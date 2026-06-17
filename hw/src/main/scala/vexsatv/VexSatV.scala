package vexsatv

import scala.collection.mutable.ArrayBuffer

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.apb._
import spinal.lib.bus.amba4.axi._
import spinal.lib.bus.amba4.axilite._
import spinal.lib.com.jtag.Jtag
import spinal.lib.com.uart._
import spinal.lib.misc.Apb3Clint
import spinal.lib.misc.plic._
import vexriscv.ip.{DataCacheConfig, InstructionCacheConfig}
import vexriscv.plugin._
import vexriscv.{VexRiscv, VexRiscvConfig, plugin}

// Created by Iker Borrallo Rodríguez (ikerborr@gmail.com)
//
// VexSatV.scala — VexRiscv soft-core compatible with FreeRTOS
//
// Memory map:
//   0x0000_0000 – 0x0003_FFFF   BRAM                   256 KB
//   0x1000_0000 – 0x1000_0FFF   Ctrl/status regs       4   KB
//   0x1000_1000 – 0x1000_1FFF   UART (Apb3UartCtrl)    4   KB
//   0x1002_0000 – 0x1002_FFFF   CLINT                  64  KB
//   0x1040_0000 – 0x107F_FFFF   PLIC                   4   MB
//   0x8000_0000 – 0xBFFF_FFFF   DDR (external master)  1   GB
//
// Ctrl/status regs (4 KB window):
//   0x00–0x10  rwRegs[0..4]  host -> CPU mailbox  (ext R/W, CPU RO; ext write -> PLIC src)
//   0x14–0x24  roRegs[0..4]  CPU -> host status   (CPU R/W, ext RO)
//   Dual access: CPU via APB (registersApb) and host via the ctrlRegs AXI4-Lite slave
//
// Bring-up (boot from BRAM):
//   Reset vector = 0x0000_0000, so the core boots from BRAM, which is plain RAM.
//   On every power-up/reset: hold asyncCpuReset, load the .hex into BRAM via the bramMaster
//   slave port, then release reset.
//
// Trap / interrupt handling (M-mode, DIRECT mtvec):
//   0x0000_0000  reset vector
//   0x0000_0020  mtvec

case class VexSatVConfig(
    coreFrequency: HertzNumber,
    onChipRamSize: BigInt,
    ddrSize: BigInt,
    ddrBaseAddress: BigInt,
    hardwareBreakpointCount: Int,
    axiIdWidth: Int,
    baudRate: Int,
    cpuPlugins: ArrayBuffer[Plugin[VexRiscv]],
)

object VexSatVConfig {
    def default: VexSatVConfig = default(0x40000000)

