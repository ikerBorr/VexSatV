package vexriscv.demo

import java.nio.file.{Files, Paths}
import scala.collection.mutable

import spinal.core._
import spinal.core.sim._
import spinal.lib.com.uart.sim.UartEncoder

// ---------------------------------------------------------------------------
//  Run VexSatv firmware in Verilator:
//    1. hold CPU in reset, load firmware.bin into BRAM over S_AXI_BRAM
//    2. release the CPU
//    3. capture + print the SoC's UART output
//    4. if no UART byte arrives within 30 s (wall-clock), fail the test
//
//  Run:
//    sbt "runMain vexriscv.demo.VexSatvSimAxiLoad build/firmware.bin"
// ---------------------------------------------------------------------------
object VexSatvSimAxiLoad {
  def main(args: Array[String]): Unit = {
    val firmwareBin = if (args.nonEmpty) args(0) else "test/build/firmware.bin"

    SimConfig
      .allOptimisation                       // add .withWave for a VCD (slower)
      .compile(new VexSatv(VexSatvConfig.default))
      .doSimUntilVoid("axiload", 1246756194) { dut =>
        // picosecond timebase
        val mainClkPeriod  = (1e12 / dut.config.coreFrequency.toDouble).toLong
        val uartBaudPeriod = (1e12 / dut.config.baudRate.toDouble).toLong

        val clockDomain = ClockDomain(dut.io.mainClk)
        clockDomain.forkStimulus(mainClkPeriod)

        // -------------------- UART RX (host -> SoC) --------------------
        UartEncoder(dut.io.uart.rxd, uartBaudPeriod)
        dut.io.uart.rxd #= true                          // idle line high

        // -------------------- UART TX capture (SoC -> host) ------------
        // UartDecoder has no onByte callback (only (uartPin, baudPeriod)),
        // so we decode the line ourselves to BOTH print and capture bytes.
        // Frame = 8 data bits (dataLength=7 in the config), no parity, 1 stop.
        val uartQueue    = mutable.Queue[Byte]()
        val uartDataBits = 8
        fork {
          waitUntil(dut.io.uart.txd.toBoolean)           // wait for idle line
          while (true) {
            waitUntil(!dut.io.uart.txd.toBoolean)        // start bit (falling edge)
            sleep(uartBaudPeriod / 2)                    // align to centre of start bit
            var value = 0
            var i = 0
            while (i < uartDataBits) {
              sleep(uartBaudPeriod)                      // centre of data bit i (LSB first)
              if (dut.io.uart.txd.toBoolean) value |= (1 << i)
              i += 1
            }
            sleep(uartBaudPeriod)                        // consume stop bit
            uartQueue.enqueue(value.toByte)
            print(value.toChar); Console.out.flush()     // live, readable output
          }
        }

        // -------------------- reset + load + release -------------------
        println("[sim] asserting resets")
        dut.io.asyncReset    #= true
        dut.io.asyncCpuReset #= true
        clockDomain.waitSampling(20)

        dut.io.asyncReset    #= false                    // bus fabric up, CPU still held
        clockDomain.waitSampling(300)                    // wait out the BOOT reset counter
        println("[sim] bus fabric released, reading firmware")

        val raw = Files.readAllBytes(Paths.get(firmwareBin))
        require(raw.nonEmpty, s"firmware '$firmwareBin' is empty or missing")
        val image = if (raw.length % 4 == 0) raw
        else raw ++ Array.fill(4 - raw.length % 4)(0.toByte)
        println(s"[sim] firmware '$firmwareBin' = ${image.length} bytes")

        val axi = dut.io.bramMaster
        axi.aw.valid #= false; axi.w.valid #= false; axi.ar.valid #= false
        axi.b.ready  #= true;  axi.r.ready #= true

        def axiWriteWord(addr: Long, data: BigInt): Unit = {
          axi.aw.valid #= true; axi.aw.payload.addr #= addr; axi.aw.payload.id #= 0
          axi.aw.payload.len #= 0; axi.aw.payload.size #= 2; axi.aw.payload.burst #= 1
          axi.w.valid #= true; axi.w.payload.data #= data
          axi.w.payload.strb #= 0xf; axi.w.payload.last #= true

          var awAck = false; var wAck = false; var guard = 0
          do {
            clockDomain.waitSampling()
            if (!awAck && axi.aw.ready.toBoolean) { awAck = true; axi.aw.valid #= false }
            if (!wAck  && axi.w.ready.toBoolean)  { wAck  = true; axi.w.valid  #= false }
            guard += 1
            if (guard > 10000)
              simFailure(f"[sim] AXI addr/data handshake stalled @0x$addr%08x (aw=$awAck w=$wAck) - bus still in reset?")
          } while (!(awAck && wAck))

          guard = 0
          do {
            clockDomain.waitSampling(); guard += 1
            if (guard > 10000) simFailure(f"[sim] no B (write) response @0x$addr%08x")
          } while (!axi.b.valid.toBoolean)
        }

        var off = 0
        while (off < image.length) {
          val w = (BigInt(image(off)   & 0xff))        |
            (BigInt(image(off+1) & 0xff) <<  8)  |
            (BigInt(image(off+2) & 0xff) << 16)  |
            (BigInt(image(off+3) & 0xff) << 24)
          axiWriteWord(off.toLong, w)
          off += 4
        }
        println(s"\n[sim] loaded ${image.length} bytes into BRAM, releasing CPU...\n")
        val w0 = ((image(0)&0xff)) | ((image(1)&0xff)<<8) | ((image(2)&0xff)<<16) | ((image(3)&0xff)<<24)
        println(f"[sim] first word @0x0 = 0x$w0%08x (expect 0x0240006f, a 'j' to _boot)\n")
        dut.io.asyncCpuReset #= false

        // -------------------- 30 s watchdog on first UART byte ---------
        val timeoutMs = 30000L
        val startMs   = System.currentTimeMillis()
        while (uartQueue.isEmpty && (System.currentTimeMillis() - startMs) < timeoutMs) {
          clockDomain.waitSampling(1000)                 // run a bit, then re-check
        }

        if (uartQueue.isEmpty) {
          println("\n[sim] ERROR: no UART output within 30 s - failing test")
          simFailure("No UART message received from VexSatv within the timeout")
        }

        println("\n[sim] UART output detected - continuing to capture...\n")
        clockDomain.waitSampling(2000000)                // let the rest stream out
        simSuccess()
      }
  }
}