    def default(ddrBaseAddress: BigInt): VexSatVConfig = VexSatVConfig(
        coreFrequency = 100 MHz,
        onChipRamSize = 256 KiB,
        ddrSize = 1 GiB,
        ddrBaseAddress = ddrBaseAddress,
        hardwareBreakpointCount = 3,
        axiIdWidth = 4,
        baudRate = 115200,
        cpuPlugins = ArrayBuffer(
            new IBusCachedPlugin(
                resetVector = 0x0L,
                relaxedPcCalculation = false,
                prediction = STATIC,
                config = InstructionCacheConfig(
                    cacheSize = 8 * 1024,
                    bytePerLine = 32,
                    wayCount = 1,
                    addressWidth = 32,
                    cpuDataWidth = 32,
                    memDataWidth = 32,
                    catchIllegalAccess = true,
                    catchAccessFault = true,
                    asyncTagMemory = false,
                    twoCycleRam = true,
                    twoCycleCache = true
                ),
                memoryTranslatorPortConfig = null
            ),
            new DBusCachedPlugin(
                config = new DataCacheConfig(
                    cacheSize = 8 * 1024,
                    bytePerLine = 64,
                    wayCount = 1,
                    addressWidth = 32,
                    cpuDataWidth = 32,
                    memDataWidth = 32,
                    catchAccessError = true,
                    catchIllegal = true,
                    catchUnaligned = true,
                    withLrSc = false,
                    withAmo = false
                ),
                memoryTranslatorPortConfig = null
            ),
            new StaticMemoryTranslatorPlugin(
                ioRange = _(31 downto 28) === 0x1
            ),
            new DecoderSimplePlugin(
                catchIllegalInstruction = true
            ),
            new RegFilePlugin(
                regFileReadyKind = plugin.SYNC,
                zeroBoot = true
            ),
            new IntAluPlugin,
            new SrcPlugin(
                separatedAddSub = false,
                executeInsertion = true
            ),
            new FullBarrelShifterPlugin,
            new MulPlugin,
            new DivPlugin,
            new HazardSimplePlugin(
                bypassExecute = true,
                bypassMemory = true,
                bypassWriteBack = true,
                bypassWriteBackBuffer = true,
                pessimisticUseSrc = false,
                pessimisticWriteRegFile = false,
                pessimisticAddressMatch = false
            ),
            new BranchPlugin(
                earlyBranch = false,
                catchAddressMisaligned = true
            ),
            new CsrPlugin(CsrPluginConfig.small(mtvecInit = 0x00000020L)
              .copy(
                  mtvecAccess = CsrAccess.READ_WRITE,
                  mscratchGen = true,
                  ecallGen = true,
                  ebreakGen = true,
                  mcycleAccess = CsrAccess.READ_WRITE,
                  minstretAccess = CsrAccess.READ_WRITE
              )
            ),
            new YamlPlugin("../gen/VexSatv.yaml")
        )
    )
}

case class VexSatV(config: VexSatVConfig) extends Component {
    import config._

    def buildAxiConfig(addressWidth: Int) = Axi4Config(
        addressWidth = addressWidth,
        dataWidth    = 32,
        idWidth      = config.axiIdWidth,
        useId        = true,
        useRegion    = false,
        useBurst     = true,
        useLock      = false,
        useCache     = false,
        useSize      = true,
        useQos       = false,
        useLast      = true,
        useResp      = true,
        useProt      = false,
        useStrb      = true
    )

    def buildAxiLiteConfig(addressWidth: Int) = AxiLite4Config(
        addressWidth = addressWidth,
        dataWidth    = 32
    )

    val io = new Bundle {
        val asyncReset = in Bool()
        val asyncCpuReset = in Bool()

        val mainClk = in Bool()

        val jtag = slave(Jtag())

        val uart = new Bundle {
            val txd = out Bool()
            val rxd = in  Bool()
        }

        val ctrlRegs = slave(AxiLite4(buildAxiLiteConfig(12)))

        val bramMaster = slave(Axi4(buildAxiConfig(32)))
        val ddrMaster  = master(Axi4(buildAxiConfig(32)))
    }

    io.mainClk.setName("aclk")
    io.asyncReset.setName("areset")
    io.asyncCpuReset.setName("cpu_areset")

    io.ctrlRegs.setName("S_AXI_CTRL")
    io.bramMaster.setName("S_AXI_BRAM")
    io.ddrMaster.setName("M_AXI_DDR")

    AxiLite4SpecRenamer(io.ctrlRegs)
    Axi4SpecRenamer(io.bramMaster)
    Axi4SpecRenamer(io.ddrMaster)

    val resetCtrlClockDomain = ClockDomain(
        clock = io.mainClk,
        config = ClockDomainConfig(
            resetKind = BOOT
        )
    )

    val resetCtrl = new ClockingArea(resetCtrlClockDomain) {
        val mainClkResetUnbuffered  = False
        val systemClkResetCounter = Reg(UInt(6 bits)) init(0)
        when(systemClkResetCounter =/= U(systemClkResetCounter.bitsRange -> true)){
            systemClkResetCounter := systemClkResetCounter + 1
            mainClkResetUnbuffered := True
        }
        when(BufferCC(io.asyncReset)){
            systemClkResetCounter := 0
        }

        val mainClkReset = RegNext(mainClkResetUnbuffered)
        val debugReset  = RegNext(mainClkResetUnbuffered)
        val cpuResetSync = BufferCC(io.asyncCpuReset)
    }

    val systemClockDomain = ClockDomain(
        clock = io.mainClk,
        reset = resetCtrl.mainClkReset,
        frequency = FixedFrequency(coreFrequency)
    )

    val debugClockDomain = ClockDomain(
        clock = io.mainClk,
        reset = resetCtrl.debugReset,
        frequency = FixedFrequency(coreFrequency)
    )

    val cpuClockDomain = ClockDomain(
        clock = io.mainClk,
        reset = resetCtrl.mainClkReset || resetCtrl.cpuResetSync,
        frequency = FixedFrequency(coreFrequency)
    )

    val system = new ClockingArea(systemClockDomain) {
        // ********* MAIN MEMORY *********
        val bram = new Axi4SharedOnChipRam(
            dataWidth  = 32,
            byteCount  = config.onChipRamSize,
            idWidth    = config.axiIdWidth + 3
        )

        // ********* GENERAL REGISTERS *********
        val numRwRegs = 5
        val numRoRegs = 5

        val rwRegs = Vec.fill(numRwRegs)(Reg(Bits(32 bits)) init 0)
        val roRegs = Vec.fill(numRoRegs)(Reg(Bits(32 bits)) init 0)

        val registersApb = Apb3(Apb3Config(addressWidth = 12, dataWidth = 32))
        val coreFactory  = Apb3SlaveFactory(registersApb)

        for (i <- 0 until numRwRegs)
            coreFactory.read(rwRegs(i), address = i * 4)

        for (i <- 0 until numRoRegs)
            coreFactory.readAndWrite(roRegs(i), address = (numRwRegs + i) * 4)

        val regChanged = Vec.fill(numRwRegs)(False)

        val extFactory = new AxiLite4SlaveFactory(
            io.ctrlRegs,
            useWriteStrobes = true
        )

        for (i <- 0 until numRwRegs) {
            extFactory.readAndWrite(rwRegs(i), address = i * 4)
            extFactory.onWrite(address = i * 4) {
                regChanged(i) := True
            }
        }

        for (i <- 0 until numRoRegs)
            extFactory.read(roRegs(i), address = (numRwRegs + i) * 4)

        // ********* UART *********
        val uartCtrl = Apb3UartCtrl(UartCtrlMemoryMappedConfig(
            uartCtrlConfig = UartCtrlGenerics(
                dataWidthMax = 8,
                clockDividerWidth = 20,
                preSamplingSize = 1,
                samplingSize = 3,
                postSamplingSize = 1
            ),
            initConfig = UartCtrlInitConfig(
                baudrate = config.baudRate,
                dataLength = 7,
                parity = UartParityType.NONE,
                stop = UartStopType.ONE
            ),
            busCanWriteClockDividerConfig = false,
            busCanWriteFrameConfig = false,
            txFifoDepth = 16,
            rxFifoDepth = 16
        ))

        uartCtrl.io.uart.txd <> io.uart.txd
        uartCtrl.io.uart.rxd <> io.uart.rxd

        // ********* CLINT *********
        val clintCtrl = Apb3Clint(hartCount = 1)

        // ********* PLIC *********
        val plicCtrl = Apb3Plic(
            sourceCount = numRwRegs + 1,
            targetCount = 1
        )

        plicCtrl.io.sources := uartCtrl.io.interrupt ## regChanged.asBits

        //  ********* DDR MEMORY *********
        val ddrNode = Axi4(buildAxiConfig(32))
        val ddrLocalBaseAddr = 0x80000000L
        io.ddrMaster << ddrNode

        io.ddrMaster.aw.addr.allowOverride() := (ddrNode.aw.addr - ddrLocalBaseAddr + config.ddrBaseAddress).resized
        io.ddrMaster.ar.addr.allowOverride() := (ddrNode.ar.addr - ddrLocalBaseAddr + config.ddrBaseAddress).resized

        //  ********* CREATE CPU *********
        val core = new ClockingArea(cpuClockDomain) {
            val cpu = new VexRiscv(
                VexRiscvConfig(
                    plugins = cpuPlugins += new DebugPlugin(
                        debugClockDomain,
                        hardwareBreakpointCount
                    )
                )
            )

            var iBus: Axi4ReadOnly = null
            var dBus: Axi4Shared   = null

            for (plugin <- cpu.plugins) plugin match {
                case p: IBusCachedPlugin =>
                    iBus = p.iBus.toAxi4ReadOnly()

                case p: DBusCachedPlugin =>
                    dBus = p.dBus.toAxi4Shared(true)

                case csr: CsrPlugin =>
                    csr.timerInterrupt := clintCtrl.io.timerInterrupt(0)
                    csr.softwareInterrupt := clintCtrl.io.softwareInterrupt(0)
                    csr.externalInterrupt := plicCtrl.io.targets(0)

                    if (csr.utime != null) {
                        csr.utime := clintCtrl.io.time
                    }

                case p: DebugPlugin =>
                    p.debugClockDomain{
                        resetCtrl.debugReset setWhen(RegNext(p.io.resetOut))
                        io.jtag <> p.io.bus.fromJtag()
                    }

                case _ =>
            }
        }

        // ********* APB bridge *********
        val apbBridge = Axi4SharedToApb3Bridge(
            addressWidth = 24,
            dataWidth    = 32,
            idWidth      = config.axiIdWidth
        )

        val apbDecoder = Apb3Decoder(
            master = apbBridge.io.apb,
            slaves = List(
                registersApb -> (0x000000,  4 KiB),
                uartCtrl.io.apb  -> (0x001000,  4 KiB),
                clintCtrl.io.bus -> (0x020000, 64 KiB),
                plicCtrl.io.bus  -> (0x400000,  4 MiB)
            )
        )

        // ********* MAIN BUS *********
        val mainBus = new Axi4CrossbarFactory()

        mainBus.addSlaves(
            bram.io.axi -> (0x0L, config.onChipRamSize),
            ddrNode -> (ddrLocalBaseAddr, config.ddrSize),
            apbBridge.io.axi -> (0x10000000L, 16 MiB)
        )

        mainBus.addConnections(
            core.iBus -> List(bram.io.axi, ddrNode),
            core.dBus -> List(bram.io.axi, ddrNode, apbBridge.io.axi),
            io.bramMaster -> List(bram.io.axi)
        )

        mainBus.build()
    }
}

case class Apb3Plic(sourceCount: Int, targetCount: Int) extends Component {
    val priorityWidth = 2
    val plicMapping   = PlicMapping.sifive

    val io = new Bundle {
        val bus = slave(Apb3(Apb3Config(addressWidth = 22, dataWidth = 32)))
        val sources = in  Bits(sourceCount bits)
        val targets = out Bits(targetCount bits)
    }

    val gateways = (for ((source, id) <- (io.sources.asBools, 1 to sourceCount).zipped)
        yield PlicGatewayActiveHigh(source = source, id = id, priorityWidth = priorityWidth)).toSeq

    val targets  = for (i <- 0 until targetCount)
        yield PlicTarget(id = i, gateways = gateways, priorityWidth = priorityWidth)

    io.targets := targets.map(_.iep).asBits

    PlicMapper(
        Apb3SlaveFactory(io.bus),
        plicMapping
    )(gateways = gateways, targets = targets)
}

object VexSatV {
    def main(args: Array[String]): Unit = {
        SpinalConfig(
            targetDirectory = "../gen",
            defaultConfigForClockDomains = ClockDomainConfig(resetActiveLevel = HIGH)
        )
        .generateVerilog {
            new VexSatV(VexSatVConfig.default)
        }
    }
}