// Generator : SpinalHDL v1.13.0    git head : d9d72474863badf47d8585d187f3e04ae4749c59
// Component : VexSatV
// Git hash  : 4e73673d261d19d0c63c4880bf973a25dbac4373

`timescale 1ns/1ps

module VexSatV (
  input  wire          areset,
  input  wire          cpu_areset,
  input  wire          aclk,
  input  wire          io_jtag_tms,
  input  wire          io_jtag_tdi,
  output wire          io_jtag_tdo,
  input  wire          io_jtag_tck,
  output wire          io_uart_txd,
  input  wire          io_uart_rxd,
  input  wire          S_AXI_CTRL_awvalid,
  output wire          S_AXI_CTRL_awready,
  input  wire [11:0]   S_AXI_CTRL_awaddr,
  input  wire [2:0]    S_AXI_CTRL_awprot,
  input  wire          S_AXI_CTRL_wvalid,
  output wire          S_AXI_CTRL_wready,
  input  wire [31:0]   S_AXI_CTRL_wdata,
  input  wire [3:0]    S_AXI_CTRL_wstrb,
  output wire          S_AXI_CTRL_bvalid,
  input  wire          S_AXI_CTRL_bready,
  output wire [1:0]    S_AXI_CTRL_bresp,
  input  wire          S_AXI_CTRL_arvalid,
  output wire          S_AXI_CTRL_arready,
  input  wire [11:0]   S_AXI_CTRL_araddr,
  input  wire [2:0]    S_AXI_CTRL_arprot,
  output wire          S_AXI_CTRL_rvalid,
  input  wire          S_AXI_CTRL_rready,
  output wire [31:0]   S_AXI_CTRL_rdata,
  output wire [1:0]    S_AXI_CTRL_rresp,
  input  wire          S_AXI_BRAM_awvalid,
  output wire          S_AXI_BRAM_awready,
  input  wire [31:0]   S_AXI_BRAM_awaddr,
  input  wire [3:0]    S_AXI_BRAM_awid,
  input  wire [7:0]    S_AXI_BRAM_awlen,
  input  wire [2:0]    S_AXI_BRAM_awsize,
  input  wire [1:0]    S_AXI_BRAM_awburst,
  input  wire          S_AXI_BRAM_wvalid,
  output wire          S_AXI_BRAM_wready,
  input  wire [31:0]   S_AXI_BRAM_wdata,
  input  wire [3:0]    S_AXI_BRAM_wstrb,
  input  wire          S_AXI_BRAM_wlast,
  output wire          S_AXI_BRAM_bvalid,
  input  wire          S_AXI_BRAM_bready,
  output wire [3:0]    S_AXI_BRAM_bid,
  output wire [1:0]    S_AXI_BRAM_bresp,
  input  wire          S_AXI_BRAM_arvalid,
  output wire          S_AXI_BRAM_arready,
  input  wire [31:0]   S_AXI_BRAM_araddr,
  input  wire [3:0]    S_AXI_BRAM_arid,
  input  wire [7:0]    S_AXI_BRAM_arlen,
  input  wire [2:0]    S_AXI_BRAM_arsize,
  input  wire [1:0]    S_AXI_BRAM_arburst,
  output wire          S_AXI_BRAM_rvalid,
  input  wire          S_AXI_BRAM_rready,
  output wire [31:0]   S_AXI_BRAM_rdata,
  output wire [3:0]    S_AXI_BRAM_rid,
  output wire [1:0]    S_AXI_BRAM_rresp,
  output wire          S_AXI_BRAM_rlast,
  output wire          M_AXI_DDR_awvalid,
  input  wire          M_AXI_DDR_awready,
  output reg  [31:0]   M_AXI_DDR_awaddr,
  output wire [3:0]    M_AXI_DDR_awid,
  output wire [7:0]    M_AXI_DDR_awlen,
  output wire [2:0]    M_AXI_DDR_awsize,
  output wire [1:0]    M_AXI_DDR_awburst,
  output wire          M_AXI_DDR_wvalid,
  input  wire          M_AXI_DDR_wready,
  output wire [31:0]   M_AXI_DDR_wdata,
  output wire [3:0]    M_AXI_DDR_wstrb,
  output wire          M_AXI_DDR_wlast,
  input  wire          M_AXI_DDR_bvalid,
  output wire          M_AXI_DDR_bready,
  input  wire [3:0]    M_AXI_DDR_bid,
  input  wire [1:0]    M_AXI_DDR_bresp,
  output wire          M_AXI_DDR_arvalid,
  input  wire          M_AXI_DDR_arready,
  output reg  [31:0]   M_AXI_DDR_araddr,
  output wire [3:0]    M_AXI_DDR_arid,
  output wire [7:0]    M_AXI_DDR_arlen,
  output wire [2:0]    M_AXI_DDR_arsize,
  output wire [1:0]    M_AXI_DDR_arburst,
  input  wire          M_AXI_DDR_rvalid,
  output wire          M_AXI_DDR_rready,
  input  wire [31:0]   M_AXI_DDR_rdata,
  input  wire [3:0]    M_AXI_DDR_rid,
  input  wire [1:0]    M_AXI_DDR_rresp,
  input  wire          M_AXI_DDR_rlast,
  input  wire          clk,
  input  wire          reset
);

  wire       [4:0]    system_uartCtrl_io_apb_PADDR;
  wire       [15:0]   system_clintCtrl_io_bus_PADDR;
  wire       [21:0]   system_plicCtrl_io_bus_PADDR;
  wire       [5:0]    system_plicCtrl_io_sources;
  reg                 system_core_cpu_dBus_cmd_ready;
  wire                system_core_cpu_dBus_rsp_payload_error;
  wire                system_core_cpu_timerInterrupt;
  wire                system_core_cpu_externalInterrupt;
  wire                system_core_cpu_softwareInterrupt;
  wire       [7:0]    system_core_cpu_debug_bus_cmd_payload_address;
  wire                system_core_cpu_iBus_rsp_payload_error;
  wire       [3:0]    S_AXI_BRAM_readOnly_decoder_io_outputs_0_r_payload_id;
  wire       [3:0]    S_AXI_BRAM_writeOnly_decoder_io_outputs_0_b_payload_id;
  wire       [17:0]   system_bram_io_axi_arbiter_io_readInputs_0_ar_payload_addr;
  wire       [17:0]   system_bram_io_axi_arbiter_io_readInputs_1_ar_payload_addr;
  wire       [4:0]    system_bram_io_axi_arbiter_io_readInputs_1_ar_payload_id;
  wire       [17:0]   system_bram_io_axi_arbiter_io_writeInputs_0_aw_payload_addr;
  wire       [5:0]    system_bram_io_axi_arbiter_io_writeInputs_0_aw_payload_id;
  wire       [17:0]   system_bram_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr;
  wire       [23:0]   system_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr;
  wire                areset_buffercc_io_dataOut;
  wire                cpu_areset_buffercc_io_dataOut;
  wire                system_bram_io_axi_arw_ready;
  wire                system_bram_io_axi_w_ready;
  wire                system_bram_io_axi_b_valid;
  wire       [6:0]    system_bram_io_axi_b_payload_id;
  wire       [1:0]    system_bram_io_axi_b_payload_resp;
  wire                system_bram_io_axi_r_valid;
  wire       [31:0]   system_bram_io_axi_r_payload_data;
  wire       [6:0]    system_bram_io_axi_r_payload_id;
  wire       [1:0]    system_bram_io_axi_r_payload_resp;
  wire                system_bram_io_axi_r_payload_last;
  wire                system_uartCtrl_io_apb_PREADY;
  wire       [31:0]   system_uartCtrl_io_apb_PRDATA;
  wire                system_uartCtrl_io_uart_txd;
  wire                system_uartCtrl_io_interrupt;
  wire                system_clintCtrl_io_bus_PREADY;
  wire       [31:0]   system_clintCtrl_io_bus_PRDATA;
  wire                system_clintCtrl_io_bus_PSLVERROR;
  wire       [0:0]    system_clintCtrl_io_timerInterrupt;
  wire       [0:0]    system_clintCtrl_io_softwareInterrupt;
  wire       [63:0]   system_clintCtrl_io_time;
  wire                system_plicCtrl_io_bus_PREADY;
  wire       [31:0]   system_plicCtrl_io_bus_PRDATA;
  wire                system_plicCtrl_io_bus_PSLVERROR;
  wire       [0:0]    system_plicCtrl_io_targets;
  wire                system_core_cpu_dBus_cmd_valid;
  wire                system_core_cpu_dBus_cmd_payload_wr;
  wire                system_core_cpu_dBus_cmd_payload_uncached;
  wire       [31:0]   system_core_cpu_dBus_cmd_payload_address;
  wire       [31:0]   system_core_cpu_dBus_cmd_payload_data;
  wire       [3:0]    system_core_cpu_dBus_cmd_payload_mask;
  wire       [2:0]    system_core_cpu_dBus_cmd_payload_size;
  wire                system_core_cpu_dBus_cmd_payload_last;
  wire                system_core_cpu_debug_bus_cmd_ready;
  wire       [31:0]   system_core_cpu_debug_bus_rsp_data;
  wire                system_core_cpu_debug_resetOut;
  wire                system_core_cpu_iBus_cmd_valid;
  wire       [31:0]   system_core_cpu_iBus_cmd_payload_address;
  wire       [2:0]    system_core_cpu_iBus_cmd_payload_size;
  wire                jtagBridge_1_io_jtag_tdo;
  wire                jtagBridge_1_io_remote_cmd_valid;
  wire                jtagBridge_1_io_remote_cmd_payload_last;
  wire       [0:0]    jtagBridge_1_io_remote_cmd_payload_fragment;
  wire                jtagBridge_1_io_remote_rsp_ready;
  wire                systemDebugger_1_io_remote_cmd_ready;
  wire                systemDebugger_1_io_remote_rsp_valid;
  wire                systemDebugger_1_io_remote_rsp_payload_error;
  wire       [31:0]   systemDebugger_1_io_remote_rsp_payload_data;
  wire                systemDebugger_1_io_mem_cmd_valid;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_address;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_data;
  wire                systemDebugger_1_io_mem_cmd_payload_wr;
  wire       [1:0]    systemDebugger_1_io_mem_cmd_payload_size;
  wire                system_apbBridge_io_axi_arw_ready;
  wire                system_apbBridge_io_axi_w_ready;
  wire                system_apbBridge_io_axi_b_valid;
  wire       [3:0]    system_apbBridge_io_axi_b_payload_id;
  wire       [1:0]    system_apbBridge_io_axi_b_payload_resp;
  wire                system_apbBridge_io_axi_r_valid;
  wire       [31:0]   system_apbBridge_io_axi_r_payload_data;
  wire       [3:0]    system_apbBridge_io_axi_r_payload_id;
  wire       [1:0]    system_apbBridge_io_axi_r_payload_resp;
  wire                system_apbBridge_io_axi_r_payload_last;
  wire       [23:0]   system_apbBridge_io_apb_PADDR;
  wire       [0:0]    system_apbBridge_io_apb_PSEL;
  wire                system_apbBridge_io_apb_PENABLE;
  wire                system_apbBridge_io_apb_PWRITE;
  wire       [31:0]   system_apbBridge_io_apb_PWDATA;
  wire                io_apb_decoder_io_input_PREADY;
  wire       [31:0]   io_apb_decoder_io_input_PRDATA;
  wire                io_apb_decoder_io_input_PSLVERROR;
  wire       [23:0]   io_apb_decoder_io_output_PADDR;
  wire       [3:0]    io_apb_decoder_io_output_PSEL;
  wire                io_apb_decoder_io_output_PENABLE;
  wire                io_apb_decoder_io_output_PWRITE;
  wire       [31:0]   io_apb_decoder_io_output_PWDATA;
  wire                apb3Router_1_io_input_PREADY;
  wire       [31:0]   apb3Router_1_io_input_PRDATA;
  wire                apb3Router_1_io_input_PSLVERROR;
  wire       [23:0]   apb3Router_1_io_outputs_0_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_0_PSEL;
  wire                apb3Router_1_io_outputs_0_PENABLE;
  wire                apb3Router_1_io_outputs_0_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_0_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_1_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_1_PSEL;
  wire                apb3Router_1_io_outputs_1_PENABLE;
  wire                apb3Router_1_io_outputs_1_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_1_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_2_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_2_PSEL;
  wire                apb3Router_1_io_outputs_2_PENABLE;
  wire                apb3Router_1_io_outputs_2_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_2_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_3_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_3_PSEL;
  wire                apb3Router_1_io_outputs_3_PENABLE;
  wire                apb3Router_1_io_outputs_3_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_3_PWDATA;
  wire                axi4ReadOnlyDecoder_2_io_input_ar_ready;
  wire                axi4ReadOnlyDecoder_2_io_input_r_valid;
  wire       [31:0]   axi4ReadOnlyDecoder_2_io_input_r_payload_data;
  wire       [1:0]    axi4ReadOnlyDecoder_2_io_input_r_payload_resp;
  wire                axi4ReadOnlyDecoder_2_io_input_r_payload_last;
  wire                axi4ReadOnlyDecoder_2_io_outputs_0_ar_valid;
  wire       [31:0]   axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_addr;
  wire       [7:0]    axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_len;
  wire       [1:0]    axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_burst;
  wire       [3:0]    axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_cache;
  wire       [2:0]    axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_prot;
  wire                axi4ReadOnlyDecoder_2_io_outputs_0_r_ready;
  wire                axi4ReadOnlyDecoder_2_io_outputs_1_ar_valid;
  wire       [31:0]   axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_addr;
  wire       [7:0]    axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_len;
  wire       [1:0]    axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_burst;
  wire       [3:0]    axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_cache;
  wire       [2:0]    axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_prot;
  wire                axi4ReadOnlyDecoder_2_io_outputs_1_r_ready;
  wire                dbus_axi_decoder_io_input_arw_ready;
  wire                dbus_axi_decoder_io_input_w_ready;
  wire                dbus_axi_decoder_io_input_b_valid;
  wire       [1:0]    dbus_axi_decoder_io_input_b_payload_resp;
  wire                dbus_axi_decoder_io_input_r_valid;
  wire       [31:0]   dbus_axi_decoder_io_input_r_payload_data;
  wire       [1:0]    dbus_axi_decoder_io_input_r_payload_resp;
  wire                dbus_axi_decoder_io_input_r_payload_last;
  wire                dbus_axi_decoder_io_readOutputs_0_ar_valid;
  wire       [31:0]   dbus_axi_decoder_io_readOutputs_0_ar_payload_addr;
  wire       [7:0]    dbus_axi_decoder_io_readOutputs_0_ar_payload_len;
  wire       [2:0]    dbus_axi_decoder_io_readOutputs_0_ar_payload_size;
  wire       [3:0]    dbus_axi_decoder_io_readOutputs_0_ar_payload_cache;
  wire       [2:0]    dbus_axi_decoder_io_readOutputs_0_ar_payload_prot;
  wire                dbus_axi_decoder_io_readOutputs_0_r_ready;
  wire                dbus_axi_decoder_io_writeOutputs_0_aw_valid;
  wire       [31:0]   dbus_axi_decoder_io_writeOutputs_0_aw_payload_addr;
  wire       [7:0]    dbus_axi_decoder_io_writeOutputs_0_aw_payload_len;
  wire       [2:0]    dbus_axi_decoder_io_writeOutputs_0_aw_payload_size;
  wire       [3:0]    dbus_axi_decoder_io_writeOutputs_0_aw_payload_cache;
  wire       [2:0]    dbus_axi_decoder_io_writeOutputs_0_aw_payload_prot;
  wire                dbus_axi_decoder_io_writeOutputs_0_w_valid;
  wire       [31:0]   dbus_axi_decoder_io_writeOutputs_0_w_payload_data;
  wire       [3:0]    dbus_axi_decoder_io_writeOutputs_0_w_payload_strb;
  wire                dbus_axi_decoder_io_writeOutputs_0_w_payload_last;
  wire                dbus_axi_decoder_io_writeOutputs_0_b_ready;
  wire                dbus_axi_decoder_io_sharedOutputs_0_arw_valid;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_0_arw_payload_addr;
  wire       [7:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_payload_len;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_payload_size;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_payload_cache;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_payload_prot;
  wire                dbus_axi_decoder_io_sharedOutputs_0_arw_payload_write;
  wire                dbus_axi_decoder_io_sharedOutputs_0_w_valid;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_0_w_payload_data;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_0_w_payload_strb;
  wire                dbus_axi_decoder_io_sharedOutputs_0_w_payload_last;
  wire                dbus_axi_decoder_io_sharedOutputs_0_b_ready;
  wire                dbus_axi_decoder_io_sharedOutputs_0_r_ready;
  wire                dbus_axi_decoder_io_sharedOutputs_1_arw_valid;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_1_arw_payload_addr;
  wire       [7:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_payload_len;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_payload_size;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_payload_cache;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_payload_prot;
  wire                dbus_axi_decoder_io_sharedOutputs_1_arw_payload_write;
  wire                dbus_axi_decoder_io_sharedOutputs_1_w_valid;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_1_w_payload_data;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_1_w_payload_strb;
  wire                dbus_axi_decoder_io_sharedOutputs_1_w_payload_last;
  wire                dbus_axi_decoder_io_sharedOutputs_1_b_ready;
  wire                dbus_axi_decoder_io_sharedOutputs_1_r_ready;
  wire                S_AXI_BRAM_readOnly_decoder_io_input_ar_ready;
  wire                S_AXI_BRAM_readOnly_decoder_io_input_r_valid;
  wire       [31:0]   S_AXI_BRAM_readOnly_decoder_io_input_r_payload_data;
  wire       [3:0]    S_AXI_BRAM_readOnly_decoder_io_input_r_payload_id;
  wire       [1:0]    S_AXI_BRAM_readOnly_decoder_io_input_r_payload_resp;
  wire                S_AXI_BRAM_readOnly_decoder_io_input_r_payload_last;
  wire                S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_valid;
  wire       [31:0]   S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_payload_addr;
  wire       [3:0]    S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_payload_id;
  wire       [7:0]    S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_payload_len;
  wire       [2:0]    S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_payload_size;
  wire       [1:0]    S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_payload_burst;
  wire                S_AXI_BRAM_readOnly_decoder_io_outputs_0_r_ready;
  wire                S_AXI_BRAM_writeOnly_decoder_io_input_aw_ready;
  wire                S_AXI_BRAM_writeOnly_decoder_io_input_w_ready;
  wire                S_AXI_BRAM_writeOnly_decoder_io_input_b_valid;
  wire       [3:0]    S_AXI_BRAM_writeOnly_decoder_io_input_b_payload_id;
  wire       [1:0]    S_AXI_BRAM_writeOnly_decoder_io_input_b_payload_resp;
  wire                S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_valid;
  wire       [31:0]   S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_payload_addr;
  wire       [3:0]    S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_payload_id;
  wire       [7:0]    S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_payload_len;
  wire       [2:0]    S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_payload_size;
  wire       [1:0]    S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_payload_burst;
  wire                S_AXI_BRAM_writeOnly_decoder_io_outputs_0_w_valid;
  wire       [31:0]   S_AXI_BRAM_writeOnly_decoder_io_outputs_0_w_payload_data;
  wire       [3:0]    S_AXI_BRAM_writeOnly_decoder_io_outputs_0_w_payload_strb;
  wire                S_AXI_BRAM_writeOnly_decoder_io_outputs_0_w_payload_last;
  wire                S_AXI_BRAM_writeOnly_decoder_io_outputs_0_b_ready;
  wire                system_bram_io_axi_arbiter_io_readInputs_0_ar_ready;
  wire                system_bram_io_axi_arbiter_io_readInputs_0_r_valid;
  wire       [31:0]   system_bram_io_axi_arbiter_io_readInputs_0_r_payload_data;
  wire       [4:0]    system_bram_io_axi_arbiter_io_readInputs_0_r_payload_id;
  wire       [1:0]    system_bram_io_axi_arbiter_io_readInputs_0_r_payload_resp;
  wire                system_bram_io_axi_arbiter_io_readInputs_0_r_payload_last;
  wire                system_bram_io_axi_arbiter_io_readInputs_1_ar_ready;
  wire                system_bram_io_axi_arbiter_io_readInputs_1_r_valid;
  wire       [31:0]   system_bram_io_axi_arbiter_io_readInputs_1_r_payload_data;
  wire       [4:0]    system_bram_io_axi_arbiter_io_readInputs_1_r_payload_id;
  wire       [1:0]    system_bram_io_axi_arbiter_io_readInputs_1_r_payload_resp;
  wire                system_bram_io_axi_arbiter_io_readInputs_1_r_payload_last;
  wire                system_bram_io_axi_arbiter_io_writeInputs_0_aw_ready;
  wire                system_bram_io_axi_arbiter_io_writeInputs_0_w_ready;
  wire                system_bram_io_axi_arbiter_io_writeInputs_0_b_valid;
  wire       [5:0]    system_bram_io_axi_arbiter_io_writeInputs_0_b_payload_id;
  wire       [1:0]    system_bram_io_axi_arbiter_io_writeInputs_0_b_payload_resp;
  wire                system_bram_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire                system_bram_io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire                system_bram_io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire       [4:0]    system_bram_io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    system_bram_io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                system_bram_io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire       [31:0]   system_bram_io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [4:0]    system_bram_io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    system_bram_io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                system_bram_io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire                system_bram_io_axi_arbiter_io_output_arw_valid;
  wire       [17:0]   system_bram_io_axi_arbiter_io_output_arw_payload_addr;
  wire       [6:0]    system_bram_io_axi_arbiter_io_output_arw_payload_id;
  wire       [7:0]    system_bram_io_axi_arbiter_io_output_arw_payload_len;
  wire       [2:0]    system_bram_io_axi_arbiter_io_output_arw_payload_size;
  wire       [1:0]    system_bram_io_axi_arbiter_io_output_arw_payload_burst;
  wire                system_bram_io_axi_arbiter_io_output_arw_payload_write;
  wire                system_bram_io_axi_arbiter_io_output_w_valid;
  wire       [31:0]   system_bram_io_axi_arbiter_io_output_w_payload_data;
  wire       [3:0]    system_bram_io_axi_arbiter_io_output_w_payload_strb;
  wire                system_bram_io_axi_arbiter_io_output_w_payload_last;
  wire                system_bram_io_axi_arbiter_io_output_b_ready;
  wire                system_bram_io_axi_arbiter_io_output_r_ready;
  wire                system_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire                system_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire                system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire       [3:0]    system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire       [31:0]   system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [3:0]    system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire                system_apbBridge_io_axi_arbiter_io_output_arw_valid;
  wire       [23:0]   system_apbBridge_io_axi_arbiter_io_output_arw_payload_addr;
  wire       [3:0]    system_apbBridge_io_axi_arbiter_io_output_arw_payload_id;
  wire       [7:0]    system_apbBridge_io_axi_arbiter_io_output_arw_payload_len;
  wire       [2:0]    system_apbBridge_io_axi_arbiter_io_output_arw_payload_size;
  wire       [1:0]    system_apbBridge_io_axi_arbiter_io_output_arw_payload_burst;
  wire                system_apbBridge_io_axi_arbiter_io_output_arw_payload_write;
  wire                system_apbBridge_io_axi_arbiter_io_output_w_valid;
  wire       [31:0]   system_apbBridge_io_axi_arbiter_io_output_w_payload_data;
  wire       [3:0]    system_apbBridge_io_axi_arbiter_io_output_w_payload_strb;
  wire                system_apbBridge_io_axi_arbiter_io_output_w_payload_last;
  wire                system_apbBridge_io_axi_arbiter_io_output_b_ready;
  wire                system_apbBridge_io_axi_arbiter_io_output_r_ready;
  wire                axi4ReadOnlyArbiter_1_io_inputs_0_ar_ready;
  wire                axi4ReadOnlyArbiter_1_io_inputs_0_r_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_data;
  wire       [2:0]    axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_id;
  wire       [1:0]    axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_resp;
  wire                axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_last;
  wire                axi4ReadOnlyArbiter_1_io_inputs_1_ar_ready;
  wire                axi4ReadOnlyArbiter_1_io_inputs_1_r_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_data;
  wire       [2:0]    axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_id;
  wire       [1:0]    axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_resp;
  wire                axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_last;
  wire                axi4ReadOnlyArbiter_1_io_output_ar_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_1_io_output_ar_payload_addr;
  wire       [3:0]    axi4ReadOnlyArbiter_1_io_output_ar_payload_id;
  wire       [7:0]    axi4ReadOnlyArbiter_1_io_output_ar_payload_len;
  wire       [2:0]    axi4ReadOnlyArbiter_1_io_output_ar_payload_size;
  wire       [1:0]    axi4ReadOnlyArbiter_1_io_output_ar_payload_burst;
  wire                axi4ReadOnlyArbiter_1_io_output_r_ready;
  wire                axi4WriteOnlyArbiter_1_io_inputs_0_aw_ready;
  wire                axi4WriteOnlyArbiter_1_io_inputs_0_w_ready;
  wire                axi4WriteOnlyArbiter_1_io_inputs_0_b_valid;
  wire       [3:0]    axi4WriteOnlyArbiter_1_io_inputs_0_b_payload_id;
  wire       [1:0]    axi4WriteOnlyArbiter_1_io_inputs_0_b_payload_resp;
  wire                axi4WriteOnlyArbiter_1_io_output_aw_valid;
  wire       [31:0]   axi4WriteOnlyArbiter_1_io_output_aw_payload_addr;
  wire       [3:0]    axi4WriteOnlyArbiter_1_io_output_aw_payload_id;
  wire       [7:0]    axi4WriteOnlyArbiter_1_io_output_aw_payload_len;
  wire       [2:0]    axi4WriteOnlyArbiter_1_io_output_aw_payload_size;
  wire       [1:0]    axi4WriteOnlyArbiter_1_io_output_aw_payload_burst;
  wire                axi4WriteOnlyArbiter_1_io_output_w_valid;
  wire       [31:0]   axi4WriteOnlyArbiter_1_io_output_w_payload_data;
  wire       [3:0]    axi4WriteOnlyArbiter_1_io_output_w_payload_strb;
  wire                axi4WriteOnlyArbiter_1_io_output_w_payload_last;
  wire                axi4WriteOnlyArbiter_1_io_output_b_ready;
  wire       [31:0]   _zz_M_AXI_DDR_awaddr;
  wire       [31:0]   _zz_M_AXI_DDR_araddr;
  wire       [3:0]    _zz_dbus_axi_arw_payload_len;
  reg                 resetCtrl_mainClkResetUnbuffered;
  reg        [5:0]    resetCtrl_systemClkResetCounter;
  wire       [5:0]    _zz_when_VexSatV_l214;
  wire                when_VexSatV_l214;
  wire                when_VexSatV_l218;
  reg                 resetCtrl_mainClkReset;
  reg                 resetCtrl_debugReset;
  wire                resetCtrl_cpuResetSync;
  wire                _zz_1;
  reg        [31:0]   system_rwRegs_0;
  reg        [31:0]   system_rwRegs_1;
  reg        [31:0]   system_rwRegs_2;
  reg        [31:0]   system_rwRegs_3;
  reg        [31:0]   system_rwRegs_4;
  reg        [31:0]   system_roRegs_0;
  reg        [31:0]   system_roRegs_1;
  reg        [31:0]   system_roRegs_2;
  reg        [31:0]   system_roRegs_3;
  reg        [31:0]   system_roRegs_4;
  wire       [11:0]   system_registersApb_PADDR;
  wire       [0:0]    system_registersApb_PSEL;
  wire                system_registersApb_PENABLE;
  wire                system_registersApb_PREADY;
  wire                system_registersApb_PWRITE;
  wire       [31:0]   system_registersApb_PWDATA;
  reg        [31:0]   system_registersApb_PRDATA;
  wire                system_registersApb_PSLVERROR;
  wire                system_coreFactory_readErrorFlag;
  wire                system_coreFactory_writeErrorFlag;
  wire                system_coreFactory_askWrite;
  wire                system_coreFactory_askRead;
  wire                system_coreFactory_doWrite;
  wire                system_coreFactory_doRead;
  reg                 system_regChanged_0;
  reg                 system_regChanged_1;
  reg                 system_regChanged_2;
  reg                 system_regChanged_3;
  reg                 system_regChanged_4;
  wire                system_extFactory_readErrorFlag;
  wire                system_extFactory_writeErrorFlag;
  wire                system_extFactory_readHaltRequest;
  wire                system_extFactory_writeHaltRequest;
  wire                system_extFactory_writeJoinEvent_valid;
  wire                system_extFactory_writeJoinEvent_ready;
  wire                system_extFactory_writeOccur;
  reg        [1:0]    system_extFactory_writeRsp_resp;
  wire                system_extFactory_writeJoinEvent_translated_valid;
  wire                system_extFactory_writeJoinEvent_translated_ready;
  wire       [1:0]    system_extFactory_writeJoinEvent_translated_payload_resp;
  wire                _zz_system_extFactory_writeJoinEvent_translated_ready;
  wire                system_extFactory_writeJoinEvent_translated_haltWhen_valid;
  wire                system_extFactory_writeJoinEvent_translated_haltWhen_ready;
  wire       [1:0]    system_extFactory_writeJoinEvent_translated_haltWhen_payload_resp;
  wire                system_extFactory_writeJoinEvent_translated_haltWhen_halfPipe_valid;
  wire                system_extFactory_writeJoinEvent_translated_haltWhen_halfPipe_ready;
  wire       [1:0]    system_extFactory_writeJoinEvent_translated_haltWhen_halfPipe_payload_resp;
  reg                 system_extFactory_writeJoinEvent_translated_haltWhen_rValid;
  wire                system_extFactory_writeJoinEvent_translated_haltWhen_halfPipe_fire;
  reg        [1:0]    system_extFactory_writeJoinEvent_translated_haltWhen_rData_resp;
  wire                system_extFactory_readDataStage_valid;
  wire                system_extFactory_readDataStage_ready;
  wire       [11:0]   system_extFactory_readDataStage_payload_addr;
  wire       [2:0]    system_extFactory_readDataStage_payload_prot;
  reg                 S_AXI_CTRL_ar_rValid;
  wire                system_extFactory_readDataStage_fire;
  reg        [11:0]   S_AXI_CTRL_ar_rData_addr;
  reg        [2:0]    S_AXI_CTRL_ar_rData_prot;
  reg        [31:0]   system_extFactory_readRsp_data;
  reg        [1:0]    system_extFactory_readRsp_resp;
  wire                _zz_system_extFactory_readDataStage_ready;
  wire                system_extFactory_readDataStage_haltWhen_valid;
  wire                system_extFactory_readDataStage_haltWhen_ready;
  wire       [11:0]   system_extFactory_readDataStage_haltWhen_payload_addr;
  wire       [2:0]    system_extFactory_readDataStage_haltWhen_payload_prot;
  wire                system_extFactory_readDataStage_haltWhen_translated_valid;
  wire                system_extFactory_readDataStage_haltWhen_translated_ready;
  wire       [31:0]   system_extFactory_readDataStage_haltWhen_translated_payload_data;
  wire       [1:0]    system_extFactory_readDataStage_haltWhen_translated_payload_resp;
  wire       [11:0]   system_extFactory_readAddressMasked;
  wire       [11:0]   system_extFactory_writeAddressMasked;
  wire                system_extFactory_readOccur;
  wire                system_ddrNode_aw_valid;
  wire                system_ddrNode_aw_ready;
  wire       [31:0]   system_ddrNode_aw_payload_addr;
  wire       [3:0]    system_ddrNode_aw_payload_id;
  wire       [7:0]    system_ddrNode_aw_payload_len;
  wire       [2:0]    system_ddrNode_aw_payload_size;
  wire       [1:0]    system_ddrNode_aw_payload_burst;
  wire                system_ddrNode_w_valid;
  wire                system_ddrNode_w_ready;
  wire       [31:0]   system_ddrNode_w_payload_data;
  wire       [3:0]    system_ddrNode_w_payload_strb;
  wire                system_ddrNode_w_payload_last;
  wire                system_ddrNode_b_valid;
  wire                system_ddrNode_b_ready;
  wire       [3:0]    system_ddrNode_b_payload_id;
  wire       [1:0]    system_ddrNode_b_payload_resp;
  wire                system_ddrNode_ar_valid;
  wire                system_ddrNode_ar_ready;
  wire       [31:0]   system_ddrNode_ar_payload_addr;
  wire       [3:0]    system_ddrNode_ar_payload_id;
  wire       [7:0]    system_ddrNode_ar_payload_len;
  wire       [2:0]    system_ddrNode_ar_payload_size;
  wire       [1:0]    system_ddrNode_ar_payload_burst;
  wire                system_ddrNode_r_valid;
  wire                system_ddrNode_r_ready;
  wire       [31:0]   system_ddrNode_r_payload_data;
  wire       [3:0]    system_ddrNode_r_payload_id;
  wire       [1:0]    system_ddrNode_r_payload_resp;
  wire                system_ddrNode_r_payload_last;
  wire                dbus_axi_arw_valid;
  wire                dbus_axi_arw_ready;
  wire       [31:0]   dbus_axi_arw_payload_addr;
  wire       [7:0]    dbus_axi_arw_payload_len;
  wire       [2:0]    dbus_axi_arw_payload_size;
  wire       [3:0]    dbus_axi_arw_payload_cache;
  wire       [2:0]    dbus_axi_arw_payload_prot;
  wire                dbus_axi_arw_payload_write;
  wire                dbus_axi_w_valid;
  wire                dbus_axi_w_ready;
  wire       [31:0]   dbus_axi_w_payload_data;
  wire       [3:0]    dbus_axi_w_payload_strb;
  wire                dbus_axi_w_payload_last;
  wire                dbus_axi_b_valid;
  wire                dbus_axi_b_ready;
  wire       [1:0]    dbus_axi_b_payload_resp;
  wire                dbus_axi_r_valid;
  wire                dbus_axi_r_ready;
  wire       [31:0]   dbus_axi_r_payload_data;
  wire       [1:0]    dbus_axi_r_payload_resp;
  wire                dbus_axi_r_payload_last;
  wire                dBus_cmd_stage_valid;
  reg                 dBus_cmd_stage_ready;
  wire                dBus_cmd_stage_payload_wr;
  wire                dBus_cmd_stage_payload_uncached;
  wire       [31:0]   dBus_cmd_stage_payload_address;
  wire       [31:0]   dBus_cmd_stage_payload_data;
  wire       [3:0]    dBus_cmd_stage_payload_mask;
  wire       [2:0]    dBus_cmd_stage_payload_size;
  wire                dBus_cmd_stage_payload_last;
  reg                 dBus_cmd_rValid;
  reg                 dBus_cmd_rData_wr;
  reg                 dBus_cmd_rData_uncached;
  reg        [31:0]   dBus_cmd_rData_address;
  reg        [31:0]   dBus_cmd_rData_data;
  reg        [3:0]    dBus_cmd_rData_mask;
  reg        [2:0]    dBus_cmd_rData_size;
  reg                 dBus_cmd_rData_last;
  wire                when_Stream_l477;
  wire                dBus_cmd_stage_stage_valid;
  wire                dBus_cmd_stage_stage_ready;
  wire                dBus_cmd_stage_stage_payload_wr;
  wire                dBus_cmd_stage_stage_payload_uncached;
  wire       [31:0]   dBus_cmd_stage_stage_payload_address;
  wire       [31:0]   dBus_cmd_stage_stage_payload_data;
  wire       [3:0]    dBus_cmd_stage_stage_payload_mask;
  wire       [2:0]    dBus_cmd_stage_stage_payload_size;
  wire                dBus_cmd_stage_stage_payload_last;
  reg                 dBus_cmd_stage_rValid;
  reg                 dBus_cmd_stage_rData_wr;
  reg                 dBus_cmd_stage_rData_uncached;
  reg        [31:0]   dBus_cmd_stage_rData_address;
  reg        [31:0]   dBus_cmd_stage_rData_data;
  reg        [3:0]    dBus_cmd_stage_rData_mask;
  reg        [2:0]    dBus_cmd_stage_rData_size;
  reg                 dBus_cmd_stage_rData_last;
  wire                when_Stream_l477_1;
  wire                dBusToAxi4Shared_cmdPreFork_valid;
  wire                dBusToAxi4Shared_cmdPreFork_ready;
  wire                dBusToAxi4Shared_cmdPreFork_payload_wr;
  wire                dBusToAxi4Shared_cmdPreFork_payload_uncached;
  wire       [31:0]   dBusToAxi4Shared_cmdPreFork_payload_address;
  wire       [31:0]   dBusToAxi4Shared_cmdPreFork_payload_data;
  wire       [3:0]    dBusToAxi4Shared_cmdPreFork_payload_mask;
  wire       [2:0]    dBusToAxi4Shared_cmdPreFork_payload_size;
  wire                dBusToAxi4Shared_cmdPreFork_payload_last;
  reg                 dBus_cmd_stage_stage_rValidN;
  reg                 dBus_cmd_stage_stage_rData_wr;
  reg                 dBus_cmd_stage_stage_rData_uncached;
  reg        [31:0]   dBus_cmd_stage_stage_rData_address;
  reg        [31:0]   dBus_cmd_stage_stage_rData_data;
  reg        [3:0]    dBus_cmd_stage_stage_rData_mask;
  reg        [2:0]    dBus_cmd_stage_stage_rData_size;
  reg                 dBus_cmd_stage_stage_rData_last;
  wire                dBusToAxi4Shared_cmdPreFork_fire;
  wire                when_Utils_l732;
  wire                dbus_axi_b_fire;
  reg                 dBusToAxi4Shared_pendingWrites_incrementIt;
  reg                 dBusToAxi4Shared_pendingWrites_decrementIt;
  wire       [2:0]    dBusToAxi4Shared_pendingWrites_valueNext;
  reg        [2:0]    dBusToAxi4Shared_pendingWrites_value;
  wire                dBusToAxi4Shared_pendingWrites_mayOverflow;
  wire                dBusToAxi4Shared_pendingWrites_mayUnderflow;
  wire                dBusToAxi4Shared_pendingWrites_willOverflowIfInc;
  wire                dBusToAxi4Shared_pendingWrites_willOverflow;
  wire                dBusToAxi4Shared_pendingWrites_willUnderflowIfDec;
  wire                dBusToAxi4Shared_pendingWrites_willUnderflow;
  reg        [2:0]    dBusToAxi4Shared_pendingWrites_finalIncrement;
  wire                when_Utils_l767;
  wire                when_Utils_l769;
  wire                dBusToAxi4Shared_hazard;
  wire                _zz_dBusToAxi4Shared_cmdPreFork_ready;
  wire                dBusToAxi4Shared_cmdPreFork_haltWhen_valid;
  reg                 dBusToAxi4Shared_cmdPreFork_haltWhen_ready;
  wire                dBusToAxi4Shared_cmdPreFork_haltWhen_payload_wr;
  wire                dBusToAxi4Shared_cmdPreFork_haltWhen_payload_uncached;
  wire       [31:0]   dBusToAxi4Shared_cmdPreFork_haltWhen_payload_address;
  wire       [31:0]   dBusToAxi4Shared_cmdPreFork_haltWhen_payload_data;
  wire       [3:0]    dBusToAxi4Shared_cmdPreFork_haltWhen_payload_mask;
  wire       [2:0]    dBusToAxi4Shared_cmdPreFork_haltWhen_payload_size;
  wire                dBusToAxi4Shared_cmdPreFork_haltWhen_payload_last;
  wire                dBusToAxi4Shared_cmdFork_valid;
  reg                 dBusToAxi4Shared_cmdFork_ready;
  wire                dBusToAxi4Shared_cmdFork_payload_wr;
  wire                dBusToAxi4Shared_cmdFork_payload_uncached;
  wire       [31:0]   dBusToAxi4Shared_cmdFork_payload_address;
  wire       [31:0]   dBusToAxi4Shared_cmdFork_payload_data;
  wire       [3:0]    dBusToAxi4Shared_cmdFork_payload_mask;
  wire       [2:0]    dBusToAxi4Shared_cmdFork_payload_size;
  wire                dBusToAxi4Shared_cmdFork_payload_last;
  wire                dBusToAxi4Shared_dataFork_valid;
  reg                 dBusToAxi4Shared_dataFork_ready;
  wire                dBusToAxi4Shared_dataFork_payload_wr;
  wire                dBusToAxi4Shared_dataFork_payload_uncached;
  wire       [31:0]   dBusToAxi4Shared_dataFork_payload_address;
  wire       [31:0]   dBusToAxi4Shared_dataFork_payload_data;
  wire       [3:0]    dBusToAxi4Shared_dataFork_payload_mask;
  wire       [2:0]    dBusToAxi4Shared_dataFork_payload_size;
  wire                dBusToAxi4Shared_dataFork_payload_last;
  reg                 dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_0;
  reg                 dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_1;
  wire                when_Stream_l1253;
  wire                when_Stream_l1253_1;
  wire                dBusToAxi4Shared_cmdFork_fire;
  wire                dBusToAxi4Shared_dataFork_fire;
  reg                 _zz_2;
  reg                 dBusToAxi4Shared_cmdStage_valid;
  wire                dBusToAxi4Shared_cmdStage_ready;
  wire                dBusToAxi4Shared_cmdStage_payload_wr;
  wire                dBusToAxi4Shared_cmdStage_payload_uncached;
  wire       [31:0]   dBusToAxi4Shared_cmdStage_payload_address;
  wire       [31:0]   dBusToAxi4Shared_cmdStage_payload_data;
  wire       [3:0]    dBusToAxi4Shared_cmdStage_payload_mask;
  wire       [2:0]    dBusToAxi4Shared_cmdStage_payload_size;
  wire                dBusToAxi4Shared_cmdStage_payload_last;
  wire                when_Stream_l581;
  reg                 dBusToAxi4Shared_dataStage_valid;
  wire                dBusToAxi4Shared_dataStage_ready;
  wire                dBusToAxi4Shared_dataStage_payload_wr;
  wire                dBusToAxi4Shared_dataStage_payload_uncached;
  wire       [31:0]   dBusToAxi4Shared_dataStage_payload_address;
  wire       [31:0]   dBusToAxi4Shared_dataStage_payload_data;
  wire       [3:0]    dBusToAxi4Shared_dataStage_payload_mask;
  wire       [2:0]    dBusToAxi4Shared_dataStage_payload_size;
  wire                dBusToAxi4Shared_dataStage_payload_last;
  reg                 debug_resetOut_regNext;
  wire                debug_bus_cmd_fire;
  reg                 debug_bus_cmd_fire_regNext;
  wire                S_AXI_BRAM_readOnly_ar_valid;
  wire                S_AXI_BRAM_readOnly_ar_ready;
  wire       [31:0]   S_AXI_BRAM_readOnly_ar_payload_addr;
  wire       [3:0]    S_AXI_BRAM_readOnly_ar_payload_id;
  wire       [7:0]    S_AXI_BRAM_readOnly_ar_payload_len;
  wire       [2:0]    S_AXI_BRAM_readOnly_ar_payload_size;
  wire       [1:0]    S_AXI_BRAM_readOnly_ar_payload_burst;
  wire                S_AXI_BRAM_readOnly_r_valid;
  wire                S_AXI_BRAM_readOnly_r_ready;
  wire       [31:0]   S_AXI_BRAM_readOnly_r_payload_data;
  wire       [3:0]    S_AXI_BRAM_readOnly_r_payload_id;
  wire       [1:0]    S_AXI_BRAM_readOnly_r_payload_resp;
  wire                S_AXI_BRAM_readOnly_r_payload_last;
  wire                S_AXI_BRAM_writeOnly_aw_valid;
  wire                S_AXI_BRAM_writeOnly_aw_ready;
  wire       [31:0]   S_AXI_BRAM_writeOnly_aw_payload_addr;
  wire       [3:0]    S_AXI_BRAM_writeOnly_aw_payload_id;
  wire       [7:0]    S_AXI_BRAM_writeOnly_aw_payload_len;
  wire       [2:0]    S_AXI_BRAM_writeOnly_aw_payload_size;
  wire       [1:0]    S_AXI_BRAM_writeOnly_aw_payload_burst;
  wire                S_AXI_BRAM_writeOnly_w_valid;
  wire                S_AXI_BRAM_writeOnly_w_ready;
  wire       [31:0]   S_AXI_BRAM_writeOnly_w_payload_data;
  wire       [3:0]    S_AXI_BRAM_writeOnly_w_payload_strb;
  wire                S_AXI_BRAM_writeOnly_w_payload_last;
  wire                S_AXI_BRAM_writeOnly_b_valid;
  wire                S_AXI_BRAM_writeOnly_b_ready;
  wire       [3:0]    S_AXI_BRAM_writeOnly_b_payload_id;
  wire       [1:0]    S_AXI_BRAM_writeOnly_b_payload_resp;
  wire                io_outputs_0_ar_validPipe_valid;
  wire                io_outputs_0_ar_validPipe_ready;
  wire       [31:0]   io_outputs_0_ar_validPipe_payload_addr;
  wire       [7:0]    io_outputs_0_ar_validPipe_payload_len;
  wire       [1:0]    io_outputs_0_ar_validPipe_payload_burst;
  wire       [3:0]    io_outputs_0_ar_validPipe_payload_cache;
  wire       [2:0]    io_outputs_0_ar_validPipe_payload_prot;
  reg                 io_outputs_0_ar_rValid;
  wire                io_outputs_0_ar_validPipe_fire;
  wire                io_outputs_1_ar_validPipe_valid;
  wire                io_outputs_1_ar_validPipe_ready;
  wire       [31:0]   io_outputs_1_ar_validPipe_payload_addr;
  wire       [7:0]    io_outputs_1_ar_validPipe_payload_len;
  wire       [1:0]    io_outputs_1_ar_validPipe_payload_burst;
  wire       [3:0]    io_outputs_1_ar_validPipe_payload_cache;
  wire       [2:0]    io_outputs_1_ar_validPipe_payload_prot;
  reg                 io_outputs_1_ar_rValid;
  wire                io_outputs_1_ar_validPipe_fire;
  wire                io_readOutputs_0_ar_validPipe_valid;
  wire                io_readOutputs_0_ar_validPipe_ready;
  wire       [31:0]   io_readOutputs_0_ar_validPipe_payload_addr;
  wire       [7:0]    io_readOutputs_0_ar_validPipe_payload_len;
  wire       [2:0]    io_readOutputs_0_ar_validPipe_payload_size;
  wire       [3:0]    io_readOutputs_0_ar_validPipe_payload_cache;
  wire       [2:0]    io_readOutputs_0_ar_validPipe_payload_prot;
  reg                 io_readOutputs_0_ar_rValid;
  wire                io_readOutputs_0_ar_validPipe_fire;
  wire                io_writeOutputs_0_aw_validPipe_valid;
  wire                io_writeOutputs_0_aw_validPipe_ready;
  wire       [31:0]   io_writeOutputs_0_aw_validPipe_payload_addr;
  wire       [7:0]    io_writeOutputs_0_aw_validPipe_payload_len;
  wire       [2:0]    io_writeOutputs_0_aw_validPipe_payload_size;
  wire       [3:0]    io_writeOutputs_0_aw_validPipe_payload_cache;
  wire       [2:0]    io_writeOutputs_0_aw_validPipe_payload_prot;
  reg                 io_writeOutputs_0_aw_rValid;
  wire                io_writeOutputs_0_aw_validPipe_fire;
  wire                io_sharedOutputs_0_arw_validPipe_valid;
  wire                io_sharedOutputs_0_arw_validPipe_ready;
  wire       [31:0]   io_sharedOutputs_0_arw_validPipe_payload_addr;
  wire       [7:0]    io_sharedOutputs_0_arw_validPipe_payload_len;
  wire       [2:0]    io_sharedOutputs_0_arw_validPipe_payload_size;
  wire       [3:0]    io_sharedOutputs_0_arw_validPipe_payload_cache;
  wire       [2:0]    io_sharedOutputs_0_arw_validPipe_payload_prot;
  wire                io_sharedOutputs_0_arw_validPipe_payload_write;
  reg                 io_sharedOutputs_0_arw_rValid;
  wire                io_sharedOutputs_0_arw_validPipe_fire;
  wire                io_sharedOutputs_1_arw_validPipe_valid;
  wire                io_sharedOutputs_1_arw_validPipe_ready;
  wire       [31:0]   io_sharedOutputs_1_arw_validPipe_payload_addr;
  wire       [7:0]    io_sharedOutputs_1_arw_validPipe_payload_len;
  wire       [2:0]    io_sharedOutputs_1_arw_validPipe_payload_size;
  wire       [3:0]    io_sharedOutputs_1_arw_validPipe_payload_cache;
  wire       [2:0]    io_sharedOutputs_1_arw_validPipe_payload_prot;
  wire                io_sharedOutputs_1_arw_validPipe_payload_write;
  reg                 io_sharedOutputs_1_arw_rValid;
  wire                io_sharedOutputs_1_arw_validPipe_fire;
  wire                io_outputs_0_ar_validPipe_valid_1;
  wire                io_outputs_0_ar_validPipe_ready_1;
  wire       [31:0]   io_outputs_0_ar_validPipe_payload_addr_1;
  wire       [3:0]    io_outputs_0_ar_validPipe_payload_id;
  wire       [7:0]    io_outputs_0_ar_validPipe_payload_len_1;
  wire       [2:0]    io_outputs_0_ar_validPipe_payload_size;
  wire       [1:0]    io_outputs_0_ar_validPipe_payload_burst_1;
  reg                 io_outputs_0_ar_rValid_1;
  wire                io_outputs_0_ar_validPipe_fire_1;
  wire                io_outputs_0_aw_validPipe_valid;
  wire                io_outputs_0_aw_validPipe_ready;
  wire       [31:0]   io_outputs_0_aw_validPipe_payload_addr;
  wire       [3:0]    io_outputs_0_aw_validPipe_payload_id;
  wire       [7:0]    io_outputs_0_aw_validPipe_payload_len;
  wire       [2:0]    io_outputs_0_aw_validPipe_payload_size;
  wire       [1:0]    io_outputs_0_aw_validPipe_payload_burst;
  reg                 io_outputs_0_aw_rValid;
  wire                io_outputs_0_aw_validPipe_fire;
  wire       [4:0]    _zz_io_readInputs_0_ar_payload_id;
  wire       [4:0]    _zz_io_sharedInputs_0_arw_payload_id;
  wire       [3:0]    _zz_io_sharedInputs_0_arw_payload_id_1;
  wire       [2:0]    _zz_io_inputs_0_ar_payload_id;
  wire       [2:0]    _zz_io_inputs_1_ar_payload_id;
  wire       [3:0]    _zz_io_inputs_0_aw_payload_id;
  wire                when_BusSlaveFactory_l1058;
  wire                when_BusSlaveFactory_l1058_1;
  wire                when_BusSlaveFactory_l1058_2;
  wire                when_BusSlaveFactory_l1058_3;
  wire                when_BusSlaveFactory_l1058_4;
  wire                when_BusSlaveFactory_l1058_5;
  wire                when_BusSlaveFactory_l1058_6;
  wire                when_BusSlaveFactory_l1058_7;
  wire                when_BusSlaveFactory_l1058_8;
  wire                when_BusSlaveFactory_l1058_9;
  wire                when_BusSlaveFactory_l1058_10;
  wire                when_BusSlaveFactory_l1058_11;
  wire                when_BusSlaveFactory_l1058_12;
  wire                when_BusSlaveFactory_l1058_13;
  wire                when_BusSlaveFactory_l1058_14;
  wire                when_BusSlaveFactory_l1058_15;
  wire                when_BusSlaveFactory_l1058_16;
  wire                when_BusSlaveFactory_l1058_17;
  wire                when_BusSlaveFactory_l1058_18;
  wire                when_BusSlaveFactory_l1058_19;

  assign _zz_M_AXI_DDR_awaddr = (system_ddrNode_aw_payload_addr - 32'h80000000);
  assign _zz_M_AXI_DDR_araddr = (system_ddrNode_ar_payload_addr - 32'h80000000);
  assign _zz_dbus_axi_arw_payload_len = ((dBusToAxi4Shared_cmdStage_payload_size == 3'b110) ? 4'b1111 : 4'b0000);
  (* keep_hierarchy = "TRUE" *) BufferCC_2 areset_buffercc (
    .io_dataIn  (areset                    ), //i
    .io_dataOut (areset_buffercc_io_dataOut), //o
    .aclk       (aclk                      )  //i
  );
  (* keep_hierarchy = "TRUE" *) BufferCC_2 cpu_areset_buffercc (
    .io_dataIn  (cpu_areset                    ), //i
    .io_dataOut (cpu_areset_buffercc_io_dataOut), //o
    .aclk       (aclk                          )  //i
  );
  Axi4SharedOnChipRam system_bram (
    .io_axi_arw_valid         (system_bram_io_axi_arbiter_io_output_arw_valid             ), //i
    .io_axi_arw_ready         (system_bram_io_axi_arw_ready                               ), //o
    .io_axi_arw_payload_addr  (system_bram_io_axi_arbiter_io_output_arw_payload_addr[17:0]), //i
    .io_axi_arw_payload_id    (system_bram_io_axi_arbiter_io_output_arw_payload_id[6:0]   ), //i
    .io_axi_arw_payload_len   (system_bram_io_axi_arbiter_io_output_arw_payload_len[7:0]  ), //i
    .io_axi_arw_payload_size  (system_bram_io_axi_arbiter_io_output_arw_payload_size[2:0] ), //i
    .io_axi_arw_payload_burst (system_bram_io_axi_arbiter_io_output_arw_payload_burst[1:0]), //i
    .io_axi_arw_payload_write (system_bram_io_axi_arbiter_io_output_arw_payload_write     ), //i
    .io_axi_w_valid           (system_bram_io_axi_arbiter_io_output_w_valid               ), //i
    .io_axi_w_ready           (system_bram_io_axi_w_ready                                 ), //o
    .io_axi_w_payload_data    (system_bram_io_axi_arbiter_io_output_w_payload_data[31:0]  ), //i
    .io_axi_w_payload_strb    (system_bram_io_axi_arbiter_io_output_w_payload_strb[3:0]   ), //i
    .io_axi_w_payload_last    (system_bram_io_axi_arbiter_io_output_w_payload_last        ), //i
    .io_axi_b_valid           (system_bram_io_axi_b_valid                                 ), //o
    .io_axi_b_ready           (system_bram_io_axi_arbiter_io_output_b_ready               ), //i
    .io_axi_b_payload_id      (system_bram_io_axi_b_payload_id[6:0]                       ), //o
    .io_axi_b_payload_resp    (system_bram_io_axi_b_payload_resp[1:0]                     ), //o
    .io_axi_r_valid           (system_bram_io_axi_r_valid                                 ), //o
    .io_axi_r_ready           (system_bram_io_axi_arbiter_io_output_r_ready               ), //i
    .io_axi_r_payload_data    (system_bram_io_axi_r_payload_data[31:0]                    ), //o
    .io_axi_r_payload_id      (system_bram_io_axi_r_payload_id[6:0]                       ), //o
    .io_axi_r_payload_resp    (system_bram_io_axi_r_payload_resp[1:0]                     ), //o
    .io_axi_r_payload_last    (system_bram_io_axi_r_payload_last                          ), //o
    .aclk                     (aclk                                                       ), //i
    .resetCtrl_mainClkReset   (resetCtrl_mainClkReset                                     )  //i
  );
  Apb3UartCtrl system_uartCtrl (
    .io_apb_PADDR           (system_uartCtrl_io_apb_PADDR[4:0]     ), //i
    .io_apb_PSEL            (apb3Router_1_io_outputs_1_PSEL        ), //i
    .io_apb_PENABLE         (apb3Router_1_io_outputs_1_PENABLE     ), //i
    .io_apb_PREADY          (system_uartCtrl_io_apb_PREADY         ), //o
    .io_apb_PWRITE          (apb3Router_1_io_outputs_1_PWRITE      ), //i
    .io_apb_PWDATA          (apb3Router_1_io_outputs_1_PWDATA[31:0]), //i
    .io_apb_PRDATA          (system_uartCtrl_io_apb_PRDATA[31:0]   ), //o
    .io_uart_txd            (system_uartCtrl_io_uart_txd           ), //o
    .io_uart_rxd            (io_uart_rxd                           ), //i
    .io_interrupt           (system_uartCtrl_io_interrupt          ), //o
    .aclk                   (aclk                                  ), //i
    .resetCtrl_mainClkReset (resetCtrl_mainClkReset                )  //i
  );
  Apb3Clint system_clintCtrl (
    .io_bus_PADDR           (system_clintCtrl_io_bus_PADDR[15:0]   ), //i
    .io_bus_PSEL            (apb3Router_1_io_outputs_2_PSEL        ), //i
    .io_bus_PENABLE         (apb3Router_1_io_outputs_2_PENABLE     ), //i
    .io_bus_PREADY          (system_clintCtrl_io_bus_PREADY        ), //o
    .io_bus_PWRITE          (apb3Router_1_io_outputs_2_PWRITE      ), //i
    .io_bus_PWDATA          (apb3Router_1_io_outputs_2_PWDATA[31:0]), //i
    .io_bus_PRDATA          (system_clintCtrl_io_bus_PRDATA[31:0]  ), //o
    .io_bus_PSLVERROR       (system_clintCtrl_io_bus_PSLVERROR     ), //o
    .io_timerInterrupt      (system_clintCtrl_io_timerInterrupt    ), //o
    .io_softwareInterrupt   (system_clintCtrl_io_softwareInterrupt ), //o
    .io_time                (system_clintCtrl_io_time[63:0]        ), //o
    .aclk                   (aclk                                  ), //i
    .resetCtrl_mainClkReset (resetCtrl_mainClkReset                )  //i
  );
  Apb3Plic system_plicCtrl (
    .io_bus_PADDR           (system_plicCtrl_io_bus_PADDR[21:0]    ), //i
    .io_bus_PSEL            (apb3Router_1_io_outputs_3_PSEL        ), //i
    .io_bus_PENABLE         (apb3Router_1_io_outputs_3_PENABLE     ), //i
    .io_bus_PREADY          (system_plicCtrl_io_bus_PREADY         ), //o
    .io_bus_PWRITE          (apb3Router_1_io_outputs_3_PWRITE      ), //i
    .io_bus_PWDATA          (apb3Router_1_io_outputs_3_PWDATA[31:0]), //i
    .io_bus_PRDATA          (system_plicCtrl_io_bus_PRDATA[31:0]   ), //o
    .io_bus_PSLVERROR       (system_plicCtrl_io_bus_PSLVERROR      ), //o
    .io_sources             (system_plicCtrl_io_sources[5:0]       ), //i
    .io_targets             (system_plicCtrl_io_targets            ), //o
    .aclk                   (aclk                                  ), //i
    .resetCtrl_mainClkReset (resetCtrl_mainClkReset                )  //i
  );
  VexRiscv system_core_cpu (
    .dBus_cmd_valid                (system_core_cpu_dBus_cmd_valid                     ), //o
    .dBus_cmd_ready                (system_core_cpu_dBus_cmd_ready                     ), //i
    .dBus_cmd_payload_wr           (system_core_cpu_dBus_cmd_payload_wr                ), //o
    .dBus_cmd_payload_uncached     (system_core_cpu_dBus_cmd_payload_uncached          ), //o
    .dBus_cmd_payload_address      (system_core_cpu_dBus_cmd_payload_address[31:0]     ), //o
    .dBus_cmd_payload_data         (system_core_cpu_dBus_cmd_payload_data[31:0]        ), //o
    .dBus_cmd_payload_mask         (system_core_cpu_dBus_cmd_payload_mask[3:0]         ), //o
    .dBus_cmd_payload_size         (system_core_cpu_dBus_cmd_payload_size[2:0]         ), //o
    .dBus_cmd_payload_last         (system_core_cpu_dBus_cmd_payload_last              ), //o
    .dBus_rsp_valid                (dbus_axi_r_valid                                   ), //i
    .dBus_rsp_payload_last         (                                                   ), //i
    .dBus_rsp_payload_data         (dbus_axi_r_payload_data[31:0]                      ), //i
    .dBus_rsp_payload_error        (system_core_cpu_dBus_rsp_payload_error             ), //i
    .timerInterrupt                (system_core_cpu_timerInterrupt                     ), //i
    .externalInterrupt             (system_core_cpu_externalInterrupt                  ), //i
    .softwareInterrupt             (system_core_cpu_softwareInterrupt                  ), //i
    .debug_bus_cmd_valid           (systemDebugger_1_io_mem_cmd_valid                  ), //i
    .debug_bus_cmd_ready           (system_core_cpu_debug_bus_cmd_ready                ), //o
    .debug_bus_cmd_payload_wr      (systemDebugger_1_io_mem_cmd_payload_wr             ), //i
    .debug_bus_cmd_payload_address (system_core_cpu_debug_bus_cmd_payload_address[7:0] ), //i
    .debug_bus_cmd_payload_data    (systemDebugger_1_io_mem_cmd_payload_data[31:0]     ), //i
    .debug_bus_rsp_data            (system_core_cpu_debug_bus_rsp_data[31:0]           ), //o
    .debug_resetOut                (system_core_cpu_debug_resetOut                     ), //o
    .iBus_cmd_valid                (system_core_cpu_iBus_cmd_valid                     ), //o
    .iBus_cmd_ready                (axi4ReadOnlyDecoder_2_io_input_ar_ready            ), //i
    .iBus_cmd_payload_address      (system_core_cpu_iBus_cmd_payload_address[31:0]     ), //o
    .iBus_cmd_payload_size         (system_core_cpu_iBus_cmd_payload_size[2:0]         ), //o
    .iBus_rsp_valid                (axi4ReadOnlyDecoder_2_io_input_r_valid             ), //i
    .iBus_rsp_payload_data         (axi4ReadOnlyDecoder_2_io_input_r_payload_data[31:0]), //i
    .iBus_rsp_payload_error        (system_core_cpu_iBus_rsp_payload_error             ), //i
    .aclk                          (aclk                                               ), //i
    ._zz_11                        (_zz_1                                              ), //i
    .resetCtrl_debugReset          (resetCtrl_debugReset                               )  //i
  );
  JtagBridge jtagBridge_1 (
    .io_jtag_tms                    (io_jtag_tms                                      ), //i
    .io_jtag_tdi                    (io_jtag_tdi                                      ), //i
    .io_jtag_tdo                    (jtagBridge_1_io_jtag_tdo                         ), //o
    .io_jtag_tck                    (io_jtag_tck                                      ), //i
    .io_remote_cmd_valid            (jtagBridge_1_io_remote_cmd_valid                 ), //o
    .io_remote_cmd_ready            (systemDebugger_1_io_remote_cmd_ready             ), //i
    .io_remote_cmd_payload_last     (jtagBridge_1_io_remote_cmd_payload_last          ), //o
    .io_remote_cmd_payload_fragment (jtagBridge_1_io_remote_cmd_payload_fragment      ), //o
    .io_remote_rsp_valid            (systemDebugger_1_io_remote_rsp_valid             ), //i
    .io_remote_rsp_ready            (jtagBridge_1_io_remote_rsp_ready                 ), //o
    .io_remote_rsp_payload_error    (systemDebugger_1_io_remote_rsp_payload_error     ), //i
    .io_remote_rsp_payload_data     (systemDebugger_1_io_remote_rsp_payload_data[31:0]), //i
    .aclk                           (aclk                                             ), //i
    .resetCtrl_debugReset           (resetCtrl_debugReset                             )  //i
  );
  SystemDebugger systemDebugger_1 (
    .io_remote_cmd_valid            (jtagBridge_1_io_remote_cmd_valid                 ), //i
    .io_remote_cmd_ready            (systemDebugger_1_io_remote_cmd_ready             ), //o
    .io_remote_cmd_payload_last     (jtagBridge_1_io_remote_cmd_payload_last          ), //i
    .io_remote_cmd_payload_fragment (jtagBridge_1_io_remote_cmd_payload_fragment      ), //i
    .io_remote_rsp_valid            (systemDebugger_1_io_remote_rsp_valid             ), //o
    .io_remote_rsp_ready            (jtagBridge_1_io_remote_rsp_ready                 ), //i
    .io_remote_rsp_payload_error    (systemDebugger_1_io_remote_rsp_payload_error     ), //o
    .io_remote_rsp_payload_data     (systemDebugger_1_io_remote_rsp_payload_data[31:0]), //o
    .io_mem_cmd_valid               (systemDebugger_1_io_mem_cmd_valid                ), //o
    .io_mem_cmd_ready               (system_core_cpu_debug_bus_cmd_ready              ), //i
    .io_mem_cmd_payload_address     (systemDebugger_1_io_mem_cmd_payload_address[31:0]), //o
    .io_mem_cmd_payload_data        (systemDebugger_1_io_mem_cmd_payload_data[31:0]   ), //o
    .io_mem_cmd_payload_wr          (systemDebugger_1_io_mem_cmd_payload_wr           ), //o
    .io_mem_cmd_payload_size        (systemDebugger_1_io_mem_cmd_payload_size[1:0]    ), //o
    .io_mem_rsp_valid               (debug_bus_cmd_fire_regNext                       ), //i
    .io_mem_rsp_payload             (system_core_cpu_debug_bus_rsp_data[31:0]         ), //i
    .aclk                           (aclk                                             ), //i
    .resetCtrl_debugReset           (resetCtrl_debugReset                             )  //i
  );
  Axi4SharedToApb3Bridge system_apbBridge (
    .io_axi_arw_valid         (system_apbBridge_io_axi_arbiter_io_output_arw_valid             ), //i
    .io_axi_arw_ready         (system_apbBridge_io_axi_arw_ready                               ), //o
    .io_axi_arw_payload_addr  (system_apbBridge_io_axi_arbiter_io_output_arw_payload_addr[23:0]), //i
    .io_axi_arw_payload_id    (system_apbBridge_io_axi_arbiter_io_output_arw_payload_id[3:0]   ), //i
    .io_axi_arw_payload_len   (system_apbBridge_io_axi_arbiter_io_output_arw_payload_len[7:0]  ), //i
    .io_axi_arw_payload_size  (system_apbBridge_io_axi_arbiter_io_output_arw_payload_size[2:0] ), //i
    .io_axi_arw_payload_burst (system_apbBridge_io_axi_arbiter_io_output_arw_payload_burst[1:0]), //i
    .io_axi_arw_payload_write (system_apbBridge_io_axi_arbiter_io_output_arw_payload_write     ), //i
    .io_axi_w_valid           (system_apbBridge_io_axi_arbiter_io_output_w_valid               ), //i
    .io_axi_w_ready           (system_apbBridge_io_axi_w_ready                                 ), //o
    .io_axi_w_payload_data    (system_apbBridge_io_axi_arbiter_io_output_w_payload_data[31:0]  ), //i
    .io_axi_w_payload_strb    (system_apbBridge_io_axi_arbiter_io_output_w_payload_strb[3:0]   ), //i
    .io_axi_w_payload_last    (system_apbBridge_io_axi_arbiter_io_output_w_payload_last        ), //i
    .io_axi_b_valid           (system_apbBridge_io_axi_b_valid                                 ), //o
    .io_axi_b_ready           (system_apbBridge_io_axi_arbiter_io_output_b_ready               ), //i
    .io_axi_b_payload_id      (system_apbBridge_io_axi_b_payload_id[3:0]                       ), //o
    .io_axi_b_payload_resp    (system_apbBridge_io_axi_b_payload_resp[1:0]                     ), //o
    .io_axi_r_valid           (system_apbBridge_io_axi_r_valid                                 ), //o
    .io_axi_r_ready           (system_apbBridge_io_axi_arbiter_io_output_r_ready               ), //i
    .io_axi_r_payload_data    (system_apbBridge_io_axi_r_payload_data[31:0]                    ), //o
    .io_axi_r_payload_id      (system_apbBridge_io_axi_r_payload_id[3:0]                       ), //o
    .io_axi_r_payload_resp    (system_apbBridge_io_axi_r_payload_resp[1:0]                     ), //o
    .io_axi_r_payload_last    (system_apbBridge_io_axi_r_payload_last                          ), //o
    .io_apb_PADDR             (system_apbBridge_io_apb_PADDR[23:0]                             ), //o
    .io_apb_PSEL              (system_apbBridge_io_apb_PSEL                                    ), //o
    .io_apb_PENABLE           (system_apbBridge_io_apb_PENABLE                                 ), //o
    .io_apb_PREADY            (io_apb_decoder_io_input_PREADY                                  ), //i
    .io_apb_PWRITE            (system_apbBridge_io_apb_PWRITE                                  ), //o
    .io_apb_PWDATA            (system_apbBridge_io_apb_PWDATA[31:0]                            ), //o
    .io_apb_PRDATA            (io_apb_decoder_io_input_PRDATA[31:0]                            ), //i
    .io_apb_PSLVERROR         (io_apb_decoder_io_input_PSLVERROR                               ), //i
    .aclk                     (aclk                                                            ), //i
    .resetCtrl_mainClkReset   (resetCtrl_mainClkReset                                          )  //i
  );
  Apb3Decoder io_apb_decoder (
    .io_input_PADDR      (system_apbBridge_io_apb_PADDR[23:0]  ), //i
    .io_input_PSEL       (system_apbBridge_io_apb_PSEL         ), //i
    .io_input_PENABLE    (system_apbBridge_io_apb_PENABLE      ), //i
    .io_input_PREADY     (io_apb_decoder_io_input_PREADY       ), //o
    .io_input_PWRITE     (system_apbBridge_io_apb_PWRITE       ), //i
    .io_input_PWDATA     (system_apbBridge_io_apb_PWDATA[31:0] ), //i
    .io_input_PRDATA     (io_apb_decoder_io_input_PRDATA[31:0] ), //o
    .io_input_PSLVERROR  (io_apb_decoder_io_input_PSLVERROR    ), //o
    .io_output_PADDR     (io_apb_decoder_io_output_PADDR[23:0] ), //o
    .io_output_PSEL      (io_apb_decoder_io_output_PSEL[3:0]   ), //o
    .io_output_PENABLE   (io_apb_decoder_io_output_PENABLE     ), //o
    .io_output_PREADY    (apb3Router_1_io_input_PREADY         ), //i
    .io_output_PWRITE    (io_apb_decoder_io_output_PWRITE      ), //o
    .io_output_PWDATA    (io_apb_decoder_io_output_PWDATA[31:0]), //o
    .io_output_PRDATA    (apb3Router_1_io_input_PRDATA[31:0]   ), //i
    .io_output_PSLVERROR (apb3Router_1_io_input_PSLVERROR      )  //i
  );
  Apb3Router apb3Router_1 (
    .io_input_PADDR         (io_apb_decoder_io_output_PADDR[23:0]  ), //i
    .io_input_PSEL          (io_apb_decoder_io_output_PSEL[3:0]    ), //i
    .io_input_PENABLE       (io_apb_decoder_io_output_PENABLE      ), //i
    .io_input_PREADY        (apb3Router_1_io_input_PREADY          ), //o
    .io_input_PWRITE        (io_apb_decoder_io_output_PWRITE       ), //i
    .io_input_PWDATA        (io_apb_decoder_io_output_PWDATA[31:0] ), //i
    .io_input_PRDATA        (apb3Router_1_io_input_PRDATA[31:0]    ), //o
    .io_input_PSLVERROR     (apb3Router_1_io_input_PSLVERROR       ), //o
    .io_outputs_0_PADDR     (apb3Router_1_io_outputs_0_PADDR[23:0] ), //o
    .io_outputs_0_PSEL      (apb3Router_1_io_outputs_0_PSEL        ), //o
    .io_outputs_0_PENABLE   (apb3Router_1_io_outputs_0_PENABLE     ), //o
    .io_outputs_0_PREADY    (system_registersApb_PREADY            ), //i
    .io_outputs_0_PWRITE    (apb3Router_1_io_outputs_0_PWRITE      ), //o
    .io_outputs_0_PWDATA    (apb3Router_1_io_outputs_0_PWDATA[31:0]), //o
    .io_outputs_0_PRDATA    (system_registersApb_PRDATA[31:0]      ), //i
    .io_outputs_0_PSLVERROR (system_registersApb_PSLVERROR         ), //i
    .io_outputs_1_PADDR     (apb3Router_1_io_outputs_1_PADDR[23:0] ), //o
    .io_outputs_1_PSEL      (apb3Router_1_io_outputs_1_PSEL        ), //o
    .io_outputs_1_PENABLE   (apb3Router_1_io_outputs_1_PENABLE     ), //o
    .io_outputs_1_PREADY    (system_uartCtrl_io_apb_PREADY         ), //i
    .io_outputs_1_PWRITE    (apb3Router_1_io_outputs_1_PWRITE      ), //o
    .io_outputs_1_PWDATA    (apb3Router_1_io_outputs_1_PWDATA[31:0]), //o
    .io_outputs_1_PRDATA    (system_uartCtrl_io_apb_PRDATA[31:0]   ), //i
    .io_outputs_1_PSLVERROR (1'b0                                  ), //i
    .io_outputs_2_PADDR     (apb3Router_1_io_outputs_2_PADDR[23:0] ), //o
    .io_outputs_2_PSEL      (apb3Router_1_io_outputs_2_PSEL        ), //o
    .io_outputs_2_PENABLE   (apb3Router_1_io_outputs_2_PENABLE     ), //o
    .io_outputs_2_PREADY    (system_clintCtrl_io_bus_PREADY        ), //i
    .io_outputs_2_PWRITE    (apb3Router_1_io_outputs_2_PWRITE      ), //o
    .io_outputs_2_PWDATA    (apb3Router_1_io_outputs_2_PWDATA[31:0]), //o
    .io_outputs_2_PRDATA    (system_clintCtrl_io_bus_PRDATA[31:0]  ), //i
    .io_outputs_2_PSLVERROR (system_clintCtrl_io_bus_PSLVERROR     ), //i
    .io_outputs_3_PADDR     (apb3Router_1_io_outputs_3_PADDR[23:0] ), //o
    .io_outputs_3_PSEL      (apb3Router_1_io_outputs_3_PSEL        ), //o
    .io_outputs_3_PENABLE   (apb3Router_1_io_outputs_3_PENABLE     ), //o
    .io_outputs_3_PREADY    (system_plicCtrl_io_bus_PREADY         ), //i
    .io_outputs_3_PWRITE    (apb3Router_1_io_outputs_3_PWRITE      ), //o
    .io_outputs_3_PWDATA    (apb3Router_1_io_outputs_3_PWDATA[31:0]), //o
    .io_outputs_3_PRDATA    (system_plicCtrl_io_bus_PRDATA[31:0]   ), //i
    .io_outputs_3_PSLVERROR (system_plicCtrl_io_bus_PSLVERROR      ), //i
    .aclk                   (aclk                                  ), //i
    .resetCtrl_mainClkReset (resetCtrl_mainClkReset                )  //i
  );
  Axi4ReadOnlyDecoder axi4ReadOnlyDecoder_2 (
    .io_input_ar_valid             (system_core_cpu_iBus_cmd_valid                                 ), //i
    .io_input_ar_ready             (axi4ReadOnlyDecoder_2_io_input_ar_ready                        ), //o
    .io_input_ar_payload_addr      (system_core_cpu_iBus_cmd_payload_address[31:0]                 ), //i
    .io_input_ar_payload_len       (8'h07                                                          ), //i
    .io_input_ar_payload_burst     (2'b01                                                          ), //i
    .io_input_ar_payload_cache     (4'b1111                                                        ), //i
    .io_input_ar_payload_prot      (3'b110                                                         ), //i
    .io_input_r_valid              (axi4ReadOnlyDecoder_2_io_input_r_valid                         ), //o
    .io_input_r_ready              (1'b1                                                           ), //i
    .io_input_r_payload_data       (axi4ReadOnlyDecoder_2_io_input_r_payload_data[31:0]            ), //o
    .io_input_r_payload_resp       (axi4ReadOnlyDecoder_2_io_input_r_payload_resp[1:0]             ), //o
    .io_input_r_payload_last       (axi4ReadOnlyDecoder_2_io_input_r_payload_last                  ), //o
    .io_outputs_0_ar_valid         (axi4ReadOnlyDecoder_2_io_outputs_0_ar_valid                    ), //o
    .io_outputs_0_ar_ready         (io_outputs_0_ar_validPipe_fire                                 ), //i
    .io_outputs_0_ar_payload_addr  (axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_addr[31:0]       ), //o
    .io_outputs_0_ar_payload_len   (axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_len[7:0]         ), //o
    .io_outputs_0_ar_payload_burst (axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_burst[1:0]       ), //o
    .io_outputs_0_ar_payload_cache (axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_cache[3:0]       ), //o
    .io_outputs_0_ar_payload_prot  (axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_prot[2:0]        ), //o
    .io_outputs_0_r_valid          (system_bram_io_axi_arbiter_io_readInputs_0_r_valid             ), //i
    .io_outputs_0_r_ready          (axi4ReadOnlyDecoder_2_io_outputs_0_r_ready                     ), //o
    .io_outputs_0_r_payload_data   (system_bram_io_axi_arbiter_io_readInputs_0_r_payload_data[31:0]), //i
    .io_outputs_0_r_payload_resp   (system_bram_io_axi_arbiter_io_readInputs_0_r_payload_resp[1:0] ), //i
    .io_outputs_0_r_payload_last   (system_bram_io_axi_arbiter_io_readInputs_0_r_payload_last      ), //i
    .io_outputs_1_ar_valid         (axi4ReadOnlyDecoder_2_io_outputs_1_ar_valid                    ), //o
    .io_outputs_1_ar_ready         (io_outputs_1_ar_validPipe_fire                                 ), //i
    .io_outputs_1_ar_payload_addr  (axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_addr[31:0]       ), //o
    .io_outputs_1_ar_payload_len   (axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_len[7:0]         ), //o
    .io_outputs_1_ar_payload_burst (axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_burst[1:0]       ), //o
    .io_outputs_1_ar_payload_cache (axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_cache[3:0]       ), //o
    .io_outputs_1_ar_payload_prot  (axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_prot[2:0]        ), //o
    .io_outputs_1_r_valid          (axi4ReadOnlyArbiter_1_io_inputs_0_r_valid                      ), //i
    .io_outputs_1_r_ready          (axi4ReadOnlyDecoder_2_io_outputs_1_r_ready                     ), //o
    .io_outputs_1_r_payload_data   (axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_data[31:0]         ), //i
    .io_outputs_1_r_payload_resp   (axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_resp[1:0]          ), //i
    .io_outputs_1_r_payload_last   (axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_last               ), //i
    .aclk                          (aclk                                                           ), //i
    .resetCtrl_mainClkReset        (resetCtrl_mainClkReset                                         )  //i
  );
  Axi4SharedDecoder dbus_axi_decoder (
    .io_input_arw_valid                   (dbus_axi_arw_valid                                                    ), //i
    .io_input_arw_ready                   (dbus_axi_decoder_io_input_arw_ready                                   ), //o
    .io_input_arw_payload_addr            (dbus_axi_arw_payload_addr[31:0]                                       ), //i
    .io_input_arw_payload_len             (dbus_axi_arw_payload_len[7:0]                                         ), //i
    .io_input_arw_payload_size            (dbus_axi_arw_payload_size[2:0]                                        ), //i
    .io_input_arw_payload_cache           (dbus_axi_arw_payload_cache[3:0]                                       ), //i
    .io_input_arw_payload_prot            (dbus_axi_arw_payload_prot[2:0]                                        ), //i
    .io_input_arw_payload_write           (dbus_axi_arw_payload_write                                            ), //i
    .io_input_w_valid                     (dbus_axi_w_valid                                                      ), //i
    .io_input_w_ready                     (dbus_axi_decoder_io_input_w_ready                                     ), //o
    .io_input_w_payload_data              (dbus_axi_w_payload_data[31:0]                                         ), //i
    .io_input_w_payload_strb              (dbus_axi_w_payload_strb[3:0]                                          ), //i
    .io_input_w_payload_last              (dbus_axi_w_payload_last                                               ), //i
    .io_input_b_valid                     (dbus_axi_decoder_io_input_b_valid                                     ), //o
    .io_input_b_ready                     (dbus_axi_b_ready                                                      ), //i
    .io_input_b_payload_resp              (dbus_axi_decoder_io_input_b_payload_resp[1:0]                         ), //o
    .io_input_r_valid                     (dbus_axi_decoder_io_input_r_valid                                     ), //o
    .io_input_r_ready                     (dbus_axi_r_ready                                                      ), //i
    .io_input_r_payload_data              (dbus_axi_decoder_io_input_r_payload_data[31:0]                        ), //o
    .io_input_r_payload_resp              (dbus_axi_decoder_io_input_r_payload_resp[1:0]                         ), //o
    .io_input_r_payload_last              (dbus_axi_decoder_io_input_r_payload_last                              ), //o
    .io_readOutputs_0_ar_valid            (dbus_axi_decoder_io_readOutputs_0_ar_valid                            ), //o
    .io_readOutputs_0_ar_ready            (io_readOutputs_0_ar_validPipe_fire                                    ), //i
    .io_readOutputs_0_ar_payload_addr     (dbus_axi_decoder_io_readOutputs_0_ar_payload_addr[31:0]               ), //o
    .io_readOutputs_0_ar_payload_len      (dbus_axi_decoder_io_readOutputs_0_ar_payload_len[7:0]                 ), //o
    .io_readOutputs_0_ar_payload_size     (dbus_axi_decoder_io_readOutputs_0_ar_payload_size[2:0]                ), //o
    .io_readOutputs_0_ar_payload_cache    (dbus_axi_decoder_io_readOutputs_0_ar_payload_cache[3:0]               ), //o
    .io_readOutputs_0_ar_payload_prot     (dbus_axi_decoder_io_readOutputs_0_ar_payload_prot[2:0]                ), //o
    .io_readOutputs_0_r_valid             (axi4ReadOnlyArbiter_1_io_inputs_1_r_valid                             ), //i
    .io_readOutputs_0_r_ready             (dbus_axi_decoder_io_readOutputs_0_r_ready                             ), //o
    .io_readOutputs_0_r_payload_data      (axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_data[31:0]                ), //i
    .io_readOutputs_0_r_payload_resp      (axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_resp[1:0]                 ), //i
    .io_readOutputs_0_r_payload_last      (axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_last                      ), //i
    .io_writeOutputs_0_aw_valid           (dbus_axi_decoder_io_writeOutputs_0_aw_valid                           ), //o
    .io_writeOutputs_0_aw_ready           (io_writeOutputs_0_aw_validPipe_fire                                   ), //i
    .io_writeOutputs_0_aw_payload_addr    (dbus_axi_decoder_io_writeOutputs_0_aw_payload_addr[31:0]              ), //o
    .io_writeOutputs_0_aw_payload_len     (dbus_axi_decoder_io_writeOutputs_0_aw_payload_len[7:0]                ), //o
    .io_writeOutputs_0_aw_payload_size    (dbus_axi_decoder_io_writeOutputs_0_aw_payload_size[2:0]               ), //o
    .io_writeOutputs_0_aw_payload_cache   (dbus_axi_decoder_io_writeOutputs_0_aw_payload_cache[3:0]              ), //o
    .io_writeOutputs_0_aw_payload_prot    (dbus_axi_decoder_io_writeOutputs_0_aw_payload_prot[2:0]               ), //o
    .io_writeOutputs_0_w_valid            (dbus_axi_decoder_io_writeOutputs_0_w_valid                            ), //o
    .io_writeOutputs_0_w_ready            (axi4WriteOnlyArbiter_1_io_inputs_0_w_ready                            ), //i
    .io_writeOutputs_0_w_payload_data     (dbus_axi_decoder_io_writeOutputs_0_w_payload_data[31:0]               ), //o
    .io_writeOutputs_0_w_payload_strb     (dbus_axi_decoder_io_writeOutputs_0_w_payload_strb[3:0]                ), //o
    .io_writeOutputs_0_w_payload_last     (dbus_axi_decoder_io_writeOutputs_0_w_payload_last                     ), //o
    .io_writeOutputs_0_b_valid            (axi4WriteOnlyArbiter_1_io_inputs_0_b_valid                            ), //i
    .io_writeOutputs_0_b_ready            (dbus_axi_decoder_io_writeOutputs_0_b_ready                            ), //o
    .io_writeOutputs_0_b_payload_resp     (axi4WriteOnlyArbiter_1_io_inputs_0_b_payload_resp[1:0]                ), //i
    .io_sharedOutputs_0_arw_valid         (dbus_axi_decoder_io_sharedOutputs_0_arw_valid                         ), //o
    .io_sharedOutputs_0_arw_ready         (io_sharedOutputs_0_arw_validPipe_fire                                 ), //i
    .io_sharedOutputs_0_arw_payload_addr  (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_addr[31:0]            ), //o
    .io_sharedOutputs_0_arw_payload_len   (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_len[7:0]              ), //o
    .io_sharedOutputs_0_arw_payload_size  (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_size[2:0]             ), //o
    .io_sharedOutputs_0_arw_payload_cache (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_cache[3:0]            ), //o
    .io_sharedOutputs_0_arw_payload_prot  (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_prot[2:0]             ), //o
    .io_sharedOutputs_0_arw_payload_write (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_write                 ), //o
    .io_sharedOutputs_0_w_valid           (dbus_axi_decoder_io_sharedOutputs_0_w_valid                           ), //o
    .io_sharedOutputs_0_w_ready           (system_bram_io_axi_arbiter_io_sharedInputs_0_w_ready                  ), //i
    .io_sharedOutputs_0_w_payload_data    (dbus_axi_decoder_io_sharedOutputs_0_w_payload_data[31:0]              ), //o
    .io_sharedOutputs_0_w_payload_strb    (dbus_axi_decoder_io_sharedOutputs_0_w_payload_strb[3:0]               ), //o
    .io_sharedOutputs_0_w_payload_last    (dbus_axi_decoder_io_sharedOutputs_0_w_payload_last                    ), //o
    .io_sharedOutputs_0_b_valid           (system_bram_io_axi_arbiter_io_sharedInputs_0_b_valid                  ), //i
    .io_sharedOutputs_0_b_ready           (dbus_axi_decoder_io_sharedOutputs_0_b_ready                           ), //o
    .io_sharedOutputs_0_b_payload_resp    (system_bram_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]      ), //i
    .io_sharedOutputs_0_r_valid           (system_bram_io_axi_arbiter_io_sharedInputs_0_r_valid                  ), //i
    .io_sharedOutputs_0_r_ready           (dbus_axi_decoder_io_sharedOutputs_0_r_ready                           ), //o
    .io_sharedOutputs_0_r_payload_data    (system_bram_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]     ), //i
    .io_sharedOutputs_0_r_payload_resp    (system_bram_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]      ), //i
    .io_sharedOutputs_0_r_payload_last    (system_bram_io_axi_arbiter_io_sharedInputs_0_r_payload_last           ), //i
    .io_sharedOutputs_1_arw_valid         (dbus_axi_decoder_io_sharedOutputs_1_arw_valid                         ), //o
    .io_sharedOutputs_1_arw_ready         (io_sharedOutputs_1_arw_validPipe_fire                                 ), //i
    .io_sharedOutputs_1_arw_payload_addr  (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_addr[31:0]            ), //o
    .io_sharedOutputs_1_arw_payload_len   (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_len[7:0]              ), //o
    .io_sharedOutputs_1_arw_payload_size  (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_size[2:0]             ), //o
    .io_sharedOutputs_1_arw_payload_cache (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_cache[3:0]            ), //o
    .io_sharedOutputs_1_arw_payload_prot  (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_prot[2:0]             ), //o
    .io_sharedOutputs_1_arw_payload_write (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_write                 ), //o
    .io_sharedOutputs_1_w_valid           (dbus_axi_decoder_io_sharedOutputs_1_w_valid                           ), //o
    .io_sharedOutputs_1_w_ready           (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready             ), //i
    .io_sharedOutputs_1_w_payload_data    (dbus_axi_decoder_io_sharedOutputs_1_w_payload_data[31:0]              ), //o
    .io_sharedOutputs_1_w_payload_strb    (dbus_axi_decoder_io_sharedOutputs_1_w_payload_strb[3:0]               ), //o
    .io_sharedOutputs_1_w_payload_last    (dbus_axi_decoder_io_sharedOutputs_1_w_payload_last                    ), //o
    .io_sharedOutputs_1_b_valid           (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid             ), //i
    .io_sharedOutputs_1_b_ready           (dbus_axi_decoder_io_sharedOutputs_1_b_ready                           ), //o
    .io_sharedOutputs_1_b_payload_resp    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0] ), //i
    .io_sharedOutputs_1_r_valid           (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid             ), //i
    .io_sharedOutputs_1_r_ready           (dbus_axi_decoder_io_sharedOutputs_1_r_ready                           ), //o
    .io_sharedOutputs_1_r_payload_data    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]), //i
    .io_sharedOutputs_1_r_payload_resp    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0] ), //i
    .io_sharedOutputs_1_r_payload_last    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last      ), //i
    .aclk                                 (aclk                                                                  ), //i
    .resetCtrl_mainClkReset               (resetCtrl_mainClkReset                                                )  //i
  );
  Axi4ReadOnlyDecoder_1 S_AXI_BRAM_readOnly_decoder (
    .io_input_ar_valid             (S_AXI_BRAM_readOnly_ar_valid                                   ), //i
    .io_input_ar_ready             (S_AXI_BRAM_readOnly_decoder_io_input_ar_ready                  ), //o
    .io_input_ar_payload_addr      (S_AXI_BRAM_readOnly_ar_payload_addr[31:0]                      ), //i
    .io_input_ar_payload_id        (S_AXI_BRAM_readOnly_ar_payload_id[3:0]                         ), //i
    .io_input_ar_payload_len       (S_AXI_BRAM_readOnly_ar_payload_len[7:0]                        ), //i
    .io_input_ar_payload_size      (S_AXI_BRAM_readOnly_ar_payload_size[2:0]                       ), //i
    .io_input_ar_payload_burst     (S_AXI_BRAM_readOnly_ar_payload_burst[1:0]                      ), //i
    .io_input_r_valid              (S_AXI_BRAM_readOnly_decoder_io_input_r_valid                   ), //o
    .io_input_r_ready              (S_AXI_BRAM_readOnly_r_ready                                    ), //i
    .io_input_r_payload_data       (S_AXI_BRAM_readOnly_decoder_io_input_r_payload_data[31:0]      ), //o
    .io_input_r_payload_id         (S_AXI_BRAM_readOnly_decoder_io_input_r_payload_id[3:0]         ), //o
    .io_input_r_payload_resp       (S_AXI_BRAM_readOnly_decoder_io_input_r_payload_resp[1:0]       ), //o
    .io_input_r_payload_last       (S_AXI_BRAM_readOnly_decoder_io_input_r_payload_last            ), //o
    .io_outputs_0_ar_valid         (S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_valid              ), //o
    .io_outputs_0_ar_ready         (io_outputs_0_ar_validPipe_fire_1                               ), //i
    .io_outputs_0_ar_payload_addr  (S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_payload_addr[31:0] ), //o
    .io_outputs_0_ar_payload_id    (S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_payload_id[3:0]    ), //o
    .io_outputs_0_ar_payload_len   (S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_payload_len[7:0]   ), //o
    .io_outputs_0_ar_payload_size  (S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_payload_size[2:0]  ), //o
    .io_outputs_0_ar_payload_burst (S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_payload_burst[1:0] ), //o
    .io_outputs_0_r_valid          (system_bram_io_axi_arbiter_io_readInputs_1_r_valid             ), //i
    .io_outputs_0_r_ready          (S_AXI_BRAM_readOnly_decoder_io_outputs_0_r_ready               ), //o
    .io_outputs_0_r_payload_data   (system_bram_io_axi_arbiter_io_readInputs_1_r_payload_data[31:0]), //i
    .io_outputs_0_r_payload_id     (S_AXI_BRAM_readOnly_decoder_io_outputs_0_r_payload_id[3:0]     ), //i
    .io_outputs_0_r_payload_resp   (system_bram_io_axi_arbiter_io_readInputs_1_r_payload_resp[1:0] ), //i
    .io_outputs_0_r_payload_last   (system_bram_io_axi_arbiter_io_readInputs_1_r_payload_last      ), //i
    .aclk                          (aclk                                                           ), //i
    .resetCtrl_mainClkReset        (resetCtrl_mainClkReset                                         )  //i
  );
  Axi4WriteOnlyDecoder S_AXI_BRAM_writeOnly_decoder (
    .io_input_aw_valid             (S_AXI_BRAM_writeOnly_aw_valid                                  ), //i
    .io_input_aw_ready             (S_AXI_BRAM_writeOnly_decoder_io_input_aw_ready                 ), //o
    .io_input_aw_payload_addr      (S_AXI_BRAM_writeOnly_aw_payload_addr[31:0]                     ), //i
    .io_input_aw_payload_id        (S_AXI_BRAM_writeOnly_aw_payload_id[3:0]                        ), //i
    .io_input_aw_payload_len       (S_AXI_BRAM_writeOnly_aw_payload_len[7:0]                       ), //i
    .io_input_aw_payload_size      (S_AXI_BRAM_writeOnly_aw_payload_size[2:0]                      ), //i
    .io_input_aw_payload_burst     (S_AXI_BRAM_writeOnly_aw_payload_burst[1:0]                     ), //i
    .io_input_w_valid              (S_AXI_BRAM_writeOnly_w_valid                                   ), //i
    .io_input_w_ready              (S_AXI_BRAM_writeOnly_decoder_io_input_w_ready                  ), //o
    .io_input_w_payload_data       (S_AXI_BRAM_writeOnly_w_payload_data[31:0]                      ), //i
    .io_input_w_payload_strb       (S_AXI_BRAM_writeOnly_w_payload_strb[3:0]                       ), //i
    .io_input_w_payload_last       (S_AXI_BRAM_writeOnly_w_payload_last                            ), //i
    .io_input_b_valid              (S_AXI_BRAM_writeOnly_decoder_io_input_b_valid                  ), //o
    .io_input_b_ready              (S_AXI_BRAM_writeOnly_b_ready                                   ), //i
    .io_input_b_payload_id         (S_AXI_BRAM_writeOnly_decoder_io_input_b_payload_id[3:0]        ), //o
    .io_input_b_payload_resp       (S_AXI_BRAM_writeOnly_decoder_io_input_b_payload_resp[1:0]      ), //o
    .io_outputs_0_aw_valid         (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_valid             ), //o
    .io_outputs_0_aw_ready         (io_outputs_0_aw_validPipe_fire                                 ), //i
    .io_outputs_0_aw_payload_addr  (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_payload_addr[31:0]), //o
    .io_outputs_0_aw_payload_id    (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_payload_id[3:0]   ), //o
    .io_outputs_0_aw_payload_len   (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_payload_len[7:0]  ), //o
    .io_outputs_0_aw_payload_size  (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_payload_size[2:0] ), //o
    .io_outputs_0_aw_payload_burst (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_payload_burst[1:0]), //o
    .io_outputs_0_w_valid          (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_w_valid              ), //o
    .io_outputs_0_w_ready          (system_bram_io_axi_arbiter_io_writeInputs_0_w_ready            ), //i
    .io_outputs_0_w_payload_data   (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_w_payload_data[31:0] ), //o
    .io_outputs_0_w_payload_strb   (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_w_payload_strb[3:0]  ), //o
    .io_outputs_0_w_payload_last   (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_w_payload_last       ), //o
    .io_outputs_0_b_valid          (system_bram_io_axi_arbiter_io_writeInputs_0_b_valid            ), //i
    .io_outputs_0_b_ready          (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_b_ready              ), //o
    .io_outputs_0_b_payload_id     (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_b_payload_id[3:0]    ), //i
    .io_outputs_0_b_payload_resp   (system_bram_io_axi_arbiter_io_writeInputs_0_b_payload_resp[1:0]), //i
    .aclk                          (aclk                                                           ), //i
    .resetCtrl_mainClkReset        (resetCtrl_mainClkReset                                         )  //i
  );
  Axi4SharedArbiter system_bram_io_axi_arbiter (
    .io_readInputs_0_ar_valid            (io_outputs_0_ar_validPipe_valid                                    ), //i
    .io_readInputs_0_ar_ready            (system_bram_io_axi_arbiter_io_readInputs_0_ar_ready                ), //o
    .io_readInputs_0_ar_payload_addr     (system_bram_io_axi_arbiter_io_readInputs_0_ar_payload_addr[17:0]   ), //i
    .io_readInputs_0_ar_payload_id       (_zz_io_readInputs_0_ar_payload_id[4:0]                             ), //i
    .io_readInputs_0_ar_payload_len      (io_outputs_0_ar_validPipe_payload_len[7:0]                         ), //i
    .io_readInputs_0_ar_payload_size     (3'b010                                                             ), //i
    .io_readInputs_0_ar_payload_burst    (io_outputs_0_ar_validPipe_payload_burst[1:0]                       ), //i
    .io_readInputs_0_r_valid             (system_bram_io_axi_arbiter_io_readInputs_0_r_valid                 ), //o
    .io_readInputs_0_r_ready             (axi4ReadOnlyDecoder_2_io_outputs_0_r_ready                         ), //i
    .io_readInputs_0_r_payload_data      (system_bram_io_axi_arbiter_io_readInputs_0_r_payload_data[31:0]    ), //o
    .io_readInputs_0_r_payload_id        (system_bram_io_axi_arbiter_io_readInputs_0_r_payload_id[4:0]       ), //o
    .io_readInputs_0_r_payload_resp      (system_bram_io_axi_arbiter_io_readInputs_0_r_payload_resp[1:0]     ), //o
    .io_readInputs_0_r_payload_last      (system_bram_io_axi_arbiter_io_readInputs_0_r_payload_last          ), //o
    .io_readInputs_1_ar_valid            (io_outputs_0_ar_validPipe_valid_1                                  ), //i
    .io_readInputs_1_ar_ready            (system_bram_io_axi_arbiter_io_readInputs_1_ar_ready                ), //o
    .io_readInputs_1_ar_payload_addr     (system_bram_io_axi_arbiter_io_readInputs_1_ar_payload_addr[17:0]   ), //i
    .io_readInputs_1_ar_payload_id       (system_bram_io_axi_arbiter_io_readInputs_1_ar_payload_id[4:0]      ), //i
    .io_readInputs_1_ar_payload_len      (io_outputs_0_ar_validPipe_payload_len_1[7:0]                       ), //i
    .io_readInputs_1_ar_payload_size     (io_outputs_0_ar_validPipe_payload_size[2:0]                        ), //i
    .io_readInputs_1_ar_payload_burst    (io_outputs_0_ar_validPipe_payload_burst_1[1:0]                     ), //i
    .io_readInputs_1_r_valid             (system_bram_io_axi_arbiter_io_readInputs_1_r_valid                 ), //o
    .io_readInputs_1_r_ready             (S_AXI_BRAM_readOnly_decoder_io_outputs_0_r_ready                   ), //i
    .io_readInputs_1_r_payload_data      (system_bram_io_axi_arbiter_io_readInputs_1_r_payload_data[31:0]    ), //o
    .io_readInputs_1_r_payload_id        (system_bram_io_axi_arbiter_io_readInputs_1_r_payload_id[4:0]       ), //o
    .io_readInputs_1_r_payload_resp      (system_bram_io_axi_arbiter_io_readInputs_1_r_payload_resp[1:0]     ), //o
    .io_readInputs_1_r_payload_last      (system_bram_io_axi_arbiter_io_readInputs_1_r_payload_last          ), //o
    .io_writeInputs_0_aw_valid           (io_outputs_0_aw_validPipe_valid                                    ), //i
    .io_writeInputs_0_aw_ready           (system_bram_io_axi_arbiter_io_writeInputs_0_aw_ready               ), //o
    .io_writeInputs_0_aw_payload_addr    (system_bram_io_axi_arbiter_io_writeInputs_0_aw_payload_addr[17:0]  ), //i
    .io_writeInputs_0_aw_payload_id      (system_bram_io_axi_arbiter_io_writeInputs_0_aw_payload_id[5:0]     ), //i
    .io_writeInputs_0_aw_payload_len     (io_outputs_0_aw_validPipe_payload_len[7:0]                         ), //i
    .io_writeInputs_0_aw_payload_size    (io_outputs_0_aw_validPipe_payload_size[2:0]                        ), //i
    .io_writeInputs_0_aw_payload_burst   (io_outputs_0_aw_validPipe_payload_burst[1:0]                       ), //i
    .io_writeInputs_0_w_valid            (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_w_valid                  ), //i
    .io_writeInputs_0_w_ready            (system_bram_io_axi_arbiter_io_writeInputs_0_w_ready                ), //o
    .io_writeInputs_0_w_payload_data     (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_w_payload_data[31:0]     ), //i
    .io_writeInputs_0_w_payload_strb     (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_w_payload_strb[3:0]      ), //i
    .io_writeInputs_0_w_payload_last     (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_w_payload_last           ), //i
    .io_writeInputs_0_b_valid            (system_bram_io_axi_arbiter_io_writeInputs_0_b_valid                ), //o
    .io_writeInputs_0_b_ready            (S_AXI_BRAM_writeOnly_decoder_io_outputs_0_b_ready                  ), //i
    .io_writeInputs_0_b_payload_id       (system_bram_io_axi_arbiter_io_writeInputs_0_b_payload_id[5:0]      ), //o
    .io_writeInputs_0_b_payload_resp     (system_bram_io_axi_arbiter_io_writeInputs_0_b_payload_resp[1:0]    ), //o
    .io_sharedInputs_0_arw_valid         (io_sharedOutputs_0_arw_validPipe_valid                             ), //i
    .io_sharedInputs_0_arw_ready         (system_bram_io_axi_arbiter_io_sharedInputs_0_arw_ready             ), //o
    .io_sharedInputs_0_arw_payload_addr  (system_bram_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr[17:0]), //i
    .io_sharedInputs_0_arw_payload_id    (_zz_io_sharedInputs_0_arw_payload_id[4:0]                          ), //i
    .io_sharedInputs_0_arw_payload_len   (io_sharedOutputs_0_arw_validPipe_payload_len[7:0]                  ), //i
    .io_sharedInputs_0_arw_payload_size  (io_sharedOutputs_0_arw_validPipe_payload_size[2:0]                 ), //i
    .io_sharedInputs_0_arw_payload_burst (2'b01                                                              ), //i
    .io_sharedInputs_0_arw_payload_write (io_sharedOutputs_0_arw_validPipe_payload_write                     ), //i
    .io_sharedInputs_0_w_valid           (dbus_axi_decoder_io_sharedOutputs_0_w_valid                        ), //i
    .io_sharedInputs_0_w_ready           (system_bram_io_axi_arbiter_io_sharedInputs_0_w_ready               ), //o
    .io_sharedInputs_0_w_payload_data    (dbus_axi_decoder_io_sharedOutputs_0_w_payload_data[31:0]           ), //i
    .io_sharedInputs_0_w_payload_strb    (dbus_axi_decoder_io_sharedOutputs_0_w_payload_strb[3:0]            ), //i
    .io_sharedInputs_0_w_payload_last    (dbus_axi_decoder_io_sharedOutputs_0_w_payload_last                 ), //i
    .io_sharedInputs_0_b_valid           (system_bram_io_axi_arbiter_io_sharedInputs_0_b_valid               ), //o
    .io_sharedInputs_0_b_ready           (dbus_axi_decoder_io_sharedOutputs_0_b_ready                        ), //i
    .io_sharedInputs_0_b_payload_id      (system_bram_io_axi_arbiter_io_sharedInputs_0_b_payload_id[4:0]     ), //o
    .io_sharedInputs_0_b_payload_resp    (system_bram_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_valid           (system_bram_io_axi_arbiter_io_sharedInputs_0_r_valid               ), //o
    .io_sharedInputs_0_r_ready           (dbus_axi_decoder_io_sharedOutputs_0_r_ready                        ), //i
    .io_sharedInputs_0_r_payload_data    (system_bram_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]  ), //o
    .io_sharedInputs_0_r_payload_id      (system_bram_io_axi_arbiter_io_sharedInputs_0_r_payload_id[4:0]     ), //o
    .io_sharedInputs_0_r_payload_resp    (system_bram_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_payload_last    (system_bram_io_axi_arbiter_io_sharedInputs_0_r_payload_last        ), //o
    .io_output_arw_valid                 (system_bram_io_axi_arbiter_io_output_arw_valid                     ), //o
    .io_output_arw_ready                 (system_bram_io_axi_arw_ready                                       ), //i
    .io_output_arw_payload_addr          (system_bram_io_axi_arbiter_io_output_arw_payload_addr[17:0]        ), //o
    .io_output_arw_payload_id            (system_bram_io_axi_arbiter_io_output_arw_payload_id[6:0]           ), //o
    .io_output_arw_payload_len           (system_bram_io_axi_arbiter_io_output_arw_payload_len[7:0]          ), //o
    .io_output_arw_payload_size          (system_bram_io_axi_arbiter_io_output_arw_payload_size[2:0]         ), //o
    .io_output_arw_payload_burst         (system_bram_io_axi_arbiter_io_output_arw_payload_burst[1:0]        ), //o
    .io_output_arw_payload_write         (system_bram_io_axi_arbiter_io_output_arw_payload_write             ), //o
    .io_output_w_valid                   (system_bram_io_axi_arbiter_io_output_w_valid                       ), //o
    .io_output_w_ready                   (system_bram_io_axi_w_ready                                         ), //i
    .io_output_w_payload_data            (system_bram_io_axi_arbiter_io_output_w_payload_data[31:0]          ), //o
    .io_output_w_payload_strb            (system_bram_io_axi_arbiter_io_output_w_payload_strb[3:0]           ), //o
    .io_output_w_payload_last            (system_bram_io_axi_arbiter_io_output_w_payload_last                ), //o
    .io_output_b_valid                   (system_bram_io_axi_b_valid                                         ), //i
    .io_output_b_ready                   (system_bram_io_axi_arbiter_io_output_b_ready                       ), //o
    .io_output_b_payload_id              (system_bram_io_axi_b_payload_id[6:0]                               ), //i
    .io_output_b_payload_resp            (system_bram_io_axi_b_payload_resp[1:0]                             ), //i
    .io_output_r_valid                   (system_bram_io_axi_r_valid                                         ), //i
    .io_output_r_ready                   (system_bram_io_axi_arbiter_io_output_r_ready                       ), //o
    .io_output_r_payload_data            (system_bram_io_axi_r_payload_data[31:0]                            ), //i
    .io_output_r_payload_id              (system_bram_io_axi_r_payload_id[6:0]                               ), //i
    .io_output_r_payload_resp            (system_bram_io_axi_r_payload_resp[1:0]                             ), //i
    .io_output_r_payload_last            (system_bram_io_axi_r_payload_last                                  ), //i
    .aclk                                (aclk                                                               ), //i
    .resetCtrl_mainClkReset              (resetCtrl_mainClkReset                                             )  //i
  );
  Axi4SharedArbiter_1 system_apbBridge_io_axi_arbiter (
    .io_sharedInputs_0_arw_valid         (io_sharedOutputs_1_arw_validPipe_valid                                  ), //i
    .io_sharedInputs_0_arw_ready         (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready             ), //o
    .io_sharedInputs_0_arw_payload_addr  (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr[23:0]), //i
    .io_sharedInputs_0_arw_payload_id    (_zz_io_sharedInputs_0_arw_payload_id_1[3:0]                             ), //i
    .io_sharedInputs_0_arw_payload_len   (io_sharedOutputs_1_arw_validPipe_payload_len[7:0]                       ), //i
    .io_sharedInputs_0_arw_payload_size  (io_sharedOutputs_1_arw_validPipe_payload_size[2:0]                      ), //i
    .io_sharedInputs_0_arw_payload_burst (2'b01                                                                   ), //i
    .io_sharedInputs_0_arw_payload_write (io_sharedOutputs_1_arw_validPipe_payload_write                          ), //i
    .io_sharedInputs_0_w_valid           (dbus_axi_decoder_io_sharedOutputs_1_w_valid                             ), //i
    .io_sharedInputs_0_w_ready           (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready               ), //o
    .io_sharedInputs_0_w_payload_data    (dbus_axi_decoder_io_sharedOutputs_1_w_payload_data[31:0]                ), //i
    .io_sharedInputs_0_w_payload_strb    (dbus_axi_decoder_io_sharedOutputs_1_w_payload_strb[3:0]                 ), //i
    .io_sharedInputs_0_w_payload_last    (dbus_axi_decoder_io_sharedOutputs_1_w_payload_last                      ), //i
    .io_sharedInputs_0_b_valid           (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid               ), //o
    .io_sharedInputs_0_b_ready           (dbus_axi_decoder_io_sharedOutputs_1_b_ready                             ), //i
    .io_sharedInputs_0_b_payload_id      (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_id[3:0]     ), //o
    .io_sharedInputs_0_b_payload_resp    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_valid           (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid               ), //o
    .io_sharedInputs_0_r_ready           (dbus_axi_decoder_io_sharedOutputs_1_r_ready                             ), //i
    .io_sharedInputs_0_r_payload_data    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]  ), //o
    .io_sharedInputs_0_r_payload_id      (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_id[3:0]     ), //o
    .io_sharedInputs_0_r_payload_resp    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_payload_last    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last        ), //o
    .io_output_arw_valid                 (system_apbBridge_io_axi_arbiter_io_output_arw_valid                     ), //o
    .io_output_arw_ready                 (system_apbBridge_io_axi_arw_ready                                       ), //i
    .io_output_arw_payload_addr          (system_apbBridge_io_axi_arbiter_io_output_arw_payload_addr[23:0]        ), //o
    .io_output_arw_payload_id            (system_apbBridge_io_axi_arbiter_io_output_arw_payload_id[3:0]           ), //o
    .io_output_arw_payload_len           (system_apbBridge_io_axi_arbiter_io_output_arw_payload_len[7:0]          ), //o
    .io_output_arw_payload_size          (system_apbBridge_io_axi_arbiter_io_output_arw_payload_size[2:0]         ), //o
    .io_output_arw_payload_burst         (system_apbBridge_io_axi_arbiter_io_output_arw_payload_burst[1:0]        ), //o
    .io_output_arw_payload_write         (system_apbBridge_io_axi_arbiter_io_output_arw_payload_write             ), //o
    .io_output_w_valid                   (system_apbBridge_io_axi_arbiter_io_output_w_valid                       ), //o
    .io_output_w_ready                   (system_apbBridge_io_axi_w_ready                                         ), //i
    .io_output_w_payload_data            (system_apbBridge_io_axi_arbiter_io_output_w_payload_data[31:0]          ), //o
    .io_output_w_payload_strb            (system_apbBridge_io_axi_arbiter_io_output_w_payload_strb[3:0]           ), //o
    .io_output_w_payload_last            (system_apbBridge_io_axi_arbiter_io_output_w_payload_last                ), //o
    .io_output_b_valid                   (system_apbBridge_io_axi_b_valid                                         ), //i
    .io_output_b_ready                   (system_apbBridge_io_axi_arbiter_io_output_b_ready                       ), //o
    .io_output_b_payload_id              (system_apbBridge_io_axi_b_payload_id[3:0]                               ), //i
    .io_output_b_payload_resp            (system_apbBridge_io_axi_b_payload_resp[1:0]                             ), //i
    .io_output_r_valid                   (system_apbBridge_io_axi_r_valid                                         ), //i
    .io_output_r_ready                   (system_apbBridge_io_axi_arbiter_io_output_r_ready                       ), //o
    .io_output_r_payload_data            (system_apbBridge_io_axi_r_payload_data[31:0]                            ), //i
    .io_output_r_payload_id              (system_apbBridge_io_axi_r_payload_id[3:0]                               ), //i
    .io_output_r_payload_resp            (system_apbBridge_io_axi_r_payload_resp[1:0]                             ), //i
    .io_output_r_payload_last            (system_apbBridge_io_axi_r_payload_last                                  ), //i
    .aclk                                (aclk                                                                    ), //i
    .resetCtrl_mainClkReset              (resetCtrl_mainClkReset                                                  )  //i
  );
  Axi4ReadOnlyArbiter axi4ReadOnlyArbiter_1 (
    .io_inputs_0_ar_valid         (io_outputs_1_ar_validPipe_valid                       ), //i
    .io_inputs_0_ar_ready         (axi4ReadOnlyArbiter_1_io_inputs_0_ar_ready            ), //o
    .io_inputs_0_ar_payload_addr  (io_outputs_1_ar_validPipe_payload_addr[31:0]          ), //i
    .io_inputs_0_ar_payload_id    (_zz_io_inputs_0_ar_payload_id[2:0]                    ), //i
    .io_inputs_0_ar_payload_len   (io_outputs_1_ar_validPipe_payload_len[7:0]            ), //i
    .io_inputs_0_ar_payload_size  (3'b010                                                ), //i
    .io_inputs_0_ar_payload_burst (io_outputs_1_ar_validPipe_payload_burst[1:0]          ), //i
    .io_inputs_0_r_valid          (axi4ReadOnlyArbiter_1_io_inputs_0_r_valid             ), //o
    .io_inputs_0_r_ready          (axi4ReadOnlyDecoder_2_io_outputs_1_r_ready            ), //i
    .io_inputs_0_r_payload_data   (axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_data[31:0]), //o
    .io_inputs_0_r_payload_id     (axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_id[2:0]   ), //o
    .io_inputs_0_r_payload_resp   (axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_resp[1:0] ), //o
    .io_inputs_0_r_payload_last   (axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_last      ), //o
    .io_inputs_1_ar_valid         (io_readOutputs_0_ar_validPipe_valid                   ), //i
    .io_inputs_1_ar_ready         (axi4ReadOnlyArbiter_1_io_inputs_1_ar_ready            ), //o
    .io_inputs_1_ar_payload_addr  (io_readOutputs_0_ar_validPipe_payload_addr[31:0]      ), //i
    .io_inputs_1_ar_payload_id    (_zz_io_inputs_1_ar_payload_id[2:0]                    ), //i
    .io_inputs_1_ar_payload_len   (io_readOutputs_0_ar_validPipe_payload_len[7:0]        ), //i
    .io_inputs_1_ar_payload_size  (io_readOutputs_0_ar_validPipe_payload_size[2:0]       ), //i
    .io_inputs_1_ar_payload_burst (2'b01                                                 ), //i
    .io_inputs_1_r_valid          (axi4ReadOnlyArbiter_1_io_inputs_1_r_valid             ), //o
    .io_inputs_1_r_ready          (dbus_axi_decoder_io_readOutputs_0_r_ready             ), //i
    .io_inputs_1_r_payload_data   (axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_data[31:0]), //o
    .io_inputs_1_r_payload_id     (axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_id[2:0]   ), //o
    .io_inputs_1_r_payload_resp   (axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_resp[1:0] ), //o
    .io_inputs_1_r_payload_last   (axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_last      ), //o
    .io_output_ar_valid           (axi4ReadOnlyArbiter_1_io_output_ar_valid              ), //o
    .io_output_ar_ready           (system_ddrNode_ar_ready                               ), //i
    .io_output_ar_payload_addr    (axi4ReadOnlyArbiter_1_io_output_ar_payload_addr[31:0] ), //o
    .io_output_ar_payload_id      (axi4ReadOnlyArbiter_1_io_output_ar_payload_id[3:0]    ), //o
    .io_output_ar_payload_len     (axi4ReadOnlyArbiter_1_io_output_ar_payload_len[7:0]   ), //o
    .io_output_ar_payload_size    (axi4ReadOnlyArbiter_1_io_output_ar_payload_size[2:0]  ), //o
    .io_output_ar_payload_burst   (axi4ReadOnlyArbiter_1_io_output_ar_payload_burst[1:0] ), //o
    .io_output_r_valid            (system_ddrNode_r_valid                                ), //i
    .io_output_r_ready            (axi4ReadOnlyArbiter_1_io_output_r_ready               ), //o
    .io_output_r_payload_data     (system_ddrNode_r_payload_data[31:0]                   ), //i
    .io_output_r_payload_id       (system_ddrNode_r_payload_id[3:0]                      ), //i
    .io_output_r_payload_resp     (system_ddrNode_r_payload_resp[1:0]                    ), //i
    .io_output_r_payload_last     (system_ddrNode_r_payload_last                         ), //i
    .aclk                         (aclk                                                  ), //i
    .resetCtrl_mainClkReset       (resetCtrl_mainClkReset                                )  //i
  );
  Axi4WriteOnlyArbiter axi4WriteOnlyArbiter_1 (
    .io_inputs_0_aw_valid         (io_writeOutputs_0_aw_validPipe_valid                   ), //i
    .io_inputs_0_aw_ready         (axi4WriteOnlyArbiter_1_io_inputs_0_aw_ready            ), //o
    .io_inputs_0_aw_payload_addr  (io_writeOutputs_0_aw_validPipe_payload_addr[31:0]      ), //i
    .io_inputs_0_aw_payload_id    (_zz_io_inputs_0_aw_payload_id[3:0]                     ), //i
    .io_inputs_0_aw_payload_len   (io_writeOutputs_0_aw_validPipe_payload_len[7:0]        ), //i
    .io_inputs_0_aw_payload_size  (io_writeOutputs_0_aw_validPipe_payload_size[2:0]       ), //i
    .io_inputs_0_aw_payload_burst (2'b01                                                  ), //i
    .io_inputs_0_w_valid          (dbus_axi_decoder_io_writeOutputs_0_w_valid             ), //i
    .io_inputs_0_w_ready          (axi4WriteOnlyArbiter_1_io_inputs_0_w_ready             ), //o
    .io_inputs_0_w_payload_data   (dbus_axi_decoder_io_writeOutputs_0_w_payload_data[31:0]), //i
    .io_inputs_0_w_payload_strb   (dbus_axi_decoder_io_writeOutputs_0_w_payload_strb[3:0] ), //i
    .io_inputs_0_w_payload_last   (dbus_axi_decoder_io_writeOutputs_0_w_payload_last      ), //i
    .io_inputs_0_b_valid          (axi4WriteOnlyArbiter_1_io_inputs_0_b_valid             ), //o
    .io_inputs_0_b_ready          (dbus_axi_decoder_io_writeOutputs_0_b_ready             ), //i
    .io_inputs_0_b_payload_id     (axi4WriteOnlyArbiter_1_io_inputs_0_b_payload_id[3:0]   ), //o
    .io_inputs_0_b_payload_resp   (axi4WriteOnlyArbiter_1_io_inputs_0_b_payload_resp[1:0] ), //o
    .io_output_aw_valid           (axi4WriteOnlyArbiter_1_io_output_aw_valid              ), //o
    .io_output_aw_ready           (system_ddrNode_aw_ready                                ), //i
    .io_output_aw_payload_addr    (axi4WriteOnlyArbiter_1_io_output_aw_payload_addr[31:0] ), //o
    .io_output_aw_payload_id      (axi4WriteOnlyArbiter_1_io_output_aw_payload_id[3:0]    ), //o
    .io_output_aw_payload_len     (axi4WriteOnlyArbiter_1_io_output_aw_payload_len[7:0]   ), //o
    .io_output_aw_payload_size    (axi4WriteOnlyArbiter_1_io_output_aw_payload_size[2:0]  ), //o
    .io_output_aw_payload_burst   (axi4WriteOnlyArbiter_1_io_output_aw_payload_burst[1:0] ), //o
    .io_output_w_valid            (axi4WriteOnlyArbiter_1_io_output_w_valid               ), //o
    .io_output_w_ready            (system_ddrNode_w_ready                                 ), //i
    .io_output_w_payload_data     (axi4WriteOnlyArbiter_1_io_output_w_payload_data[31:0]  ), //o
    .io_output_w_payload_strb     (axi4WriteOnlyArbiter_1_io_output_w_payload_strb[3:0]   ), //o
    .io_output_w_payload_last     (axi4WriteOnlyArbiter_1_io_output_w_payload_last        ), //o
    .io_output_b_valid            (system_ddrNode_b_valid                                 ), //i
    .io_output_b_ready            (axi4WriteOnlyArbiter_1_io_output_b_ready               ), //o
    .io_output_b_payload_id       (system_ddrNode_b_payload_id[3:0]                       ), //i
    .io_output_b_payload_resp     (system_ddrNode_b_payload_resp[1:0]                     ), //i
    .aclk                         (aclk                                                   ), //i
    .resetCtrl_mainClkReset       (resetCtrl_mainClkReset                                 )  //i
  );
  initial begin
    resetCtrl_systemClkResetCounter = 6'h0;
  end

  always @(*) begin
    resetCtrl_mainClkResetUnbuffered = 1'b0;
    if(when_VexSatV_l214) begin
      resetCtrl_mainClkResetUnbuffered = 1'b1;
    end
  end

  assign _zz_when_VexSatV_l214[5 : 0] = 6'h3f;
  assign when_VexSatV_l214 = (resetCtrl_systemClkResetCounter != _zz_when_VexSatV_l214);
  assign when_VexSatV_l218 = areset_buffercc_io_dataOut;
  assign resetCtrl_cpuResetSync = cpu_areset_buffercc_io_dataOut;
  assign _zz_1 = (resetCtrl_mainClkReset || resetCtrl_cpuResetSync);
  assign system_coreFactory_readErrorFlag = 1'b0;
  assign system_coreFactory_writeErrorFlag = 1'b0;
  assign system_registersApb_PREADY = 1'b1;
  always @(*) begin
    system_registersApb_PRDATA = 32'h0;
    case(system_registersApb_PADDR)
      12'h0 : begin
        system_registersApb_PRDATA[31 : 0] = system_rwRegs_0;
      end
      12'h004 : begin
        system_registersApb_PRDATA[31 : 0] = system_rwRegs_1;
      end
      12'h008 : begin
        system_registersApb_PRDATA[31 : 0] = system_rwRegs_2;
      end
      12'h00c : begin
        system_registersApb_PRDATA[31 : 0] = system_rwRegs_3;
      end
      12'h010 : begin
        system_registersApb_PRDATA[31 : 0] = system_rwRegs_4;
      end
      12'h014 : begin
        system_registersApb_PRDATA[31 : 0] = system_roRegs_0;
      end
      12'h018 : begin
        system_registersApb_PRDATA[31 : 0] = system_roRegs_1;
      end
      12'h01c : begin
        system_registersApb_PRDATA[31 : 0] = system_roRegs_2;
      end
      12'h020 : begin
        system_registersApb_PRDATA[31 : 0] = system_roRegs_3;
      end
      12'h024 : begin
        system_registersApb_PRDATA[31 : 0] = system_roRegs_4;
      end
      default : begin
      end
    endcase
  end

  assign system_coreFactory_askWrite = ((system_registersApb_PSEL[0] && system_registersApb_PENABLE) && system_registersApb_PWRITE);
  assign system_coreFactory_askRead = ((system_registersApb_PSEL[0] && system_registersApb_PENABLE) && (! system_registersApb_PWRITE));
  assign system_coreFactory_doWrite = (((system_registersApb_PSEL[0] && system_registersApb_PENABLE) && system_registersApb_PREADY) && system_registersApb_PWRITE);
  assign system_coreFactory_doRead = (((system_registersApb_PSEL[0] && system_registersApb_PENABLE) && system_registersApb_PREADY) && (! system_registersApb_PWRITE));
  assign system_registersApb_PSLVERROR = ((system_coreFactory_doWrite && system_coreFactory_writeErrorFlag) || (system_coreFactory_doRead && system_coreFactory_readErrorFlag));
  always @(*) begin
    system_regChanged_0 = 1'b0;
    case(system_extFactory_writeAddressMasked)
      12'h0 : begin
        if(system_extFactory_writeOccur) begin
          system_regChanged_0 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    system_regChanged_1 = 1'b0;
    case(system_extFactory_writeAddressMasked)
      12'h004 : begin
        if(system_extFactory_writeOccur) begin
          system_regChanged_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    system_regChanged_2 = 1'b0;
    case(system_extFactory_writeAddressMasked)
      12'h008 : begin
        if(system_extFactory_writeOccur) begin
          system_regChanged_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    system_regChanged_3 = 1'b0;
    case(system_extFactory_writeAddressMasked)
      12'h00c : begin
        if(system_extFactory_writeOccur) begin
          system_regChanged_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    system_regChanged_4 = 1'b0;
    case(system_extFactory_writeAddressMasked)
      12'h010 : begin
        if(system_extFactory_writeOccur) begin
          system_regChanged_4 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign system_extFactory_readErrorFlag = 1'b0;
  assign system_extFactory_writeErrorFlag = 1'b0;
  assign system_extFactory_readHaltRequest = 1'b0;
  assign system_extFactory_writeHaltRequest = 1'b0;
  assign system_extFactory_writeOccur = (system_extFactory_writeJoinEvent_valid && system_extFactory_writeJoinEvent_ready);
  assign system_extFactory_writeJoinEvent_valid = (S_AXI_CTRL_awvalid && S_AXI_CTRL_wvalid);
  assign S_AXI_CTRL_awready = system_extFactory_writeOccur;
  assign S_AXI_CTRL_wready = system_extFactory_writeOccur;
  assign system_extFactory_writeJoinEvent_translated_valid = system_extFactory_writeJoinEvent_valid;
  assign system_extFactory_writeJoinEvent_ready = system_extFactory_writeJoinEvent_translated_ready;
  assign system_extFactory_writeJoinEvent_translated_payload_resp = system_extFactory_writeRsp_resp;
  assign _zz_system_extFactory_writeJoinEvent_translated_ready = (! system_extFactory_writeHaltRequest);
  assign system_extFactory_writeJoinEvent_translated_haltWhen_valid = (system_extFactory_writeJoinEvent_translated_valid && _zz_system_extFactory_writeJoinEvent_translated_ready);
  assign system_extFactory_writeJoinEvent_translated_ready = (system_extFactory_writeJoinEvent_translated_haltWhen_ready && _zz_system_extFactory_writeJoinEvent_translated_ready);
  assign system_extFactory_writeJoinEvent_translated_haltWhen_payload_resp = system_extFactory_writeJoinEvent_translated_payload_resp;
  assign system_extFactory_writeJoinEvent_translated_haltWhen_halfPipe_fire = (system_extFactory_writeJoinEvent_translated_haltWhen_halfPipe_valid && system_extFactory_writeJoinEvent_translated_haltWhen_halfPipe_ready);
  assign system_extFactory_writeJoinEvent_translated_haltWhen_ready = (! system_extFactory_writeJoinEvent_translated_haltWhen_rValid);
  assign system_extFactory_writeJoinEvent_translated_haltWhen_halfPipe_valid = system_extFactory_writeJoinEvent_translated_haltWhen_rValid;
  assign system_extFactory_writeJoinEvent_translated_haltWhen_halfPipe_payload_resp = system_extFactory_writeJoinEvent_translated_haltWhen_rData_resp;
  assign S_AXI_CTRL_bvalid = system_extFactory_writeJoinEvent_translated_haltWhen_halfPipe_valid;
  assign system_extFactory_writeJoinEvent_translated_haltWhen_halfPipe_ready = S_AXI_CTRL_bready;
  assign S_AXI_CTRL_bresp = system_extFactory_writeJoinEvent_translated_haltWhen_halfPipe_payload_resp;
  assign system_extFactory_readDataStage_fire = (system_extFactory_readDataStage_valid && system_extFactory_readDataStage_ready);
  assign S_AXI_CTRL_arready = (! S_AXI_CTRL_ar_rValid);
  assign system_extFactory_readDataStage_valid = S_AXI_CTRL_ar_rValid;
  assign system_extFactory_readDataStage_payload_addr = S_AXI_CTRL_ar_rData_addr;
  assign system_extFactory_readDataStage_payload_prot = S_AXI_CTRL_ar_rData_prot;
  assign _zz_system_extFactory_readDataStage_ready = (! system_extFactory_readHaltRequest);
  assign system_extFactory_readDataStage_haltWhen_valid = (system_extFactory_readDataStage_valid && _zz_system_extFactory_readDataStage_ready);
  assign system_extFactory_readDataStage_ready = (system_extFactory_readDataStage_haltWhen_ready && _zz_system_extFactory_readDataStage_ready);
  assign system_extFactory_readDataStage_haltWhen_payload_addr = system_extFactory_readDataStage_payload_addr;
  assign system_extFactory_readDataStage_haltWhen_payload_prot = system_extFactory_readDataStage_payload_prot;
  assign system_extFactory_readDataStage_haltWhen_translated_valid = system_extFactory_readDataStage_haltWhen_valid;
  assign system_extFactory_readDataStage_haltWhen_ready = system_extFactory_readDataStage_haltWhen_translated_ready;
  assign system_extFactory_readDataStage_haltWhen_translated_payload_data = system_extFactory_readRsp_data;
  assign system_extFactory_readDataStage_haltWhen_translated_payload_resp = system_extFactory_readRsp_resp;
  assign S_AXI_CTRL_rvalid = system_extFactory_readDataStage_haltWhen_translated_valid;
  assign system_extFactory_readDataStage_haltWhen_translated_ready = S_AXI_CTRL_rready;
  assign S_AXI_CTRL_rdata = system_extFactory_readDataStage_haltWhen_translated_payload_data;
  assign S_AXI_CTRL_rresp = system_extFactory_readDataStage_haltWhen_translated_payload_resp;
  always @(*) begin
    if(system_extFactory_writeErrorFlag) begin
      system_extFactory_writeRsp_resp = 2'b10;
    end else begin
      system_extFactory_writeRsp_resp = 2'b00;
    end
  end

  always @(*) begin
    if(system_extFactory_readErrorFlag) begin
      system_extFactory_readRsp_resp = 2'b10;
    end else begin
      system_extFactory_readRsp_resp = 2'b00;
    end
  end

  always @(*) begin
    system_extFactory_readRsp_data = 32'h0;
    case(system_extFactory_readAddressMasked)
      12'h0 : begin
        system_extFactory_readRsp_data[31 : 0] = system_rwRegs_0;
      end
      12'h004 : begin
        system_extFactory_readRsp_data[31 : 0] = system_rwRegs_1;
      end
      12'h008 : begin
        system_extFactory_readRsp_data[31 : 0] = system_rwRegs_2;
      end
      12'h00c : begin
        system_extFactory_readRsp_data[31 : 0] = system_rwRegs_3;
      end
      12'h010 : begin
        system_extFactory_readRsp_data[31 : 0] = system_rwRegs_4;
      end
      12'h014 : begin
        system_extFactory_readRsp_data[31 : 0] = system_roRegs_0;
      end
      12'h018 : begin
        system_extFactory_readRsp_data[31 : 0] = system_roRegs_1;
      end
      12'h01c : begin
        system_extFactory_readRsp_data[31 : 0] = system_roRegs_2;
      end
      12'h020 : begin
        system_extFactory_readRsp_data[31 : 0] = system_roRegs_3;
      end
      12'h024 : begin
        system_extFactory_readRsp_data[31 : 0] = system_roRegs_4;
      end
      default : begin
      end
    endcase
  end

  assign system_extFactory_readAddressMasked = (system_extFactory_readDataStage_payload_addr & (~ 12'h003));
  assign system_extFactory_writeAddressMasked = (S_AXI_CTRL_awaddr & (~ 12'h003));
  assign system_extFactory_readOccur = (S_AXI_CTRL_rvalid && S_AXI_CTRL_rready);
  assign io_uart_txd = system_uartCtrl_io_uart_txd;
  assign system_plicCtrl_io_sources = {system_uartCtrl_io_interrupt,{system_regChanged_4,{system_regChanged_3,{system_regChanged_2,{system_regChanged_1,system_regChanged_0}}}}};
  assign M_AXI_DDR_arvalid = system_ddrNode_ar_valid;
  assign system_ddrNode_ar_ready = M_AXI_DDR_arready;
  always @(*) begin
    M_AXI_DDR_araddr = system_ddrNode_ar_payload_addr;
    M_AXI_DDR_araddr = (_zz_M_AXI_DDR_araddr + 32'h40000000);
  end

  assign M_AXI_DDR_arid = system_ddrNode_ar_payload_id;
  assign M_AXI_DDR_arlen = system_ddrNode_ar_payload_len;
  assign M_AXI_DDR_arsize = system_ddrNode_ar_payload_size;
  assign M_AXI_DDR_arburst = system_ddrNode_ar_payload_burst;
  assign M_AXI_DDR_awvalid = system_ddrNode_aw_valid;
  assign system_ddrNode_aw_ready = M_AXI_DDR_awready;
  always @(*) begin
    M_AXI_DDR_awaddr = system_ddrNode_aw_payload_addr;
    M_AXI_DDR_awaddr = (_zz_M_AXI_DDR_awaddr + 32'h40000000);
  end

  assign M_AXI_DDR_awid = system_ddrNode_aw_payload_id;
  assign M_AXI_DDR_awlen = system_ddrNode_aw_payload_len;
  assign M_AXI_DDR_awsize = system_ddrNode_aw_payload_size;
  assign M_AXI_DDR_awburst = system_ddrNode_aw_payload_burst;
  assign M_AXI_DDR_wvalid = system_ddrNode_w_valid;
  assign system_ddrNode_w_ready = M_AXI_DDR_wready;
  assign M_AXI_DDR_wdata = system_ddrNode_w_payload_data;
  assign M_AXI_DDR_wstrb = system_ddrNode_w_payload_strb;
  assign M_AXI_DDR_wlast = system_ddrNode_w_payload_last;
  assign system_ddrNode_r_valid = M_AXI_DDR_rvalid;
  assign M_AXI_DDR_rready = system_ddrNode_r_ready;
  assign system_ddrNode_r_payload_data = M_AXI_DDR_rdata;
  assign system_ddrNode_r_payload_last = M_AXI_DDR_rlast;
  assign system_ddrNode_r_payload_id = M_AXI_DDR_rid;
  assign system_ddrNode_r_payload_resp = M_AXI_DDR_rresp;
  assign system_ddrNode_b_valid = M_AXI_DDR_bvalid;
  assign M_AXI_DDR_bready = system_ddrNode_b_ready;
  assign system_ddrNode_b_payload_id = M_AXI_DDR_bid;
  assign system_ddrNode_b_payload_resp = M_AXI_DDR_bresp;
  assign system_core_cpu_iBus_rsp_payload_error = (! (axi4ReadOnlyDecoder_2_io_input_r_payload_resp == 2'b00));
  always @(*) begin
    system_core_cpu_dBus_cmd_ready = dBus_cmd_stage_ready;
    if(when_Stream_l477) begin
      system_core_cpu_dBus_cmd_ready = 1'b1;
    end
  end

  assign when_Stream_l477 = (! dBus_cmd_stage_valid);
  assign dBus_cmd_stage_valid = dBus_cmd_rValid;
  assign dBus_cmd_stage_payload_wr = dBus_cmd_rData_wr;
  assign dBus_cmd_stage_payload_uncached = dBus_cmd_rData_uncached;
  assign dBus_cmd_stage_payload_address = dBus_cmd_rData_address;
  assign dBus_cmd_stage_payload_data = dBus_cmd_rData_data;
  assign dBus_cmd_stage_payload_mask = dBus_cmd_rData_mask;
  assign dBus_cmd_stage_payload_size = dBus_cmd_rData_size;
  assign dBus_cmd_stage_payload_last = dBus_cmd_rData_last;
  always @(*) begin
    dBus_cmd_stage_ready = dBus_cmd_stage_stage_ready;
    if(when_Stream_l477_1) begin
      dBus_cmd_stage_ready = 1'b1;
    end
  end

  assign when_Stream_l477_1 = (! dBus_cmd_stage_stage_valid);
  assign dBus_cmd_stage_stage_valid = dBus_cmd_stage_rValid;
  assign dBus_cmd_stage_stage_payload_wr = dBus_cmd_stage_rData_wr;
  assign dBus_cmd_stage_stage_payload_uncached = dBus_cmd_stage_rData_uncached;
  assign dBus_cmd_stage_stage_payload_address = dBus_cmd_stage_rData_address;
  assign dBus_cmd_stage_stage_payload_data = dBus_cmd_stage_rData_data;
  assign dBus_cmd_stage_stage_payload_mask = dBus_cmd_stage_rData_mask;
  assign dBus_cmd_stage_stage_payload_size = dBus_cmd_stage_rData_size;
  assign dBus_cmd_stage_stage_payload_last = dBus_cmd_stage_rData_last;
  assign dBus_cmd_stage_stage_ready = dBus_cmd_stage_stage_rValidN;
  assign dBusToAxi4Shared_cmdPreFork_valid = (dBus_cmd_stage_stage_valid || (! dBus_cmd_stage_stage_rValidN));
  assign dBusToAxi4Shared_cmdPreFork_payload_wr = (dBus_cmd_stage_stage_rValidN ? dBus_cmd_stage_stage_payload_wr : dBus_cmd_stage_stage_rData_wr);
  assign dBusToAxi4Shared_cmdPreFork_payload_uncached = (dBus_cmd_stage_stage_rValidN ? dBus_cmd_stage_stage_payload_uncached : dBus_cmd_stage_stage_rData_uncached);
  assign dBusToAxi4Shared_cmdPreFork_payload_address = (dBus_cmd_stage_stage_rValidN ? dBus_cmd_stage_stage_payload_address : dBus_cmd_stage_stage_rData_address);
  assign dBusToAxi4Shared_cmdPreFork_payload_data = (dBus_cmd_stage_stage_rValidN ? dBus_cmd_stage_stage_payload_data : dBus_cmd_stage_stage_rData_data);
  assign dBusToAxi4Shared_cmdPreFork_payload_mask = (dBus_cmd_stage_stage_rValidN ? dBus_cmd_stage_stage_payload_mask : dBus_cmd_stage_stage_rData_mask);
  assign dBusToAxi4Shared_cmdPreFork_payload_size = (dBus_cmd_stage_stage_rValidN ? dBus_cmd_stage_stage_payload_size : dBus_cmd_stage_stage_rData_size);
  assign dBusToAxi4Shared_cmdPreFork_payload_last = (dBus_cmd_stage_stage_rValidN ? dBus_cmd_stage_stage_payload_last : dBus_cmd_stage_stage_rData_last);
  assign dBusToAxi4Shared_cmdPreFork_fire = (dBusToAxi4Shared_cmdPreFork_valid && dBusToAxi4Shared_cmdPreFork_ready);
  assign when_Utils_l732 = (dBusToAxi4Shared_cmdPreFork_fire && dBusToAxi4Shared_cmdPreFork_payload_wr);
  assign dbus_axi_b_fire = (dbus_axi_b_valid && dbus_axi_b_ready);
  always @(*) begin
    dBusToAxi4Shared_pendingWrites_incrementIt = 1'b0;
    if(when_Utils_l732) begin
      dBusToAxi4Shared_pendingWrites_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    dBusToAxi4Shared_pendingWrites_decrementIt = 1'b0;
    if(dbus_axi_b_fire) begin
      dBusToAxi4Shared_pendingWrites_decrementIt = 1'b1;
    end
  end

  assign dBusToAxi4Shared_pendingWrites_mayOverflow = (dBusToAxi4Shared_pendingWrites_value == 3'b111);
  assign dBusToAxi4Shared_pendingWrites_mayUnderflow = (dBusToAxi4Shared_pendingWrites_value == 3'b000);
  assign dBusToAxi4Shared_pendingWrites_willOverflowIfInc = (dBusToAxi4Shared_pendingWrites_mayOverflow && (! dBusToAxi4Shared_pendingWrites_decrementIt));
  assign dBusToAxi4Shared_pendingWrites_willOverflow = (dBusToAxi4Shared_pendingWrites_willOverflowIfInc && dBusToAxi4Shared_pendingWrites_incrementIt);
  assign dBusToAxi4Shared_pendingWrites_willUnderflowIfDec = (dBusToAxi4Shared_pendingWrites_mayUnderflow && (! dBusToAxi4Shared_pendingWrites_incrementIt));
  assign dBusToAxi4Shared_pendingWrites_willUnderflow = (dBusToAxi4Shared_pendingWrites_willUnderflowIfDec && dBusToAxi4Shared_pendingWrites_decrementIt);
  assign when_Utils_l767 = (dBusToAxi4Shared_pendingWrites_incrementIt && (! dBusToAxi4Shared_pendingWrites_decrementIt));
  always @(*) begin
    if(when_Utils_l767) begin
      dBusToAxi4Shared_pendingWrites_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l769) begin
        dBusToAxi4Shared_pendingWrites_finalIncrement = 3'b111;
      end else begin
        dBusToAxi4Shared_pendingWrites_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l769 = ((! dBusToAxi4Shared_pendingWrites_incrementIt) && dBusToAxi4Shared_pendingWrites_decrementIt);
  assign dBusToAxi4Shared_pendingWrites_valueNext = (dBusToAxi4Shared_pendingWrites_value + dBusToAxi4Shared_pendingWrites_finalIncrement);
  assign dBusToAxi4Shared_hazard = (((dBusToAxi4Shared_pendingWrites_value != 3'b000) && (! dBusToAxi4Shared_cmdPreFork_payload_wr)) || (dBusToAxi4Shared_pendingWrites_value == 3'b111));
  assign _zz_dBusToAxi4Shared_cmdPreFork_ready = (! dBusToAxi4Shared_hazard);
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_valid = (dBusToAxi4Shared_cmdPreFork_valid && _zz_dBusToAxi4Shared_cmdPreFork_ready);
  assign dBusToAxi4Shared_cmdPreFork_ready = (dBusToAxi4Shared_cmdPreFork_haltWhen_ready && _zz_dBusToAxi4Shared_cmdPreFork_ready);
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_payload_wr = dBusToAxi4Shared_cmdPreFork_payload_wr;
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_payload_uncached = dBusToAxi4Shared_cmdPreFork_payload_uncached;
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_payload_address = dBusToAxi4Shared_cmdPreFork_payload_address;
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_payload_data = dBusToAxi4Shared_cmdPreFork_payload_data;
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_payload_mask = dBusToAxi4Shared_cmdPreFork_payload_mask;
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_payload_size = dBusToAxi4Shared_cmdPreFork_payload_size;
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_payload_last = dBusToAxi4Shared_cmdPreFork_payload_last;
  always @(*) begin
    dBusToAxi4Shared_cmdPreFork_haltWhen_ready = 1'b1;
    if(when_Stream_l1253) begin
      dBusToAxi4Shared_cmdPreFork_haltWhen_ready = 1'b0;
    end
    if(when_Stream_l1253_1) begin
      dBusToAxi4Shared_cmdPreFork_haltWhen_ready = 1'b0;
    end
  end

  assign when_Stream_l1253 = ((! dBusToAxi4Shared_cmdFork_ready) && dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_0);
  assign when_Stream_l1253_1 = ((! dBusToAxi4Shared_dataFork_ready) && dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_1);
  assign dBusToAxi4Shared_cmdFork_valid = (dBusToAxi4Shared_cmdPreFork_haltWhen_valid && dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_0);
  assign dBusToAxi4Shared_cmdFork_payload_wr = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_wr;
  assign dBusToAxi4Shared_cmdFork_payload_uncached = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_uncached;
  assign dBusToAxi4Shared_cmdFork_payload_address = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_address;
  assign dBusToAxi4Shared_cmdFork_payload_data = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_data;
  assign dBusToAxi4Shared_cmdFork_payload_mask = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_mask;
  assign dBusToAxi4Shared_cmdFork_payload_size = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_size;
  assign dBusToAxi4Shared_cmdFork_payload_last = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_last;
  assign dBusToAxi4Shared_cmdFork_fire = (dBusToAxi4Shared_cmdFork_valid && dBusToAxi4Shared_cmdFork_ready);
  assign dBusToAxi4Shared_dataFork_valid = (dBusToAxi4Shared_cmdPreFork_haltWhen_valid && dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_1);
  assign dBusToAxi4Shared_dataFork_payload_wr = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_wr;
  assign dBusToAxi4Shared_dataFork_payload_uncached = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_uncached;
  assign dBusToAxi4Shared_dataFork_payload_address = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_address;
  assign dBusToAxi4Shared_dataFork_payload_data = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_data;
  assign dBusToAxi4Shared_dataFork_payload_mask = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_mask;
  assign dBusToAxi4Shared_dataFork_payload_size = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_size;
  assign dBusToAxi4Shared_dataFork_payload_last = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_last;
  assign dBusToAxi4Shared_dataFork_fire = (dBusToAxi4Shared_dataFork_valid && dBusToAxi4Shared_dataFork_ready);
  always @(*) begin
    dBusToAxi4Shared_cmdStage_valid = dBusToAxi4Shared_cmdFork_valid;
    if(_zz_2) begin
      dBusToAxi4Shared_cmdStage_valid = 1'b0;
    end
  end

  always @(*) begin
    dBusToAxi4Shared_cmdFork_ready = dBusToAxi4Shared_cmdStage_ready;
    if(_zz_2) begin
      dBusToAxi4Shared_cmdFork_ready = 1'b1;
    end
  end

  assign dBusToAxi4Shared_cmdStage_payload_wr = dBusToAxi4Shared_cmdFork_payload_wr;
  assign dBusToAxi4Shared_cmdStage_payload_uncached = dBusToAxi4Shared_cmdFork_payload_uncached;
  assign dBusToAxi4Shared_cmdStage_payload_address = dBusToAxi4Shared_cmdFork_payload_address;
  assign dBusToAxi4Shared_cmdStage_payload_data = dBusToAxi4Shared_cmdFork_payload_data;
  assign dBusToAxi4Shared_cmdStage_payload_mask = dBusToAxi4Shared_cmdFork_payload_mask;
  assign dBusToAxi4Shared_cmdStage_payload_size = dBusToAxi4Shared_cmdFork_payload_size;
  assign dBusToAxi4Shared_cmdStage_payload_last = dBusToAxi4Shared_cmdFork_payload_last;
  assign when_Stream_l581 = (! dBusToAxi4Shared_dataFork_payload_wr);
  always @(*) begin
    dBusToAxi4Shared_dataStage_valid = dBusToAxi4Shared_dataFork_valid;
    if(when_Stream_l581) begin
      dBusToAxi4Shared_dataStage_valid = 1'b0;
    end
  end

  always @(*) begin
    dBusToAxi4Shared_dataFork_ready = dBusToAxi4Shared_dataStage_ready;
    if(when_Stream_l581) begin
      dBusToAxi4Shared_dataFork_ready = 1'b1;
    end
  end

  assign dBusToAxi4Shared_dataStage_payload_wr = dBusToAxi4Shared_dataFork_payload_wr;
  assign dBusToAxi4Shared_dataStage_payload_uncached = dBusToAxi4Shared_dataFork_payload_uncached;
  assign dBusToAxi4Shared_dataStage_payload_address = dBusToAxi4Shared_dataFork_payload_address;
  assign dBusToAxi4Shared_dataStage_payload_data = dBusToAxi4Shared_dataFork_payload_data;
  assign dBusToAxi4Shared_dataStage_payload_mask = dBusToAxi4Shared_dataFork_payload_mask;
  assign dBusToAxi4Shared_dataStage_payload_size = dBusToAxi4Shared_dataFork_payload_size;
  assign dBusToAxi4Shared_dataStage_payload_last = dBusToAxi4Shared_dataFork_payload_last;
  assign dbus_axi_arw_valid = dBusToAxi4Shared_cmdStage_valid;
  assign dBusToAxi4Shared_cmdStage_ready = dbus_axi_arw_ready;
  assign dbus_axi_arw_payload_write = dBusToAxi4Shared_cmdStage_payload_wr;
  assign dbus_axi_arw_payload_prot = 3'b010;
  assign dbus_axi_arw_payload_cache = 4'b1111;
  assign dbus_axi_arw_payload_size = 3'b010;
  assign dbus_axi_arw_payload_addr = dBusToAxi4Shared_cmdStage_payload_address;
  assign dbus_axi_arw_payload_len = {4'd0, _zz_dbus_axi_arw_payload_len};
  assign dbus_axi_w_valid = dBusToAxi4Shared_dataStage_valid;
  assign dBusToAxi4Shared_dataStage_ready = dbus_axi_w_ready;
  assign dbus_axi_w_payload_data = dBusToAxi4Shared_dataStage_payload_data;
  assign dbus_axi_w_payload_strb = dBusToAxi4Shared_dataStage_payload_mask;
  assign dbus_axi_w_payload_last = dBusToAxi4Shared_dataStage_payload_last;
  assign system_core_cpu_dBus_rsp_payload_error = (! (dbus_axi_r_payload_resp == 2'b00));
  assign dbus_axi_r_ready = 1'b1;
  assign dbus_axi_b_ready = 1'b1;
  assign system_core_cpu_timerInterrupt = system_clintCtrl_io_timerInterrupt[0];
  assign system_core_cpu_softwareInterrupt = system_clintCtrl_io_softwareInterrupt[0];
  assign system_core_cpu_externalInterrupt = system_plicCtrl_io_targets[0];
  assign system_core_cpu_debug_bus_cmd_payload_address = systemDebugger_1_io_mem_cmd_payload_address[7:0];
  assign debug_bus_cmd_fire = (systemDebugger_1_io_mem_cmd_valid && system_core_cpu_debug_bus_cmd_ready);
  assign io_jtag_tdo = jtagBridge_1_io_jtag_tdo;
  assign system_registersApb_PADDR = apb3Router_1_io_outputs_0_PADDR[11:0];
  assign system_registersApb_PSEL = apb3Router_1_io_outputs_0_PSEL;
  assign system_registersApb_PENABLE = apb3Router_1_io_outputs_0_PENABLE;
  assign system_registersApb_PWRITE = apb3Router_1_io_outputs_0_PWRITE;
  assign system_registersApb_PWDATA = apb3Router_1_io_outputs_0_PWDATA;
  assign system_uartCtrl_io_apb_PADDR = apb3Router_1_io_outputs_1_PADDR[4:0];
  assign system_clintCtrl_io_bus_PADDR = apb3Router_1_io_outputs_2_PADDR[15:0];
  assign system_plicCtrl_io_bus_PADDR = apb3Router_1_io_outputs_3_PADDR[21:0];
  assign system_ddrNode_ar_valid = axi4ReadOnlyArbiter_1_io_output_ar_valid;
  assign system_ddrNode_ar_payload_addr = axi4ReadOnlyArbiter_1_io_output_ar_payload_addr;
  assign system_ddrNode_ar_payload_id = axi4ReadOnlyArbiter_1_io_output_ar_payload_id;
  assign system_ddrNode_ar_payload_len = axi4ReadOnlyArbiter_1_io_output_ar_payload_len;
  assign system_ddrNode_ar_payload_size = axi4ReadOnlyArbiter_1_io_output_ar_payload_size;
  assign system_ddrNode_ar_payload_burst = axi4ReadOnlyArbiter_1_io_output_ar_payload_burst;
  assign system_ddrNode_r_ready = axi4ReadOnlyArbiter_1_io_output_r_ready;
  assign system_ddrNode_aw_valid = axi4WriteOnlyArbiter_1_io_output_aw_valid;
  assign system_ddrNode_aw_payload_addr = axi4WriteOnlyArbiter_1_io_output_aw_payload_addr;
  assign system_ddrNode_aw_payload_id = axi4WriteOnlyArbiter_1_io_output_aw_payload_id;
  assign system_ddrNode_aw_payload_len = axi4WriteOnlyArbiter_1_io_output_aw_payload_len;
  assign system_ddrNode_aw_payload_size = axi4WriteOnlyArbiter_1_io_output_aw_payload_size;
  assign system_ddrNode_aw_payload_burst = axi4WriteOnlyArbiter_1_io_output_aw_payload_burst;
  assign system_ddrNode_w_valid = axi4WriteOnlyArbiter_1_io_output_w_valid;
  assign system_ddrNode_w_payload_data = axi4WriteOnlyArbiter_1_io_output_w_payload_data;
  assign system_ddrNode_w_payload_strb = axi4WriteOnlyArbiter_1_io_output_w_payload_strb;
  assign system_ddrNode_w_payload_last = axi4WriteOnlyArbiter_1_io_output_w_payload_last;
  assign system_ddrNode_b_ready = axi4WriteOnlyArbiter_1_io_output_b_ready;
  assign S_AXI_BRAM_readOnly_ar_valid = S_AXI_BRAM_arvalid;
  assign S_AXI_BRAM_arready = S_AXI_BRAM_readOnly_ar_ready;
  assign S_AXI_BRAM_readOnly_ar_payload_addr = S_AXI_BRAM_araddr;
  assign S_AXI_BRAM_readOnly_ar_payload_id = S_AXI_BRAM_arid;
  assign S_AXI_BRAM_readOnly_ar_payload_len = S_AXI_BRAM_arlen;
  assign S_AXI_BRAM_readOnly_ar_payload_size = S_AXI_BRAM_arsize;
  assign S_AXI_BRAM_readOnly_ar_payload_burst = S_AXI_BRAM_arburst;
  assign S_AXI_BRAM_rvalid = S_AXI_BRAM_readOnly_r_valid;
  assign S_AXI_BRAM_readOnly_r_ready = S_AXI_BRAM_rready;
  assign S_AXI_BRAM_rdata = S_AXI_BRAM_readOnly_r_payload_data;
  assign S_AXI_BRAM_rlast = S_AXI_BRAM_readOnly_r_payload_last;
  assign S_AXI_BRAM_rid = S_AXI_BRAM_readOnly_r_payload_id;
  assign S_AXI_BRAM_rresp = S_AXI_BRAM_readOnly_r_payload_resp;
  assign S_AXI_BRAM_writeOnly_aw_valid = S_AXI_BRAM_awvalid;
  assign S_AXI_BRAM_awready = S_AXI_BRAM_writeOnly_aw_ready;
  assign S_AXI_BRAM_writeOnly_aw_payload_addr = S_AXI_BRAM_awaddr;
  assign S_AXI_BRAM_writeOnly_aw_payload_id = S_AXI_BRAM_awid;
  assign S_AXI_BRAM_writeOnly_aw_payload_len = S_AXI_BRAM_awlen;
  assign S_AXI_BRAM_writeOnly_aw_payload_size = S_AXI_BRAM_awsize;
  assign S_AXI_BRAM_writeOnly_aw_payload_burst = S_AXI_BRAM_awburst;
  assign S_AXI_BRAM_writeOnly_w_valid = S_AXI_BRAM_wvalid;
  assign S_AXI_BRAM_wready = S_AXI_BRAM_writeOnly_w_ready;
  assign S_AXI_BRAM_writeOnly_w_payload_data = S_AXI_BRAM_wdata;
  assign S_AXI_BRAM_writeOnly_w_payload_strb = S_AXI_BRAM_wstrb;
  assign S_AXI_BRAM_writeOnly_w_payload_last = S_AXI_BRAM_wlast;
  assign S_AXI_BRAM_bvalid = S_AXI_BRAM_writeOnly_b_valid;
  assign S_AXI_BRAM_writeOnly_b_ready = S_AXI_BRAM_bready;
  assign S_AXI_BRAM_bid = S_AXI_BRAM_writeOnly_b_payload_id;
  assign S_AXI_BRAM_bresp = S_AXI_BRAM_writeOnly_b_payload_resp;
  assign io_outputs_0_ar_validPipe_fire = (io_outputs_0_ar_validPipe_valid && io_outputs_0_ar_validPipe_ready);
  assign io_outputs_0_ar_validPipe_valid = io_outputs_0_ar_rValid;
  assign io_outputs_0_ar_validPipe_payload_addr = axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_addr;
  assign io_outputs_0_ar_validPipe_payload_len = axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_len;
  assign io_outputs_0_ar_validPipe_payload_burst = axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_burst;
  assign io_outputs_0_ar_validPipe_payload_cache = axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_cache;
  assign io_outputs_0_ar_validPipe_payload_prot = axi4ReadOnlyDecoder_2_io_outputs_0_ar_payload_prot;
  assign io_outputs_0_ar_validPipe_ready = system_bram_io_axi_arbiter_io_readInputs_0_ar_ready;
  assign io_outputs_1_ar_validPipe_fire = (io_outputs_1_ar_validPipe_valid && io_outputs_1_ar_validPipe_ready);
  assign io_outputs_1_ar_validPipe_valid = io_outputs_1_ar_rValid;
  assign io_outputs_1_ar_validPipe_payload_addr = axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_addr;
  assign io_outputs_1_ar_validPipe_payload_len = axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_len;
  assign io_outputs_1_ar_validPipe_payload_burst = axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_burst;
  assign io_outputs_1_ar_validPipe_payload_cache = axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_cache;
  assign io_outputs_1_ar_validPipe_payload_prot = axi4ReadOnlyDecoder_2_io_outputs_1_ar_payload_prot;
  assign io_outputs_1_ar_validPipe_ready = axi4ReadOnlyArbiter_1_io_inputs_0_ar_ready;
  assign io_readOutputs_0_ar_validPipe_fire = (io_readOutputs_0_ar_validPipe_valid && io_readOutputs_0_ar_validPipe_ready);
  assign io_readOutputs_0_ar_validPipe_valid = io_readOutputs_0_ar_rValid;
  assign io_readOutputs_0_ar_validPipe_payload_addr = dbus_axi_decoder_io_readOutputs_0_ar_payload_addr;
  assign io_readOutputs_0_ar_validPipe_payload_len = dbus_axi_decoder_io_readOutputs_0_ar_payload_len;
  assign io_readOutputs_0_ar_validPipe_payload_size = dbus_axi_decoder_io_readOutputs_0_ar_payload_size;
  assign io_readOutputs_0_ar_validPipe_payload_cache = dbus_axi_decoder_io_readOutputs_0_ar_payload_cache;
  assign io_readOutputs_0_ar_validPipe_payload_prot = dbus_axi_decoder_io_readOutputs_0_ar_payload_prot;
  assign io_readOutputs_0_ar_validPipe_ready = axi4ReadOnlyArbiter_1_io_inputs_1_ar_ready;
  assign io_writeOutputs_0_aw_validPipe_fire = (io_writeOutputs_0_aw_validPipe_valid && io_writeOutputs_0_aw_validPipe_ready);
  assign io_writeOutputs_0_aw_validPipe_valid = io_writeOutputs_0_aw_rValid;
  assign io_writeOutputs_0_aw_validPipe_payload_addr = dbus_axi_decoder_io_writeOutputs_0_aw_payload_addr;
  assign io_writeOutputs_0_aw_validPipe_payload_len = dbus_axi_decoder_io_writeOutputs_0_aw_payload_len;
  assign io_writeOutputs_0_aw_validPipe_payload_size = dbus_axi_decoder_io_writeOutputs_0_aw_payload_size;
  assign io_writeOutputs_0_aw_validPipe_payload_cache = dbus_axi_decoder_io_writeOutputs_0_aw_payload_cache;
  assign io_writeOutputs_0_aw_validPipe_payload_prot = dbus_axi_decoder_io_writeOutputs_0_aw_payload_prot;
  assign io_writeOutputs_0_aw_validPipe_ready = axi4WriteOnlyArbiter_1_io_inputs_0_aw_ready;
  assign io_sharedOutputs_0_arw_validPipe_fire = (io_sharedOutputs_0_arw_validPipe_valid && io_sharedOutputs_0_arw_validPipe_ready);
  assign io_sharedOutputs_0_arw_validPipe_valid = io_sharedOutputs_0_arw_rValid;
  assign io_sharedOutputs_0_arw_validPipe_payload_addr = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_addr;
  assign io_sharedOutputs_0_arw_validPipe_payload_len = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_len;
  assign io_sharedOutputs_0_arw_validPipe_payload_size = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_size;
  assign io_sharedOutputs_0_arw_validPipe_payload_cache = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_cache;
  assign io_sharedOutputs_0_arw_validPipe_payload_prot = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_prot;
  assign io_sharedOutputs_0_arw_validPipe_payload_write = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_write;
  assign io_sharedOutputs_0_arw_validPipe_ready = system_bram_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  assign io_sharedOutputs_1_arw_validPipe_fire = (io_sharedOutputs_1_arw_validPipe_valid && io_sharedOutputs_1_arw_validPipe_ready);
  assign io_sharedOutputs_1_arw_validPipe_valid = io_sharedOutputs_1_arw_rValid;
  assign io_sharedOutputs_1_arw_validPipe_payload_addr = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_addr;
  assign io_sharedOutputs_1_arw_validPipe_payload_len = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_len;
  assign io_sharedOutputs_1_arw_validPipe_payload_size = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_size;
  assign io_sharedOutputs_1_arw_validPipe_payload_cache = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_cache;
  assign io_sharedOutputs_1_arw_validPipe_payload_prot = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_prot;
  assign io_sharedOutputs_1_arw_validPipe_payload_write = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_write;
  assign io_sharedOutputs_1_arw_validPipe_ready = system_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  assign dbus_axi_arw_ready = dbus_axi_decoder_io_input_arw_ready;
  assign dbus_axi_w_ready = dbus_axi_decoder_io_input_w_ready;
  assign dbus_axi_b_valid = dbus_axi_decoder_io_input_b_valid;
  assign dbus_axi_b_payload_resp = dbus_axi_decoder_io_input_b_payload_resp;
  assign dbus_axi_r_valid = dbus_axi_decoder_io_input_r_valid;
  assign dbus_axi_r_payload_data = dbus_axi_decoder_io_input_r_payload_data;
  assign dbus_axi_r_payload_last = dbus_axi_decoder_io_input_r_payload_last;
  assign dbus_axi_r_payload_resp = dbus_axi_decoder_io_input_r_payload_resp;
  assign io_outputs_0_ar_validPipe_fire_1 = (io_outputs_0_ar_validPipe_valid_1 && io_outputs_0_ar_validPipe_ready_1);
  assign io_outputs_0_ar_validPipe_valid_1 = io_outputs_0_ar_rValid_1;
  assign io_outputs_0_ar_validPipe_payload_addr_1 = S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_payload_addr;
  assign io_outputs_0_ar_validPipe_payload_id = S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_payload_id;
  assign io_outputs_0_ar_validPipe_payload_len_1 = S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_payload_len;
  assign io_outputs_0_ar_validPipe_payload_size = S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_payload_size;
  assign io_outputs_0_ar_validPipe_payload_burst_1 = S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_payload_burst;
  assign io_outputs_0_ar_validPipe_ready_1 = system_bram_io_axi_arbiter_io_readInputs_1_ar_ready;
  assign S_AXI_BRAM_readOnly_decoder_io_outputs_0_r_payload_id = system_bram_io_axi_arbiter_io_readInputs_1_r_payload_id[3:0];
  assign S_AXI_BRAM_readOnly_ar_ready = S_AXI_BRAM_readOnly_decoder_io_input_ar_ready;
  assign S_AXI_BRAM_readOnly_r_valid = S_AXI_BRAM_readOnly_decoder_io_input_r_valid;
  assign S_AXI_BRAM_readOnly_r_payload_data = S_AXI_BRAM_readOnly_decoder_io_input_r_payload_data;
  assign S_AXI_BRAM_readOnly_r_payload_last = S_AXI_BRAM_readOnly_decoder_io_input_r_payload_last;
  assign S_AXI_BRAM_readOnly_r_payload_id = S_AXI_BRAM_readOnly_decoder_io_input_r_payload_id;
  assign S_AXI_BRAM_readOnly_r_payload_resp = S_AXI_BRAM_readOnly_decoder_io_input_r_payload_resp;
  assign io_outputs_0_aw_validPipe_fire = (io_outputs_0_aw_validPipe_valid && io_outputs_0_aw_validPipe_ready);
  assign io_outputs_0_aw_validPipe_valid = io_outputs_0_aw_rValid;
  assign io_outputs_0_aw_validPipe_payload_addr = S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_payload_addr;
  assign io_outputs_0_aw_validPipe_payload_id = S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_payload_id;
  assign io_outputs_0_aw_validPipe_payload_len = S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_payload_len;
  assign io_outputs_0_aw_validPipe_payload_size = S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_payload_size;
  assign io_outputs_0_aw_validPipe_payload_burst = S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_payload_burst;
  assign io_outputs_0_aw_validPipe_ready = system_bram_io_axi_arbiter_io_writeInputs_0_aw_ready;
  assign S_AXI_BRAM_writeOnly_decoder_io_outputs_0_b_payload_id = system_bram_io_axi_arbiter_io_writeInputs_0_b_payload_id[3:0];
  assign S_AXI_BRAM_writeOnly_aw_ready = S_AXI_BRAM_writeOnly_decoder_io_input_aw_ready;
  assign S_AXI_BRAM_writeOnly_w_ready = S_AXI_BRAM_writeOnly_decoder_io_input_w_ready;
  assign S_AXI_BRAM_writeOnly_b_valid = S_AXI_BRAM_writeOnly_decoder_io_input_b_valid;
  assign S_AXI_BRAM_writeOnly_b_payload_id = S_AXI_BRAM_writeOnly_decoder_io_input_b_payload_id;
  assign S_AXI_BRAM_writeOnly_b_payload_resp = S_AXI_BRAM_writeOnly_decoder_io_input_b_payload_resp;
  assign system_bram_io_axi_arbiter_io_readInputs_0_ar_payload_addr = io_outputs_0_ar_validPipe_payload_addr[17:0];
  assign _zz_io_readInputs_0_ar_payload_id[4 : 0] = 5'h0;
  assign system_bram_io_axi_arbiter_io_readInputs_1_ar_payload_addr = io_outputs_0_ar_validPipe_payload_addr_1[17:0];
  assign system_bram_io_axi_arbiter_io_readInputs_1_ar_payload_id = {1'd0, io_outputs_0_ar_validPipe_payload_id};
  assign system_bram_io_axi_arbiter_io_writeInputs_0_aw_payload_addr = io_outputs_0_aw_validPipe_payload_addr[17:0];
  assign system_bram_io_axi_arbiter_io_writeInputs_0_aw_payload_id = {2'd0, io_outputs_0_aw_validPipe_payload_id};
  assign system_bram_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr = io_sharedOutputs_0_arw_validPipe_payload_addr[17:0];
  assign _zz_io_sharedInputs_0_arw_payload_id[4 : 0] = 5'h0;
  assign system_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr = io_sharedOutputs_1_arw_validPipe_payload_addr[23:0];
  assign _zz_io_sharedInputs_0_arw_payload_id_1[3 : 0] = 4'b0000;
  assign _zz_io_inputs_0_ar_payload_id[2 : 0] = 3'b000;
  assign _zz_io_inputs_1_ar_payload_id[2 : 0] = 3'b000;
  assign _zz_io_inputs_0_aw_payload_id[3 : 0] = 4'b0000;
  assign when_BusSlaveFactory_l1058 = S_AXI_CTRL_wstrb[0];
  assign when_BusSlaveFactory_l1058_1 = S_AXI_CTRL_wstrb[1];
  assign when_BusSlaveFactory_l1058_2 = S_AXI_CTRL_wstrb[2];
  assign when_BusSlaveFactory_l1058_3 = S_AXI_CTRL_wstrb[3];
  assign when_BusSlaveFactory_l1058_4 = S_AXI_CTRL_wstrb[0];
  assign when_BusSlaveFactory_l1058_5 = S_AXI_CTRL_wstrb[1];
  assign when_BusSlaveFactory_l1058_6 = S_AXI_CTRL_wstrb[2];
  assign when_BusSlaveFactory_l1058_7 = S_AXI_CTRL_wstrb[3];
  assign when_BusSlaveFactory_l1058_8 = S_AXI_CTRL_wstrb[0];
  assign when_BusSlaveFactory_l1058_9 = S_AXI_CTRL_wstrb[1];
  assign when_BusSlaveFactory_l1058_10 = S_AXI_CTRL_wstrb[2];
  assign when_BusSlaveFactory_l1058_11 = S_AXI_CTRL_wstrb[3];
  assign when_BusSlaveFactory_l1058_12 = S_AXI_CTRL_wstrb[0];
  assign when_BusSlaveFactory_l1058_13 = S_AXI_CTRL_wstrb[1];
  assign when_BusSlaveFactory_l1058_14 = S_AXI_CTRL_wstrb[2];
  assign when_BusSlaveFactory_l1058_15 = S_AXI_CTRL_wstrb[3];
  assign when_BusSlaveFactory_l1058_16 = S_AXI_CTRL_wstrb[0];
  assign when_BusSlaveFactory_l1058_17 = S_AXI_CTRL_wstrb[1];
  assign when_BusSlaveFactory_l1058_18 = S_AXI_CTRL_wstrb[2];
  assign when_BusSlaveFactory_l1058_19 = S_AXI_CTRL_wstrb[3];
  always @(posedge aclk) begin
    if(when_VexSatV_l214) begin
      resetCtrl_systemClkResetCounter <= (resetCtrl_systemClkResetCounter + 6'h01);
    end
    if(when_VexSatV_l218) begin
      resetCtrl_systemClkResetCounter <= 6'h0;
    end
  end

  always @(posedge aclk) begin
    resetCtrl_mainClkReset <= resetCtrl_mainClkResetUnbuffered;
    resetCtrl_debugReset <= resetCtrl_mainClkResetUnbuffered;
    if(debug_resetOut_regNext) begin
      resetCtrl_debugReset <= 1'b1;
    end
  end

  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      system_rwRegs_0 <= 32'h0;
      system_rwRegs_1 <= 32'h0;
      system_rwRegs_2 <= 32'h0;
      system_rwRegs_3 <= 32'h0;
      system_rwRegs_4 <= 32'h0;
      system_roRegs_0 <= 32'h0;
      system_roRegs_1 <= 32'h0;
      system_roRegs_2 <= 32'h0;
      system_roRegs_3 <= 32'h0;
      system_roRegs_4 <= 32'h0;
      system_extFactory_writeJoinEvent_translated_haltWhen_rValid <= 1'b0;
      S_AXI_CTRL_ar_rValid <= 1'b0;
      io_outputs_0_ar_rValid <= 1'b0;
      io_outputs_1_ar_rValid <= 1'b0;
      io_readOutputs_0_ar_rValid <= 1'b0;
      io_writeOutputs_0_aw_rValid <= 1'b0;
      io_sharedOutputs_0_arw_rValid <= 1'b0;
      io_sharedOutputs_1_arw_rValid <= 1'b0;
      io_outputs_0_ar_rValid_1 <= 1'b0;
      io_outputs_0_aw_rValid <= 1'b0;
    end else begin
      if(system_extFactory_writeJoinEvent_translated_haltWhen_valid) begin
        system_extFactory_writeJoinEvent_translated_haltWhen_rValid <= 1'b1;
      end
      if(system_extFactory_writeJoinEvent_translated_haltWhen_halfPipe_fire) begin
        system_extFactory_writeJoinEvent_translated_haltWhen_rValid <= 1'b0;
      end
      if(S_AXI_CTRL_arvalid) begin
        S_AXI_CTRL_ar_rValid <= 1'b1;
      end
      if(system_extFactory_readDataStage_fire) begin
        S_AXI_CTRL_ar_rValid <= 1'b0;
      end
      if(axi4ReadOnlyDecoder_2_io_outputs_0_ar_valid) begin
        io_outputs_0_ar_rValid <= 1'b1;
      end
      if(io_outputs_0_ar_validPipe_fire) begin
        io_outputs_0_ar_rValid <= 1'b0;
      end
      if(axi4ReadOnlyDecoder_2_io_outputs_1_ar_valid) begin
        io_outputs_1_ar_rValid <= 1'b1;
      end
      if(io_outputs_1_ar_validPipe_fire) begin
        io_outputs_1_ar_rValid <= 1'b0;
      end
      if(dbus_axi_decoder_io_readOutputs_0_ar_valid) begin
        io_readOutputs_0_ar_rValid <= 1'b1;
      end
      if(io_readOutputs_0_ar_validPipe_fire) begin
        io_readOutputs_0_ar_rValid <= 1'b0;
      end
      if(dbus_axi_decoder_io_writeOutputs_0_aw_valid) begin
        io_writeOutputs_0_aw_rValid <= 1'b1;
      end
      if(io_writeOutputs_0_aw_validPipe_fire) begin
        io_writeOutputs_0_aw_rValid <= 1'b0;
      end
      if(dbus_axi_decoder_io_sharedOutputs_0_arw_valid) begin
        io_sharedOutputs_0_arw_rValid <= 1'b1;
      end
      if(io_sharedOutputs_0_arw_validPipe_fire) begin
        io_sharedOutputs_0_arw_rValid <= 1'b0;
      end
      if(dbus_axi_decoder_io_sharedOutputs_1_arw_valid) begin
        io_sharedOutputs_1_arw_rValid <= 1'b1;
      end
      if(io_sharedOutputs_1_arw_validPipe_fire) begin
        io_sharedOutputs_1_arw_rValid <= 1'b0;
      end
      if(S_AXI_BRAM_readOnly_decoder_io_outputs_0_ar_valid) begin
        io_outputs_0_ar_rValid_1 <= 1'b1;
      end
      if(io_outputs_0_ar_validPipe_fire_1) begin
        io_outputs_0_ar_rValid_1 <= 1'b0;
      end
      if(S_AXI_BRAM_writeOnly_decoder_io_outputs_0_aw_valid) begin
        io_outputs_0_aw_rValid <= 1'b1;
      end
      if(io_outputs_0_aw_validPipe_fire) begin
        io_outputs_0_aw_rValid <= 1'b0;
      end
      case(system_registersApb_PADDR)
        12'h014 : begin
          if(system_coreFactory_doWrite) begin
            system_roRegs_0 <= system_registersApb_PWDATA[31 : 0];
          end
        end
        12'h018 : begin
          if(system_coreFactory_doWrite) begin
            system_roRegs_1 <= system_registersApb_PWDATA[31 : 0];
          end
        end
        12'h01c : begin
          if(system_coreFactory_doWrite) begin
            system_roRegs_2 <= system_registersApb_PWDATA[31 : 0];
          end
        end
        12'h020 : begin
          if(system_coreFactory_doWrite) begin
            system_roRegs_3 <= system_registersApb_PWDATA[31 : 0];
          end
        end
        12'h024 : begin
          if(system_coreFactory_doWrite) begin
            system_roRegs_4 <= system_registersApb_PWDATA[31 : 0];
          end
        end
        default : begin
        end
      endcase
      case(system_extFactory_writeAddressMasked)
        12'h0 : begin
          if(system_extFactory_writeOccur) begin
            if(when_BusSlaveFactory_l1058) begin
              system_rwRegs_0[7 : 0] <= S_AXI_CTRL_wdata[7 : 0];
            end
            if(when_BusSlaveFactory_l1058_1) begin
              system_rwRegs_0[15 : 8] <= S_AXI_CTRL_wdata[15 : 8];
            end
            if(when_BusSlaveFactory_l1058_2) begin
              system_rwRegs_0[23 : 16] <= S_AXI_CTRL_wdata[23 : 16];
            end
            if(when_BusSlaveFactory_l1058_3) begin
              system_rwRegs_0[31 : 24] <= S_AXI_CTRL_wdata[31 : 24];
            end
          end
        end
        12'h004 : begin
          if(system_extFactory_writeOccur) begin
            if(when_BusSlaveFactory_l1058_4) begin
              system_rwRegs_1[7 : 0] <= S_AXI_CTRL_wdata[7 : 0];
            end
            if(when_BusSlaveFactory_l1058_5) begin
              system_rwRegs_1[15 : 8] <= S_AXI_CTRL_wdata[15 : 8];
            end
            if(when_BusSlaveFactory_l1058_6) begin
              system_rwRegs_1[23 : 16] <= S_AXI_CTRL_wdata[23 : 16];
            end
            if(when_BusSlaveFactory_l1058_7) begin
              system_rwRegs_1[31 : 24] <= S_AXI_CTRL_wdata[31 : 24];
            end
          end
        end
        12'h008 : begin
          if(system_extFactory_writeOccur) begin
            if(when_BusSlaveFactory_l1058_8) begin
              system_rwRegs_2[7 : 0] <= S_AXI_CTRL_wdata[7 : 0];
            end
            if(when_BusSlaveFactory_l1058_9) begin
              system_rwRegs_2[15 : 8] <= S_AXI_CTRL_wdata[15 : 8];
            end
            if(when_BusSlaveFactory_l1058_10) begin
              system_rwRegs_2[23 : 16] <= S_AXI_CTRL_wdata[23 : 16];
            end
            if(when_BusSlaveFactory_l1058_11) begin
              system_rwRegs_2[31 : 24] <= S_AXI_CTRL_wdata[31 : 24];
            end
          end
        end
        12'h00c : begin
          if(system_extFactory_writeOccur) begin
            if(when_BusSlaveFactory_l1058_12) begin
              system_rwRegs_3[7 : 0] <= S_AXI_CTRL_wdata[7 : 0];
            end
            if(when_BusSlaveFactory_l1058_13) begin
              system_rwRegs_3[15 : 8] <= S_AXI_CTRL_wdata[15 : 8];
            end
            if(when_BusSlaveFactory_l1058_14) begin
              system_rwRegs_3[23 : 16] <= S_AXI_CTRL_wdata[23 : 16];
            end
            if(when_BusSlaveFactory_l1058_15) begin
              system_rwRegs_3[31 : 24] <= S_AXI_CTRL_wdata[31 : 24];
            end
          end
        end
        12'h010 : begin
          if(system_extFactory_writeOccur) begin
            if(when_BusSlaveFactory_l1058_16) begin
              system_rwRegs_4[7 : 0] <= S_AXI_CTRL_wdata[7 : 0];
            end
            if(when_BusSlaveFactory_l1058_17) begin
              system_rwRegs_4[15 : 8] <= S_AXI_CTRL_wdata[15 : 8];
            end
            if(when_BusSlaveFactory_l1058_18) begin
              system_rwRegs_4[23 : 16] <= S_AXI_CTRL_wdata[23 : 16];
            end
            if(when_BusSlaveFactory_l1058_19) begin
              system_rwRegs_4[31 : 24] <= S_AXI_CTRL_wdata[31 : 24];
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge aclk) begin
    if(system_extFactory_writeJoinEvent_translated_haltWhen_ready) begin
      system_extFactory_writeJoinEvent_translated_haltWhen_rData_resp <= system_extFactory_writeJoinEvent_translated_haltWhen_payload_resp;
    end
    if(S_AXI_CTRL_arready) begin
      S_AXI_CTRL_ar_rData_addr <= S_AXI_CTRL_araddr;
      S_AXI_CTRL_ar_rData_prot <= S_AXI_CTRL_arprot;
    end
  end

  always @(posedge aclk or posedge _zz_1) begin
    if(_zz_1) begin
      dBus_cmd_rValid <= 1'b0;
      dBus_cmd_stage_rValid <= 1'b0;
      dBus_cmd_stage_stage_rValidN <= 1'b1;
      dBusToAxi4Shared_pendingWrites_value <= 3'b000;
      dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_0 <= 1'b1;
      dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_1 <= 1'b1;
      _zz_2 <= 1'b0;
    end else begin
      if(system_core_cpu_dBus_cmd_ready) begin
        dBus_cmd_rValid <= system_core_cpu_dBus_cmd_valid;
      end
      if(dBus_cmd_stage_ready) begin
        dBus_cmd_stage_rValid <= dBus_cmd_stage_valid;
      end
      if(dBus_cmd_stage_stage_valid) begin
        dBus_cmd_stage_stage_rValidN <= 1'b0;
      end
      if(dBusToAxi4Shared_cmdPreFork_ready) begin
        dBus_cmd_stage_stage_rValidN <= 1'b1;
      end
      dBusToAxi4Shared_pendingWrites_value <= dBusToAxi4Shared_pendingWrites_valueNext;
      if(dBusToAxi4Shared_cmdFork_fire) begin
        dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(dBusToAxi4Shared_dataFork_fire) begin
        dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(dBusToAxi4Shared_cmdPreFork_haltWhen_ready) begin
        dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_0 <= 1'b1;
        dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_1 <= 1'b1;
      end
      if(dBusToAxi4Shared_cmdFork_fire) begin
        _zz_2 <= (! dBusToAxi4Shared_cmdFork_payload_last);
      end
    end
  end

  always @(posedge aclk) begin
    if(system_core_cpu_dBus_cmd_ready) begin
      dBus_cmd_rData_wr <= system_core_cpu_dBus_cmd_payload_wr;
      dBus_cmd_rData_uncached <= system_core_cpu_dBus_cmd_payload_uncached;
      dBus_cmd_rData_address <= system_core_cpu_dBus_cmd_payload_address;
      dBus_cmd_rData_data <= system_core_cpu_dBus_cmd_payload_data;
      dBus_cmd_rData_mask <= system_core_cpu_dBus_cmd_payload_mask;
      dBus_cmd_rData_size <= system_core_cpu_dBus_cmd_payload_size;
      dBus_cmd_rData_last <= system_core_cpu_dBus_cmd_payload_last;
    end
    if(dBus_cmd_stage_ready) begin
      dBus_cmd_stage_rData_wr <= dBus_cmd_stage_payload_wr;
      dBus_cmd_stage_rData_uncached <= dBus_cmd_stage_payload_uncached;
      dBus_cmd_stage_rData_address <= dBus_cmd_stage_payload_address;
      dBus_cmd_stage_rData_data <= dBus_cmd_stage_payload_data;
      dBus_cmd_stage_rData_mask <= dBus_cmd_stage_payload_mask;
      dBus_cmd_stage_rData_size <= dBus_cmd_stage_payload_size;
      dBus_cmd_stage_rData_last <= dBus_cmd_stage_payload_last;
    end
    if(dBus_cmd_stage_stage_ready) begin
      dBus_cmd_stage_stage_rData_wr <= dBus_cmd_stage_stage_payload_wr;
      dBus_cmd_stage_stage_rData_uncached <= dBus_cmd_stage_stage_payload_uncached;
      dBus_cmd_stage_stage_rData_address <= dBus_cmd_stage_stage_payload_address;
      dBus_cmd_stage_stage_rData_data <= dBus_cmd_stage_stage_payload_data;
      dBus_cmd_stage_stage_rData_mask <= dBus_cmd_stage_stage_payload_mask;
      dBus_cmd_stage_stage_rData_size <= dBus_cmd_stage_stage_payload_size;
      dBus_cmd_stage_stage_rData_last <= dBus_cmd_stage_stage_payload_last;
    end
  end

  always @(posedge aclk) begin
    debug_resetOut_regNext <= system_core_cpu_debug_resetOut;
  end

  always @(posedge aclk or posedge resetCtrl_debugReset) begin
    if(resetCtrl_debugReset) begin
      debug_bus_cmd_fire_regNext <= 1'b0;
    end else begin
      debug_bus_cmd_fire_regNext <= debug_bus_cmd_fire;
    end
  end


endmodule

module Axi4WriteOnlyArbiter (
  input  wire          io_inputs_0_aw_valid,
  output wire          io_inputs_0_aw_ready,
  input  wire [31:0]   io_inputs_0_aw_payload_addr,
  input  wire [3:0]    io_inputs_0_aw_payload_id,
  input  wire [7:0]    io_inputs_0_aw_payload_len,
  input  wire [2:0]    io_inputs_0_aw_payload_size,
  input  wire [1:0]    io_inputs_0_aw_payload_burst,
  input  wire          io_inputs_0_w_valid,
  output wire          io_inputs_0_w_ready,
  input  wire [31:0]   io_inputs_0_w_payload_data,
  input  wire [3:0]    io_inputs_0_w_payload_strb,
  input  wire          io_inputs_0_w_payload_last,
  output wire          io_inputs_0_b_valid,
  input  wire          io_inputs_0_b_ready,
  output wire [3:0]    io_inputs_0_b_payload_id,
  output wire [1:0]    io_inputs_0_b_payload_resp,
  output wire          io_output_aw_valid,
  input  wire          io_output_aw_ready,
  output wire [31:0]   io_output_aw_payload_addr,
  output wire [3:0]    io_output_aw_payload_id,
  output wire [7:0]    io_output_aw_payload_len,
  output wire [2:0]    io_output_aw_payload_size,
  output wire [1:0]    io_output_aw_payload_burst,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [31:0]   io_output_w_payload_data,
  output wire [3:0]    io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [3:0]    io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_translated_fifo_io_pop_ready;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [31:0]   cmdArbiter_io_output_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire       [0:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_translated_fifo_io_push_ready;
  wire                cmdRouteFork_translated_fifo_io_pop_valid;
  wire       [2:0]    cmdRouteFork_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_translated_fifo_io_availability;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [31:0]   cmdOutputFork_payload_addr;
  wire       [3:0]    cmdOutputFork_payload_id;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire                cmdRouteFork_valid;
  wire                cmdRouteFork_ready;
  wire       [31:0]   cmdRouteFork_payload_addr;
  wire       [3:0]    cmdRouteFork_payload_id;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  reg                 cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1253;
  wire                when_Stream_l1253_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                cmdRouteFork_translated_valid;
  wire                cmdRouteFork_translated_ready;
  wire                io_output_w_fire;
  wire                writeRspSels_0;

  StreamArbiter_3 cmdArbiter (
    .io_inputs_0_valid         (io_inputs_0_aw_valid                   ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (io_inputs_0_aw_payload_addr[31:0]      ), //i
    .io_inputs_0_payload_id    (io_inputs_0_aw_payload_id[3:0]         ), //i
    .io_inputs_0_payload_len   (io_inputs_0_aw_payload_len[7:0]        ), //i
    .io_inputs_0_payload_size  (io_inputs_0_aw_payload_size[2:0]       ), //i
    .io_inputs_0_payload_burst (io_inputs_0_aw_payload_burst[1:0]      ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (cmdArbiter_io_output_ready             ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[31:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[3:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH                 ), //o
    .aclk                      (aclk                                   ), //i
    .resetCtrl_mainClkReset    (resetCtrl_mainClkReset                 )  //i
  );
  StreamFifoLowLatency_1 cmdRouteFork_translated_fifo (
    .io_push_valid          (cmdRouteFork_translated_valid                    ), //i
    .io_push_ready          (cmdRouteFork_translated_fifo_io_push_ready       ), //o
    .io_pop_valid           (cmdRouteFork_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready           (cmdRouteFork_translated_fifo_io_pop_ready        ), //i
    .io_flush               (1'b0                                             ), //i
    .io_occupancy           (cmdRouteFork_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability        (cmdRouteFork_translated_fifo_io_availability[2:0]), //o
    .aclk                   (aclk                                             ), //i
    .resetCtrl_mainClkReset (resetCtrl_mainClkReset                           )  //i
  );
  assign io_inputs_0_aw_ready = cmdArbiter_io_inputs_0_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1253) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1253_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1253 = ((! cmdOutputFork_ready) && cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1253_1 = ((! cmdRouteFork_ready) && cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_aw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_aw_ready;
  assign io_output_aw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_aw_payload_len = cmdOutputFork_payload_len;
  assign io_output_aw_payload_size = cmdOutputFork_payload_size;
  assign io_output_aw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_aw_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_translated_valid = cmdRouteFork_valid;
  assign cmdRouteFork_ready = cmdRouteFork_translated_ready;
  assign cmdRouteFork_translated_ready = cmdRouteFork_translated_fifo_io_push_ready;
  assign io_output_w_valid = (cmdRouteFork_translated_fifo_io_pop_valid && io_inputs_0_w_valid);
  assign io_output_w_payload_data = io_inputs_0_w_payload_data;
  assign io_output_w_payload_strb = io_inputs_0_w_payload_strb;
  assign io_output_w_payload_last = io_inputs_0_w_payload_last;
  assign io_inputs_0_w_ready = ((cmdRouteFork_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeRspSels_0 = 1'b1;
  assign io_inputs_0_b_valid = (io_output_b_valid && writeRspSels_0);
  assign io_inputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_inputs_0_b_payload_id = io_output_b_payload_id[3 : 0];
  assign io_output_b_ready = io_inputs_0_b_ready;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

module Axi4ReadOnlyArbiter (
  input  wire          io_inputs_0_ar_valid,
  output wire          io_inputs_0_ar_ready,
  input  wire [31:0]   io_inputs_0_ar_payload_addr,
  input  wire [2:0]    io_inputs_0_ar_payload_id,
  input  wire [7:0]    io_inputs_0_ar_payload_len,
  input  wire [2:0]    io_inputs_0_ar_payload_size,
  input  wire [1:0]    io_inputs_0_ar_payload_burst,
  output wire          io_inputs_0_r_valid,
  input  wire          io_inputs_0_r_ready,
  output wire [31:0]   io_inputs_0_r_payload_data,
  output wire [2:0]    io_inputs_0_r_payload_id,
  output wire [1:0]    io_inputs_0_r_payload_resp,
  output wire          io_inputs_0_r_payload_last,
  input  wire          io_inputs_1_ar_valid,
  output wire          io_inputs_1_ar_ready,
  input  wire [31:0]   io_inputs_1_ar_payload_addr,
  input  wire [2:0]    io_inputs_1_ar_payload_id,
  input  wire [7:0]    io_inputs_1_ar_payload_len,
  input  wire [2:0]    io_inputs_1_ar_payload_size,
  input  wire [1:0]    io_inputs_1_ar_payload_burst,
  output wire          io_inputs_1_r_valid,
  input  wire          io_inputs_1_r_ready,
  output wire [31:0]   io_inputs_1_r_payload_data,
  output wire [2:0]    io_inputs_1_r_payload_id,
  output wire [1:0]    io_inputs_1_r_payload_resp,
  output wire          io_inputs_1_r_payload_last,
  output wire          io_output_ar_valid,
  input  wire          io_output_ar_ready,
  output wire [31:0]   io_output_ar_payload_addr,
  output wire [3:0]    io_output_ar_payload_id,
  output wire [7:0]    io_output_ar_payload_len,
  output wire [2:0]    io_output_ar_payload_size,
  output wire [1:0]    io_output_ar_payload_burst,
  input  wire          io_output_r_valid,
  output wire          io_output_r_ready,
  input  wire [31:0]   io_output_r_payload_data,
  input  wire [3:0]    io_output_r_payload_id,
  input  wire [1:0]    io_output_r_payload_resp,
  input  wire          io_output_r_payload_last,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [31:0]   cmdArbiter_io_output_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  reg                 _zz_io_output_r_ready;
  wire       [0:0]    readRspIndex;
  wire                readRspSels_0;
  wire                readRspSels_1;

  StreamArbiter_2 cmdArbiter (
    .io_inputs_0_valid         (io_inputs_0_ar_valid                   ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (io_inputs_0_ar_payload_addr[31:0]      ), //i
    .io_inputs_0_payload_id    (io_inputs_0_ar_payload_id[2:0]         ), //i
    .io_inputs_0_payload_len   (io_inputs_0_ar_payload_len[7:0]        ), //i
    .io_inputs_0_payload_size  (io_inputs_0_ar_payload_size[2:0]       ), //i
    .io_inputs_0_payload_burst (io_inputs_0_ar_payload_burst[1:0]      ), //i
    .io_inputs_1_valid         (io_inputs_1_ar_valid                   ), //i
    .io_inputs_1_ready         (cmdArbiter_io_inputs_1_ready           ), //o
    .io_inputs_1_payload_addr  (io_inputs_1_ar_payload_addr[31:0]      ), //i
    .io_inputs_1_payload_id    (io_inputs_1_ar_payload_id[2:0]         ), //i
    .io_inputs_1_payload_len   (io_inputs_1_ar_payload_len[7:0]        ), //i
    .io_inputs_1_payload_size  (io_inputs_1_ar_payload_size[2:0]       ), //i
    .io_inputs_1_payload_burst (io_inputs_1_ar_payload_burst[1:0]      ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (io_output_ar_ready                     ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[31:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[2:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_chosen                 (cmdArbiter_io_chosen                   ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH[1:0]            ), //o
    .aclk                      (aclk                                   ), //i
    .resetCtrl_mainClkReset    (resetCtrl_mainClkReset                 )  //i
  );
  always @(*) begin
    case(readRspIndex)
      1'b0 : _zz_io_output_r_ready = io_inputs_0_r_ready;
      default : _zz_io_output_r_ready = io_inputs_1_r_ready;
    endcase
  end

  assign io_inputs_0_ar_ready = cmdArbiter_io_inputs_0_ready;
  assign io_inputs_1_ar_ready = cmdArbiter_io_inputs_1_ready;
  assign io_output_ar_valid = cmdArbiter_io_output_valid;
  assign io_output_ar_payload_addr = cmdArbiter_io_output_payload_addr;
  assign io_output_ar_payload_len = cmdArbiter_io_output_payload_len;
  assign io_output_ar_payload_size = cmdArbiter_io_output_payload_size;
  assign io_output_ar_payload_burst = cmdArbiter_io_output_payload_burst;
  assign io_output_ar_payload_id = {cmdArbiter_io_chosen,cmdArbiter_io_output_payload_id};
  assign readRspIndex = io_output_r_payload_id[3 : 3];
  assign readRspSels_0 = (readRspIndex == 1'b0);
  assign readRspSels_1 = (readRspIndex == 1'b1);
  assign io_inputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_inputs_0_r_payload_data = io_output_r_payload_data;
  assign io_inputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_inputs_0_r_payload_last = io_output_r_payload_last;
  assign io_inputs_0_r_payload_id = io_output_r_payload_id[2 : 0];
  assign io_inputs_1_r_valid = (io_output_r_valid && readRspSels_1);
  assign io_inputs_1_r_payload_data = io_output_r_payload_data;
  assign io_inputs_1_r_payload_resp = io_output_r_payload_resp;
  assign io_inputs_1_r_payload_last = io_output_r_payload_last;
  assign io_inputs_1_r_payload_id = io_output_r_payload_id[2 : 0];
  assign io_output_r_ready = _zz_io_output_r_ready;

endmodule

module Axi4SharedArbiter_1 (
  input  wire          io_sharedInputs_0_arw_valid,
  output wire          io_sharedInputs_0_arw_ready,
  input  wire [23:0]   io_sharedInputs_0_arw_payload_addr,
  input  wire [3:0]    io_sharedInputs_0_arw_payload_id,
  input  wire [7:0]    io_sharedInputs_0_arw_payload_len,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_size,
  input  wire [1:0]    io_sharedInputs_0_arw_payload_burst,
  input  wire          io_sharedInputs_0_arw_payload_write,
  input  wire          io_sharedInputs_0_w_valid,
  output wire          io_sharedInputs_0_w_ready,
  input  wire [31:0]   io_sharedInputs_0_w_payload_data,
  input  wire [3:0]    io_sharedInputs_0_w_payload_strb,
  input  wire          io_sharedInputs_0_w_payload_last,
  output wire          io_sharedInputs_0_b_valid,
  input  wire          io_sharedInputs_0_b_ready,
  output wire [3:0]    io_sharedInputs_0_b_payload_id,
  output wire [1:0]    io_sharedInputs_0_b_payload_resp,
  output wire          io_sharedInputs_0_r_valid,
  input  wire          io_sharedInputs_0_r_ready,
  output wire [31:0]   io_sharedInputs_0_r_payload_data,
  output wire [3:0]    io_sharedInputs_0_r_payload_id,
  output wire [1:0]    io_sharedInputs_0_r_payload_resp,
  output wire          io_sharedInputs_0_r_payload_last,
  output wire          io_output_arw_valid,
  input  wire          io_output_arw_ready,
  output wire [23:0]   io_output_arw_payload_addr,
  output wire [3:0]    io_output_arw_payload_id,
  output wire [7:0]    io_output_arw_payload_len,
  output wire [2:0]    io_output_arw_payload_size,
  output wire [1:0]    io_output_arw_payload_burst,
  output wire          io_output_arw_payload_write,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [31:0]   io_output_w_payload_data,
  output wire [3:0]    io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [3:0]    io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          io_output_r_valid,
  output wire          io_output_r_ready,
  input  wire [31:0]   io_output_r_payload_data,
  input  wire [3:0]    io_output_r_payload_id,
  input  wire [1:0]    io_output_r_payload_resp,
  input  wire          io_output_r_payload_last,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_throwWhen_translated_fifo_io_pop_ready;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [23:0]   cmdArbiter_io_output_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [0:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_throwWhen_translated_fifo_io_push_ready;
  wire                cmdRouteFork_throwWhen_translated_fifo_io_pop_valid;
  wire       [2:0]    cmdRouteFork_throwWhen_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_throwWhen_translated_fifo_io_availability;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [23:0]   inputsCmd_0_payload_addr;
  wire       [3:0]    inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [23:0]   cmdOutputFork_payload_addr;
  wire       [3:0]    cmdOutputFork_payload_id;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire                cmdOutputFork_payload_write;
  wire                cmdRouteFork_valid;
  reg                 cmdRouteFork_ready;
  wire       [23:0]   cmdRouteFork_payload_addr;
  wire       [3:0]    cmdRouteFork_payload_id;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  wire                cmdRouteFork_payload_write;
  reg                 cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1253;
  wire                when_Stream_l1253_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                when_Stream_l581;
  reg                 cmdRouteFork_throwWhen_valid;
  wire                cmdRouteFork_throwWhen_ready;
  wire       [23:0]   cmdRouteFork_throwWhen_payload_addr;
  wire       [3:0]    cmdRouteFork_throwWhen_payload_id;
  wire       [7:0]    cmdRouteFork_throwWhen_payload_len;
  wire       [2:0]    cmdRouteFork_throwWhen_payload_size;
  wire       [1:0]    cmdRouteFork_throwWhen_payload_burst;
  wire                cmdRouteFork_throwWhen_payload_write;
  wire                cmdRouteFork_throwWhen_translated_valid;
  wire                cmdRouteFork_throwWhen_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [31:0]   writeLogic_routeDataInput_payload_data;
  wire       [3:0]    writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                io_output_w_fire;
  wire                writeLogic_writeRspSels_0;
  wire                readRspSels_0;

  StreamArbiter_1 cmdArbiter (
    .io_inputs_0_valid         (inputsCmd_0_valid                      ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (inputsCmd_0_payload_addr[23:0]         ), //i
    .io_inputs_0_payload_id    (inputsCmd_0_payload_id[3:0]            ), //i
    .io_inputs_0_payload_len   (inputsCmd_0_payload_len[7:0]           ), //i
    .io_inputs_0_payload_size  (inputsCmd_0_payload_size[2:0]          ), //i
    .io_inputs_0_payload_burst (inputsCmd_0_payload_burst[1:0]         ), //i
    .io_inputs_0_payload_write (inputsCmd_0_payload_write              ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (cmdArbiter_io_output_ready             ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[23:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[3:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_output_payload_write   (cmdArbiter_io_output_payload_write     ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH                 ), //o
    .aclk                      (aclk                                   ), //i
    .resetCtrl_mainClkReset    (resetCtrl_mainClkReset                 )  //i
  );
  StreamFifoLowLatency_1 cmdRouteFork_throwWhen_translated_fifo (
    .io_push_valid          (cmdRouteFork_throwWhen_translated_valid                    ), //i
    .io_push_ready          (cmdRouteFork_throwWhen_translated_fifo_io_push_ready       ), //o
    .io_pop_valid           (cmdRouteFork_throwWhen_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready           (cmdRouteFork_throwWhen_translated_fifo_io_pop_ready        ), //i
    .io_flush               (1'b0                                                       ), //i
    .io_occupancy           (cmdRouteFork_throwWhen_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability        (cmdRouteFork_throwWhen_translated_fifo_io_availability[2:0]), //o
    .aclk                   (aclk                                                       ), //i
    .resetCtrl_mainClkReset (resetCtrl_mainClkReset                                     )  //i
  );
  assign inputsCmd_0_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_0_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_0_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_0_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_0_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_0_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1253) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1253_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1253 = ((! cmdOutputFork_ready) && cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1253_1 = ((! cmdRouteFork_ready) && cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_arw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_arw_ready;
  assign io_output_arw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_arw_payload_len = cmdOutputFork_payload_len;
  assign io_output_arw_payload_size = cmdOutputFork_payload_size;
  assign io_output_arw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_arw_payload_write = cmdOutputFork_payload_write;
  assign io_output_arw_payload_id = (cmdOutputFork_payload_write ? cmdOutputFork_payload_id : cmdOutputFork_payload_id);
  assign when_Stream_l581 = (! cmdRouteFork_payload_write);
  always @(*) begin
    cmdRouteFork_throwWhen_valid = cmdRouteFork_valid;
    if(when_Stream_l581) begin
      cmdRouteFork_throwWhen_valid = 1'b0;
    end
  end

  always @(*) begin
    cmdRouteFork_ready = cmdRouteFork_throwWhen_ready;
    if(when_Stream_l581) begin
      cmdRouteFork_ready = 1'b1;
    end
  end

  assign cmdRouteFork_throwWhen_payload_addr = cmdRouteFork_payload_addr;
  assign cmdRouteFork_throwWhen_payload_id = cmdRouteFork_payload_id;
  assign cmdRouteFork_throwWhen_payload_len = cmdRouteFork_payload_len;
  assign cmdRouteFork_throwWhen_payload_size = cmdRouteFork_payload_size;
  assign cmdRouteFork_throwWhen_payload_burst = cmdRouteFork_payload_burst;
  assign cmdRouteFork_throwWhen_payload_write = cmdRouteFork_payload_write;
  assign cmdRouteFork_throwWhen_translated_valid = cmdRouteFork_throwWhen_valid;
  assign cmdRouteFork_throwWhen_ready = cmdRouteFork_throwWhen_translated_ready;
  assign cmdRouteFork_throwWhen_translated_ready = cmdRouteFork_throwWhen_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (cmdRouteFork_throwWhen_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((cmdRouteFork_throwWhen_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_throwWhen_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id;
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspSels_0 = 1'b1;
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id;
  assign io_output_r_ready = io_sharedInputs_0_r_ready;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

module Axi4SharedArbiter (
  input  wire          io_readInputs_0_ar_valid,
  output wire          io_readInputs_0_ar_ready,
  input  wire [17:0]   io_readInputs_0_ar_payload_addr,
  input  wire [4:0]    io_readInputs_0_ar_payload_id,
  input  wire [7:0]    io_readInputs_0_ar_payload_len,
  input  wire [2:0]    io_readInputs_0_ar_payload_size,
  input  wire [1:0]    io_readInputs_0_ar_payload_burst,
  output wire          io_readInputs_0_r_valid,
  input  wire          io_readInputs_0_r_ready,
  output wire [31:0]   io_readInputs_0_r_payload_data,
  output wire [4:0]    io_readInputs_0_r_payload_id,
  output wire [1:0]    io_readInputs_0_r_payload_resp,
  output wire          io_readInputs_0_r_payload_last,
  input  wire          io_readInputs_1_ar_valid,
  output wire          io_readInputs_1_ar_ready,
  input  wire [17:0]   io_readInputs_1_ar_payload_addr,
  input  wire [4:0]    io_readInputs_1_ar_payload_id,
  input  wire [7:0]    io_readInputs_1_ar_payload_len,
  input  wire [2:0]    io_readInputs_1_ar_payload_size,
  input  wire [1:0]    io_readInputs_1_ar_payload_burst,
  output wire          io_readInputs_1_r_valid,
  input  wire          io_readInputs_1_r_ready,
  output wire [31:0]   io_readInputs_1_r_payload_data,
  output wire [4:0]    io_readInputs_1_r_payload_id,
  output wire [1:0]    io_readInputs_1_r_payload_resp,
  output wire          io_readInputs_1_r_payload_last,
  input  wire          io_writeInputs_0_aw_valid,
  output wire          io_writeInputs_0_aw_ready,
  input  wire [17:0]   io_writeInputs_0_aw_payload_addr,
  input  wire [5:0]    io_writeInputs_0_aw_payload_id,
  input  wire [7:0]    io_writeInputs_0_aw_payload_len,
  input  wire [2:0]    io_writeInputs_0_aw_payload_size,
  input  wire [1:0]    io_writeInputs_0_aw_payload_burst,
  input  wire          io_writeInputs_0_w_valid,
  output wire          io_writeInputs_0_w_ready,
  input  wire [31:0]   io_writeInputs_0_w_payload_data,
  input  wire [3:0]    io_writeInputs_0_w_payload_strb,
  input  wire          io_writeInputs_0_w_payload_last,
  output wire          io_writeInputs_0_b_valid,
  input  wire          io_writeInputs_0_b_ready,
  output wire [5:0]    io_writeInputs_0_b_payload_id,
  output wire [1:0]    io_writeInputs_0_b_payload_resp,
  input  wire          io_sharedInputs_0_arw_valid,
  output wire          io_sharedInputs_0_arw_ready,
  input  wire [17:0]   io_sharedInputs_0_arw_payload_addr,
  input  wire [4:0]    io_sharedInputs_0_arw_payload_id,
  input  wire [7:0]    io_sharedInputs_0_arw_payload_len,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_size,
  input  wire [1:0]    io_sharedInputs_0_arw_payload_burst,
  input  wire          io_sharedInputs_0_arw_payload_write,
  input  wire          io_sharedInputs_0_w_valid,
  output wire          io_sharedInputs_0_w_ready,
  input  wire [31:0]   io_sharedInputs_0_w_payload_data,
  input  wire [3:0]    io_sharedInputs_0_w_payload_strb,
  input  wire          io_sharedInputs_0_w_payload_last,
  output wire          io_sharedInputs_0_b_valid,
  input  wire          io_sharedInputs_0_b_ready,
  output wire [4:0]    io_sharedInputs_0_b_payload_id,
  output wire [1:0]    io_sharedInputs_0_b_payload_resp,
  output wire          io_sharedInputs_0_r_valid,
  input  wire          io_sharedInputs_0_r_ready,
  output wire [31:0]   io_sharedInputs_0_r_payload_data,
  output wire [4:0]    io_sharedInputs_0_r_payload_id,
  output wire [1:0]    io_sharedInputs_0_r_payload_resp,
  output wire          io_sharedInputs_0_r_payload_last,
  output wire          io_output_arw_valid,
  input  wire          io_output_arw_ready,
  output wire [17:0]   io_output_arw_payload_addr,
  output wire [6:0]    io_output_arw_payload_id,
  output wire [7:0]    io_output_arw_payload_len,
  output wire [2:0]    io_output_arw_payload_size,
  output wire [1:0]    io_output_arw_payload_burst,
  output wire          io_output_arw_payload_write,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [31:0]   io_output_w_payload_data,
  output wire [3:0]    io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [6:0]    io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          io_output_r_valid,
  output wire          io_output_r_ready,
  input  wire [31:0]   io_output_r_payload_data,
  input  wire [6:0]    io_output_r_payload_id,
  input  wire [1:0]    io_output_r_payload_resp,
  input  wire          io_output_r_payload_last,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_throwWhen_translated_fifo_io_pop_ready;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_inputs_2_ready;
  wire                cmdArbiter_io_inputs_3_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [17:0]   cmdArbiter_io_output_payload_addr;
  wire       [4:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [1:0]    cmdArbiter_io_chosen;
  wire       [3:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_throwWhen_translated_fifo_io_push_ready;
  wire                cmdRouteFork_throwWhen_translated_fifo_io_pop_valid;
  wire       [0:0]    cmdRouteFork_throwWhen_translated_fifo_io_pop_payload;
  wire       [2:0]    cmdRouteFork_throwWhen_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_throwWhen_translated_fifo_io_availability;
  wire       [1:0]    _zz__zz_io_output_arw_payload_id;
  wire       [6:0]    _zz_io_output_arw_payload_id_4;
  wire       [5:0]    _zz_io_output_arw_payload_id_5;
  wire       [1:0]    _zz__zz_cmdRouteFork_throwWhen_translated_payload;
  reg                 _zz_writeLogic_routeDataInput_valid;
  reg                 _zz_writeLogic_routeDataInput_ready;
  reg        [31:0]   _zz_writeLogic_routeDataInput_payload_data;
  reg        [3:0]    _zz_writeLogic_routeDataInput_payload_strb;
  reg                 _zz_writeLogic_routeDataInput_payload_last;
  reg                 _zz_io_output_b_ready;
  reg                 _zz_io_output_r_ready;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [17:0]   inputsCmd_0_payload_addr;
  wire       [4:0]    inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  wire                inputsCmd_1_valid;
  wire                inputsCmd_1_ready;
  wire       [17:0]   inputsCmd_1_payload_addr;
  wire       [4:0]    inputsCmd_1_payload_id;
  wire       [7:0]    inputsCmd_1_payload_len;
  wire       [2:0]    inputsCmd_1_payload_size;
  wire       [1:0]    inputsCmd_1_payload_burst;
  wire                inputsCmd_1_payload_write;
  wire                inputsCmd_2_valid;
  wire                inputsCmd_2_ready;
  wire       [17:0]   inputsCmd_2_payload_addr;
  wire       [4:0]    inputsCmd_2_payload_id;
  wire       [7:0]    inputsCmd_2_payload_len;
  wire       [2:0]    inputsCmd_2_payload_size;
  wire       [1:0]    inputsCmd_2_payload_burst;
  wire                inputsCmd_2_payload_write;
  wire                inputsCmd_3_valid;
  wire                inputsCmd_3_ready;
  wire       [17:0]   inputsCmd_3_payload_addr;
  wire       [4:0]    inputsCmd_3_payload_id;
  wire       [7:0]    inputsCmd_3_payload_len;
  wire       [2:0]    inputsCmd_3_payload_size;
  wire       [1:0]    inputsCmd_3_payload_burst;
  wire                inputsCmd_3_payload_write;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [17:0]   cmdOutputFork_payload_addr;
  wire       [4:0]    cmdOutputFork_payload_id;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire                cmdOutputFork_payload_write;
  wire                cmdRouteFork_valid;
  reg                 cmdRouteFork_ready;
  wire       [17:0]   cmdRouteFork_payload_addr;
  wire       [4:0]    cmdRouteFork_payload_id;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  wire                cmdRouteFork_payload_write;
  reg                 cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1253;
  wire                when_Stream_l1253_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                _zz_io_output_arw_payload_id;
  wire       [2:0]    _zz_io_output_arw_payload_id_1;
  wire                _zz_io_output_arw_payload_id_2;
  wire                _zz_io_output_arw_payload_id_3;
  wire                when_Stream_l581;
  reg                 cmdRouteFork_throwWhen_valid;
  wire                cmdRouteFork_throwWhen_ready;
  wire       [17:0]   cmdRouteFork_throwWhen_payload_addr;
  wire       [4:0]    cmdRouteFork_throwWhen_payload_id;
  wire       [7:0]    cmdRouteFork_throwWhen_payload_len;
  wire       [2:0]    cmdRouteFork_throwWhen_payload_size;
  wire       [1:0]    cmdRouteFork_throwWhen_payload_burst;
  wire                cmdRouteFork_throwWhen_payload_write;
  wire                _zz_cmdRouteFork_throwWhen_translated_payload;
  wire                cmdRouteFork_throwWhen_translated_valid;
  wire                cmdRouteFork_throwWhen_translated_ready;
  wire       [0:0]    cmdRouteFork_throwWhen_translated_payload;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [31:0]   writeLogic_routeDataInput_payload_data;
  wire       [3:0]    writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                io_output_w_fire;
  wire       [0:0]    writeLogic_writeRspIndex;
  wire                writeLogic_writeRspSels_0;
  wire                writeLogic_writeRspSels_1;
  wire       [1:0]    readRspIndex;
  wire                readRspSels_0;
  wire                readRspSels_1;
  wire                readRspSels_2;

  assign _zz__zz_io_output_arw_payload_id = {cmdArbiter_io_chosenOH[3 : 3],cmdArbiter_io_chosenOH[2 : 2]};
  assign _zz_io_output_arw_payload_id_5 = {_zz_io_output_arw_payload_id,cmdOutputFork_payload_id};
  assign _zz_io_output_arw_payload_id_4 = {1'd0, _zz_io_output_arw_payload_id_5};
  assign _zz__zz_cmdRouteFork_throwWhen_translated_payload = {cmdArbiter_io_chosenOH[3 : 3],cmdArbiter_io_chosenOH[2 : 2]};
  StreamArbiter cmdArbiter (
    .io_inputs_0_valid         (inputsCmd_0_valid                      ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (inputsCmd_0_payload_addr[17:0]         ), //i
    .io_inputs_0_payload_id    (inputsCmd_0_payload_id[4:0]            ), //i
    .io_inputs_0_payload_len   (inputsCmd_0_payload_len[7:0]           ), //i
    .io_inputs_0_payload_size  (inputsCmd_0_payload_size[2:0]          ), //i
    .io_inputs_0_payload_burst (inputsCmd_0_payload_burst[1:0]         ), //i
    .io_inputs_0_payload_write (inputsCmd_0_payload_write              ), //i
    .io_inputs_1_valid         (inputsCmd_1_valid                      ), //i
    .io_inputs_1_ready         (cmdArbiter_io_inputs_1_ready           ), //o
    .io_inputs_1_payload_addr  (inputsCmd_1_payload_addr[17:0]         ), //i
    .io_inputs_1_payload_id    (inputsCmd_1_payload_id[4:0]            ), //i
    .io_inputs_1_payload_len   (inputsCmd_1_payload_len[7:0]           ), //i
    .io_inputs_1_payload_size  (inputsCmd_1_payload_size[2:0]          ), //i
    .io_inputs_1_payload_burst (inputsCmd_1_payload_burst[1:0]         ), //i
    .io_inputs_1_payload_write (inputsCmd_1_payload_write              ), //i
    .io_inputs_2_valid         (inputsCmd_2_valid                      ), //i
    .io_inputs_2_ready         (cmdArbiter_io_inputs_2_ready           ), //o
    .io_inputs_2_payload_addr  (inputsCmd_2_payload_addr[17:0]         ), //i
    .io_inputs_2_payload_id    (inputsCmd_2_payload_id[4:0]            ), //i
    .io_inputs_2_payload_len   (inputsCmd_2_payload_len[7:0]           ), //i
    .io_inputs_2_payload_size  (inputsCmd_2_payload_size[2:0]          ), //i
    .io_inputs_2_payload_burst (inputsCmd_2_payload_burst[1:0]         ), //i
    .io_inputs_2_payload_write (inputsCmd_2_payload_write              ), //i
    .io_inputs_3_valid         (inputsCmd_3_valid                      ), //i
    .io_inputs_3_ready         (cmdArbiter_io_inputs_3_ready           ), //o
    .io_inputs_3_payload_addr  (inputsCmd_3_payload_addr[17:0]         ), //i
    .io_inputs_3_payload_id    (inputsCmd_3_payload_id[4:0]            ), //i
    .io_inputs_3_payload_len   (inputsCmd_3_payload_len[7:0]           ), //i
    .io_inputs_3_payload_size  (inputsCmd_3_payload_size[2:0]          ), //i
    .io_inputs_3_payload_burst (inputsCmd_3_payload_burst[1:0]         ), //i
    .io_inputs_3_payload_write (inputsCmd_3_payload_write              ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (cmdArbiter_io_output_ready             ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[17:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[4:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_output_payload_write   (cmdArbiter_io_output_payload_write     ), //o
    .io_chosen                 (cmdArbiter_io_chosen[1:0]              ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH[3:0]            ), //o
    .aclk                      (aclk                                   ), //i
    .resetCtrl_mainClkReset    (resetCtrl_mainClkReset                 )  //i
  );
  StreamFifoLowLatency cmdRouteFork_throwWhen_translated_fifo (
    .io_push_valid          (cmdRouteFork_throwWhen_translated_valid                    ), //i
    .io_push_ready          (cmdRouteFork_throwWhen_translated_fifo_io_push_ready       ), //o
    .io_push_payload        (cmdRouteFork_throwWhen_translated_payload                  ), //i
    .io_pop_valid           (cmdRouteFork_throwWhen_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready           (cmdRouteFork_throwWhen_translated_fifo_io_pop_ready        ), //i
    .io_pop_payload         (cmdRouteFork_throwWhen_translated_fifo_io_pop_payload      ), //o
    .io_flush               (1'b0                                                       ), //i
    .io_occupancy           (cmdRouteFork_throwWhen_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability        (cmdRouteFork_throwWhen_translated_fifo_io_availability[2:0]), //o
    .aclk                   (aclk                                                       ), //i
    .resetCtrl_mainClkReset (resetCtrl_mainClkReset                                     )  //i
  );
  always @(*) begin
    case(cmdRouteFork_throwWhen_translated_fifo_io_pop_payload)
      1'b0 : begin
        _zz_writeLogic_routeDataInput_valid = io_writeInputs_0_w_valid;
        _zz_writeLogic_routeDataInput_ready = io_writeInputs_0_w_ready;
        _zz_writeLogic_routeDataInput_payload_data = io_writeInputs_0_w_payload_data;
        _zz_writeLogic_routeDataInput_payload_strb = io_writeInputs_0_w_payload_strb;
        _zz_writeLogic_routeDataInput_payload_last = io_writeInputs_0_w_payload_last;
      end
      default : begin
        _zz_writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
        _zz_writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
        _zz_writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
        _zz_writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
        _zz_writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
      end
    endcase
  end

  always @(*) begin
    case(writeLogic_writeRspIndex)
      1'b0 : _zz_io_output_b_ready = io_writeInputs_0_b_ready;
      default : _zz_io_output_b_ready = io_sharedInputs_0_b_ready;
    endcase
  end

  always @(*) begin
    case(readRspIndex)
      2'b00 : _zz_io_output_r_ready = io_readInputs_0_r_ready;
      2'b01 : _zz_io_output_r_ready = io_readInputs_1_r_ready;
      default : _zz_io_output_r_ready = io_sharedInputs_0_r_ready;
    endcase
  end

  assign inputsCmd_0_valid = io_readInputs_0_ar_valid;
  assign io_readInputs_0_ar_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_readInputs_0_ar_payload_addr;
  assign inputsCmd_0_payload_id = io_readInputs_0_ar_payload_id;
  assign inputsCmd_0_payload_len = io_readInputs_0_ar_payload_len;
  assign inputsCmd_0_payload_size = io_readInputs_0_ar_payload_size;
  assign inputsCmd_0_payload_burst = io_readInputs_0_ar_payload_burst;
  assign inputsCmd_0_payload_write = 1'b0;
  assign inputsCmd_1_valid = io_readInputs_1_ar_valid;
  assign io_readInputs_1_ar_ready = inputsCmd_1_ready;
  assign inputsCmd_1_payload_addr = io_readInputs_1_ar_payload_addr;
  assign inputsCmd_1_payload_id = io_readInputs_1_ar_payload_id;
  assign inputsCmd_1_payload_len = io_readInputs_1_ar_payload_len;
  assign inputsCmd_1_payload_size = io_readInputs_1_ar_payload_size;
  assign inputsCmd_1_payload_burst = io_readInputs_1_ar_payload_burst;
  assign inputsCmd_1_payload_write = 1'b0;
  assign inputsCmd_2_valid = io_writeInputs_0_aw_valid;
  assign io_writeInputs_0_aw_ready = inputsCmd_2_ready;
  assign inputsCmd_2_payload_addr = io_writeInputs_0_aw_payload_addr;
  assign inputsCmd_2_payload_id = io_writeInputs_0_aw_payload_id[4:0];
  assign inputsCmd_2_payload_len = io_writeInputs_0_aw_payload_len;
  assign inputsCmd_2_payload_size = io_writeInputs_0_aw_payload_size;
  assign inputsCmd_2_payload_burst = io_writeInputs_0_aw_payload_burst;
  assign inputsCmd_2_payload_write = 1'b1;
  assign inputsCmd_3_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_3_ready;
  assign inputsCmd_3_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_3_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_3_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_3_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_3_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_3_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  assign inputsCmd_1_ready = cmdArbiter_io_inputs_1_ready;
  assign inputsCmd_2_ready = cmdArbiter_io_inputs_2_ready;
  assign inputsCmd_3_ready = cmdArbiter_io_inputs_3_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1253) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1253_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1253 = ((! cmdOutputFork_ready) && cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1253_1 = ((! cmdRouteFork_ready) && cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_arw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_arw_ready;
  assign io_output_arw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_arw_payload_len = cmdOutputFork_payload_len;
  assign io_output_arw_payload_size = cmdOutputFork_payload_size;
  assign io_output_arw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_arw_payload_write = cmdOutputFork_payload_write;
  assign _zz_io_output_arw_payload_id = _zz__zz_io_output_arw_payload_id[1];
  assign _zz_io_output_arw_payload_id_1 = {cmdArbiter_io_chosenOH[3 : 3],cmdArbiter_io_chosenOH[1 : 0]};
  assign _zz_io_output_arw_payload_id_2 = _zz_io_output_arw_payload_id_1[1];
  assign _zz_io_output_arw_payload_id_3 = _zz_io_output_arw_payload_id_1[2];
  assign io_output_arw_payload_id = (cmdOutputFork_payload_write ? _zz_io_output_arw_payload_id_4 : {{_zz_io_output_arw_payload_id_3,_zz_io_output_arw_payload_id_2},cmdOutputFork_payload_id});
  assign when_Stream_l581 = (! cmdRouteFork_payload_write);
  always @(*) begin
    cmdRouteFork_throwWhen_valid = cmdRouteFork_valid;
    if(when_Stream_l581) begin
      cmdRouteFork_throwWhen_valid = 1'b0;
    end
  end

  always @(*) begin
    cmdRouteFork_ready = cmdRouteFork_throwWhen_ready;
    if(when_Stream_l581) begin
      cmdRouteFork_ready = 1'b1;
    end
  end

  assign cmdRouteFork_throwWhen_payload_addr = cmdRouteFork_payload_addr;
  assign cmdRouteFork_throwWhen_payload_id = cmdRouteFork_payload_id;
  assign cmdRouteFork_throwWhen_payload_len = cmdRouteFork_payload_len;
  assign cmdRouteFork_throwWhen_payload_size = cmdRouteFork_payload_size;
  assign cmdRouteFork_throwWhen_payload_burst = cmdRouteFork_payload_burst;
  assign cmdRouteFork_throwWhen_payload_write = cmdRouteFork_payload_write;
  assign _zz_cmdRouteFork_throwWhen_translated_payload = _zz__zz_cmdRouteFork_throwWhen_translated_payload[1];
  assign cmdRouteFork_throwWhen_translated_valid = cmdRouteFork_throwWhen_valid;
  assign cmdRouteFork_throwWhen_ready = cmdRouteFork_throwWhen_translated_ready;
  assign cmdRouteFork_throwWhen_translated_payload = _zz_cmdRouteFork_throwWhen_translated_payload;
  assign cmdRouteFork_throwWhen_translated_ready = cmdRouteFork_throwWhen_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = _zz_writeLogic_routeDataInput_valid;
  assign writeLogic_routeDataInput_ready = _zz_writeLogic_routeDataInput_ready;
  assign writeLogic_routeDataInput_payload_data = _zz_writeLogic_routeDataInput_payload_data;
  assign writeLogic_routeDataInput_payload_strb = _zz_writeLogic_routeDataInput_payload_strb;
  assign writeLogic_routeDataInput_payload_last = _zz_writeLogic_routeDataInput_payload_last;
  assign io_output_w_valid = (cmdRouteFork_throwWhen_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_writeInputs_0_w_ready = ((cmdRouteFork_throwWhen_translated_fifo_io_pop_valid && io_output_w_ready) && (cmdRouteFork_throwWhen_translated_fifo_io_pop_payload == 1'b0));
  assign io_sharedInputs_0_w_ready = ((cmdRouteFork_throwWhen_translated_fifo_io_pop_valid && io_output_w_ready) && (cmdRouteFork_throwWhen_translated_fifo_io_pop_payload == 1'b1));
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_throwWhen_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeLogic_writeRspIndex = io_output_b_payload_id[5 : 5];
  assign writeLogic_writeRspSels_0 = (writeLogic_writeRspIndex == 1'b0);
  assign writeLogic_writeRspSels_1 = (writeLogic_writeRspIndex == 1'b1);
  assign io_writeInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_writeInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_writeInputs_0_b_payload_id = io_output_b_payload_id[5:0];
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_1);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id[4:0];
  assign io_output_b_ready = _zz_io_output_b_ready;
  assign readRspIndex = io_output_r_payload_id[6 : 5];
  assign readRspSels_0 = (readRspIndex == 2'b00);
  assign readRspSels_1 = (readRspIndex == 2'b01);
  assign readRspSels_2 = (readRspIndex == 2'b10);
  assign io_readInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_readInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_readInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_readInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_readInputs_0_r_payload_id = io_output_r_payload_id[4:0];
  assign io_readInputs_1_r_valid = (io_output_r_valid && readRspSels_1);
  assign io_readInputs_1_r_payload_data = io_output_r_payload_data;
  assign io_readInputs_1_r_payload_resp = io_output_r_payload_resp;
  assign io_readInputs_1_r_payload_last = io_output_r_payload_last;
  assign io_readInputs_1_r_payload_id = io_output_r_payload_id[4:0];
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_2);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id[4:0];
  assign io_output_r_ready = _zz_io_output_r_ready;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

module Axi4WriteOnlyDecoder (
  input  wire          io_input_aw_valid,
  output wire          io_input_aw_ready,
  input  wire [31:0]   io_input_aw_payload_addr,
  input  wire [3:0]    io_input_aw_payload_id,
  input  wire [7:0]    io_input_aw_payload_len,
  input  wire [2:0]    io_input_aw_payload_size,
  input  wire [1:0]    io_input_aw_payload_burst,
  input  wire          io_input_w_valid,
  output wire          io_input_w_ready,
  input  wire [31:0]   io_input_w_payload_data,
  input  wire [3:0]    io_input_w_payload_strb,
  input  wire          io_input_w_payload_last,
  output wire          io_input_b_valid,
  input  wire          io_input_b_ready,
  output reg  [3:0]    io_input_b_payload_id,
  output reg  [1:0]    io_input_b_payload_resp,
  output wire          io_outputs_0_aw_valid,
  input  wire          io_outputs_0_aw_ready,
  output wire [31:0]   io_outputs_0_aw_payload_addr,
  output wire [3:0]    io_outputs_0_aw_payload_id,
  output wire [7:0]    io_outputs_0_aw_payload_len,
  output wire [2:0]    io_outputs_0_aw_payload_size,
  output wire [1:0]    io_outputs_0_aw_payload_burst,
  output wire          io_outputs_0_w_valid,
  input  wire          io_outputs_0_w_ready,
  output wire [31:0]   io_outputs_0_w_payload_data,
  output wire [3:0]    io_outputs_0_w_payload_strb,
  output wire          io_outputs_0_w_payload_last,
  input  wire          io_outputs_0_b_valid,
  output wire          io_outputs_0_b_ready,
  input  wire [3:0]    io_outputs_0_b_payload_id,
  input  wire [1:0]    io_outputs_0_b_payload_resp,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  wire                errorSlave_io_axi_aw_valid;
  wire                errorSlave_io_axi_w_valid;
  wire                errorSlave_io_axi_aw_ready;
  wire                errorSlave_io_axi_w_ready;
  wire                errorSlave_io_axi_b_valid;
  wire       [3:0]    errorSlave_io_axi_b_payload_id;
  wire       [1:0]    errorSlave_io_axi_b_payload_resp;
  wire                cmdAllowedStart;
  wire                io_input_aw_fire;
  wire                io_input_b_fire;
  reg                 pendingCmdCounter_incrementIt;
  reg                 pendingCmdCounter_decrementIt;
  wire       [2:0]    pendingCmdCounter_valueNext;
  reg        [2:0]    pendingCmdCounter_value;
  wire                pendingCmdCounter_mayOverflow;
  wire                pendingCmdCounter_mayUnderflow;
  wire                pendingCmdCounter_willOverflowIfInc;
  wire                pendingCmdCounter_willOverflow;
  wire                pendingCmdCounter_willUnderflowIfDec;
  wire                pendingCmdCounter_willUnderflow;
  reg        [2:0]    pendingCmdCounter_finalIncrement;
  wire                when_Utils_l767;
  wire                when_Utils_l769;
  wire                io_input_w_fire;
  wire                when_Utils_l735;
  reg                 pendingDataCounter_incrementIt;
  reg                 pendingDataCounter_decrementIt;
  wire       [2:0]    pendingDataCounter_valueNext;
  reg        [2:0]    pendingDataCounter_value;
  wire                pendingDataCounter_mayOverflow;
  wire                pendingDataCounter_mayUnderflow;
  wire                pendingDataCounter_willOverflowIfInc;
  wire                pendingDataCounter_willOverflow;
  wire                pendingDataCounter_willUnderflowIfDec;
  wire                pendingDataCounter_willUnderflow;
  reg        [2:0]    pendingDataCounter_finalIncrement;
  wire                when_Utils_l767_1;
  wire                when_Utils_l769_1;
  wire       [0:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [0:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;
  wire                allowData;
  reg                 _zz_cmdAllowedStart;

  Axi4WriteOnlyErrorSlave errorSlave (
    .io_axi_aw_valid         (errorSlave_io_axi_aw_valid           ), //i
    .io_axi_aw_ready         (errorSlave_io_axi_aw_ready           ), //o
    .io_axi_aw_payload_addr  (io_input_aw_payload_addr[31:0]       ), //i
    .io_axi_aw_payload_id    (io_input_aw_payload_id[3:0]          ), //i
    .io_axi_aw_payload_len   (io_input_aw_payload_len[7:0]         ), //i
    .io_axi_aw_payload_size  (io_input_aw_payload_size[2:0]        ), //i
    .io_axi_aw_payload_burst (io_input_aw_payload_burst[1:0]       ), //i
    .io_axi_w_valid          (errorSlave_io_axi_w_valid            ), //i
    .io_axi_w_ready          (errorSlave_io_axi_w_ready            ), //o
    .io_axi_w_payload_data   (io_input_w_payload_data[31:0]        ), //i
    .io_axi_w_payload_strb   (io_input_w_payload_strb[3:0]         ), //i
    .io_axi_w_payload_last   (io_input_w_payload_last              ), //i
    .io_axi_b_valid          (errorSlave_io_axi_b_valid            ), //o
    .io_axi_b_ready          (io_input_b_ready                     ), //i
    .io_axi_b_payload_id     (errorSlave_io_axi_b_payload_id[3:0]  ), //o
    .io_axi_b_payload_resp   (errorSlave_io_axi_b_payload_resp[1:0]), //o
    .aclk                    (aclk                                 ), //i
    .resetCtrl_mainClkReset  (resetCtrl_mainClkReset               )  //i
  );
  assign io_input_aw_fire = (io_input_aw_valid && io_input_aw_ready);
  assign io_input_b_fire = (io_input_b_valid && io_input_b_ready);
  always @(*) begin
    pendingCmdCounter_incrementIt = 1'b0;
    if(io_input_aw_fire) begin
      pendingCmdCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingCmdCounter_decrementIt = 1'b0;
    if(io_input_b_fire) begin
      pendingCmdCounter_decrementIt = 1'b1;
    end
  end

  assign pendingCmdCounter_mayOverflow = (pendingCmdCounter_value == 3'b111);
  assign pendingCmdCounter_mayUnderflow = (pendingCmdCounter_value == 3'b000);
  assign pendingCmdCounter_willOverflowIfInc = (pendingCmdCounter_mayOverflow && (! pendingCmdCounter_decrementIt));
  assign pendingCmdCounter_willOverflow = (pendingCmdCounter_willOverflowIfInc && pendingCmdCounter_incrementIt);
  assign pendingCmdCounter_willUnderflowIfDec = (pendingCmdCounter_mayUnderflow && (! pendingCmdCounter_incrementIt));
  assign pendingCmdCounter_willUnderflow = (pendingCmdCounter_willUnderflowIfDec && pendingCmdCounter_decrementIt);
  assign when_Utils_l767 = (pendingCmdCounter_incrementIt && (! pendingCmdCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l767) begin
      pendingCmdCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l769) begin
        pendingCmdCounter_finalIncrement = 3'b111;
      end else begin
        pendingCmdCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l769 = ((! pendingCmdCounter_incrementIt) && pendingCmdCounter_decrementIt);
  assign pendingCmdCounter_valueNext = (pendingCmdCounter_value + pendingCmdCounter_finalIncrement);
  assign io_input_w_fire = (io_input_w_valid && io_input_w_ready);
  assign when_Utils_l735 = (io_input_w_fire && io_input_w_payload_last);
  always @(*) begin
    pendingDataCounter_incrementIt = 1'b0;
    if(cmdAllowedStart) begin
      pendingDataCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingDataCounter_decrementIt = 1'b0;
    if(when_Utils_l735) begin
      pendingDataCounter_decrementIt = 1'b1;
    end
  end

  assign pendingDataCounter_mayOverflow = (pendingDataCounter_value == 3'b111);
  assign pendingDataCounter_mayUnderflow = (pendingDataCounter_value == 3'b000);
  assign pendingDataCounter_willOverflowIfInc = (pendingDataCounter_mayOverflow && (! pendingDataCounter_decrementIt));
  assign pendingDataCounter_willOverflow = (pendingDataCounter_willOverflowIfInc && pendingDataCounter_incrementIt);
  assign pendingDataCounter_willUnderflowIfDec = (pendingDataCounter_mayUnderflow && (! pendingDataCounter_incrementIt));
  assign pendingDataCounter_willUnderflow = (pendingDataCounter_willUnderflowIfDec && pendingDataCounter_decrementIt);
  assign when_Utils_l767_1 = (pendingDataCounter_incrementIt && (! pendingDataCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l767_1) begin
      pendingDataCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l769_1) begin
        pendingDataCounter_finalIncrement = 3'b111;
      end else begin
        pendingDataCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l769_1 = ((! pendingDataCounter_incrementIt) && pendingDataCounter_decrementIt);
  assign pendingDataCounter_valueNext = (pendingDataCounter_value + pendingDataCounter_finalIncrement);
  assign decodedCmdSels = (((io_input_aw_payload_addr & (~ 32'h0003ffff)) == 32'h0) && io_input_aw_valid);
  assign decodedCmdError = (decodedCmdSels == 1'b0);
  assign allowCmd = ((pendingCmdCounter_value == 3'b000) || ((pendingCmdCounter_value != 3'b111) && (pendingSels == decodedCmdSels)));
  assign allowData = (pendingDataCounter_value != 3'b000);
  assign cmdAllowedStart = ((io_input_aw_valid && allowCmd) && _zz_cmdAllowedStart);
  assign io_input_aw_ready = (((|(decodedCmdSels & io_outputs_0_aw_ready)) || (decodedCmdError && errorSlave_io_axi_aw_ready)) && allowCmd);
  assign errorSlave_io_axi_aw_valid = ((io_input_aw_valid && decodedCmdError) && allowCmd);
  assign io_outputs_0_aw_valid = ((io_input_aw_valid && decodedCmdSels[0]) && allowCmd);
  assign io_outputs_0_aw_payload_addr = io_input_aw_payload_addr;
  assign io_outputs_0_aw_payload_id = io_input_aw_payload_id;
  assign io_outputs_0_aw_payload_len = io_input_aw_payload_len;
  assign io_outputs_0_aw_payload_size = io_input_aw_payload_size;
  assign io_outputs_0_aw_payload_burst = io_input_aw_payload_burst;
  assign io_input_w_ready = (((|(pendingSels & io_outputs_0_w_ready)) || (pendingError && errorSlave_io_axi_w_ready)) && allowData);
  assign errorSlave_io_axi_w_valid = ((io_input_w_valid && pendingError) && allowData);
  assign io_outputs_0_w_valid = ((io_input_w_valid && pendingSels[0]) && allowData);
  assign io_outputs_0_w_payload_data = io_input_w_payload_data;
  assign io_outputs_0_w_payload_strb = io_input_w_payload_strb;
  assign io_outputs_0_w_payload_last = io_input_w_payload_last;
  assign io_input_b_valid = ((|io_outputs_0_b_valid) || errorSlave_io_axi_b_valid);
  always @(*) begin
    io_input_b_payload_id = io_outputs_0_b_payload_id;
    if(pendingError) begin
      io_input_b_payload_id = errorSlave_io_axi_b_payload_id;
    end
  end

  always @(*) begin
    io_input_b_payload_resp = io_outputs_0_b_payload_resp;
    if(pendingError) begin
      io_input_b_payload_resp = errorSlave_io_axi_b_payload_resp;
    end
  end

  assign io_outputs_0_b_ready = io_input_b_ready;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      pendingCmdCounter_value <= 3'b000;
      pendingDataCounter_value <= 3'b000;
      pendingSels <= 1'b0;
      pendingError <= 1'b0;
      _zz_cmdAllowedStart <= 1'b1;
    end else begin
      pendingCmdCounter_value <= pendingCmdCounter_valueNext;
      pendingDataCounter_value <= pendingDataCounter_valueNext;
      if(cmdAllowedStart) begin
        pendingSels <= decodedCmdSels;
      end
      if(cmdAllowedStart) begin
        pendingError <= decodedCmdError;
      end
      if(cmdAllowedStart) begin
        _zz_cmdAllowedStart <= 1'b0;
      end
      if(io_input_aw_ready) begin
        _zz_cmdAllowedStart <= 1'b1;
      end
    end
  end


endmodule

module Axi4ReadOnlyDecoder_1 (
  input  wire          io_input_ar_valid,
  output wire          io_input_ar_ready,
  input  wire [31:0]   io_input_ar_payload_addr,
  input  wire [3:0]    io_input_ar_payload_id,
  input  wire [7:0]    io_input_ar_payload_len,
  input  wire [2:0]    io_input_ar_payload_size,
  input  wire [1:0]    io_input_ar_payload_burst,
  output reg           io_input_r_valid,
  input  wire          io_input_r_ready,
  output wire [31:0]   io_input_r_payload_data,
  output reg  [3:0]    io_input_r_payload_id,
  output reg  [1:0]    io_input_r_payload_resp,
  output reg           io_input_r_payload_last,
  output wire          io_outputs_0_ar_valid,
  input  wire          io_outputs_0_ar_ready,
  output wire [31:0]   io_outputs_0_ar_payload_addr,
  output wire [3:0]    io_outputs_0_ar_payload_id,
  output wire [7:0]    io_outputs_0_ar_payload_len,
  output wire [2:0]    io_outputs_0_ar_payload_size,
  output wire [1:0]    io_outputs_0_ar_payload_burst,
  input  wire          io_outputs_0_r_valid,
  output wire          io_outputs_0_r_ready,
  input  wire [31:0]   io_outputs_0_r_payload_data,
  input  wire [3:0]    io_outputs_0_r_payload_id,
  input  wire [1:0]    io_outputs_0_r_payload_resp,
  input  wire          io_outputs_0_r_payload_last,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  wire                errorSlave_io_axi_ar_valid;
  wire                errorSlave_io_axi_ar_ready;
  wire                errorSlave_io_axi_r_valid;
  wire       [31:0]   errorSlave_io_axi_r_payload_data;
  wire       [3:0]    errorSlave_io_axi_r_payload_id;
  wire       [1:0]    errorSlave_io_axi_r_payload_resp;
  wire                errorSlave_io_axi_r_payload_last;
  wire                io_input_ar_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l735;
  reg                 pendingCmdCounter_incrementIt;
  reg                 pendingCmdCounter_decrementIt;
  wire       [2:0]    pendingCmdCounter_valueNext;
  reg        [2:0]    pendingCmdCounter_value;
  wire                pendingCmdCounter_mayOverflow;
  wire                pendingCmdCounter_mayUnderflow;
  wire                pendingCmdCounter_willOverflowIfInc;
  wire                pendingCmdCounter_willOverflow;
  wire                pendingCmdCounter_willUnderflowIfDec;
  wire                pendingCmdCounter_willUnderflow;
  reg        [2:0]    pendingCmdCounter_finalIncrement;
  wire                when_Utils_l767;
  wire                when_Utils_l769;
  wire       [0:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [0:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;

  Axi4ReadOnlyErrorSlave_1 errorSlave (
    .io_axi_ar_valid         (errorSlave_io_axi_ar_valid            ), //i
    .io_axi_ar_ready         (errorSlave_io_axi_ar_ready            ), //o
    .io_axi_ar_payload_addr  (io_input_ar_payload_addr[31:0]        ), //i
    .io_axi_ar_payload_id    (io_input_ar_payload_id[3:0]           ), //i
    .io_axi_ar_payload_len   (io_input_ar_payload_len[7:0]          ), //i
    .io_axi_ar_payload_size  (io_input_ar_payload_size[2:0]         ), //i
    .io_axi_ar_payload_burst (io_input_ar_payload_burst[1:0]        ), //i
    .io_axi_r_valid          (errorSlave_io_axi_r_valid             ), //o
    .io_axi_r_ready          (io_input_r_ready                      ), //i
    .io_axi_r_payload_data   (errorSlave_io_axi_r_payload_data[31:0]), //o
    .io_axi_r_payload_id     (errorSlave_io_axi_r_payload_id[3:0]   ), //o
    .io_axi_r_payload_resp   (errorSlave_io_axi_r_payload_resp[1:0] ), //o
    .io_axi_r_payload_last   (errorSlave_io_axi_r_payload_last      ), //o
    .aclk                    (aclk                                  ), //i
    .resetCtrl_mainClkReset  (resetCtrl_mainClkReset                )  //i
  );
  assign io_input_ar_fire = (io_input_ar_valid && io_input_ar_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l735 = (io_input_r_fire && io_input_r_payload_last);
  always @(*) begin
    pendingCmdCounter_incrementIt = 1'b0;
    if(io_input_ar_fire) begin
      pendingCmdCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingCmdCounter_decrementIt = 1'b0;
    if(when_Utils_l735) begin
      pendingCmdCounter_decrementIt = 1'b1;
    end
  end

  assign pendingCmdCounter_mayOverflow = (pendingCmdCounter_value == 3'b111);
  assign pendingCmdCounter_mayUnderflow = (pendingCmdCounter_value == 3'b000);
  assign pendingCmdCounter_willOverflowIfInc = (pendingCmdCounter_mayOverflow && (! pendingCmdCounter_decrementIt));
  assign pendingCmdCounter_willOverflow = (pendingCmdCounter_willOverflowIfInc && pendingCmdCounter_incrementIt);
  assign pendingCmdCounter_willUnderflowIfDec = (pendingCmdCounter_mayUnderflow && (! pendingCmdCounter_incrementIt));
  assign pendingCmdCounter_willUnderflow = (pendingCmdCounter_willUnderflowIfDec && pendingCmdCounter_decrementIt);
  assign when_Utils_l767 = (pendingCmdCounter_incrementIt && (! pendingCmdCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l767) begin
      pendingCmdCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l769) begin
        pendingCmdCounter_finalIncrement = 3'b111;
      end else begin
        pendingCmdCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l769 = ((! pendingCmdCounter_incrementIt) && pendingCmdCounter_decrementIt);
  assign pendingCmdCounter_valueNext = (pendingCmdCounter_value + pendingCmdCounter_finalIncrement);
  assign decodedCmdSels = (((io_input_ar_payload_addr & (~ 32'h0003ffff)) == 32'h0) && io_input_ar_valid);
  assign decodedCmdError = (decodedCmdSels == 1'b0);
  assign allowCmd = ((pendingCmdCounter_value == 3'b000) || ((pendingCmdCounter_value != 3'b111) && (pendingSels == decodedCmdSels)));
  assign io_input_ar_ready = (((|(decodedCmdSels & io_outputs_0_ar_ready)) || (decodedCmdError && errorSlave_io_axi_ar_ready)) && allowCmd);
  assign errorSlave_io_axi_ar_valid = ((io_input_ar_valid && decodedCmdError) && allowCmd);
  assign io_outputs_0_ar_valid = ((io_input_ar_valid && decodedCmdSels[0]) && allowCmd);
  assign io_outputs_0_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_0_ar_payload_id = io_input_ar_payload_id;
  assign io_outputs_0_ar_payload_len = io_input_ar_payload_len;
  assign io_outputs_0_ar_payload_size = io_input_ar_payload_size;
  assign io_outputs_0_ar_payload_burst = io_input_ar_payload_burst;
  always @(*) begin
    io_input_r_valid = (|io_outputs_0_r_valid);
    if(errorSlave_io_axi_r_valid) begin
      io_input_r_valid = 1'b1;
    end
  end

  assign io_input_r_payload_data = io_outputs_0_r_payload_data;
  always @(*) begin
    io_input_r_payload_id = io_outputs_0_r_payload_id;
    if(pendingError) begin
      io_input_r_payload_id = errorSlave_io_axi_r_payload_id;
    end
  end

  always @(*) begin
    io_input_r_payload_resp = io_outputs_0_r_payload_resp;
    if(pendingError) begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_input_r_payload_last = io_outputs_0_r_payload_last;
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_outputs_0_r_ready = io_input_r_ready;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      pendingCmdCounter_value <= 3'b000;
      pendingSels <= 1'b0;
      pendingError <= 1'b0;
    end else begin
      pendingCmdCounter_value <= pendingCmdCounter_valueNext;
      if(io_input_ar_ready) begin
        pendingSels <= decodedCmdSels;
      end
      if(io_input_ar_ready) begin
        pendingError <= decodedCmdError;
      end
    end
  end


endmodule

module Axi4SharedDecoder (
  input  wire          io_input_arw_valid,
  output wire          io_input_arw_ready,
  input  wire [31:0]   io_input_arw_payload_addr,
  input  wire [7:0]    io_input_arw_payload_len,
  input  wire [2:0]    io_input_arw_payload_size,
  input  wire [3:0]    io_input_arw_payload_cache,
  input  wire [2:0]    io_input_arw_payload_prot,
  input  wire          io_input_arw_payload_write,
  input  wire          io_input_w_valid,
  output wire          io_input_w_ready,
  input  wire [31:0]   io_input_w_payload_data,
  input  wire [3:0]    io_input_w_payload_strb,
  input  wire          io_input_w_payload_last,
  output wire          io_input_b_valid,
  input  wire          io_input_b_ready,
  output reg  [1:0]    io_input_b_payload_resp,
  output wire          io_input_r_valid,
  input  wire          io_input_r_ready,
  output wire [31:0]   io_input_r_payload_data,
  output reg  [1:0]    io_input_r_payload_resp,
  output reg           io_input_r_payload_last,
  output wire          io_readOutputs_0_ar_valid,
  input  wire          io_readOutputs_0_ar_ready,
  output wire [31:0]   io_readOutputs_0_ar_payload_addr,
  output wire [7:0]    io_readOutputs_0_ar_payload_len,
  output wire [2:0]    io_readOutputs_0_ar_payload_size,
  output wire [3:0]    io_readOutputs_0_ar_payload_cache,
  output wire [2:0]    io_readOutputs_0_ar_payload_prot,
  input  wire          io_readOutputs_0_r_valid,
  output wire          io_readOutputs_0_r_ready,
  input  wire [31:0]   io_readOutputs_0_r_payload_data,
  input  wire [1:0]    io_readOutputs_0_r_payload_resp,
  input  wire          io_readOutputs_0_r_payload_last,
  output wire          io_writeOutputs_0_aw_valid,
  input  wire          io_writeOutputs_0_aw_ready,
  output wire [31:0]   io_writeOutputs_0_aw_payload_addr,
  output wire [7:0]    io_writeOutputs_0_aw_payload_len,
  output wire [2:0]    io_writeOutputs_0_aw_payload_size,
  output wire [3:0]    io_writeOutputs_0_aw_payload_cache,
  output wire [2:0]    io_writeOutputs_0_aw_payload_prot,
  output wire          io_writeOutputs_0_w_valid,
  input  wire          io_writeOutputs_0_w_ready,
  output wire [31:0]   io_writeOutputs_0_w_payload_data,
  output wire [3:0]    io_writeOutputs_0_w_payload_strb,
  output wire          io_writeOutputs_0_w_payload_last,
  input  wire          io_writeOutputs_0_b_valid,
  output wire          io_writeOutputs_0_b_ready,
  input  wire [1:0]    io_writeOutputs_0_b_payload_resp,
  output wire          io_sharedOutputs_0_arw_valid,
  input  wire          io_sharedOutputs_0_arw_ready,
  output wire [31:0]   io_sharedOutputs_0_arw_payload_addr,
  output wire [7:0]    io_sharedOutputs_0_arw_payload_len,
  output wire [2:0]    io_sharedOutputs_0_arw_payload_size,
  output wire [3:0]    io_sharedOutputs_0_arw_payload_cache,
  output wire [2:0]    io_sharedOutputs_0_arw_payload_prot,
  output wire          io_sharedOutputs_0_arw_payload_write,
  output wire          io_sharedOutputs_0_w_valid,
  input  wire          io_sharedOutputs_0_w_ready,
  output wire [31:0]   io_sharedOutputs_0_w_payload_data,
  output wire [3:0]    io_sharedOutputs_0_w_payload_strb,
  output wire          io_sharedOutputs_0_w_payload_last,
  input  wire          io_sharedOutputs_0_b_valid,
  output wire          io_sharedOutputs_0_b_ready,
  input  wire [1:0]    io_sharedOutputs_0_b_payload_resp,
  input  wire          io_sharedOutputs_0_r_valid,
  output wire          io_sharedOutputs_0_r_ready,
  input  wire [31:0]   io_sharedOutputs_0_r_payload_data,
  input  wire [1:0]    io_sharedOutputs_0_r_payload_resp,
  input  wire          io_sharedOutputs_0_r_payload_last,
  output wire          io_sharedOutputs_1_arw_valid,
  input  wire          io_sharedOutputs_1_arw_ready,
  output wire [31:0]   io_sharedOutputs_1_arw_payload_addr,
  output wire [7:0]    io_sharedOutputs_1_arw_payload_len,
  output wire [2:0]    io_sharedOutputs_1_arw_payload_size,
  output wire [3:0]    io_sharedOutputs_1_arw_payload_cache,
  output wire [2:0]    io_sharedOutputs_1_arw_payload_prot,
  output wire          io_sharedOutputs_1_arw_payload_write,
  output wire          io_sharedOutputs_1_w_valid,
  input  wire          io_sharedOutputs_1_w_ready,
  output wire [31:0]   io_sharedOutputs_1_w_payload_data,
  output wire [3:0]    io_sharedOutputs_1_w_payload_strb,
  output wire          io_sharedOutputs_1_w_payload_last,
  input  wire          io_sharedOutputs_1_b_valid,
  output wire          io_sharedOutputs_1_b_ready,
  input  wire [1:0]    io_sharedOutputs_1_b_payload_resp,
  input  wire          io_sharedOutputs_1_r_valid,
  output wire          io_sharedOutputs_1_r_ready,
  input  wire [31:0]   io_sharedOutputs_1_r_payload_data,
  input  wire [1:0]    io_sharedOutputs_1_r_payload_resp,
  input  wire          io_sharedOutputs_1_r_payload_last,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  wire                errorSlave_io_axi_arw_valid;
  wire                errorSlave_io_axi_w_valid;
  wire                errorSlave_io_axi_arw_ready;
  wire                errorSlave_io_axi_w_ready;
  wire                errorSlave_io_axi_b_valid;
  wire       [1:0]    errorSlave_io_axi_b_payload_resp;
  wire                errorSlave_io_axi_r_valid;
  wire       [31:0]   errorSlave_io_axi_r_payload_data;
  wire       [1:0]    errorSlave_io_axi_r_payload_resp;
  wire                errorSlave_io_axi_r_payload_last;
  wire       [31:0]   _zz_decodedCmdSels;
  wire       [31:0]   _zz_decodedCmdSels_1;
  wire       [31:0]   _zz_decodedCmdSels_2;
  wire       [31:0]   _zz_decodedCmdSels_3;
  reg        [1:0]    _zz_io_input_b_payload_resp;
  reg        [31:0]   _zz_io_input_r_payload_data;
  reg        [1:0]    _zz_io_input_r_payload_resp;
  reg                 _zz_io_input_r_payload_last;
  reg        [2:0]    _zz_pendingCmdCounter;
  reg        [2:0]    _zz_pendingCmdCounter_1;
  reg        [2:0]    _zz_pendingCmdCounter_2;
  wire                cmdAllowedStart;
  wire                io_input_arw_fire;
  wire                io_input_b_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l798;
  reg        [2:0]    pendingCmdCounter;
  wire       [2:0]    _zz_pendingCmdCounter_3;
  wire                when_Utils_l732;
  wire                io_input_w_fire;
  wire                when_Utils_l735;
  reg                 pendingDataCounter_incrementIt;
  reg                 pendingDataCounter_decrementIt;
  wire       [2:0]    pendingDataCounter_valueNext;
  reg        [2:0]    pendingDataCounter_value;
  wire                pendingDataCounter_mayOverflow;
  wire                pendingDataCounter_mayUnderflow;
  wire                pendingDataCounter_willOverflowIfInc;
  wire                pendingDataCounter_willOverflow;
  wire                pendingDataCounter_willUnderflowIfDec;
  wire                pendingDataCounter_willUnderflow;
  reg        [2:0]    pendingDataCounter_finalIncrement;
  wire                when_Utils_l767;
  wire                when_Utils_l769;
  wire       [3:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [3:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;
  wire                allowData;
  reg                 _zz_cmdAllowedStart;
  wire       [1:0]    _zz_io_sharedOutputs_0_arw_valid;
  wire       [1:0]    _zz_io_sharedOutputs_0_w_valid;
  wire       [2:0]    _zz_writeRspIndex;
  wire                _zz_writeRspIndex_1;
  wire                _zz_writeRspIndex_2;
  wire       [1:0]    writeRspIndex;
  wire       [2:0]    _zz_readRspIndex;
  wire                _zz_readRspIndex_1;
  wire                _zz_readRspIndex_2;
  wire       [1:0]    readRspIndex;

  assign _zz_decodedCmdSels = 32'h00ffffff;
  assign _zz_decodedCmdSels_1 = 32'h0003ffff;
  assign _zz_decodedCmdSels_2 = (~ 32'h3fffffff);
  assign _zz_decodedCmdSels_3 = (~ 32'h3fffffff);
  Axi4SharedErrorSlave errorSlave (
    .io_axi_arw_valid         (errorSlave_io_axi_arw_valid           ), //i
    .io_axi_arw_ready         (errorSlave_io_axi_arw_ready           ), //o
    .io_axi_arw_payload_addr  (io_input_arw_payload_addr[31:0]       ), //i
    .io_axi_arw_payload_len   (io_input_arw_payload_len[7:0]         ), //i
    .io_axi_arw_payload_size  (io_input_arw_payload_size[2:0]        ), //i
    .io_axi_arw_payload_cache (io_input_arw_payload_cache[3:0]       ), //i
    .io_axi_arw_payload_prot  (io_input_arw_payload_prot[2:0]        ), //i
    .io_axi_arw_payload_write (io_input_arw_payload_write            ), //i
    .io_axi_w_valid           (errorSlave_io_axi_w_valid             ), //i
    .io_axi_w_ready           (errorSlave_io_axi_w_ready             ), //o
    .io_axi_w_payload_data    (io_input_w_payload_data[31:0]         ), //i
    .io_axi_w_payload_strb    (io_input_w_payload_strb[3:0]          ), //i
    .io_axi_w_payload_last    (io_input_w_payload_last               ), //i
    .io_axi_b_valid           (errorSlave_io_axi_b_valid             ), //o
    .io_axi_b_ready           (io_input_b_ready                      ), //i
    .io_axi_b_payload_resp    (errorSlave_io_axi_b_payload_resp[1:0] ), //o
    .io_axi_r_valid           (errorSlave_io_axi_r_valid             ), //o
    .io_axi_r_ready           (io_input_r_ready                      ), //i
    .io_axi_r_payload_data    (errorSlave_io_axi_r_payload_data[31:0]), //o
    .io_axi_r_payload_resp    (errorSlave_io_axi_r_payload_resp[1:0] ), //o
    .io_axi_r_payload_last    (errorSlave_io_axi_r_payload_last      ), //o
    .aclk                     (aclk                                  ), //i
    .resetCtrl_mainClkReset   (resetCtrl_mainClkReset                )  //i
  );
  always @(*) begin
    case(writeRspIndex)
      2'b00 : _zz_io_input_b_payload_resp = io_writeOutputs_0_b_payload_resp;
      2'b01 : _zz_io_input_b_payload_resp = io_sharedOutputs_0_b_payload_resp;
      default : _zz_io_input_b_payload_resp = io_sharedOutputs_1_b_payload_resp;
    endcase
  end

  always @(*) begin
    case(readRspIndex)
      2'b00 : begin
        _zz_io_input_r_payload_data = io_readOutputs_0_r_payload_data;
        _zz_io_input_r_payload_resp = io_readOutputs_0_r_payload_resp;
        _zz_io_input_r_payload_last = io_readOutputs_0_r_payload_last;
      end
      2'b01 : begin
        _zz_io_input_r_payload_data = io_sharedOutputs_0_r_payload_data;
        _zz_io_input_r_payload_resp = io_sharedOutputs_0_r_payload_resp;
        _zz_io_input_r_payload_last = io_sharedOutputs_0_r_payload_last;
      end
      default : begin
        _zz_io_input_r_payload_data = io_sharedOutputs_1_r_payload_data;
        _zz_io_input_r_payload_resp = io_sharedOutputs_1_r_payload_resp;
        _zz_io_input_r_payload_last = io_sharedOutputs_1_r_payload_last;
      end
    endcase
  end

  always @(*) begin
    _zz_pendingCmdCounter = _zz_pendingCmdCounter_1;
    if(when_Utils_l798) begin
      _zz_pendingCmdCounter = (_zz_pendingCmdCounter_1 - 3'b001);
    end
  end

  always @(*) begin
    _zz_pendingCmdCounter_1 = _zz_pendingCmdCounter_2;
    if(io_input_b_fire) begin
      _zz_pendingCmdCounter_1 = (_zz_pendingCmdCounter_2 - 3'b001);
    end
  end

  always @(*) begin
    _zz_pendingCmdCounter_2 = _zz_pendingCmdCounter_3;
    if(io_input_arw_fire) begin
      _zz_pendingCmdCounter_2 = (_zz_pendingCmdCounter_3 + 3'b001);
    end
  end

  assign io_input_arw_fire = (io_input_arw_valid && io_input_arw_ready);
  assign io_input_b_fire = (io_input_b_valid && io_input_b_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l798 = (io_input_r_fire && io_input_r_payload_last);
  assign _zz_pendingCmdCounter_3 = pendingCmdCounter;
  assign when_Utils_l732 = (cmdAllowedStart && io_input_arw_payload_write);
  assign io_input_w_fire = (io_input_w_valid && io_input_w_ready);
  assign when_Utils_l735 = (io_input_w_fire && io_input_w_payload_last);
  always @(*) begin
    pendingDataCounter_incrementIt = 1'b0;
    if(when_Utils_l732) begin
      pendingDataCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingDataCounter_decrementIt = 1'b0;
    if(when_Utils_l735) begin
      pendingDataCounter_decrementIt = 1'b1;
    end
  end

  assign pendingDataCounter_mayOverflow = (pendingDataCounter_value == 3'b111);
  assign pendingDataCounter_mayUnderflow = (pendingDataCounter_value == 3'b000);
  assign pendingDataCounter_willOverflowIfInc = (pendingDataCounter_mayOverflow && (! pendingDataCounter_decrementIt));
  assign pendingDataCounter_willOverflow = (pendingDataCounter_willOverflowIfInc && pendingDataCounter_incrementIt);
  assign pendingDataCounter_willUnderflowIfDec = (pendingDataCounter_mayUnderflow && (! pendingDataCounter_incrementIt));
  assign pendingDataCounter_willUnderflow = (pendingDataCounter_willUnderflowIfDec && pendingDataCounter_decrementIt);
  assign when_Utils_l767 = (pendingDataCounter_incrementIt && (! pendingDataCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l767) begin
      pendingDataCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l769) begin
        pendingDataCounter_finalIncrement = 3'b111;
      end else begin
        pendingDataCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l769 = ((! pendingDataCounter_incrementIt) && pendingDataCounter_decrementIt);
  assign pendingDataCounter_valueNext = (pendingDataCounter_value + pendingDataCounter_finalIncrement);
  assign decodedCmdSels = {{((io_input_arw_payload_addr & (~ _zz_decodedCmdSels)) == 32'h10000000),((io_input_arw_payload_addr & (~ _zz_decodedCmdSels_1)) == 32'h0)},{(((io_input_arw_payload_addr & _zz_decodedCmdSels_2) == 32'h80000000) && io_input_arw_payload_write),(((io_input_arw_payload_addr & _zz_decodedCmdSels_3) == 32'h80000000) && (! io_input_arw_payload_write))}};
  assign decodedCmdError = (decodedCmdSels == 4'b0000);
  assign allowCmd = ((pendingCmdCounter == 3'b000) || ((pendingCmdCounter != 3'b111) && (pendingSels == decodedCmdSels)));
  assign allowData = (pendingDataCounter_value != 3'b000);
  assign cmdAllowedStart = ((io_input_arw_valid && allowCmd) && _zz_cmdAllowedStart);
  assign io_input_arw_ready = (((|(decodedCmdSels & {io_sharedOutputs_1_arw_ready,{io_sharedOutputs_0_arw_ready,{io_writeOutputs_0_aw_ready,io_readOutputs_0_ar_ready}}})) || (decodedCmdError && errorSlave_io_axi_arw_ready)) && allowCmd);
  assign errorSlave_io_axi_arw_valid = ((io_input_arw_valid && decodedCmdError) && allowCmd);
  assign io_readOutputs_0_ar_valid = ((io_input_arw_valid && decodedCmdSels[0]) && allowCmd);
  assign io_readOutputs_0_ar_payload_addr = io_input_arw_payload_addr;
  assign io_readOutputs_0_ar_payload_len = io_input_arw_payload_len;
  assign io_readOutputs_0_ar_payload_size = io_input_arw_payload_size;
  assign io_readOutputs_0_ar_payload_cache = io_input_arw_payload_cache;
  assign io_readOutputs_0_ar_payload_prot = io_input_arw_payload_prot;
  assign io_writeOutputs_0_aw_valid = ((io_input_arw_valid && decodedCmdSels[1]) && allowCmd);
  assign io_writeOutputs_0_aw_payload_addr = io_input_arw_payload_addr;
  assign io_writeOutputs_0_aw_payload_len = io_input_arw_payload_len;
  assign io_writeOutputs_0_aw_payload_size = io_input_arw_payload_size;
  assign io_writeOutputs_0_aw_payload_cache = io_input_arw_payload_cache;
  assign io_writeOutputs_0_aw_payload_prot = io_input_arw_payload_prot;
  assign _zz_io_sharedOutputs_0_arw_valid = decodedCmdSels[3 : 2];
  assign io_sharedOutputs_0_arw_valid = ((io_input_arw_valid && _zz_io_sharedOutputs_0_arw_valid[0]) && allowCmd);
  assign io_sharedOutputs_0_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_0_arw_payload_len = io_input_arw_payload_len;
  assign io_sharedOutputs_0_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_0_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_0_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_0_arw_payload_write = io_input_arw_payload_write;
  assign io_sharedOutputs_1_arw_valid = ((io_input_arw_valid && _zz_io_sharedOutputs_0_arw_valid[1]) && allowCmd);
  assign io_sharedOutputs_1_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_1_arw_payload_len = io_input_arw_payload_len;
  assign io_sharedOutputs_1_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_1_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_1_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_1_arw_payload_write = io_input_arw_payload_write;
  assign io_input_w_ready = (((|({pendingSels[3 : 2],pendingSels[1 : 1]} & {io_sharedOutputs_1_w_ready,{io_sharedOutputs_0_w_ready,io_writeOutputs_0_w_ready}})) || (pendingError && errorSlave_io_axi_w_ready)) && allowData);
  assign errorSlave_io_axi_w_valid = ((io_input_w_valid && pendingError) && allowData);
  assign io_writeOutputs_0_w_valid = ((io_input_w_valid && pendingSels[1]) && allowData);
  assign io_writeOutputs_0_w_payload_data = io_input_w_payload_data;
  assign io_writeOutputs_0_w_payload_strb = io_input_w_payload_strb;
  assign io_writeOutputs_0_w_payload_last = io_input_w_payload_last;
  assign _zz_io_sharedOutputs_0_w_valid = pendingSels[3 : 2];
  assign io_sharedOutputs_0_w_valid = ((io_input_w_valid && _zz_io_sharedOutputs_0_w_valid[0]) && allowData);
  assign io_sharedOutputs_0_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_0_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_0_w_payload_last = io_input_w_payload_last;
  assign io_sharedOutputs_1_w_valid = ((io_input_w_valid && _zz_io_sharedOutputs_0_w_valid[1]) && allowData);
  assign io_sharedOutputs_1_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_1_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_1_w_payload_last = io_input_w_payload_last;
  assign _zz_writeRspIndex = {pendingSels[3 : 2],pendingSels[1 : 1]};
  assign _zz_writeRspIndex_1 = _zz_writeRspIndex[1];
  assign _zz_writeRspIndex_2 = _zz_writeRspIndex[2];
  assign writeRspIndex = {_zz_writeRspIndex_2,_zz_writeRspIndex_1};
  assign io_input_b_valid = ((|{io_sharedOutputs_1_b_valid,{io_sharedOutputs_0_b_valid,io_writeOutputs_0_b_valid}}) || errorSlave_io_axi_b_valid);
  always @(*) begin
    io_input_b_payload_resp = _zz_io_input_b_payload_resp;
    if(pendingError) begin
      io_input_b_payload_resp = errorSlave_io_axi_b_payload_resp;
    end
  end

  assign io_writeOutputs_0_b_ready = io_input_b_ready;
  assign io_sharedOutputs_0_b_ready = io_input_b_ready;
  assign io_sharedOutputs_1_b_ready = io_input_b_ready;
  assign _zz_readRspIndex = {pendingSels[3 : 2],pendingSels[0 : 0]};
  assign _zz_readRspIndex_1 = _zz_readRspIndex[1];
  assign _zz_readRspIndex_2 = _zz_readRspIndex[2];
  assign readRspIndex = {_zz_readRspIndex_2,_zz_readRspIndex_1};
  assign io_input_r_valid = ((|{io_sharedOutputs_1_r_valid,{io_sharedOutputs_0_r_valid,io_readOutputs_0_r_valid}}) || errorSlave_io_axi_r_valid);
  assign io_input_r_payload_data = _zz_io_input_r_payload_data;
  always @(*) begin
    io_input_r_payload_resp = _zz_io_input_r_payload_resp;
    if(pendingError) begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_input_r_payload_last = _zz_io_input_r_payload_last;
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_readOutputs_0_r_ready = io_input_r_ready;
  assign io_sharedOutputs_0_r_ready = io_input_r_ready;
  assign io_sharedOutputs_1_r_ready = io_input_r_ready;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      pendingCmdCounter <= 3'b000;
      pendingDataCounter_value <= 3'b000;
      pendingSels <= 4'b0000;
      pendingError <= 1'b0;
      _zz_cmdAllowedStart <= 1'b1;
    end else begin
      pendingCmdCounter <= _zz_pendingCmdCounter;
      pendingDataCounter_value <= pendingDataCounter_valueNext;
      if(cmdAllowedStart) begin
        pendingSels <= decodedCmdSels;
      end
      if(cmdAllowedStart) begin
        pendingError <= decodedCmdError;
      end
      if(cmdAllowedStart) begin
        _zz_cmdAllowedStart <= 1'b0;
      end
      if(io_input_arw_ready) begin
        _zz_cmdAllowedStart <= 1'b1;
      end
    end
  end


endmodule

module Axi4ReadOnlyDecoder (
  input  wire          io_input_ar_valid,
  output wire          io_input_ar_ready,
  input  wire [31:0]   io_input_ar_payload_addr,
  input  wire [7:0]    io_input_ar_payload_len,
  input  wire [1:0]    io_input_ar_payload_burst,
  input  wire [3:0]    io_input_ar_payload_cache,
  input  wire [2:0]    io_input_ar_payload_prot,
  output reg           io_input_r_valid,
  input  wire          io_input_r_ready,
  output wire [31:0]   io_input_r_payload_data,
  output reg  [1:0]    io_input_r_payload_resp,
  output reg           io_input_r_payload_last,
  output wire          io_outputs_0_ar_valid,
  input  wire          io_outputs_0_ar_ready,
  output wire [31:0]   io_outputs_0_ar_payload_addr,
  output wire [7:0]    io_outputs_0_ar_payload_len,
  output wire [1:0]    io_outputs_0_ar_payload_burst,
  output wire [3:0]    io_outputs_0_ar_payload_cache,
  output wire [2:0]    io_outputs_0_ar_payload_prot,
  input  wire          io_outputs_0_r_valid,
  output wire          io_outputs_0_r_ready,
  input  wire [31:0]   io_outputs_0_r_payload_data,
  input  wire [1:0]    io_outputs_0_r_payload_resp,
  input  wire          io_outputs_0_r_payload_last,
  output wire          io_outputs_1_ar_valid,
  input  wire          io_outputs_1_ar_ready,
  output wire [31:0]   io_outputs_1_ar_payload_addr,
  output wire [7:0]    io_outputs_1_ar_payload_len,
  output wire [1:0]    io_outputs_1_ar_payload_burst,
  output wire [3:0]    io_outputs_1_ar_payload_cache,
  output wire [2:0]    io_outputs_1_ar_payload_prot,
  input  wire          io_outputs_1_r_valid,
  output wire          io_outputs_1_r_ready,
  input  wire [31:0]   io_outputs_1_r_payload_data,
  input  wire [1:0]    io_outputs_1_r_payload_resp,
  input  wire          io_outputs_1_r_payload_last,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  wire                errorSlave_io_axi_ar_valid;
  wire                errorSlave_io_axi_ar_ready;
  wire                errorSlave_io_axi_r_valid;
  wire       [31:0]   errorSlave_io_axi_r_payload_data;
  wire       [1:0]    errorSlave_io_axi_r_payload_resp;
  wire                errorSlave_io_axi_r_payload_last;
  wire                io_input_ar_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l735;
  reg                 pendingCmdCounter_incrementIt;
  reg                 pendingCmdCounter_decrementIt;
  wire       [2:0]    pendingCmdCounter_valueNext;
  reg        [2:0]    pendingCmdCounter_value;
  wire                pendingCmdCounter_mayOverflow;
  wire                pendingCmdCounter_mayUnderflow;
  wire                pendingCmdCounter_willOverflowIfInc;
  wire                pendingCmdCounter_willOverflow;
  wire                pendingCmdCounter_willUnderflowIfDec;
  wire                pendingCmdCounter_willUnderflow;
  reg        [2:0]    pendingCmdCounter_finalIncrement;
  wire                when_Utils_l767;
  wire                when_Utils_l769;
  wire       [1:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [1:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;
  wire                _zz_io_input_r_payload_data;
  wire                _zz_readRspIndex;
  wire       [0:0]    readRspIndex;

  Axi4ReadOnlyErrorSlave errorSlave (
    .io_axi_ar_valid         (errorSlave_io_axi_ar_valid            ), //i
    .io_axi_ar_ready         (errorSlave_io_axi_ar_ready            ), //o
    .io_axi_ar_payload_addr  (io_input_ar_payload_addr[31:0]        ), //i
    .io_axi_ar_payload_len   (io_input_ar_payload_len[7:0]          ), //i
    .io_axi_ar_payload_burst (io_input_ar_payload_burst[1:0]        ), //i
    .io_axi_ar_payload_cache (io_input_ar_payload_cache[3:0]        ), //i
    .io_axi_ar_payload_prot  (io_input_ar_payload_prot[2:0]         ), //i
    .io_axi_r_valid          (errorSlave_io_axi_r_valid             ), //o
    .io_axi_r_ready          (io_input_r_ready                      ), //i
    .io_axi_r_payload_data   (errorSlave_io_axi_r_payload_data[31:0]), //o
    .io_axi_r_payload_resp   (errorSlave_io_axi_r_payload_resp[1:0] ), //o
    .io_axi_r_payload_last   (errorSlave_io_axi_r_payload_last      ), //o
    .aclk                    (aclk                                  ), //i
    .resetCtrl_mainClkReset  (resetCtrl_mainClkReset                )  //i
  );
  assign io_input_ar_fire = (io_input_ar_valid && io_input_ar_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l735 = (io_input_r_fire && io_input_r_payload_last);
  always @(*) begin
    pendingCmdCounter_incrementIt = 1'b0;
    if(io_input_ar_fire) begin
      pendingCmdCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingCmdCounter_decrementIt = 1'b0;
    if(when_Utils_l735) begin
      pendingCmdCounter_decrementIt = 1'b1;
    end
  end

  assign pendingCmdCounter_mayOverflow = (pendingCmdCounter_value == 3'b111);
  assign pendingCmdCounter_mayUnderflow = (pendingCmdCounter_value == 3'b000);
  assign pendingCmdCounter_willOverflowIfInc = (pendingCmdCounter_mayOverflow && (! pendingCmdCounter_decrementIt));
  assign pendingCmdCounter_willOverflow = (pendingCmdCounter_willOverflowIfInc && pendingCmdCounter_incrementIt);
  assign pendingCmdCounter_willUnderflowIfDec = (pendingCmdCounter_mayUnderflow && (! pendingCmdCounter_incrementIt));
  assign pendingCmdCounter_willUnderflow = (pendingCmdCounter_willUnderflowIfDec && pendingCmdCounter_decrementIt);
  assign when_Utils_l767 = (pendingCmdCounter_incrementIt && (! pendingCmdCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l767) begin
      pendingCmdCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l769) begin
        pendingCmdCounter_finalIncrement = 3'b111;
      end else begin
        pendingCmdCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l769 = ((! pendingCmdCounter_incrementIt) && pendingCmdCounter_decrementIt);
  assign pendingCmdCounter_valueNext = (pendingCmdCounter_value + pendingCmdCounter_finalIncrement);
  assign decodedCmdSels = {(((io_input_ar_payload_addr & (~ 32'h3fffffff)) == 32'h80000000) && io_input_ar_valid),(((io_input_ar_payload_addr & (~ 32'h0003ffff)) == 32'h0) && io_input_ar_valid)};
  assign decodedCmdError = (decodedCmdSels == 2'b00);
  assign allowCmd = ((pendingCmdCounter_value == 3'b000) || ((pendingCmdCounter_value != 3'b111) && (pendingSels == decodedCmdSels)));
  assign io_input_ar_ready = (((|(decodedCmdSels & {io_outputs_1_ar_ready,io_outputs_0_ar_ready})) || (decodedCmdError && errorSlave_io_axi_ar_ready)) && allowCmd);
  assign errorSlave_io_axi_ar_valid = ((io_input_ar_valid && decodedCmdError) && allowCmd);
  assign io_outputs_0_ar_valid = ((io_input_ar_valid && decodedCmdSels[0]) && allowCmd);
  assign io_outputs_0_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_0_ar_payload_len = io_input_ar_payload_len;
  assign io_outputs_0_ar_payload_burst = io_input_ar_payload_burst;
  assign io_outputs_0_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_0_ar_payload_prot = io_input_ar_payload_prot;
  assign io_outputs_1_ar_valid = ((io_input_ar_valid && decodedCmdSels[1]) && allowCmd);
  assign io_outputs_1_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_1_ar_payload_len = io_input_ar_payload_len;
  assign io_outputs_1_ar_payload_burst = io_input_ar_payload_burst;
  assign io_outputs_1_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_1_ar_payload_prot = io_input_ar_payload_prot;
  assign _zz_io_input_r_payload_data = pendingSels[0];
  assign _zz_readRspIndex = pendingSels[1];
  assign readRspIndex = _zz_readRspIndex;
  always @(*) begin
    io_input_r_valid = (|{io_outputs_1_r_valid,io_outputs_0_r_valid});
    if(errorSlave_io_axi_r_valid) begin
      io_input_r_valid = 1'b1;
    end
  end

  assign io_input_r_payload_data = (_zz_io_input_r_payload_data ? io_outputs_0_r_payload_data : io_outputs_1_r_payload_data);
  always @(*) begin
    io_input_r_payload_resp = (_zz_io_input_r_payload_data ? io_outputs_0_r_payload_resp : io_outputs_1_r_payload_resp);
    if(pendingError) begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_input_r_payload_last = (_zz_io_input_r_payload_data ? io_outputs_0_r_payload_last : io_outputs_1_r_payload_last);
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_outputs_0_r_ready = io_input_r_ready;
  assign io_outputs_1_r_ready = io_input_r_ready;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      pendingCmdCounter_value <= 3'b000;
      pendingSels <= 2'b00;
      pendingError <= 1'b0;
    end else begin
      pendingCmdCounter_value <= pendingCmdCounter_valueNext;
      if(io_input_ar_ready) begin
        pendingSels <= decodedCmdSels;
      end
      if(io_input_ar_ready) begin
        pendingError <= decodedCmdError;
      end
    end
  end


endmodule

module Apb3Router (
  input  wire [23:0]   io_input_PADDR,
  input  wire [3:0]    io_input_PSEL,
  input  wire          io_input_PENABLE,
  output wire          io_input_PREADY,
  input  wire          io_input_PWRITE,
  input  wire [31:0]   io_input_PWDATA,
  output wire [31:0]   io_input_PRDATA,
  output wire          io_input_PSLVERROR,
  output wire [23:0]   io_outputs_0_PADDR,
  output wire [0:0]    io_outputs_0_PSEL,
  output wire          io_outputs_0_PENABLE,
  input  wire          io_outputs_0_PREADY,
  output wire          io_outputs_0_PWRITE,
  output wire [31:0]   io_outputs_0_PWDATA,
  input  wire [31:0]   io_outputs_0_PRDATA,
  input  wire          io_outputs_0_PSLVERROR,
  output wire [23:0]   io_outputs_1_PADDR,
  output wire [0:0]    io_outputs_1_PSEL,
  output wire          io_outputs_1_PENABLE,
  input  wire          io_outputs_1_PREADY,
  output wire          io_outputs_1_PWRITE,
  output wire [31:0]   io_outputs_1_PWDATA,
  input  wire [31:0]   io_outputs_1_PRDATA,
  input  wire          io_outputs_1_PSLVERROR,
  output wire [23:0]   io_outputs_2_PADDR,
  output wire [0:0]    io_outputs_2_PSEL,
  output wire          io_outputs_2_PENABLE,
  input  wire          io_outputs_2_PREADY,
  output wire          io_outputs_2_PWRITE,
  output wire [31:0]   io_outputs_2_PWDATA,
  input  wire [31:0]   io_outputs_2_PRDATA,
  input  wire          io_outputs_2_PSLVERROR,
  output wire [23:0]   io_outputs_3_PADDR,
  output wire [0:0]    io_outputs_3_PSEL,
  output wire          io_outputs_3_PENABLE,
  input  wire          io_outputs_3_PREADY,
  output wire          io_outputs_3_PWRITE,
  output wire [31:0]   io_outputs_3_PWDATA,
  input  wire [31:0]   io_outputs_3_PRDATA,
  input  wire          io_outputs_3_PSLVERROR,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  reg                 _zz_io_input_PREADY;
  reg        [31:0]   _zz_io_input_PRDATA;
  reg                 _zz_io_input_PSLVERROR;
  wire                _zz_selIndex;
  wire                _zz_selIndex_1;
  wire                _zz_selIndex_2;
  reg        [1:0]    selIndex;

  always @(*) begin
    case(selIndex)
      2'b00 : begin
        _zz_io_input_PREADY = io_outputs_0_PREADY;
        _zz_io_input_PRDATA = io_outputs_0_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_0_PSLVERROR;
      end
      2'b01 : begin
        _zz_io_input_PREADY = io_outputs_1_PREADY;
        _zz_io_input_PRDATA = io_outputs_1_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_1_PSLVERROR;
      end
      2'b10 : begin
        _zz_io_input_PREADY = io_outputs_2_PREADY;
        _zz_io_input_PRDATA = io_outputs_2_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_2_PSLVERROR;
      end
      default : begin
        _zz_io_input_PREADY = io_outputs_3_PREADY;
        _zz_io_input_PRDATA = io_outputs_3_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_3_PSLVERROR;
      end
    endcase
  end

  assign io_outputs_0_PADDR = io_input_PADDR;
  assign io_outputs_0_PENABLE = io_input_PENABLE;
  assign io_outputs_0_PSEL[0] = io_input_PSEL[0];
  assign io_outputs_0_PWRITE = io_input_PWRITE;
  assign io_outputs_0_PWDATA = io_input_PWDATA;
  assign io_outputs_1_PADDR = io_input_PADDR;
  assign io_outputs_1_PENABLE = io_input_PENABLE;
  assign io_outputs_1_PSEL[0] = io_input_PSEL[1];
  assign io_outputs_1_PWRITE = io_input_PWRITE;
  assign io_outputs_1_PWDATA = io_input_PWDATA;
  assign io_outputs_2_PADDR = io_input_PADDR;
  assign io_outputs_2_PENABLE = io_input_PENABLE;
  assign io_outputs_2_PSEL[0] = io_input_PSEL[2];
  assign io_outputs_2_PWRITE = io_input_PWRITE;
  assign io_outputs_2_PWDATA = io_input_PWDATA;
  assign io_outputs_3_PADDR = io_input_PADDR;
  assign io_outputs_3_PENABLE = io_input_PENABLE;
  assign io_outputs_3_PSEL[0] = io_input_PSEL[3];
  assign io_outputs_3_PWRITE = io_input_PWRITE;
  assign io_outputs_3_PWDATA = io_input_PWDATA;
  assign _zz_selIndex = io_input_PSEL[3];
  assign _zz_selIndex_1 = (io_input_PSEL[1] || _zz_selIndex);
  assign _zz_selIndex_2 = (io_input_PSEL[2] || _zz_selIndex);
  assign io_input_PREADY = _zz_io_input_PREADY;
  assign io_input_PRDATA = _zz_io_input_PRDATA;
  assign io_input_PSLVERROR = _zz_io_input_PSLVERROR;
  always @(posedge aclk) begin
    selIndex <= {_zz_selIndex_2,_zz_selIndex_1};
  end


endmodule

module Apb3Decoder (
  input  wire [23:0]   io_input_PADDR,
  input  wire [0:0]    io_input_PSEL,
  input  wire          io_input_PENABLE,
  output reg           io_input_PREADY,
  input  wire          io_input_PWRITE,
  input  wire [31:0]   io_input_PWDATA,
  output wire [31:0]   io_input_PRDATA,
  output reg           io_input_PSLVERROR,
  output wire [23:0]   io_output_PADDR,
  output reg  [3:0]    io_output_PSEL,
  output wire          io_output_PENABLE,
  input  wire          io_output_PREADY,
  output wire          io_output_PWRITE,
  output wire [31:0]   io_output_PWDATA,
  input  wire [31:0]   io_output_PRDATA,
  input  wire          io_output_PSLVERROR
);

  wire                when_Apb3Decoder_l88;

  assign io_output_PADDR = io_input_PADDR;
  assign io_output_PENABLE = io_input_PENABLE;
  assign io_output_PWRITE = io_input_PWRITE;
  assign io_output_PWDATA = io_input_PWDATA;
  always @(*) begin
    io_output_PSEL[0] = (((io_input_PADDR & (~ 24'h000fff)) == 24'h0) && io_input_PSEL[0]);
    io_output_PSEL[1] = (((io_input_PADDR & (~ 24'h000fff)) == 24'h001000) && io_input_PSEL[0]);
    io_output_PSEL[2] = (((io_input_PADDR & (~ 24'h00ffff)) == 24'h020000) && io_input_PSEL[0]);
    io_output_PSEL[3] = (((io_input_PADDR & (~ 24'h3fffff)) == 24'h400000) && io_input_PSEL[0]);
  end

  always @(*) begin
    io_input_PREADY = io_output_PREADY;
    if(when_Apb3Decoder_l88) begin
      io_input_PREADY = 1'b1;
    end
  end

  assign io_input_PRDATA = io_output_PRDATA;
  always @(*) begin
    io_input_PSLVERROR = io_output_PSLVERROR;
    if(when_Apb3Decoder_l88) begin
      io_input_PSLVERROR = 1'b1;
    end
  end

  assign when_Apb3Decoder_l88 = (io_input_PSEL[0] && (io_output_PSEL == 4'b0000));

endmodule

module Axi4SharedToApb3Bridge (
  input  wire          io_axi_arw_valid,
  output reg           io_axi_arw_ready,
  input  wire [23:0]   io_axi_arw_payload_addr,
  input  wire [3:0]    io_axi_arw_payload_id,
  input  wire [7:0]    io_axi_arw_payload_len,
  input  wire [2:0]    io_axi_arw_payload_size,
  input  wire [1:0]    io_axi_arw_payload_burst,
  input  wire          io_axi_arw_payload_write,
  input  wire          io_axi_w_valid,
  output reg           io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output reg           io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire [3:0]    io_axi_b_payload_id,
  output wire [1:0]    io_axi_b_payload_resp,
  output reg           io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire [3:0]    io_axi_r_payload_id,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  output wire [23:0]   io_apb_PADDR,
  output reg  [0:0]    io_apb_PSEL,
  output reg           io_apb_PENABLE,
  input  wire          io_apb_PREADY,
  output wire          io_apb_PWRITE,
  output wire [31:0]   io_apb_PWDATA,
  input  wire [31:0]   io_apb_PRDATA,
  input  wire          io_apb_PSLVERROR,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);
  localparam Axi4ToApb3BridgePhase_SETUP = 2'd0;
  localparam Axi4ToApb3BridgePhase_ACCESS_1 = 2'd1;
  localparam Axi4ToApb3BridgePhase_RESPONSE = 2'd2;

  reg        [1:0]    phase;
  reg                 write;
  reg        [31:0]   readedData;
  reg        [3:0]    id;
  wire                when_Axi4SharedToApb3Bridge_l91;
  wire                when_Axi4SharedToApb3Bridge_l97;
  `ifndef SYNTHESIS
  reg [63:0] phase_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : phase_string = "SETUP   ";
      Axi4ToApb3BridgePhase_ACCESS_1 : phase_string = "ACCESS_1";
      Axi4ToApb3BridgePhase_RESPONSE : phase_string = "RESPONSE";
      default : phase_string = "????????";
    endcase
  end
  `endif

  always @(*) begin
    io_axi_arw_ready = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        if(when_Axi4SharedToApb3Bridge_l91) begin
          if(when_Axi4SharedToApb3Bridge_l97) begin
            io_axi_arw_ready = 1'b1;
          end
        end
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        if(io_apb_PREADY) begin
          io_axi_arw_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi_w_ready = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        if(when_Axi4SharedToApb3Bridge_l91) begin
          if(when_Axi4SharedToApb3Bridge_l97) begin
            io_axi_w_ready = 1'b1;
          end
        end
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        if(io_apb_PREADY) begin
          io_axi_w_ready = write;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi_b_valid = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
      end
      default : begin
        if(write) begin
          io_axi_b_valid = 1'b1;
        end
      end
    endcase
  end

  always @(*) begin
    io_axi_r_valid = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
      end
      default : begin
        if(!write) begin
          io_axi_r_valid = 1'b1;
        end
      end
    endcase
  end

  always @(*) begin
    io_apb_PSEL[0] = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        if(when_Axi4SharedToApb3Bridge_l91) begin
          io_apb_PSEL[0] = 1'b1;
          if(when_Axi4SharedToApb3Bridge_l97) begin
            io_apb_PSEL[0] = 1'b0;
          end
        end
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        io_apb_PSEL[0] = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_apb_PENABLE = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        io_apb_PENABLE = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign when_Axi4SharedToApb3Bridge_l91 = (io_axi_arw_valid && ((! io_axi_arw_payload_write) || io_axi_w_valid));
  assign when_Axi4SharedToApb3Bridge_l97 = (io_axi_arw_payload_write && (io_axi_w_payload_strb == 4'b0000));
  assign io_apb_PADDR = io_axi_arw_payload_addr;
  assign io_apb_PWDATA = io_axi_w_payload_data;
  assign io_apb_PWRITE = io_axi_arw_payload_write;
  assign io_axi_r_payload_resp = {io_apb_PSLVERROR,1'b0};
  assign io_axi_b_payload_resp = {io_apb_PSLVERROR,1'b0};
  assign io_axi_r_payload_id = id;
  assign io_axi_b_payload_id = id;
  assign io_axi_r_payload_data = readedData;
  assign io_axi_r_payload_last = 1'b1;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      phase <= Axi4ToApb3BridgePhase_SETUP;
    end else begin
      case(phase)
        Axi4ToApb3BridgePhase_SETUP : begin
          if(when_Axi4SharedToApb3Bridge_l91) begin
            phase <= Axi4ToApb3BridgePhase_ACCESS_1;
            if(when_Axi4SharedToApb3Bridge_l97) begin
              phase <= Axi4ToApb3BridgePhase_RESPONSE;
            end
          end
        end
        Axi4ToApb3BridgePhase_ACCESS_1 : begin
          if(io_apb_PREADY) begin
            phase <= Axi4ToApb3BridgePhase_RESPONSE;
          end
        end
        default : begin
          if(write) begin
            if(io_axi_b_ready) begin
              phase <= Axi4ToApb3BridgePhase_SETUP;
            end
          end else begin
            if(io_axi_r_ready) begin
              phase <= Axi4ToApb3BridgePhase_SETUP;
            end
          end
        end
      endcase
    end
  end

  always @(posedge aclk) begin
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        write <= io_axi_arw_payload_write;
        id <= io_axi_arw_payload_id;
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        if(io_apb_PREADY) begin
          readedData <= io_apb_PRDATA;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module SystemDebugger (
  input  wire          io_remote_cmd_valid,
  output wire          io_remote_cmd_ready,
  input  wire          io_remote_cmd_payload_last,
  input  wire [0:0]    io_remote_cmd_payload_fragment,
  output wire          io_remote_rsp_valid,
  input  wire          io_remote_rsp_ready,
  output wire          io_remote_rsp_payload_error,
  output wire [31:0]   io_remote_rsp_payload_data,
  output wire          io_mem_cmd_valid,
  input  wire          io_mem_cmd_ready,
  output wire [31:0]   io_mem_cmd_payload_address,
  output wire [31:0]   io_mem_cmd_payload_data,
  output wire          io_mem_cmd_payload_wr,
  output wire [1:0]    io_mem_cmd_payload_size,
  input  wire          io_mem_rsp_valid,
  input  wire [31:0]   io_mem_rsp_payload,
  input  wire          aclk,
  input  wire          resetCtrl_debugReset
);

  reg        [66:0]   dispatcher_dataShifter;
  reg                 dispatcher_dataLoaded;
  reg        [7:0]    dispatcher_headerShifter;
  wire       [7:0]    dispatcher_header;
  reg                 dispatcher_headerLoaded;
  reg        [2:0]    dispatcher_counter;
  wire                when_Fragment_l358;
  wire                when_Fragment_l361;
  wire       [66:0]   _zz_io_mem_cmd_payload_address;
  wire                io_mem_cmd_isStall;
  wire                when_Fragment_l384;

  assign dispatcher_header = dispatcher_headerShifter[7 : 0];
  assign when_Fragment_l358 = (dispatcher_headerLoaded == 1'b0);
  assign when_Fragment_l361 = (dispatcher_counter == 3'b111);
  assign io_remote_cmd_ready = (! dispatcher_dataLoaded);
  assign _zz_io_mem_cmd_payload_address = dispatcher_dataShifter[66 : 0];
  assign io_mem_cmd_payload_address = _zz_io_mem_cmd_payload_address[31 : 0];
  assign io_mem_cmd_payload_data = _zz_io_mem_cmd_payload_address[63 : 32];
  assign io_mem_cmd_payload_wr = _zz_io_mem_cmd_payload_address[64];
  assign io_mem_cmd_payload_size = _zz_io_mem_cmd_payload_address[66 : 65];
  assign io_mem_cmd_valid = (dispatcher_dataLoaded && (dispatcher_header == 8'h0));
  assign io_mem_cmd_isStall = (io_mem_cmd_valid && (! io_mem_cmd_ready));
  assign when_Fragment_l384 = ((dispatcher_headerLoaded && dispatcher_dataLoaded) && (! io_mem_cmd_isStall));
  assign io_remote_rsp_valid = io_mem_rsp_valid;
  assign io_remote_rsp_payload_error = 1'b0;
  assign io_remote_rsp_payload_data = io_mem_rsp_payload;
  always @(posedge aclk or posedge resetCtrl_debugReset) begin
    if(resetCtrl_debugReset) begin
      dispatcher_dataLoaded <= 1'b0;
      dispatcher_headerLoaded <= 1'b0;
      dispatcher_counter <= 3'b000;
    end else begin
      if(io_remote_cmd_valid) begin
        if(when_Fragment_l358) begin
          dispatcher_counter <= (dispatcher_counter + 3'b001);
          if(when_Fragment_l361) begin
            dispatcher_headerLoaded <= 1'b1;
          end
        end
        if(io_remote_cmd_payload_last) begin
          dispatcher_headerLoaded <= 1'b1;
          dispatcher_dataLoaded <= 1'b1;
          dispatcher_counter <= 3'b000;
        end
      end
      if(when_Fragment_l384) begin
        dispatcher_headerLoaded <= 1'b0;
        dispatcher_dataLoaded <= 1'b0;
      end
    end
  end

  always @(posedge aclk) begin
    if(io_remote_cmd_valid) begin
      if(when_Fragment_l358) begin
        dispatcher_headerShifter <= ({io_remote_cmd_payload_fragment,dispatcher_headerShifter} >>> 1'd1);
      end else begin
        dispatcher_dataShifter <= ({io_remote_cmd_payload_fragment,dispatcher_dataShifter} >>> 1'd1);
      end
    end
  end


endmodule

module JtagBridge (
  input  wire          io_jtag_tms,
  input  wire          io_jtag_tdi,
  output wire          io_jtag_tdo,
  input  wire          io_jtag_tck,
  output wire          io_remote_cmd_valid,
  input  wire          io_remote_cmd_ready,
  output wire          io_remote_cmd_payload_last,
  output wire [0:0]    io_remote_cmd_payload_fragment,
  input  wire          io_remote_rsp_valid,
  output wire          io_remote_rsp_ready,
  input  wire          io_remote_rsp_payload_error,
  input  wire [31:0]   io_remote_rsp_payload_data,
  input  wire          aclk,
  input  wire          resetCtrl_debugReset
);
  localparam JtagState_RESET = 4'd0;
  localparam JtagState_IDLE = 4'd1;
  localparam JtagState_IR_SELECT = 4'd2;
  localparam JtagState_IR_CAPTURE = 4'd3;
  localparam JtagState_IR_SHIFT = 4'd4;
  localparam JtagState_IR_EXIT1 = 4'd5;
  localparam JtagState_IR_PAUSE = 4'd6;
  localparam JtagState_IR_EXIT2 = 4'd7;
  localparam JtagState_IR_UPDATE = 4'd8;
  localparam JtagState_DR_SELECT = 4'd9;
  localparam JtagState_DR_CAPTURE = 4'd10;
  localparam JtagState_DR_SHIFT = 4'd11;
  localparam JtagState_DR_EXIT1 = 4'd12;
  localparam JtagState_DR_PAUSE = 4'd13;
  localparam JtagState_DR_EXIT2 = 4'd14;
  localparam JtagState_DR_UPDATE = 4'd15;

  wire                flowCCUnsafeByToggle_1_io_output_valid;
  wire                flowCCUnsafeByToggle_1_io_output_payload_last;
  wire       [0:0]    flowCCUnsafeByToggle_1_io_output_payload_fragment;
  wire       [3:0]    _zz_jtag_tap_isBypass;
  wire       [1:0]    _zz_jtag_tap_instructionShift;
  wire                system_cmd_valid;
  wire                system_cmd_payload_last;
  wire       [0:0]    system_cmd_payload_fragment;
  wire                system_cmd_toStream_valid;
  wire                system_cmd_toStream_ready;
  wire                system_cmd_toStream_payload_last;
  wire       [0:0]    system_cmd_toStream_payload_fragment;
  (* async_reg = "true" *) reg                 system_rsp_valid;
  (* async_reg = "true" *) reg                 system_rsp_payload_error;
  (* async_reg = "true" *) reg        [31:0]   system_rsp_payload_data;
  wire                io_remote_rsp_fire;
  reg        [3:0]    jtag_tap_fsm_stateNext;
  reg        [3:0]    jtag_tap_fsm_state;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_1;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_2;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_3;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_4;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_5;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_6;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_7;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_8;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_9;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_10;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_11;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_12;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_13;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_14;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_15;
  reg        [3:0]    jtag_tap_instruction;
  reg        [3:0]    jtag_tap_instructionShift;
  reg                 jtag_tap_bypass;
  reg                 jtag_tap_tdoUnbufferd;
  reg                 jtag_tap_tdoDr;
  wire                jtag_tap_tdoIr;
  wire                jtag_tap_isBypass;
  reg                 jtag_tap_tdoUnbufferd_regNext;
  wire                jtag_idcodeArea_ctrl_tdi;
  wire                jtag_idcodeArea_ctrl_enable;
  wire                jtag_idcodeArea_ctrl_capture;
  wire                jtag_idcodeArea_ctrl_shift;
  wire                jtag_idcodeArea_ctrl_update;
  wire                jtag_idcodeArea_ctrl_reset;
  wire                jtag_idcodeArea_ctrl_tdo;
  reg        [31:0]   jtag_idcodeArea_shifter;
  wire                when_JtagTap_l121;
  wire                jtag_writeArea_ctrl_tdi;
  wire                jtag_writeArea_ctrl_enable;
  wire                jtag_writeArea_ctrl_capture;
  wire                jtag_writeArea_ctrl_shift;
  wire                jtag_writeArea_ctrl_update;
  wire                jtag_writeArea_ctrl_reset;
  wire                jtag_writeArea_ctrl_tdo;
  wire                jtag_writeArea_source_valid;
  wire                jtag_writeArea_source_payload_last;
  wire       [0:0]    jtag_writeArea_source_payload_fragment;
  reg                 jtag_writeArea_valid;
  reg                 jtag_writeArea_data;
  wire                jtag_readArea_ctrl_tdi;
  wire                jtag_readArea_ctrl_enable;
  wire                jtag_readArea_ctrl_capture;
  wire                jtag_readArea_ctrl_shift;
  wire                jtag_readArea_ctrl_update;
  wire                jtag_readArea_ctrl_reset;
  wire                jtag_readArea_ctrl_tdo;
  reg        [33:0]   jtag_readArea_full_shifter;
  `ifndef SYNTHESIS
  reg [79:0] jtag_tap_fsm_stateNext_string;
  reg [79:0] jtag_tap_fsm_state_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_1_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_2_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_3_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_4_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_5_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_6_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_7_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_8_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_9_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_10_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_11_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_12_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_13_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_14_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_15_string;
  `endif


  assign _zz_jtag_tap_isBypass = jtag_tap_instruction;
  assign _zz_jtag_tap_instructionShift = 2'b01;
  FlowCCUnsafeByToggle flowCCUnsafeByToggle_1 (
    .io_input_valid             (jtag_writeArea_source_valid                      ), //i
    .io_input_payload_last      (jtag_writeArea_source_payload_last               ), //i
    .io_input_payload_fragment  (jtag_writeArea_source_payload_fragment           ), //i
    .io_output_valid            (flowCCUnsafeByToggle_1_io_output_valid           ), //o
    .io_output_payload_last     (flowCCUnsafeByToggle_1_io_output_payload_last    ), //o
    .io_output_payload_fragment (flowCCUnsafeByToggle_1_io_output_payload_fragment), //o
    .io_jtag_tck                (io_jtag_tck                                      ), //i
    .aclk                       (aclk                                             ), //i
    .resetCtrl_debugReset       (resetCtrl_debugReset                             )  //i
  );
  initial begin
  `ifndef SYNTHESIS
    jtag_tap_fsm_state = {$urandom};
  `endif
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(jtag_tap_fsm_stateNext)
      JtagState_RESET : jtag_tap_fsm_stateNext_string = "RESET     ";
      JtagState_IDLE : jtag_tap_fsm_stateNext_string = "IDLE      ";
      JtagState_IR_SELECT : jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      JtagState_DR_SELECT : jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  always @(*) begin
    case(jtag_tap_fsm_state)
      JtagState_RESET : jtag_tap_fsm_state_string = "RESET     ";
      JtagState_IDLE : jtag_tap_fsm_state_string = "IDLE      ";
      JtagState_IR_SELECT : jtag_tap_fsm_state_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : jtag_tap_fsm_state_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : jtag_tap_fsm_state_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : jtag_tap_fsm_state_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : jtag_tap_fsm_state_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : jtag_tap_fsm_state_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : jtag_tap_fsm_state_string = "IR_UPDATE ";
      JtagState_DR_SELECT : jtag_tap_fsm_state_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : jtag_tap_fsm_state_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : jtag_tap_fsm_state_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : jtag_tap_fsm_state_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : jtag_tap_fsm_state_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : jtag_tap_fsm_state_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : jtag_tap_fsm_state_string = "DR_UPDATE ";
      default : jtag_tap_fsm_state_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_1)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_1_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_1_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_1_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_1_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_1_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_1_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_1_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_1_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_1_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_1_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_1_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_1_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_1_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_1_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_1_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_1_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_1_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_2)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_2_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_2_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_2_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_2_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_2_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_2_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_2_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_2_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_2_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_2_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_2_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_2_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_2_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_2_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_2_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_2_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_2_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_3)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_3_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_3_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_3_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_3_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_3_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_3_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_3_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_3_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_3_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_3_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_3_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_3_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_3_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_3_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_3_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_3_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_3_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_4)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_4_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_4_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_4_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_4_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_4_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_4_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_4_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_4_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_4_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_4_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_4_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_4_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_4_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_4_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_4_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_4_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_4_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_5)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_5_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_5_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_5_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_5_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_5_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_5_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_5_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_5_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_5_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_5_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_5_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_5_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_5_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_5_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_5_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_5_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_5_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_6)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_6_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_6_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_6_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_6_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_6_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_6_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_6_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_6_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_6_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_6_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_6_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_6_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_6_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_6_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_6_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_6_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_6_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_7)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_7_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_7_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_7_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_7_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_7_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_7_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_7_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_7_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_7_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_7_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_7_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_7_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_7_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_7_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_7_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_7_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_7_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_8)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_8_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_8_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_8_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_8_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_8_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_8_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_8_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_8_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_8_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_8_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_8_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_8_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_8_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_8_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_8_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_8_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_8_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_9)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_9_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_9_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_9_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_9_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_9_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_9_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_9_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_9_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_9_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_9_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_9_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_9_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_9_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_9_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_9_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_9_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_9_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_10)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_10_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_10_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_10_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_10_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_10_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_10_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_10_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_10_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_10_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_10_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_10_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_10_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_10_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_10_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_10_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_10_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_10_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_11)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_11_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_11_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_11_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_11_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_11_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_11_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_11_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_11_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_11_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_11_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_11_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_11_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_11_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_11_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_11_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_11_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_11_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_12)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_12_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_12_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_12_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_12_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_12_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_12_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_12_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_12_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_12_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_12_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_12_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_12_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_12_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_12_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_12_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_12_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_12_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_13)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_13_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_13_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_13_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_13_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_13_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_13_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_13_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_13_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_13_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_13_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_13_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_13_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_13_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_13_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_13_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_13_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_13_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_14)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_14_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_14_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_14_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_14_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_14_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_14_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_14_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_14_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_14_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_14_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_14_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_14_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_14_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_14_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_14_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_14_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_14_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_15)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_15_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_15_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_15_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_15_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_15_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_15_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_15_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_15_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_15_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_15_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_15_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_15_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_15_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_15_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_15_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_15_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_15_string = "??????????";
    endcase
  end
  `endif

  assign system_cmd_toStream_valid = system_cmd_valid;
  assign system_cmd_toStream_payload_last = system_cmd_payload_last;
  assign system_cmd_toStream_payload_fragment = system_cmd_payload_fragment;
  assign io_remote_cmd_valid = system_cmd_toStream_valid;
  assign system_cmd_toStream_ready = io_remote_cmd_ready;
  assign io_remote_cmd_payload_last = system_cmd_toStream_payload_last;
  assign io_remote_cmd_payload_fragment = system_cmd_toStream_payload_fragment;
  assign io_remote_rsp_fire = (io_remote_rsp_valid && io_remote_rsp_ready);
  assign io_remote_rsp_ready = 1'b1;
  assign _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_RESET : JtagState_IDLE);
  always @(*) begin
    case(jtag_tap_fsm_state)
      JtagState_RESET : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext;
      end
      JtagState_IDLE : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_1;
      end
      JtagState_IR_SELECT : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_2;
      end
      JtagState_IR_CAPTURE : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_3;
      end
      JtagState_IR_SHIFT : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_4;
      end
      JtagState_IR_EXIT1 : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_5;
      end
      JtagState_IR_PAUSE : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_6;
      end
      JtagState_IR_EXIT2 : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_7;
      end
      JtagState_IR_UPDATE : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_8;
      end
      JtagState_DR_SELECT : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_9;
      end
      JtagState_DR_CAPTURE : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_10;
      end
      JtagState_DR_SHIFT : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_11;
      end
      JtagState_DR_EXIT1 : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_12;
      end
      JtagState_DR_PAUSE : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_13;
      end
      JtagState_DR_EXIT2 : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_14;
      end
      JtagState_DR_UPDATE : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_15;
      end
      default : begin
      end
    endcase
  end

  assign _zz_jtag_tap_fsm_stateNext_1 = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
  assign _zz_jtag_tap_fsm_stateNext_2 = (io_jtag_tms ? JtagState_RESET : JtagState_IR_CAPTURE);
  assign _zz_jtag_tap_fsm_stateNext_3 = (io_jtag_tms ? JtagState_IR_EXIT1 : JtagState_IR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_4 = (io_jtag_tms ? JtagState_IR_EXIT1 : JtagState_IR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_5 = (io_jtag_tms ? JtagState_IR_UPDATE : JtagState_IR_PAUSE);
  assign _zz_jtag_tap_fsm_stateNext_6 = (io_jtag_tms ? JtagState_IR_EXIT2 : JtagState_IR_PAUSE);
  assign _zz_jtag_tap_fsm_stateNext_7 = (io_jtag_tms ? JtagState_IR_UPDATE : JtagState_IR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_8 = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
  assign _zz_jtag_tap_fsm_stateNext_9 = (io_jtag_tms ? JtagState_IR_SELECT : JtagState_DR_CAPTURE);
  assign _zz_jtag_tap_fsm_stateNext_10 = (io_jtag_tms ? JtagState_DR_EXIT1 : JtagState_DR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_11 = (io_jtag_tms ? JtagState_DR_EXIT1 : JtagState_DR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_12 = (io_jtag_tms ? JtagState_DR_UPDATE : JtagState_DR_PAUSE);
  assign _zz_jtag_tap_fsm_stateNext_13 = (io_jtag_tms ? JtagState_DR_EXIT2 : JtagState_DR_PAUSE);
  assign _zz_jtag_tap_fsm_stateNext_14 = (io_jtag_tms ? JtagState_DR_UPDATE : JtagState_DR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_15 = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
  always @(*) begin
    jtag_tap_tdoUnbufferd = jtag_tap_bypass;
    case(jtag_tap_fsm_state)
      JtagState_IR_SHIFT : begin
        jtag_tap_tdoUnbufferd = jtag_tap_tdoIr;
      end
      JtagState_DR_SHIFT : begin
        if(jtag_tap_isBypass) begin
          jtag_tap_tdoUnbufferd = jtag_tap_bypass;
        end else begin
          jtag_tap_tdoUnbufferd = jtag_tap_tdoDr;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    jtag_tap_tdoDr = 1'b0;
    if(jtag_idcodeArea_ctrl_enable) begin
      jtag_tap_tdoDr = jtag_idcodeArea_ctrl_tdo;
    end
    if(jtag_writeArea_ctrl_enable) begin
      jtag_tap_tdoDr = jtag_writeArea_ctrl_tdo;
    end
    if(jtag_readArea_ctrl_enable) begin
      jtag_tap_tdoDr = jtag_readArea_ctrl_tdo;
    end
  end

  assign jtag_tap_tdoIr = jtag_tap_instructionShift[0];
  assign jtag_tap_isBypass = ($signed(_zz_jtag_tap_isBypass) == $signed(4'b1111));
  assign io_jtag_tdo = jtag_tap_tdoUnbufferd_regNext;
  assign jtag_idcodeArea_ctrl_tdo = jtag_idcodeArea_shifter[0];
  assign jtag_idcodeArea_ctrl_tdi = io_jtag_tdi;
  assign jtag_idcodeArea_ctrl_enable = (jtag_tap_instruction == 4'b0001);
  assign jtag_idcodeArea_ctrl_capture = (jtag_tap_fsm_state == JtagState_DR_CAPTURE);
  assign jtag_idcodeArea_ctrl_shift = (jtag_tap_fsm_state == JtagState_DR_SHIFT);
  assign jtag_idcodeArea_ctrl_update = (jtag_tap_fsm_state == JtagState_DR_UPDATE);
  assign jtag_idcodeArea_ctrl_reset = (jtag_tap_fsm_state == JtagState_RESET);
  assign when_JtagTap_l121 = (jtag_tap_fsm_state == JtagState_RESET);
  assign jtag_writeArea_source_valid = jtag_writeArea_valid;
  assign jtag_writeArea_source_payload_last = (! (jtag_writeArea_ctrl_enable && jtag_writeArea_ctrl_shift));
  assign jtag_writeArea_source_payload_fragment[0] = jtag_writeArea_data;
  assign system_cmd_valid = flowCCUnsafeByToggle_1_io_output_valid;
  assign system_cmd_payload_last = flowCCUnsafeByToggle_1_io_output_payload_last;
  assign system_cmd_payload_fragment = flowCCUnsafeByToggle_1_io_output_payload_fragment;
  assign jtag_writeArea_ctrl_tdo = 1'b0;
  assign jtag_writeArea_ctrl_tdi = io_jtag_tdi;
  assign jtag_writeArea_ctrl_enable = (jtag_tap_instruction == 4'b0010);
  assign jtag_writeArea_ctrl_capture = (jtag_tap_fsm_state == JtagState_DR_CAPTURE);
  assign jtag_writeArea_ctrl_shift = (jtag_tap_fsm_state == JtagState_DR_SHIFT);
  assign jtag_writeArea_ctrl_update = (jtag_tap_fsm_state == JtagState_DR_UPDATE);
  assign jtag_writeArea_ctrl_reset = (jtag_tap_fsm_state == JtagState_RESET);
  assign jtag_readArea_ctrl_tdo = jtag_readArea_full_shifter[0];
  assign jtag_readArea_ctrl_tdi = io_jtag_tdi;
  assign jtag_readArea_ctrl_enable = (jtag_tap_instruction == 4'b0011);
  assign jtag_readArea_ctrl_capture = (jtag_tap_fsm_state == JtagState_DR_CAPTURE);
  assign jtag_readArea_ctrl_shift = (jtag_tap_fsm_state == JtagState_DR_SHIFT);
  assign jtag_readArea_ctrl_update = (jtag_tap_fsm_state == JtagState_DR_UPDATE);
  assign jtag_readArea_ctrl_reset = (jtag_tap_fsm_state == JtagState_RESET);
  always @(posedge aclk) begin
    if(io_remote_cmd_valid) begin
      system_rsp_valid <= 1'b0;
    end
    if(io_remote_rsp_fire) begin
      system_rsp_valid <= 1'b1;
      system_rsp_payload_error <= io_remote_rsp_payload_error;
      system_rsp_payload_data <= io_remote_rsp_payload_data;
    end
  end

  always @(posedge io_jtag_tck) begin
    jtag_tap_fsm_state <= jtag_tap_fsm_stateNext;
    jtag_tap_bypass <= io_jtag_tdi;
    case(jtag_tap_fsm_state)
      JtagState_IR_CAPTURE : begin
        jtag_tap_instructionShift <= {2'd0, _zz_jtag_tap_instructionShift};
      end
      JtagState_IR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1'd1);
      end
      JtagState_IR_UPDATE : begin
        jtag_tap_instruction <= jtag_tap_instructionShift;
      end
      JtagState_DR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1'd1);
      end
      default : begin
      end
    endcase
    if(jtag_idcodeArea_ctrl_enable) begin
      if(jtag_idcodeArea_ctrl_shift) begin
        jtag_idcodeArea_shifter <= ({jtag_idcodeArea_ctrl_tdi,jtag_idcodeArea_shifter} >>> 1'd1);
      end
    end
    if(jtag_idcodeArea_ctrl_capture) begin
      jtag_idcodeArea_shifter <= 32'h10001fff;
    end
    if(when_JtagTap_l121) begin
      jtag_tap_instruction <= 4'b0001;
    end
    jtag_writeArea_valid <= (jtag_writeArea_ctrl_enable && jtag_writeArea_ctrl_shift);
    jtag_writeArea_data <= jtag_writeArea_ctrl_tdi;
    if(jtag_readArea_ctrl_enable) begin
      if(jtag_readArea_ctrl_capture) begin
        jtag_readArea_full_shifter <= {{system_rsp_payload_data,system_rsp_payload_error},system_rsp_valid};
      end
      if(jtag_readArea_ctrl_shift) begin
        jtag_readArea_full_shifter <= ({jtag_readArea_ctrl_tdi,jtag_readArea_full_shifter} >>> 1'd1);
      end
    end
  end

  always @(negedge io_jtag_tck) begin
    jtag_tap_tdoUnbufferd_regNext <= jtag_tap_tdoUnbufferd;
  end


endmodule

module VexRiscv (
  output wire          dBus_cmd_valid,
  input  wire          dBus_cmd_ready,
  output wire          dBus_cmd_payload_wr,
  output wire          dBus_cmd_payload_uncached,
  output wire [31:0]   dBus_cmd_payload_address,
  output wire [31:0]   dBus_cmd_payload_data,
  output wire [3:0]    dBus_cmd_payload_mask,
  output wire [2:0]    dBus_cmd_payload_size,
  output wire          dBus_cmd_payload_last,
  input  wire          dBus_rsp_valid,
  input  wire          dBus_rsp_payload_last,
  input  wire [31:0]   dBus_rsp_payload_data,
  input  wire          dBus_rsp_payload_error,
  input  wire          timerInterrupt,
  input  wire          externalInterrupt,
  input  wire          softwareInterrupt,
  input  wire          debug_bus_cmd_valid,
  output reg           debug_bus_cmd_ready,
  input  wire          debug_bus_cmd_payload_wr,
  input  wire [7:0]    debug_bus_cmd_payload_address,
  input  wire [31:0]   debug_bus_cmd_payload_data,
  output reg  [31:0]   debug_bus_rsp_data,
  output wire          debug_resetOut,
  output wire          iBus_cmd_valid,
  input  wire          iBus_cmd_ready,
  output reg  [31:0]   iBus_cmd_payload_address,
  output wire [2:0]    iBus_cmd_payload_size,
  input  wire          iBus_rsp_valid,
  input  wire [31:0]   iBus_rsp_payload_data,
  input  wire          iBus_rsp_payload_error,
  input  wire          aclk,
  input  wire          _zz_11,
  input  wire          resetCtrl_debugReset
);
  localparam ShiftCtrlEnum_DISABLE_1 = 2'd0;
  localparam ShiftCtrlEnum_SLL_1 = 2'd1;
  localparam ShiftCtrlEnum_SRL_1 = 2'd2;
  localparam ShiftCtrlEnum_SRA_1 = 2'd3;
  localparam EnvCtrlEnum_NONE = 2'd0;
  localparam EnvCtrlEnum_XRET = 2'd1;
  localparam EnvCtrlEnum_ECALL = 2'd2;
  localparam EnvCtrlEnum_EBREAK = 2'd3;
  localparam BranchCtrlEnum_INC = 2'd0;
  localparam BranchCtrlEnum_B = 2'd1;
  localparam BranchCtrlEnum_JAL = 2'd2;
  localparam BranchCtrlEnum_JALR = 2'd3;
  localparam AluBitwiseCtrlEnum_XOR_1 = 2'd0;
  localparam AluBitwiseCtrlEnum_OR_1 = 2'd1;
  localparam AluBitwiseCtrlEnum_AND_1 = 2'd2;
  localparam Src2CtrlEnum_RS = 2'd0;
  localparam Src2CtrlEnum_IMI = 2'd1;
  localparam Src2CtrlEnum_IMS = 2'd2;
  localparam Src2CtrlEnum_PC = 2'd3;
  localparam AluCtrlEnum_ADD_SUB = 2'd0;
  localparam AluCtrlEnum_SLT_SLTU = 2'd1;
  localparam AluCtrlEnum_BITWISE = 2'd2;
  localparam Src1CtrlEnum_RS = 2'd0;
  localparam Src1CtrlEnum_IMU = 2'd1;
  localparam Src1CtrlEnum_PC_INCREMENT = 2'd2;
  localparam Src1CtrlEnum_URS1 = 2'd3;

  wire                IBusCachedPlugin_cache_io_flush;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_isStuck;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isStuck;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isUser;
  reg                 IBusCachedPlugin_cache_io_cpu_fill_valid;
  wire                dataCache_1_io_cpu_execute_isValid;
  wire       [31:0]   dataCache_1_io_cpu_execute_address;
  wire                dataCache_1_io_cpu_memory_isValid;
  wire       [31:0]   dataCache_1_io_cpu_memory_address;
  reg                 dataCache_1_io_cpu_memory_mmuRsp_isIoAccess;
  reg                 dataCache_1_io_cpu_writeBack_isValid;
  wire                dataCache_1_io_cpu_writeBack_isUser;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_storeData;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_address;
  wire                dataCache_1_io_cpu_flush_valid;
  wire                dataCache_1_io_cpu_flush_payload_singleLine;
  wire       [6:0]    dataCache_1_io_cpu_flush_payload_lineId;
  reg        [31:0]   RegFilePlugin_regFile_spinal_port0;
  reg        [31:0]   RegFilePlugin_regFile_spinal_port1;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire                IBusCachedPlugin_cache_io_cpu_decode_error;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuException;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_data;
  wire                IBusCachedPlugin_cache_io_cpu_decode_cacheMiss;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_physicalAddress;
  wire                IBusCachedPlugin_cache_io_mem_cmd_valid;
  wire       [31:0]   IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  wire       [2:0]    IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  wire                dataCache_1_io_cpu_execute_haltIt;
  wire                dataCache_1_io_cpu_execute_refilling;
  wire                dataCache_1_io_cpu_memory_isWrite;
  wire                dataCache_1_io_cpu_writeBack_haltIt;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_data;
  wire                dataCache_1_io_cpu_writeBack_mmuException;
  wire                dataCache_1_io_cpu_writeBack_unalignedAccess;
  wire                dataCache_1_io_cpu_writeBack_accessError;
  wire                dataCache_1_io_cpu_writeBack_isWrite;
  wire                dataCache_1_io_cpu_writeBack_keepMemRspData;
  wire                dataCache_1_io_cpu_writeBack_exclusiveOk;
  wire                dataCache_1_io_cpu_flush_ready;
  wire                dataCache_1_io_cpu_redo;
  wire                dataCache_1_io_cpu_writesPending;
  wire                dataCache_1_io_mem_cmd_valid;
  wire                dataCache_1_io_mem_cmd_payload_wr;
  wire                dataCache_1_io_mem_cmd_payload_uncached;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_address;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_data;
  wire       [3:0]    dataCache_1_io_mem_cmd_payload_mask;
  wire       [2:0]    dataCache_1_io_mem_cmd_payload_size;
  wire                dataCache_1_io_mem_cmd_payload_last;
  wire       [51:0]   _zz_memory_MUL_LOW;
  wire       [51:0]   _zz_memory_MUL_LOW_1;
  wire       [51:0]   _zz_memory_MUL_LOW_2;
  wire       [32:0]   _zz_memory_MUL_LOW_3;
  wire       [51:0]   _zz_memory_MUL_LOW_4;
  wire       [49:0]   _zz_memory_MUL_LOW_5;
  wire       [51:0]   _zz_memory_MUL_LOW_6;
  wire       [49:0]   _zz_memory_MUL_LOW_7;
  wire       [31:0]   _zz_execute_SHIFT_RIGHT;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_1;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_2;
  wire       [30:0]   _zz_decode_DO_EBREAK;
  wire       [30:0]   _zz_decode_DO_EBREAK_1;
  wire       [30:0]   _zz_decode_DO_EBREAK_2;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_1;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_2;
  wire                _zz_decode_LEGAL_INSTRUCTION_3;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_4;
  wire       [12:0]   _zz_decode_LEGAL_INSTRUCTION_5;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_6;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_7;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_8;
  wire                _zz_decode_LEGAL_INSTRUCTION_9;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_10;
  wire       [6:0]    _zz_decode_LEGAL_INSTRUCTION_11;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_12;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_13;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_14;
  wire                _zz_decode_LEGAL_INSTRUCTION_15;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_16;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_17;
  wire       [3:0]    _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1;
  reg        [31:0]   _zz_IBusCachedPlugin_jump_pcLoad_payload_5;
  wire       [1:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload_6;
  wire       [31:0]   _zz_IBusCachedPlugin_fetchPc_pc;
  wire       [2:0]    _zz_IBusCachedPlugin_fetchPc_pc_1;
  wire       [11:0]   _zz__zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  wire       [31:0]   _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_2;
  wire       [19:0]   _zz__zz_2;
  wire       [11:0]   _zz__zz_4;
  wire       [31:0]   _zz__zz_6;
  wire       [31:0]   _zz__zz_6_1;
  wire       [19:0]   _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload;
  wire       [11:0]   _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_4;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_5;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_6;
  wire       [25:0]   _zz_io_cpu_flush_payload_lineId;
  wire       [25:0]   _zz_io_cpu_flush_payload_lineId_1;
  wire       [2:0]    _zz_DBusCachedPlugin_exceptionBus_payload_code;
  wire       [2:0]    _zz_DBusCachedPlugin_exceptionBus_payload_code_1;
  reg        [7:0]    _zz_writeBack_DBusCachedPlugin_rspShifted;
  wire       [1:0]    _zz_writeBack_DBusCachedPlugin_rspShifted_1;
  reg        [7:0]    _zz_writeBack_DBusCachedPlugin_rspShifted_2;
  wire       [0:0]    _zz_writeBack_DBusCachedPlugin_rspShifted_3;
  wire       [31:0]   _zz__zz_decode_IS_CSR;
  wire                _zz__zz_decode_IS_CSR_1;
  wire       [0:0]    _zz__zz_decode_IS_CSR_2;
  wire       [31:0]   _zz__zz_decode_IS_CSR_3;
  wire       [0:0]    _zz__zz_decode_IS_CSR_4;
  wire       [31:0]   _zz__zz_decode_IS_CSR_5;
  wire       [1:0]    _zz__zz_decode_IS_CSR_6;
  wire       [31:0]   _zz__zz_decode_IS_CSR_7;
  wire       [31:0]   _zz__zz_decode_IS_CSR_8;
  wire                _zz__zz_decode_IS_CSR_9;
  wire       [31:0]   _zz__zz_decode_IS_CSR_10;
  wire       [31:0]   _zz__zz_decode_IS_CSR_11;
  wire       [0:0]    _zz__zz_decode_IS_CSR_12;
  wire       [25:0]   _zz__zz_decode_IS_CSR_13;
  wire       [0:0]    _zz__zz_decode_IS_CSR_14;
  wire                _zz__zz_decode_IS_CSR_15;
  wire       [0:0]    _zz__zz_decode_IS_CSR_16;
  wire       [31:0]   _zz__zz_decode_IS_CSR_17;
  wire       [22:0]   _zz__zz_decode_IS_CSR_18;
  wire       [31:0]   _zz__zz_decode_IS_CSR_19;
  wire       [31:0]   _zz__zz_decode_IS_CSR_20;
  wire       [0:0]    _zz__zz_decode_IS_CSR_21;
  wire       [0:0]    _zz__zz_decode_IS_CSR_22;
  wire       [0:0]    _zz__zz_decode_IS_CSR_23;
  wire                _zz__zz_decode_IS_CSR_24;
  wire       [31:0]   _zz__zz_decode_IS_CSR_25;
  wire       [0:0]    _zz__zz_decode_IS_CSR_26;
  wire       [31:0]   _zz__zz_decode_IS_CSR_27;
  wire       [31:0]   _zz__zz_decode_IS_CSR_28;
  wire       [17:0]   _zz__zz_decode_IS_CSR_29;
  wire       [0:0]    _zz__zz_decode_IS_CSR_30;
  wire       [0:0]    _zz__zz_decode_IS_CSR_31;
  wire       [0:0]    _zz__zz_decode_IS_CSR_32;
  wire                _zz__zz_decode_IS_CSR_33;
  wire       [31:0]   _zz__zz_decode_IS_CSR_34;
  wire       [31:0]   _zz__zz_decode_IS_CSR_35;
  wire       [31:0]   _zz__zz_decode_IS_CSR_36;
  wire       [31:0]   _zz__zz_decode_IS_CSR_37;
  wire       [0:0]    _zz__zz_decode_IS_CSR_38;
  wire                _zz__zz_decode_IS_CSR_39;
  wire       [0:0]    _zz__zz_decode_IS_CSR_40;
  wire       [0:0]    _zz__zz_decode_IS_CSR_41;
  wire       [31:0]   _zz__zz_decode_IS_CSR_42;
  wire       [13:0]   _zz__zz_decode_IS_CSR_43;
  wire                _zz__zz_decode_IS_CSR_44;
  wire       [4:0]    _zz__zz_decode_IS_CSR_45;
  wire       [31:0]   _zz__zz_decode_IS_CSR_46;
  wire       [31:0]   _zz__zz_decode_IS_CSR_47;
  wire       [0:0]    _zz__zz_decode_IS_CSR_48;
  wire       [31:0]   _zz__zz_decode_IS_CSR_49;
  wire       [31:0]   _zz__zz_decode_IS_CSR_50;
  wire       [1:0]    _zz__zz_decode_IS_CSR_51;
  wire                _zz__zz_decode_IS_CSR_52;
  wire       [31:0]   _zz__zz_decode_IS_CSR_53;
  wire                _zz__zz_decode_IS_CSR_54;
  wire       [31:0]   _zz__zz_decode_IS_CSR_55;
  wire                _zz__zz_decode_IS_CSR_56;
  wire       [0:0]    _zz__zz_decode_IS_CSR_57;
  wire       [31:0]   _zz__zz_decode_IS_CSR_58;
  wire       [31:0]   _zz__zz_decode_IS_CSR_59;
  wire       [2:0]    _zz__zz_decode_IS_CSR_60;
  wire                _zz__zz_decode_IS_CSR_61;
  wire       [31:0]   _zz__zz_decode_IS_CSR_62;
  wire       [0:0]    _zz__zz_decode_IS_CSR_63;
  wire       [31:0]   _zz__zz_decode_IS_CSR_64;
  wire       [31:0]   _zz__zz_decode_IS_CSR_65;
  wire       [0:0]    _zz__zz_decode_IS_CSR_66;
  wire       [31:0]   _zz__zz_decode_IS_CSR_67;
  wire       [31:0]   _zz__zz_decode_IS_CSR_68;
  wire       [0:0]    _zz__zz_decode_IS_CSR_69;
  wire       [0:0]    _zz__zz_decode_IS_CSR_70;
  wire       [4:0]    _zz__zz_decode_IS_CSR_71;
  wire                _zz__zz_decode_IS_CSR_72;
  wire       [31:0]   _zz__zz_decode_IS_CSR_73;
  wire       [0:0]    _zz__zz_decode_IS_CSR_74;
  wire       [31:0]   _zz__zz_decode_IS_CSR_75;
  wire       [31:0]   _zz__zz_decode_IS_CSR_76;
  wire       [2:0]    _zz__zz_decode_IS_CSR_77;
  wire                _zz__zz_decode_IS_CSR_78;
  wire       [0:0]    _zz__zz_decode_IS_CSR_79;
  wire       [31:0]   _zz__zz_decode_IS_CSR_80;
  wire       [0:0]    _zz__zz_decode_IS_CSR_81;
  wire       [31:0]   _zz__zz_decode_IS_CSR_82;
  wire       [9:0]    _zz__zz_decode_IS_CSR_83;
  wire       [1:0]    _zz__zz_decode_IS_CSR_84;
  wire                _zz__zz_decode_IS_CSR_85;
  wire       [31:0]   _zz__zz_decode_IS_CSR_86;
  wire                _zz__zz_decode_IS_CSR_87;
  wire       [0:0]    _zz__zz_decode_IS_CSR_88;
  wire       [0:0]    _zz__zz_decode_IS_CSR_89;
  wire       [31:0]   _zz__zz_decode_IS_CSR_90;
  wire       [31:0]   _zz__zz_decode_IS_CSR_91;
  wire       [0:0]    _zz__zz_decode_IS_CSR_92;
  wire       [0:0]    _zz__zz_decode_IS_CSR_93;
  wire       [31:0]   _zz__zz_decode_IS_CSR_94;
  wire       [31:0]   _zz__zz_decode_IS_CSR_95;
  wire       [6:0]    _zz__zz_decode_IS_CSR_96;
  wire                _zz__zz_decode_IS_CSR_97;
  wire                _zz__zz_decode_IS_CSR_98;
  wire       [0:0]    _zz__zz_decode_IS_CSR_99;
  wire       [4:0]    _zz__zz_decode_IS_CSR_100;
  wire       [31:0]   _zz__zz_decode_IS_CSR_101;
  wire       [31:0]   _zz__zz_decode_IS_CSR_102;
  wire       [0:0]    _zz__zz_decode_IS_CSR_103;
  wire       [31:0]   _zz__zz_decode_IS_CSR_104;
  wire       [1:0]    _zz__zz_decode_IS_CSR_105;
  wire       [31:0]   _zz__zz_decode_IS_CSR_106;
  wire       [31:0]   _zz__zz_decode_IS_CSR_107;
  wire       [31:0]   _zz__zz_decode_IS_CSR_108;
  wire       [31:0]   _zz__zz_decode_IS_CSR_109;
  wire       [4:0]    _zz__zz_decode_IS_CSR_110;
  wire                _zz__zz_decode_IS_CSR_111;
  wire       [31:0]   _zz__zz_decode_IS_CSR_112;
  wire       [31:0]   _zz__zz_decode_IS_CSR_113;
  wire       [0:0]    _zz__zz_decode_IS_CSR_114;
  wire       [0:0]    _zz__zz_decode_IS_CSR_115;
  wire       [31:0]   _zz__zz_decode_IS_CSR_116;
  wire       [1:0]    _zz__zz_decode_IS_CSR_117;
  wire       [31:0]   _zz__zz_decode_IS_CSR_118;
  wire       [31:0]   _zz__zz_decode_IS_CSR_119;
  wire       [31:0]   _zz__zz_decode_IS_CSR_120;
  wire       [31:0]   _zz__zz_decode_IS_CSR_121;
  wire       [2:0]    _zz__zz_decode_IS_CSR_122;
  wire       [1:0]    _zz__zz_decode_IS_CSR_123;
  wire       [31:0]   _zz__zz_decode_IS_CSR_124;
  wire       [31:0]   _zz__zz_decode_IS_CSR_125;
  wire                _zz__zz_decode_IS_CSR_126;
  wire                _zz__zz_decode_IS_CSR_127;
  wire                _zz__zz_decode_IS_CSR_128;
  wire       [31:0]   _zz__zz_decode_IS_CSR_129;
  wire       [31:0]   _zz__zz_decode_IS_CSR_130;
  wire                _zz_RegFilePlugin_regFile_port;
  wire                _zz_decode_RegFilePlugin_rs1Data;
  wire                _zz_RegFilePlugin_regFile_port_1;
  wire                _zz_decode_RegFilePlugin_rs2Data;
  wire       [0:0]    _zz__zz_execute_REGFILE_WRITE_DATA;
  wire       [2:0]    _zz__zz_execute_SRC1;
  wire       [4:0]    _zz__zz_execute_SRC1_1;
  wire       [11:0]   _zz__zz_execute_SRC2_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_1;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_3;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_4;
  wire       [65:0]   _zz_writeBack_MulPlugin_result;
  wire       [65:0]   _zz_writeBack_MulPlugin_result_1;
  wire       [31:0]   _zz__zz_decode_RS2_2;
  wire       [31:0]   _zz__zz_decode_RS2_2_1;
  wire       [5:0]    _zz_memory_DivPlugin_div_counter_valueNext;
  wire       [0:0]    _zz_memory_DivPlugin_div_counter_valueNext_1;
  wire       [32:0]   _zz_memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   _zz_memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   _zz_memory_DivPlugin_div_stage_0_outRemainder_1;
  wire       [32:0]   _zz_memory_DivPlugin_div_stage_0_outNumerator;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_1;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_2;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_3;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_4;
  wire       [0:0]    _zz_memory_DivPlugin_div_result_5;
  wire       [32:0]   _zz_memory_DivPlugin_rs1_2;
  wire       [0:0]    _zz_memory_DivPlugin_rs1_3;
  wire       [31:0]   _zz_memory_DivPlugin_rs2_1;
  wire       [0:0]    _zz_memory_DivPlugin_rs2_2;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_4;
  wire       [31:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_6;
  wire       [31:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_6_1;
  wire       [31:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_6_2;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_branch_src2_2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_branch_src2_4;
  wire       [0:0]    _zz_execute_BranchPlugin_branch_src2_6;
  wire       [7:0]    _zz_execute_BranchPlugin_branch_src2_7;
  wire                _zz_execute_BranchPlugin_branch_src2_8;
  wire       [0:0]    _zz_execute_BranchPlugin_branch_src2_9;
  wire       [0:0]    _zz_execute_BranchPlugin_branch_src2_10;
  wire       [2:0]    _zz_execute_BranchPlugin_branch_src2_11;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1;
  wire                _zz_when;
  wire       [51:0]   memory_MUL_LOW;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire       [33:0]   execute_MUL_HL;
  wire       [33:0]   execute_MUL_LH;
  wire       [31:0]   execute_MUL_LL;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [31:0]   memory_MEMORY_STORE_DATA_RF;
  wire       [31:0]   execute_MEMORY_STORE_DATA_RF;
  wire                decode_DO_EBREAK;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire                decode_PREDICTION_HAD_BRANCHED1;
  wire                decode_SRC2_FORCE_ZERO;
  wire       [1:0]    _zz_memory_to_writeBack_ENV_CTRL;
  wire       [1:0]    _zz_memory_to_writeBack_ENV_CTRL_1;
  wire       [1:0]    _zz_execute_to_memory_ENV_CTRL;
  wire       [1:0]    _zz_execute_to_memory_ENV_CTRL_1;
  wire       [1:0]    decode_ENV_CTRL;
  wire       [1:0]    _zz_decode_ENV_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ENV_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ENV_CTRL_1;
  wire                decode_IS_CSR;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL_1;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       [1:0]    _zz_execute_to_memory_SHIFT_CTRL;
  wire       [1:0]    _zz_execute_to_memory_SHIFT_CTRL_1;
  wire       [1:0]    decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL_1;
  wire       [1:0]    decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  wire                decode_SRC_LESS_UNSIGNED;
  wire                decode_MEMORY_MANAGMENT;
  wire                memory_MEMORY_WR;
  wire                decode_MEMORY_WR;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       [1:0]    decode_SRC2_CTRL;
  wire       [1:0]    _zz_decode_SRC2_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC2_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC2_CTRL_1;
  wire       [1:0]    decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL_1;
  wire       [1:0]    decode_SRC1_CTRL;
  wire       [1:0]    _zz_decode_SRC1_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC1_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC1_CTRL_1;
  wire                decode_MEMORY_FORCE_CONSTISTENCY;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       [1:0]    memory_ENV_CTRL;
  wire       [1:0]    _zz_memory_ENV_CTRL;
  wire       [1:0]    execute_ENV_CTRL;
  wire       [1:0]    _zz_execute_ENV_CTRL;
  wire       [1:0]    writeBack_ENV_CTRL;
  wire       [1:0]    _zz_writeBack_ENV_CTRL;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire                execute_PREDICTION_HAD_BRANCHED1;
  wire                execute_BRANCH_COND_RESULT;
  wire       [1:0]    execute_BRANCH_CTRL;
  wire       [1:0]    _zz_execute_BRANCH_CTRL;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  reg        [31:0]   _zz_decode_RS2;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_RS2_SIGNED;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_IS_DIV;
  wire                writeBack_IS_MUL;
  wire       [33:0]   writeBack_MUL_HH;
  wire       [51:0]   writeBack_MUL_LOW;
  wire       [33:0]   memory_MUL_HL;
  wire       [33:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  wire       [31:0]   memory_SHIFT_RIGHT;
  reg        [31:0]   _zz_decode_RS2_1;
  wire       [1:0]    memory_SHIFT_CTRL;
  wire       [1:0]    _zz_memory_SHIFT_CTRL;
  wire       [1:0]    execute_SHIFT_CTRL;
  wire       [1:0]    _zz_execute_SHIFT_CTRL;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_execute_to_memory_PC;
  wire       [1:0]    execute_SRC2_CTRL;
  wire       [1:0]    _zz_execute_SRC2_CTRL;
  wire       [1:0]    execute_SRC1_CTRL;
  wire       [1:0]    _zz_execute_SRC1_CTRL;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       [1:0]    execute_ALU_CTRL;
  wire       [1:0]    _zz_execute_ALU_CTRL;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       [1:0]    execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_execute_ALU_BITWISE_CTRL;
  wire       [31:0]   _zz_lastStageRegFileWrite_payload_address;
  wire                _zz_lastStageRegFileWrite_valid;
  reg                 _zz_1;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       [1:0]    _zz_decode_ENV_CTRL_1;
  wire       [1:0]    _zz_decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_1;
  wire       [1:0]    _zz_decode_SRC2_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_CTRL_1;
  wire       [1:0]    _zz_decode_SRC1_CTRL_1;
  reg        [31:0]   _zz_decode_RS2_2;
  wire                writeBack_MEMORY_WR;
  wire       [31:0]   writeBack_MEMORY_STORE_DATA_RF;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire                writeBack_MEMORY_ENABLE;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_ENABLE;
  wire                execute_MEMORY_FORCE_CONSTISTENCY;
  (* keep , syn_keep *) wire       [31:0]   execute_RS1 /* synthesis syn_keep = 1 */ ;
  wire                execute_MEMORY_MANAGMENT;
  (* keep , syn_keep *) wire       [31:0]   execute_RS2 /* synthesis syn_keep = 1 */ ;
  wire                execute_MEMORY_WR;
  wire       [31:0]   execute_SRC_ADD;
  wire                execute_MEMORY_ENABLE;
  wire       [31:0]   execute_INSTRUCTION;
  wire                decode_MEMORY_ENABLE;
  wire                decode_FLUSH_ALL;
  reg                 IBusCachedPlugin_rsp_issueDetected_4;
  reg                 IBusCachedPlugin_rsp_issueDetected_3;
  reg                 IBusCachedPlugin_rsp_issueDetected_2;
  reg                 IBusCachedPlugin_rsp_issueDetected_1;
  wire       [1:0]    decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_1;
  wire       [31:0]   decode_INSTRUCTION;
  reg        [31:0]   _zz_memory_to_writeBack_FORMAL_PC_NEXT;
  reg        [31:0]   _zz_decode_to_execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_PC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  reg                 execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  reg                 execute_arbitration_flushIt;
  reg                 execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  reg                 writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  reg                 writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusCachedPlugin_fetcherHalt;
  wire                IBusCachedPlugin_forceNoDecodeCond;
  reg                 IBusCachedPlugin_incomingInstruction;
  wire                IBusCachedPlugin_predictionJumpInterface_valid;
  (* keep , syn_keep *) wire       [31:0]   IBusCachedPlugin_predictionJumpInterface_payload /* synthesis syn_keep = 1 */ ;
  reg                 IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  wire                IBusCachedPlugin_decodePrediction_rsp_wasWrong;
  wire                IBusCachedPlugin_pcValids_0;
  wire                IBusCachedPlugin_pcValids_1;
  wire                IBusCachedPlugin_pcValids_2;
  wire                IBusCachedPlugin_pcValids_3;
  reg                 IBusCachedPlugin_decodeExceptionPort_valid;
  reg        [3:0]    IBusCachedPlugin_decodeExceptionPort_payload_code;
  wire       [31:0]   IBusCachedPlugin_decodeExceptionPort_payload_badAddr;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isValid;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  wire                IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                IBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                IBusCachedPlugin_mmuBus_rsp_isPaging;
  wire                IBusCachedPlugin_mmuBus_rsp_allowRead;
  wire                IBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire                IBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                IBusCachedPlugin_mmuBus_rsp_exception;
  wire                IBusCachedPlugin_mmuBus_rsp_refilling;
  wire                IBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                IBusCachedPlugin_mmuBus_end;
  wire                IBusCachedPlugin_mmuBus_busy;
  wire                DBusCachedPlugin_mmuBus_cmd_0_isValid;
  wire                DBusCachedPlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   DBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  wire                DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                DBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                DBusCachedPlugin_mmuBus_rsp_isPaging;
  wire                DBusCachedPlugin_mmuBus_rsp_allowRead;
  wire                DBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire                DBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                DBusCachedPlugin_mmuBus_rsp_exception;
  wire                DBusCachedPlugin_mmuBus_rsp_refilling;
  wire                DBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                DBusCachedPlugin_mmuBus_end;
  wire                DBusCachedPlugin_mmuBus_busy;
  reg                 DBusCachedPlugin_redoBranch_valid;
  wire       [31:0]   DBusCachedPlugin_redoBranch_payload;
  reg                 DBusCachedPlugin_exceptionBus_valid;
  reg        [3:0]    DBusCachedPlugin_exceptionBus_payload_code;
  wire       [31:0]   DBusCachedPlugin_exceptionBus_payload_badAddr;
  reg                 _zz_when_DBusCachedPlugin_l473;
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                BranchPlugin_branchExceptionPort_valid;
  wire       [3:0]    BranchPlugin_branchExceptionPort_payload_code;
  wire       [31:0]   BranchPlugin_branchExceptionPort_payload_badAddr;
  reg                 BranchPlugin_inDebugNoFetchFlag;
  wire       [31:0]   CsrPlugin_csrMapping_readDataSignal;
  wire       [31:0]   CsrPlugin_csrMapping_readDataInit;
  wire       [31:0]   CsrPlugin_csrMapping_writeDataSignal;
  reg                 CsrPlugin_csrMapping_allowCsrSignal;
  wire                CsrPlugin_csrMapping_hazardFree;
  wire                CsrPlugin_csrMapping_doForceFailCsr;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  reg                 CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  reg                 CsrPlugin_forceMachineWire;
  reg                 CsrPlugin_selfException_valid;
  reg        [3:0]    CsrPlugin_selfException_payload_code;
  wire       [31:0]   CsrPlugin_selfException_payload_badAddr;
  reg                 CsrPlugin_allowInterrupts;
  reg                 CsrPlugin_allowException;
  reg                 CsrPlugin_allowEbreakException;
  wire                CsrPlugin_xretAwayFromMachine;
  reg                 DebugPlugin_injectionPort_valid;
  reg                 DebugPlugin_injectionPort_ready;
  wire       [31:0]   DebugPlugin_injectionPort_payload;
  wire                IBusCachedPlugin_externalFlush;
  wire                IBusCachedPlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusCachedPlugin_jump_pcLoad_payload;
  wire       [3:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload;
  wire       [3:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload_1;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_2;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_3;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_4;
  wire                IBusCachedPlugin_fetchPc_output_valid;
  wire                IBusCachedPlugin_fetchPc_output_ready;
  wire       [31:0]   IBusCachedPlugin_fetchPc_output_payload;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusCachedPlugin_fetchPc_correction;
  reg                 IBusCachedPlugin_fetchPc_correctionReg;
  wire                IBusCachedPlugin_fetchPc_output_fire;
  wire                IBusCachedPlugin_fetchPc_corrected;
  reg                 IBusCachedPlugin_fetchPc_pcRegPropagate;
  reg                 IBusCachedPlugin_fetchPc_booted;
  reg                 IBusCachedPlugin_fetchPc_inc;
  wire                when_Fetcher_l133;
  wire                when_Fetcher_l133_1;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pc;
  wire                IBusCachedPlugin_fetchPc_redo_valid;
  wire       [31:0]   IBusCachedPlugin_fetchPc_redo_payload;
  reg                 IBusCachedPlugin_fetchPc_flushed;
  wire                when_Fetcher_l160;
  reg                 IBusCachedPlugin_iBusRsp_redoFetch;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_0_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_1_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_2_halt;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_payload;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_payload;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_payload;
  wire                IBusCachedPlugin_iBusRsp_flush;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_ready;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_ready;
  reg                 _zz_IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  reg        [31:0]   _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 IBusCachedPlugin_iBusRsp_readyForError;
  wire                IBusCachedPlugin_iBusRsp_output_valid;
  wire                IBusCachedPlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_pc;
  wire                IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusCachedPlugin_iBusRsp_output_payload_isRvc;
  wire                when_Fetcher_l242;
  wire                when_Fetcher_l322;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_0;
  wire                when_Fetcher_l331;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_1;
  wire                when_Fetcher_l331_1;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_2;
  wire                when_Fetcher_l331_2;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_3;
  wire                when_Fetcher_l331_3;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_4;
  wire                when_Fetcher_l331_4;
  wire                _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  reg        [18:0]   _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1;
  wire                _zz_2;
  reg        [10:0]   _zz_3;
  wire                _zz_4;
  reg        [18:0]   _zz_5;
  reg                 _zz_6;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload;
  reg        [10:0]   _zz_IBusCachedPlugin_predictionJumpInterface_payload_1;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
  reg        [18:0]   _zz_IBusCachedPlugin_predictionJumpInterface_payload_3;
  reg        [31:0]   IBusCachedPlugin_rspCounter;
  wire                IBusCachedPlugin_s0_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s1_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s2_tightlyCoupledHit;
  wire                IBusCachedPlugin_rsp_iBusRspOutputHalt;
  wire                IBusCachedPlugin_rsp_issueDetected;
  reg                 IBusCachedPlugin_rsp_redoFetch;
  wire                when_IBusCachedPlugin_l245;
  wire                when_IBusCachedPlugin_l250;
  wire                when_IBusCachedPlugin_l256;
  wire                when_IBusCachedPlugin_l262;
  wire                when_IBusCachedPlugin_l273;
  reg        [31:0]   DBusCachedPlugin_rspCounter;
  wire                when_DBusCachedPlugin_l353;
  wire       [1:0]    execute_DBusCachedPlugin_size;
  reg        [31:0]   _zz_execute_MEMORY_STORE_DATA_RF;
  wire                when_DBusCachedPlugin_l395;
  wire                when_DBusCachedPlugin_l411;
  wire                when_DBusCachedPlugin_l473;
  wire                when_DBusCachedPlugin_l534;
  wire                when_DBusCachedPlugin_l554;
  wire       [31:0]   writeBack_DBusCachedPlugin_rspData;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_0;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_1;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_2;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_3;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspShifted;
  wire       [31:0]   writeBack_DBusCachedPlugin_rspRf;
  wire       [1:0]    switch_Misc_l245;
  wire                _zz_writeBack_DBusCachedPlugin_rspFormated;
  reg        [31:0]   _zz_writeBack_DBusCachedPlugin_rspFormated_1;
  wire                _zz_writeBack_DBusCachedPlugin_rspFormated_2;
  reg        [31:0]   _zz_writeBack_DBusCachedPlugin_rspFormated_3;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspFormated;
  wire                when_DBusCachedPlugin_l581;
  wire       [32:0]   _zz_decode_IS_CSR;
  wire                _zz_decode_IS_CSR_1;
  wire                _zz_decode_IS_CSR_2;
  wire                _zz_decode_IS_CSR_3;
  wire                _zz_decode_IS_CSR_4;
  wire                _zz_decode_IS_CSR_5;
  wire                _zz_decode_IS_CSR_6;
  wire       [1:0]    _zz_decode_SRC1_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_CTRL_2;
  wire       [1:0]    _zz_decode_SRC2_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_2;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_2;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_2;
  wire       [1:0]    _zz_decode_ENV_CTRL_2;
  wire                when_RegFilePlugin_l63;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_10;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_execute_REGFILE_WRITE_DATA;
  reg        [31:0]   _zz_execute_SRC1;
  wire                _zz_execute_SRC2;
  reg        [19:0]   _zz_execute_SRC2_1;
  wire                _zz_execute_SRC2_2;
  reg        [19:0]   _zz_execute_SRC2_3;
  reg        [31:0]   _zz_execute_SRC2_4;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_execute_FullBarrelShifterPlugin_reversed;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_decode_RS2_3;
  reg                 execute_MulPlugin_aSigned;
  reg                 execute_MulPlugin_bSigned;
  wire       [31:0]   execute_MulPlugin_a;
  wire       [31:0]   execute_MulPlugin_b;
  wire       [1:0]    switch_MulPlugin_l87;
  wire       [15:0]   execute_MulPlugin_aULow;
  wire       [15:0]   execute_MulPlugin_bULow;
  wire       [16:0]   execute_MulPlugin_aSLow;
  wire       [16:0]   execute_MulPlugin_bSLow;
  wire       [16:0]   execute_MulPlugin_aHigh;
  wire       [16:0]   execute_MulPlugin_bHigh;
  wire       [65:0]   writeBack_MulPlugin_result;
  wire                when_MulPlugin_l147;
  wire       [1:0]    switch_MulPlugin_l148;
  reg        [32:0]   memory_DivPlugin_rs1;
  reg        [31:0]   memory_DivPlugin_rs2;
  reg        [64:0]   memory_DivPlugin_accumulator;
  wire                memory_DivPlugin_frontendOk;
  reg                 memory_DivPlugin_div_needRevert;
  reg                 memory_DivPlugin_div_counter_willIncrement;
  reg                 memory_DivPlugin_div_counter_willClear;
  reg        [5:0]    memory_DivPlugin_div_counter_valueNext;
  reg        [5:0]    memory_DivPlugin_div_counter_value;
  wire                memory_DivPlugin_div_counter_willOverflowIfInc;
  wire                memory_DivPlugin_div_counter_willOverflow;
  reg                 memory_DivPlugin_div_done;
  wire                when_MulDivIterativePlugin_l126;
  wire                when_MulDivIterativePlugin_l126_1;
  reg        [31:0]   memory_DivPlugin_div_result;
  wire                when_MulDivIterativePlugin_l128;
  wire                when_MulDivIterativePlugin_l129;
  wire                when_MulDivIterativePlugin_l132;
  wire       [31:0]   _zz_memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outNumerator;
  wire                when_MulDivIterativePlugin_l151;
  wire       [31:0]   _zz_memory_DivPlugin_div_result;
  wire                when_MulDivIterativePlugin_l162;
  wire                _zz_memory_DivPlugin_rs2;
  wire                _zz_memory_DivPlugin_rs1;
  reg        [32:0]   _zz_memory_DivPlugin_rs1_1;
  reg                 HazardSimplePlugin_src0Hazard;
  reg                 HazardSimplePlugin_src1Hazard;
  wire                HazardSimplePlugin_writeBackWrites_valid;
  wire       [4:0]    HazardSimplePlugin_writeBackWrites_payload_address;
  wire       [31:0]   HazardSimplePlugin_writeBackWrites_payload_data;
  reg                 HazardSimplePlugin_writeBackBuffer_valid;
  reg        [4:0]    HazardSimplePlugin_writeBackBuffer_payload_address;
  reg        [31:0]   HazardSimplePlugin_writeBackBuffer_payload_data;
  wire                HazardSimplePlugin_addr0Match;
  wire                HazardSimplePlugin_addr1Match;
  wire                when_HazardSimplePlugin_l47;
  wire                when_HazardSimplePlugin_l48;
  wire                when_HazardSimplePlugin_l51;
  wire                when_HazardSimplePlugin_l45;
  wire                when_HazardSimplePlugin_l57;
  wire                when_HazardSimplePlugin_l58;
  wire                when_HazardSimplePlugin_l48_1;
  wire                when_HazardSimplePlugin_l51_1;
  wire                when_HazardSimplePlugin_l45_1;
  wire                when_HazardSimplePlugin_l57_1;
  wire                when_HazardSimplePlugin_l58_1;
  wire                when_HazardSimplePlugin_l48_2;
  wire                when_HazardSimplePlugin_l51_2;
  wire                when_HazardSimplePlugin_l45_2;
  wire                when_HazardSimplePlugin_l57_2;
  wire                when_HazardSimplePlugin_l58_2;
  wire                when_HazardSimplePlugin_l105;
  wire                when_HazardSimplePlugin_l108;
  wire                when_HazardSimplePlugin_l113;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    switch_Misc_l245_1;
  reg                 _zz_execute_BRANCH_COND_RESULT;
  reg                 _zz_execute_BRANCH_COND_RESULT_1;
  wire                _zz_execute_BranchPlugin_missAlignedTarget;
  reg        [19:0]   _zz_execute_BranchPlugin_missAlignedTarget_1;
  wire                _zz_execute_BranchPlugin_missAlignedTarget_2;
  reg        [10:0]   _zz_execute_BranchPlugin_missAlignedTarget_3;
  wire                _zz_execute_BranchPlugin_missAlignedTarget_4;
  reg        [18:0]   _zz_execute_BranchPlugin_missAlignedTarget_5;
  reg                 _zz_execute_BranchPlugin_missAlignedTarget_6;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_execute_BranchPlugin_branch_src2;
  reg        [19:0]   _zz_execute_BranchPlugin_branch_src2_1;
  wire                _zz_execute_BranchPlugin_branch_src2_2;
  reg        [10:0]   _zz_execute_BranchPlugin_branch_src2_3;
  wire                _zz_execute_BranchPlugin_branch_src2_4;
  reg        [18:0]   _zz_execute_BranchPlugin_branch_src2_5;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  wire       [1:0]    CsrPlugin_mtvec_mode;
  reg        [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg        [31:0]   CsrPlugin_mscratch;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle;
  reg        [63:0]   CsrPlugin_minstret;
  wire                _zz_when_CsrPlugin_l1302;
  wire                _zz_when_CsrPlugin_l1302_1;
  wire                _zz_when_CsrPlugin_l1302_2;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg        [3:0]    CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire       [1:0]    _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  wire                _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire                when_CsrPlugin_l1259;
  wire                when_CsrPlugin_l1259_1;
  wire                when_CsrPlugin_l1259_2;
  wire                when_CsrPlugin_l1259_3;
  wire                when_CsrPlugin_l1272;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                when_CsrPlugin_l1296;
  wire                when_CsrPlugin_l1302;
  wire                when_CsrPlugin_l1302_1;
  wire                when_CsrPlugin_l1302_2;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  wire                when_CsrPlugin_l1335;
  wire                when_CsrPlugin_l1335_1;
  wire                when_CsrPlugin_l1335_2;
  wire                when_CsrPlugin_l1340;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                when_CsrPlugin_l1346;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
  wire                CsrPlugin_trapCauseEbreakDebug;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  wire                CsrPlugin_trapEnterDebug;
  wire                when_CsrPlugin_l1390;
  wire                when_CsrPlugin_l1398;
  wire                when_CsrPlugin_l1456;
  wire       [1:0]    switch_CsrPlugin_l1460;
  reg                 execute_CsrPlugin_wfiWake;
  wire                when_CsrPlugin_l1527;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire                when_CsrPlugin_l1547;
  wire                when_CsrPlugin_l1548;
  wire                when_CsrPlugin_l1555;
  wire                when_CsrPlugin_l1565;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  wire                switch_Misc_l245_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_writeDataSignal;
  wire                when_CsrPlugin_l1587;
  wire                when_CsrPlugin_l1591;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  reg                 DebugPlugin_firstCycle;
  reg                 DebugPlugin_secondCycle;
  reg                 DebugPlugin_resetIt;
  reg                 DebugPlugin_haltIt;
  reg                 DebugPlugin_stepIt;
  reg                 DebugPlugin_isPipBusy;
  reg                 DebugPlugin_godmode;
  wire                when_DebugPlugin_l238;
  reg                 DebugPlugin_haltedByBreak;
  reg                 DebugPlugin_debugUsed /* verilator public */ ;
  reg                 DebugPlugin_disableEbreak;
  wire                DebugPlugin_allowEBreak;
  reg                 DebugPlugin_hardwareBreakpoints_0_valid;
  reg        [30:0]   DebugPlugin_hardwareBreakpoints_0_pc;
  reg                 DebugPlugin_hardwareBreakpoints_1_valid;
  reg        [30:0]   DebugPlugin_hardwareBreakpoints_1_pc;
  reg                 DebugPlugin_hardwareBreakpoints_2_valid;
  reg        [30:0]   DebugPlugin_hardwareBreakpoints_2_pc;
  reg        [31:0]   DebugPlugin_busReadDataReg;
  reg                 _zz_when_DebugPlugin_l257;
  wire                when_DebugPlugin_l257;
  wire       [5:0]    switch_DebugPlugin_l280;
  wire                when_DebugPlugin_l284;
  wire                when_DebugPlugin_l284_1;
  wire                when_DebugPlugin_l285;
  wire                when_DebugPlugin_l285_1;
  wire                when_DebugPlugin_l286;
  wire                when_DebugPlugin_l287;
  wire                when_DebugPlugin_l288;
  wire                when_DebugPlugin_l288_1;
  wire                when_DebugPlugin_l308;
  wire                when_DebugPlugin_l311;
  wire                when_DebugPlugin_l324;
  reg                 DebugPlugin_resetIt_regNext;
  wire                when_DebugPlugin_l344;
  wire                when_Pipeline_l124;
  reg        [31:0]   decode_to_execute_PC;
  wire                when_Pipeline_l124_1;
  reg        [31:0]   execute_to_memory_PC;
  wire                when_Pipeline_l124_2;
  reg        [31:0]   memory_to_writeBack_PC;
  wire                when_Pipeline_l124_3;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  wire                when_Pipeline_l124_4;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  wire                when_Pipeline_l124_5;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  wire                when_Pipeline_l124_6;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_7;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_8;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_9;
  reg                 decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  wire                when_Pipeline_l124_10;
  reg        [1:0]    decode_to_execute_SRC1_CTRL;
  wire                when_Pipeline_l124_11;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  wire                when_Pipeline_l124_12;
  reg                 decode_to_execute_MEMORY_ENABLE;
  wire                when_Pipeline_l124_13;
  reg                 execute_to_memory_MEMORY_ENABLE;
  wire                when_Pipeline_l124_14;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  wire                when_Pipeline_l124_15;
  reg        [1:0]    decode_to_execute_ALU_CTRL;
  wire                when_Pipeline_l124_16;
  reg        [1:0]    decode_to_execute_SRC2_CTRL;
  wire                when_Pipeline_l124_17;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_18;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_19;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_20;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  wire                when_Pipeline_l124_21;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_22;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_23;
  reg                 decode_to_execute_MEMORY_WR;
  wire                when_Pipeline_l124_24;
  reg                 execute_to_memory_MEMORY_WR;
  wire                when_Pipeline_l124_25;
  reg                 memory_to_writeBack_MEMORY_WR;
  wire                when_Pipeline_l124_26;
  reg                 decode_to_execute_MEMORY_MANAGMENT;
  wire                when_Pipeline_l124_27;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  wire                when_Pipeline_l124_28;
  reg        [1:0]    decode_to_execute_ALU_BITWISE_CTRL;
  wire                when_Pipeline_l124_29;
  reg        [1:0]    decode_to_execute_SHIFT_CTRL;
  wire                when_Pipeline_l124_30;
  reg        [1:0]    execute_to_memory_SHIFT_CTRL;
  wire                when_Pipeline_l124_31;
  reg                 decode_to_execute_IS_MUL;
  wire                when_Pipeline_l124_32;
  reg                 execute_to_memory_IS_MUL;
  wire                when_Pipeline_l124_33;
  reg                 memory_to_writeBack_IS_MUL;
  wire                when_Pipeline_l124_34;
  reg                 decode_to_execute_IS_DIV;
  wire                when_Pipeline_l124_35;
  reg                 execute_to_memory_IS_DIV;
  wire                when_Pipeline_l124_36;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  wire                when_Pipeline_l124_37;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  wire                when_Pipeline_l124_38;
  reg        [1:0]    decode_to_execute_BRANCH_CTRL;
  wire                when_Pipeline_l124_39;
  reg                 decode_to_execute_IS_CSR;
  wire                when_Pipeline_l124_40;
  reg        [1:0]    decode_to_execute_ENV_CTRL;
  wire                when_Pipeline_l124_41;
  reg        [1:0]    execute_to_memory_ENV_CTRL;
  wire                when_Pipeline_l124_42;
  reg        [1:0]    memory_to_writeBack_ENV_CTRL;
  wire                when_Pipeline_l124_43;
  reg        [31:0]   decode_to_execute_RS1;
  wire                when_Pipeline_l124_44;
  reg        [31:0]   decode_to_execute_RS2;
  wire                when_Pipeline_l124_45;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  wire                when_Pipeline_l124_46;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED1;
  wire                when_Pipeline_l124_47;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  wire                when_Pipeline_l124_48;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  wire                when_Pipeline_l124_49;
  reg                 decode_to_execute_DO_EBREAK;
  wire                when_Pipeline_l124_50;
  reg        [31:0]   execute_to_memory_MEMORY_STORE_DATA_RF;
  wire                when_Pipeline_l124_51;
  reg        [31:0]   memory_to_writeBack_MEMORY_STORE_DATA_RF;
  wire                when_Pipeline_l124_52;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_53;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_54;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  wire                when_Pipeline_l124_55;
  reg        [31:0]   execute_to_memory_MUL_LL;
  wire                when_Pipeline_l124_56;
  reg        [33:0]   execute_to_memory_MUL_LH;
  wire                when_Pipeline_l124_57;
  reg        [33:0]   execute_to_memory_MUL_HL;
  wire                when_Pipeline_l124_58;
  reg        [33:0]   execute_to_memory_MUL_HH;
  wire                when_Pipeline_l124_59;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  wire                when_Pipeline_l124_60;
  reg                 execute_to_memory_BRANCH_DO;
  wire                when_Pipeline_l124_61;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  wire                when_Pipeline_l124_62;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  wire                when_Pipeline_l151;
  wire                when_Pipeline_l154;
  wire                when_Pipeline_l151_1;
  wire                when_Pipeline_l154_1;
  wire                when_Pipeline_l151_2;
  wire                when_Pipeline_l154_2;
  reg        [2:0]    IBusCachedPlugin_injector_port_state;
  wire                when_Fetcher_l391;
  wire                when_CsrPlugin_l1669;
  reg                 execute_CsrPlugin_csr_768;
  wire                when_CsrPlugin_l1669_1;
  reg                 execute_CsrPlugin_csr_836;
  wire                when_CsrPlugin_l1669_2;
  reg                 execute_CsrPlugin_csr_772;
  wire                when_CsrPlugin_l1669_3;
  reg                 execute_CsrPlugin_csr_773;
  wire                when_CsrPlugin_l1669_4;
  reg                 execute_CsrPlugin_csr_833;
  wire                when_CsrPlugin_l1669_5;
  reg                 execute_CsrPlugin_csr_832;
  wire                when_CsrPlugin_l1669_6;
  reg                 execute_CsrPlugin_csr_834;
  wire                when_CsrPlugin_l1669_7;
  reg                 execute_CsrPlugin_csr_835;
  wire                when_CsrPlugin_l1669_8;
  reg                 execute_CsrPlugin_csr_2816;
  wire                when_CsrPlugin_l1669_9;
  reg                 execute_CsrPlugin_csr_2944;
  wire                when_CsrPlugin_l1669_10;
  reg                 execute_CsrPlugin_csr_2818;
  wire                when_CsrPlugin_l1669_11;
  reg                 execute_CsrPlugin_csr_2946;
  wire       [1:0]    switch_CsrPlugin_l1031;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_3;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_4;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_5;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_6;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_7;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_8;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_9;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_10;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_11;
  wire                when_CsrPlugin_l1702;
  wire       [11:0]   _zz_when_CsrPlugin_l1709;
  wire                when_CsrPlugin_l1709;
  reg                 when_CsrPlugin_l1719;
  wire                when_CsrPlugin_l1717;
  wire                when_CsrPlugin_l1725;
  `ifndef SYNTHESIS
  reg [47:0] _zz_memory_to_writeBack_ENV_CTRL_string;
  reg [47:0] _zz_memory_to_writeBack_ENV_CTRL_1_string;
  reg [47:0] _zz_execute_to_memory_ENV_CTRL_string;
  reg [47:0] _zz_execute_to_memory_ENV_CTRL_1_string;
  reg [47:0] decode_ENV_CTRL_string;
  reg [47:0] _zz_decode_ENV_CTRL_string;
  reg [47:0] _zz_decode_to_execute_ENV_CTRL_string;
  reg [47:0] _zz_decode_to_execute_ENV_CTRL_1_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_1_string;
  reg [71:0] _zz_execute_to_memory_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_to_memory_SHIFT_CTRL_1_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_1_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_to_execute_SRC2_CTRL_string;
  reg [23:0] _zz_decode_to_execute_SRC2_CTRL_1_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_1_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_to_execute_SRC1_CTRL_string;
  reg [95:0] _zz_decode_to_execute_SRC1_CTRL_1_string;
  reg [47:0] memory_ENV_CTRL_string;
  reg [47:0] _zz_memory_ENV_CTRL_string;
  reg [47:0] execute_ENV_CTRL_string;
  reg [47:0] _zz_execute_ENV_CTRL_string;
  reg [47:0] writeBack_ENV_CTRL_string;
  reg [47:0] _zz_writeBack_ENV_CTRL_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_execute_BRANCH_CTRL_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_memory_SHIFT_CTRL_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_SHIFT_CTRL_string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_execute_SRC2_CTRL_string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_execute_SRC1_CTRL_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_execute_ALU_CTRL_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_execute_ALU_BITWISE_CTRL_string;
  reg [47:0] _zz_decode_ENV_CTRL_1_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_1_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_1_string;
  reg [23:0] _zz_decode_SRC2_CTRL_1_string;
  reg [63:0] _zz_decode_ALU_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_1_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_2_string;
  reg [63:0] _zz_decode_ALU_CTRL_2_string;
  reg [23:0] _zz_decode_SRC2_CTRL_2_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_2_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_2_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_2_string;
  reg [47:0] _zz_decode_ENV_CTRL_2_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [47:0] decode_to_execute_ENV_CTRL_string;
  reg [47:0] execute_to_memory_ENV_CTRL_string;
  reg [47:0] memory_to_writeBack_ENV_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_when = (|{decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid});
  assign _zz_memory_MUL_LOW = ($signed(_zz_memory_MUL_LOW_1) + $signed(_zz_memory_MUL_LOW_4));
  assign _zz_memory_MUL_LOW_1 = ($signed(52'h0) + $signed(_zz_memory_MUL_LOW_2));
  assign _zz_memory_MUL_LOW_3 = {1'b0,memory_MUL_LL};
  assign _zz_memory_MUL_LOW_2 = {{19{_zz_memory_MUL_LOW_3[32]}}, _zz_memory_MUL_LOW_3};
  assign _zz_memory_MUL_LOW_5 = ({16'd0,memory_MUL_LH} <<< 5'd16);
  assign _zz_memory_MUL_LOW_4 = {{2{_zz_memory_MUL_LOW_5[49]}}, _zz_memory_MUL_LOW_5};
  assign _zz_memory_MUL_LOW_7 = ({16'd0,memory_MUL_HL} <<< 5'd16);
  assign _zz_memory_MUL_LOW_6 = {{2{_zz_memory_MUL_LOW_7[49]}}, _zz_memory_MUL_LOW_7};
  assign _zz_execute_SHIFT_RIGHT_1 = ($signed(_zz_execute_SHIFT_RIGHT_2) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT_1[31 : 0];
  assign _zz_execute_SHIFT_RIGHT_2 = {((execute_SHIFT_CTRL == ShiftCtrlEnum_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_decode_DO_EBREAK = (decode_PC >>> 1'd1);
  assign _zz_decode_DO_EBREAK_1 = (decode_PC >>> 1'd1);
  assign _zz_decode_DO_EBREAK_2 = (decode_PC >>> 1'd1);
  assign _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1 = (_zz_IBusCachedPlugin_jump_pcLoad_payload - 4'b0001);
  assign _zz_IBusCachedPlugin_fetchPc_pc_1 = {IBusCachedPlugin_fetchPc_inc,2'b00};
  assign _zz_IBusCachedPlugin_fetchPc_pc = {29'd0, _zz_IBusCachedPlugin_fetchPc_pc_1};
  assign _zz__zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_2 = {{_zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_2 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz__zz_4 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz__zz_6 = {{_zz_3,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz__zz_6_1 = {{_zz_5,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload_2 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_io_cpu_flush_payload_lineId = _zz_io_cpu_flush_payload_lineId_1;
  assign _zz_io_cpu_flush_payload_lineId_1 = (execute_RS1 >>> 3'd6);
  assign _zz_DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? 3'b111 : 3'b101);
  assign _zz_DBusCachedPlugin_exceptionBus_payload_code_1 = (writeBack_MEMORY_WR ? 3'b110 : 3'b100);
  assign _zz__zz_execute_REGFILE_WRITE_DATA = execute_SRC_LESS;
  assign _zz__zz_execute_SRC1 = 3'b100;
  assign _zz__zz_execute_SRC1_1 = execute_INSTRUCTION[19 : 15];
  assign _zz__zz_execute_SRC2_2 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_execute_SrcPlugin_addSub = ($signed(_zz_execute_SrcPlugin_addSub_1) + $signed(_zz_execute_SrcPlugin_addSub_4));
  assign _zz_execute_SrcPlugin_addSub_1 = ($signed(_zz_execute_SrcPlugin_addSub_2) + $signed(_zz_execute_SrcPlugin_addSub_3));
  assign _zz_execute_SrcPlugin_addSub_2 = execute_SRC1;
  assign _zz_execute_SrcPlugin_addSub_3 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_execute_SrcPlugin_addSub_4 = (execute_SRC_USE_SUB_LESS ? 32'h00000001 : 32'h0);
  assign _zz_writeBack_MulPlugin_result = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_writeBack_MulPlugin_result_1 = ({32'd0,writeBack_MUL_HH} <<< 6'd32);
  assign _zz__zz_decode_RS2_2 = writeBack_MUL_LOW[31 : 0];
  assign _zz__zz_decode_RS2_2_1 = writeBack_MulPlugin_result[63 : 32];
  assign _zz_memory_DivPlugin_div_counter_valueNext_1 = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_memory_DivPlugin_div_counter_valueNext = {5'd0, _zz_memory_DivPlugin_div_counter_valueNext_1};
  assign _zz_memory_DivPlugin_div_stage_0_remainderMinusDenominator = {1'd0, memory_DivPlugin_rs2};
  assign _zz_memory_DivPlugin_div_stage_0_outRemainder = memory_DivPlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_memory_DivPlugin_div_stage_0_outRemainder_1 = memory_DivPlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_memory_DivPlugin_div_stage_0_outNumerator = {_zz_memory_DivPlugin_div_stage_0_remainderShifted,(! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_memory_DivPlugin_div_result_1 = _zz_memory_DivPlugin_div_result_2;
  assign _zz_memory_DivPlugin_div_result_2 = _zz_memory_DivPlugin_div_result_3;
  assign _zz_memory_DivPlugin_div_result_3 = ({memory_DivPlugin_div_needRevert,(memory_DivPlugin_div_needRevert ? (~ _zz_memory_DivPlugin_div_result) : _zz_memory_DivPlugin_div_result)} + _zz_memory_DivPlugin_div_result_4);
  assign _zz_memory_DivPlugin_div_result_5 = memory_DivPlugin_div_needRevert;
  assign _zz_memory_DivPlugin_div_result_4 = {32'd0, _zz_memory_DivPlugin_div_result_5};
  assign _zz_memory_DivPlugin_rs1_3 = _zz_memory_DivPlugin_rs1;
  assign _zz_memory_DivPlugin_rs1_2 = {32'd0, _zz_memory_DivPlugin_rs1_3};
  assign _zz_memory_DivPlugin_rs2_2 = _zz_memory_DivPlugin_rs2;
  assign _zz_memory_DivPlugin_rs2_1 = {31'd0, _zz_memory_DivPlugin_rs2_2};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_6 = {_zz_execute_BranchPlugin_missAlignedTarget_1,execute_INSTRUCTION[31 : 20]};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_6_1 = {{_zz_execute_BranchPlugin_missAlignedTarget_3,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_6_2 = {{_zz_execute_BranchPlugin_missAlignedTarget_5,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_execute_BranchPlugin_branch_src2_2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_branch_src2_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_execute_BranchPlugin_branch_src2_11 = 3'b100;
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code & (~ _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1));
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code - 2'b01);
  assign _zz_decode_RegFilePlugin_rs1Data = 1'b1;
  assign _zz_decode_RegFilePlugin_rs2Data = 1'b1;
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_6 = {_zz_IBusCachedPlugin_jump_pcLoad_payload_4,_zz_IBusCachedPlugin_jump_pcLoad_payload_3};
  assign _zz_writeBack_DBusCachedPlugin_rspShifted_1 = dataCache_1_io_cpu_writeBack_address[1 : 0];
  assign _zz_writeBack_DBusCachedPlugin_rspShifted_3 = dataCache_1_io_cpu_writeBack_address[1 : 1];
  assign _zz_decode_LEGAL_INSTRUCTION = 32'h0000107f;
  assign _zz_decode_LEGAL_INSTRUCTION_1 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_decode_LEGAL_INSTRUCTION_2 = 32'h00002073;
  assign _zz_decode_LEGAL_INSTRUCTION_3 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_decode_LEGAL_INSTRUCTION_4 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_decode_LEGAL_INSTRUCTION_5 = {((decode_INSTRUCTION & 32'h0000107f) == 32'h00000013),{((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_6) == 32'h00000003),{(_zz_decode_LEGAL_INSTRUCTION_7 == _zz_decode_LEGAL_INSTRUCTION_8),{_zz_decode_LEGAL_INSTRUCTION_9,{_zz_decode_LEGAL_INSTRUCTION_10,_zz_decode_LEGAL_INSTRUCTION_11}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_6 = 32'h0000207f;
  assign _zz_decode_LEGAL_INSTRUCTION_7 = (decode_INSTRUCTION & 32'h0000505f);
  assign _zz_decode_LEGAL_INSTRUCTION_8 = 32'h00000003;
  assign _zz_decode_LEGAL_INSTRUCTION_9 = ((decode_INSTRUCTION & 32'h0000707b) == 32'h00000063);
  assign _zz_decode_LEGAL_INSTRUCTION_10 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_decode_LEGAL_INSTRUCTION_11 = {((decode_INSTRUCTION & 32'hfc00007f) == 32'h00000033),{((decode_INSTRUCTION & 32'h01f0707f) == 32'h0000500f),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_12) == 32'h00005013),{(_zz_decode_LEGAL_INSTRUCTION_13 == _zz_decode_LEGAL_INSTRUCTION_14),{_zz_decode_LEGAL_INSTRUCTION_15,{_zz_decode_LEGAL_INSTRUCTION_16,_zz_decode_LEGAL_INSTRUCTION_17}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_12 = 32'hbe00705f;
  assign _zz_decode_LEGAL_INSTRUCTION_13 = (decode_INSTRUCTION & 32'hfe00305f);
  assign _zz_decode_LEGAL_INSTRUCTION_14 = 32'h00001013;
  assign _zz_decode_LEGAL_INSTRUCTION_15 = ((decode_INSTRUCTION & 32'hbe00707f) == 32'h00000033);
  assign _zz_decode_LEGAL_INSTRUCTION_16 = ((decode_INSTRUCTION & 32'hdfffffff) == 32'h10200073);
  assign _zz_decode_LEGAL_INSTRUCTION_17 = ((decode_INSTRUCTION & 32'hffefffff) == 32'h00000073);
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_4 = decode_INSTRUCTION[31];
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_5 = decode_INSTRUCTION[31];
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_6 = decode_INSTRUCTION[7];
  assign _zz__zz_decode_IS_CSR = 32'h10003050;
  assign _zz__zz_decode_IS_CSR_1 = ((decode_INSTRUCTION & 32'h10003050) == 32'h10000050);
  assign _zz__zz_decode_IS_CSR_2 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_3) == 32'h00001050);
  assign _zz__zz_decode_IS_CSR_4 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_5) == 32'h00002050);
  assign _zz__zz_decode_IS_CSR_6 = {_zz_decode_IS_CSR_4,(_zz__zz_decode_IS_CSR_7 == _zz__zz_decode_IS_CSR_8)};
  assign _zz__zz_decode_IS_CSR_9 = (|(_zz__zz_decode_IS_CSR_10 == _zz__zz_decode_IS_CSR_11));
  assign _zz__zz_decode_IS_CSR_12 = (|_zz_decode_IS_CSR_5);
  assign _zz__zz_decode_IS_CSR_13 = {(|_zz__zz_decode_IS_CSR_14),{_zz__zz_decode_IS_CSR_15,{_zz__zz_decode_IS_CSR_16,_zz__zz_decode_IS_CSR_18}}};
  assign _zz__zz_decode_IS_CSR_3 = 32'h00001050;
  assign _zz__zz_decode_IS_CSR_5 = 32'h00002050;
  assign _zz__zz_decode_IS_CSR_7 = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz__zz_decode_IS_CSR_8 = 32'h00000004;
  assign _zz__zz_decode_IS_CSR_10 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz__zz_decode_IS_CSR_11 = 32'h00000040;
  assign _zz__zz_decode_IS_CSR_14 = _zz_decode_IS_CSR_5;
  assign _zz__zz_decode_IS_CSR_15 = (|((decode_INSTRUCTION & 32'h02004064) == 32'h02004020));
  assign _zz__zz_decode_IS_CSR_16 = (|((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_17) == 32'h02000030));
  assign _zz__zz_decode_IS_CSR_18 = {(|(_zz__zz_decode_IS_CSR_19 == _zz__zz_decode_IS_CSR_20)),{(|{_zz__zz_decode_IS_CSR_21,_zz__zz_decode_IS_CSR_22}),{(|_zz__zz_decode_IS_CSR_23),{_zz__zz_decode_IS_CSR_24,{_zz__zz_decode_IS_CSR_26,_zz__zz_decode_IS_CSR_29}}}}};
  assign _zz__zz_decode_IS_CSR_17 = 32'h02004074;
  assign _zz__zz_decode_IS_CSR_19 = (decode_INSTRUCTION & 32'h02007054);
  assign _zz__zz_decode_IS_CSR_20 = 32'h00005010;
  assign _zz__zz_decode_IS_CSR_21 = ((decode_INSTRUCTION & 32'h40003054) == 32'h40001010);
  assign _zz__zz_decode_IS_CSR_22 = ((decode_INSTRUCTION & 32'h02007054) == 32'h00001010);
  assign _zz__zz_decode_IS_CSR_23 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000024);
  assign _zz__zz_decode_IS_CSR_24 = (|((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_25) == 32'h00001000));
  assign _zz__zz_decode_IS_CSR_26 = (|(_zz__zz_decode_IS_CSR_27 == _zz__zz_decode_IS_CSR_28));
  assign _zz__zz_decode_IS_CSR_29 = {(|{_zz__zz_decode_IS_CSR_30,_zz__zz_decode_IS_CSR_31}),{(|_zz__zz_decode_IS_CSR_32),{_zz__zz_decode_IS_CSR_33,{_zz__zz_decode_IS_CSR_38,_zz__zz_decode_IS_CSR_43}}}};
  assign _zz__zz_decode_IS_CSR_25 = 32'h00001000;
  assign _zz__zz_decode_IS_CSR_27 = (decode_INSTRUCTION & 32'h00003000);
  assign _zz__zz_decode_IS_CSR_28 = 32'h00002000;
  assign _zz__zz_decode_IS_CSR_30 = ((decode_INSTRUCTION & 32'h00002010) == 32'h00002000);
  assign _zz__zz_decode_IS_CSR_31 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00001000);
  assign _zz__zz_decode_IS_CSR_32 = ((decode_INSTRUCTION & 32'h00004048) == 32'h00004008);
  assign _zz__zz_decode_IS_CSR_33 = (|{(_zz__zz_decode_IS_CSR_34 == _zz__zz_decode_IS_CSR_35),(_zz__zz_decode_IS_CSR_36 == _zz__zz_decode_IS_CSR_37)});
  assign _zz__zz_decode_IS_CSR_38 = (|{_zz__zz_decode_IS_CSR_39,{_zz__zz_decode_IS_CSR_40,_zz__zz_decode_IS_CSR_41}});
  assign _zz__zz_decode_IS_CSR_43 = {(|_zz__zz_decode_IS_CSR_44),{(|_zz__zz_decode_IS_CSR_45),{_zz__zz_decode_IS_CSR_56,{_zz__zz_decode_IS_CSR_69,_zz__zz_decode_IS_CSR_83}}}};
  assign _zz__zz_decode_IS_CSR_34 = (decode_INSTRUCTION & 32'h00000034);
  assign _zz__zz_decode_IS_CSR_35 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_36 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz__zz_decode_IS_CSR_37 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_39 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000040);
  assign _zz__zz_decode_IS_CSR_40 = _zz_decode_IS_CSR_2;
  assign _zz__zz_decode_IS_CSR_41 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_42) == 32'h00000040);
  assign _zz__zz_decode_IS_CSR_44 = ((decode_INSTRUCTION & 32'h00000020) == 32'h00000020);
  assign _zz__zz_decode_IS_CSR_45 = {(_zz__zz_decode_IS_CSR_46 == _zz__zz_decode_IS_CSR_47),{_zz_decode_IS_CSR_3,{_zz__zz_decode_IS_CSR_48,_zz__zz_decode_IS_CSR_51}}};
  assign _zz__zz_decode_IS_CSR_56 = (|{_zz_decode_IS_CSR_3,{_zz__zz_decode_IS_CSR_57,_zz__zz_decode_IS_CSR_60}});
  assign _zz__zz_decode_IS_CSR_69 = (|{_zz__zz_decode_IS_CSR_70,_zz__zz_decode_IS_CSR_71});
  assign _zz__zz_decode_IS_CSR_83 = {(|_zz__zz_decode_IS_CSR_84),{_zz__zz_decode_IS_CSR_87,{_zz__zz_decode_IS_CSR_92,_zz__zz_decode_IS_CSR_96}}};
  assign _zz__zz_decode_IS_CSR_42 = 32'h00003040;
  assign _zz__zz_decode_IS_CSR_46 = (decode_INSTRUCTION & 32'h00000040);
  assign _zz__zz_decode_IS_CSR_47 = 32'h00000040;
  assign _zz__zz_decode_IS_CSR_48 = (_zz__zz_decode_IS_CSR_49 == _zz__zz_decode_IS_CSR_50);
  assign _zz__zz_decode_IS_CSR_51 = {_zz__zz_decode_IS_CSR_52,_zz__zz_decode_IS_CSR_54};
  assign _zz__zz_decode_IS_CSR_57 = (_zz__zz_decode_IS_CSR_58 == _zz__zz_decode_IS_CSR_59);
  assign _zz__zz_decode_IS_CSR_60 = {_zz__zz_decode_IS_CSR_61,{_zz__zz_decode_IS_CSR_63,_zz__zz_decode_IS_CSR_66}};
  assign _zz__zz_decode_IS_CSR_70 = _zz_decode_IS_CSR_4;
  assign _zz__zz_decode_IS_CSR_71 = {_zz__zz_decode_IS_CSR_72,{_zz__zz_decode_IS_CSR_74,_zz__zz_decode_IS_CSR_77}};
  assign _zz__zz_decode_IS_CSR_84 = {_zz_decode_IS_CSR_3,_zz__zz_decode_IS_CSR_85};
  assign _zz__zz_decode_IS_CSR_87 = (|{_zz__zz_decode_IS_CSR_88,_zz__zz_decode_IS_CSR_89});
  assign _zz__zz_decode_IS_CSR_92 = (|_zz__zz_decode_IS_CSR_93);
  assign _zz__zz_decode_IS_CSR_96 = {_zz__zz_decode_IS_CSR_97,{_zz__zz_decode_IS_CSR_99,_zz__zz_decode_IS_CSR_110}};
  assign _zz__zz_decode_IS_CSR_49 = (decode_INSTRUCTION & 32'h00004020);
  assign _zz__zz_decode_IS_CSR_50 = 32'h00004020;
  assign _zz__zz_decode_IS_CSR_52 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_53) == 32'h00000010);
  assign _zz__zz_decode_IS_CSR_54 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_55) == 32'h00000020);
  assign _zz__zz_decode_IS_CSR_58 = (decode_INSTRUCTION & 32'h00002030);
  assign _zz__zz_decode_IS_CSR_59 = 32'h00002010;
  assign _zz__zz_decode_IS_CSR_61 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_62) == 32'h00000010);
  assign _zz__zz_decode_IS_CSR_63 = (_zz__zz_decode_IS_CSR_64 == _zz__zz_decode_IS_CSR_65);
  assign _zz__zz_decode_IS_CSR_66 = (_zz__zz_decode_IS_CSR_67 == _zz__zz_decode_IS_CSR_68);
  assign _zz__zz_decode_IS_CSR_72 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_73) == 32'h00001010);
  assign _zz__zz_decode_IS_CSR_74 = (_zz__zz_decode_IS_CSR_75 == _zz__zz_decode_IS_CSR_76);
  assign _zz__zz_decode_IS_CSR_77 = {_zz__zz_decode_IS_CSR_78,{_zz__zz_decode_IS_CSR_79,_zz__zz_decode_IS_CSR_81}};
  assign _zz__zz_decode_IS_CSR_85 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_86) == 32'h00000020);
  assign _zz__zz_decode_IS_CSR_88 = _zz_decode_IS_CSR_3;
  assign _zz__zz_decode_IS_CSR_89 = (_zz__zz_decode_IS_CSR_90 == _zz__zz_decode_IS_CSR_91);
  assign _zz__zz_decode_IS_CSR_93 = (_zz__zz_decode_IS_CSR_94 == _zz__zz_decode_IS_CSR_95);
  assign _zz__zz_decode_IS_CSR_97 = (|_zz__zz_decode_IS_CSR_98);
  assign _zz__zz_decode_IS_CSR_99 = (|_zz__zz_decode_IS_CSR_100);
  assign _zz__zz_decode_IS_CSR_110 = {_zz__zz_decode_IS_CSR_111,{_zz__zz_decode_IS_CSR_114,_zz__zz_decode_IS_CSR_122}};
  assign _zz__zz_decode_IS_CSR_53 = 32'h00000030;
  assign _zz__zz_decode_IS_CSR_55 = 32'h02000020;
  assign _zz__zz_decode_IS_CSR_62 = 32'h00001030;
  assign _zz__zz_decode_IS_CSR_64 = (decode_INSTRUCTION & 32'h02002060);
  assign _zz__zz_decode_IS_CSR_65 = 32'h00002020;
  assign _zz__zz_decode_IS_CSR_67 = (decode_INSTRUCTION & 32'h02003020);
  assign _zz__zz_decode_IS_CSR_68 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_73 = 32'h00001010;
  assign _zz__zz_decode_IS_CSR_75 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz__zz_decode_IS_CSR_76 = 32'h00002010;
  assign _zz__zz_decode_IS_CSR_78 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000010);
  assign _zz__zz_decode_IS_CSR_79 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_80) == 32'h00000004);
  assign _zz__zz_decode_IS_CSR_81 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_82) == 32'h0);
  assign _zz__zz_decode_IS_CSR_86 = 32'h00000070;
  assign _zz__zz_decode_IS_CSR_90 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz__zz_decode_IS_CSR_91 = 32'h0;
  assign _zz__zz_decode_IS_CSR_94 = (decode_INSTRUCTION & 32'h00004014);
  assign _zz__zz_decode_IS_CSR_95 = 32'h00004010;
  assign _zz__zz_decode_IS_CSR_98 = ((decode_INSTRUCTION & 32'h00006014) == 32'h00002010);
  assign _zz__zz_decode_IS_CSR_100 = {(_zz__zz_decode_IS_CSR_101 == _zz__zz_decode_IS_CSR_102),{_zz_decode_IS_CSR_2,{_zz__zz_decode_IS_CSR_103,_zz__zz_decode_IS_CSR_105}}};
  assign _zz__zz_decode_IS_CSR_111 = (|(_zz__zz_decode_IS_CSR_112 == _zz__zz_decode_IS_CSR_113));
  assign _zz__zz_decode_IS_CSR_114 = (|{_zz__zz_decode_IS_CSR_115,_zz__zz_decode_IS_CSR_117});
  assign _zz__zz_decode_IS_CSR_122 = {(|_zz__zz_decode_IS_CSR_123),{_zz__zz_decode_IS_CSR_126,_zz__zz_decode_IS_CSR_128}};
  assign _zz__zz_decode_IS_CSR_80 = 32'h0000000c;
  assign _zz__zz_decode_IS_CSR_82 = 32'h00000028;
  assign _zz__zz_decode_IS_CSR_101 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz__zz_decode_IS_CSR_102 = 32'h0;
  assign _zz__zz_decode_IS_CSR_103 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_104) == 32'h00002000);
  assign _zz__zz_decode_IS_CSR_105 = {(_zz__zz_decode_IS_CSR_106 == _zz__zz_decode_IS_CSR_107),(_zz__zz_decode_IS_CSR_108 == _zz__zz_decode_IS_CSR_109)};
  assign _zz__zz_decode_IS_CSR_112 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz__zz_decode_IS_CSR_113 = 32'h0;
  assign _zz__zz_decode_IS_CSR_115 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_116) == 32'h00000040);
  assign _zz__zz_decode_IS_CSR_117 = {(_zz__zz_decode_IS_CSR_118 == _zz__zz_decode_IS_CSR_119),(_zz__zz_decode_IS_CSR_120 == _zz__zz_decode_IS_CSR_121)};
  assign _zz__zz_decode_IS_CSR_123 = {(_zz__zz_decode_IS_CSR_124 == _zz__zz_decode_IS_CSR_125),_zz_decode_IS_CSR_1};
  assign _zz__zz_decode_IS_CSR_126 = (|{_zz__zz_decode_IS_CSR_127,_zz_decode_IS_CSR_1});
  assign _zz__zz_decode_IS_CSR_128 = (|(_zz__zz_decode_IS_CSR_129 == _zz__zz_decode_IS_CSR_130));
  assign _zz__zz_decode_IS_CSR_104 = 32'h00006004;
  assign _zz__zz_decode_IS_CSR_106 = (decode_INSTRUCTION & 32'h00005004);
  assign _zz__zz_decode_IS_CSR_107 = 32'h00001000;
  assign _zz__zz_decode_IS_CSR_108 = (decode_INSTRUCTION & 32'h00004050);
  assign _zz__zz_decode_IS_CSR_109 = 32'h00004000;
  assign _zz__zz_decode_IS_CSR_116 = 32'h00000044;
  assign _zz__zz_decode_IS_CSR_118 = (decode_INSTRUCTION & 32'h00002014);
  assign _zz__zz_decode_IS_CSR_119 = 32'h00002010;
  assign _zz__zz_decode_IS_CSR_120 = (decode_INSTRUCTION & 32'h40000034);
  assign _zz__zz_decode_IS_CSR_121 = 32'h40000030;
  assign _zz__zz_decode_IS_CSR_124 = (decode_INSTRUCTION & 32'h00000014);
  assign _zz__zz_decode_IS_CSR_125 = 32'h00000004;
  assign _zz__zz_decode_IS_CSR_127 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  assign _zz__zz_decode_IS_CSR_129 = (decode_INSTRUCTION & 32'h00005048);
  assign _zz__zz_decode_IS_CSR_130 = 32'h00001008;
  assign _zz_execute_BranchPlugin_branch_src2_6 = execute_INSTRUCTION[31];
  assign _zz_execute_BranchPlugin_branch_src2_7 = execute_INSTRUCTION[19 : 12];
  assign _zz_execute_BranchPlugin_branch_src2_8 = execute_INSTRUCTION[20];
  assign _zz_execute_BranchPlugin_branch_src2_9 = execute_INSTRUCTION[31];
  assign _zz_execute_BranchPlugin_branch_src2_10 = execute_INSTRUCTION[7];
  initial begin
    $readmemb("/workspaces/VexSatV/hw/./simWorkspace/tmp/job_1/VexSatV.v_toplevel_system_core_cpu_RegFilePlugin_regFile.bin",RegFilePlugin_regFile);
  end
  always @(posedge aclk) begin
    if(_zz_decode_RegFilePlugin_rs1Data) begin
      RegFilePlugin_regFile_spinal_port0 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @(posedge aclk) begin
    if(_zz_decode_RegFilePlugin_rs2Data) begin
      RegFilePlugin_regFile_spinal_port1 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @(posedge aclk) begin
    if(_zz_1) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  InstructionCache IBusCachedPlugin_cache (
    .io_flush                              (IBusCachedPlugin_cache_io_flush                           ), //i
    .io_cpu_prefetch_isValid               (IBusCachedPlugin_cache_io_cpu_prefetch_isValid            ), //i
    .io_cpu_prefetch_haltIt                (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt             ), //o
    .io_cpu_prefetch_pc                    (IBusCachedPlugin_iBusRsp_stages_0_input_payload[31:0]     ), //i
    .io_cpu_fetch_isValid                  (IBusCachedPlugin_cache_io_cpu_fetch_isValid               ), //i
    .io_cpu_fetch_isStuck                  (IBusCachedPlugin_cache_io_cpu_fetch_isStuck               ), //i
    .io_cpu_fetch_isRemoved                (                                                          ), //i
    .io_cpu_fetch_pc                       (IBusCachedPlugin_iBusRsp_stages_1_input_payload[31:0]     ), //i
    .io_cpu_fetch_data                     (IBusCachedPlugin_cache_io_cpu_fetch_data[31:0]            ), //o
    .io_cpu_fetch_mmuRsp_physicalAddress   (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]         ), //i
    .io_cpu_fetch_mmuRsp_isIoAccess        (IBusCachedPlugin_mmuBus_rsp_isIoAccess                    ), //i
    .io_cpu_fetch_mmuRsp_isPaging          (IBusCachedPlugin_mmuBus_rsp_isPaging                      ), //i
    .io_cpu_fetch_mmuRsp_allowRead         (IBusCachedPlugin_mmuBus_rsp_allowRead                     ), //i
    .io_cpu_fetch_mmuRsp_allowWrite        (IBusCachedPlugin_mmuBus_rsp_allowWrite                    ), //i
    .io_cpu_fetch_mmuRsp_allowExecute      (IBusCachedPlugin_mmuBus_rsp_allowExecute                  ), //i
    .io_cpu_fetch_mmuRsp_exception         (IBusCachedPlugin_mmuBus_rsp_exception                     ), //i
    .io_cpu_fetch_mmuRsp_refilling         (IBusCachedPlugin_mmuBus_rsp_refilling                     ), //i
    .io_cpu_fetch_mmuRsp_bypassTranslation (IBusCachedPlugin_mmuBus_rsp_bypassTranslation             ), //i
    .io_cpu_fetch_physicalAddress          (IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress[31:0] ), //o
    .io_cpu_decode_isValid                 (IBusCachedPlugin_cache_io_cpu_decode_isValid              ), //i
    .io_cpu_decode_isStuck                 (IBusCachedPlugin_cache_io_cpu_decode_isStuck              ), //i
    .io_cpu_decode_pc                      (IBusCachedPlugin_iBusRsp_stages_2_input_payload[31:0]     ), //i
    .io_cpu_decode_physicalAddress         (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]), //o
    .io_cpu_decode_data                    (IBusCachedPlugin_cache_io_cpu_decode_data[31:0]           ), //o
    .io_cpu_decode_cacheMiss               (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss            ), //o
    .io_cpu_decode_error                   (IBusCachedPlugin_cache_io_cpu_decode_error                ), //o
    .io_cpu_decode_mmuRefilling            (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling         ), //o
    .io_cpu_decode_mmuException            (IBusCachedPlugin_cache_io_cpu_decode_mmuException         ), //o
    .io_cpu_decode_isUser                  (IBusCachedPlugin_cache_io_cpu_decode_isUser               ), //i
    .io_cpu_fill_valid                     (IBusCachedPlugin_cache_io_cpu_fill_valid                  ), //i
    .io_cpu_fill_payload                   (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]), //i
    .io_mem_cmd_valid                      (IBusCachedPlugin_cache_io_mem_cmd_valid                   ), //o
    .io_mem_cmd_ready                      (iBus_cmd_ready                                            ), //i
    .io_mem_cmd_payload_address            (IBusCachedPlugin_cache_io_mem_cmd_payload_address[31:0]   ), //o
    .io_mem_cmd_payload_size               (IBusCachedPlugin_cache_io_mem_cmd_payload_size[2:0]       ), //o
    .io_mem_rsp_valid                      (iBus_rsp_valid                                            ), //i
    .io_mem_rsp_payload_data               (iBus_rsp_payload_data[31:0]                               ), //i
    .io_mem_rsp_payload_error              (iBus_rsp_payload_error                                    ), //i
    ._zz_when_Fetcher_l411                 (IBusCachedPlugin_injector_port_state[2:0]                 ), //i
    ._zz_decodeStage_hit_data_1            (DebugPlugin_injectionPort_payload[31:0]                   ), //i
    .aclk                                  (aclk                                                      ), //i
    ._zz_7                                 (_zz_11                                                    )  //i
  );
  DataCache dataCache_1 (
    .io_cpu_execute_isValid                 (dataCache_1_io_cpu_execute_isValid               ), //i
    .io_cpu_execute_address                 (dataCache_1_io_cpu_execute_address[31:0]         ), //i
    .io_cpu_execute_haltIt                  (dataCache_1_io_cpu_execute_haltIt                ), //o
    .io_cpu_execute_args_wr                 (execute_MEMORY_WR                                ), //i
    .io_cpu_execute_args_size               (execute_DBusCachedPlugin_size[1:0]               ), //i
    .io_cpu_execute_args_totalyConsistent   (execute_MEMORY_FORCE_CONSTISTENCY                ), //i
    .io_cpu_execute_refilling               (dataCache_1_io_cpu_execute_refilling             ), //o
    .io_cpu_memory_isValid                  (dataCache_1_io_cpu_memory_isValid                ), //i
    .io_cpu_memory_isStuck                  (memory_arbitration_isStuck                       ), //i
    .io_cpu_memory_isWrite                  (dataCache_1_io_cpu_memory_isWrite                ), //o
    .io_cpu_memory_address                  (dataCache_1_io_cpu_memory_address[31:0]          ), //i
    .io_cpu_memory_mmuRsp_physicalAddress   (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]), //i
    .io_cpu_memory_mmuRsp_isIoAccess        (dataCache_1_io_cpu_memory_mmuRsp_isIoAccess      ), //i
    .io_cpu_memory_mmuRsp_isPaging          (DBusCachedPlugin_mmuBus_rsp_isPaging             ), //i
    .io_cpu_memory_mmuRsp_allowRead         (DBusCachedPlugin_mmuBus_rsp_allowRead            ), //i
    .io_cpu_memory_mmuRsp_allowWrite        (DBusCachedPlugin_mmuBus_rsp_allowWrite           ), //i
    .io_cpu_memory_mmuRsp_allowExecute      (DBusCachedPlugin_mmuBus_rsp_allowExecute         ), //i
    .io_cpu_memory_mmuRsp_exception         (DBusCachedPlugin_mmuBus_rsp_exception            ), //i
    .io_cpu_memory_mmuRsp_refilling         (DBusCachedPlugin_mmuBus_rsp_refilling            ), //i
    .io_cpu_memory_mmuRsp_bypassTranslation (DBusCachedPlugin_mmuBus_rsp_bypassTranslation    ), //i
    .io_cpu_writeBack_isValid               (dataCache_1_io_cpu_writeBack_isValid             ), //i
    .io_cpu_writeBack_isStuck               (writeBack_arbitration_isStuck                    ), //i
    .io_cpu_writeBack_isFiring              (writeBack_arbitration_isFiring                   ), //i
    .io_cpu_writeBack_isUser                (dataCache_1_io_cpu_writeBack_isUser              ), //i
    .io_cpu_writeBack_haltIt                (dataCache_1_io_cpu_writeBack_haltIt              ), //o
    .io_cpu_writeBack_isWrite               (dataCache_1_io_cpu_writeBack_isWrite             ), //o
    .io_cpu_writeBack_storeData             (dataCache_1_io_cpu_writeBack_storeData[31:0]     ), //i
    .io_cpu_writeBack_data                  (dataCache_1_io_cpu_writeBack_data[31:0]          ), //o
    .io_cpu_writeBack_address               (dataCache_1_io_cpu_writeBack_address[31:0]       ), //i
    .io_cpu_writeBack_mmuException          (dataCache_1_io_cpu_writeBack_mmuException        ), //o
    .io_cpu_writeBack_unalignedAccess       (dataCache_1_io_cpu_writeBack_unalignedAccess     ), //o
    .io_cpu_writeBack_accessError           (dataCache_1_io_cpu_writeBack_accessError         ), //o
    .io_cpu_writeBack_keepMemRspData        (dataCache_1_io_cpu_writeBack_keepMemRspData      ), //o
    .io_cpu_writeBack_fence_SW              (                                                 ), //i
    .io_cpu_writeBack_fence_SR              (                                                 ), //i
    .io_cpu_writeBack_fence_SO              (                                                 ), //i
    .io_cpu_writeBack_fence_SI              (                                                 ), //i
    .io_cpu_writeBack_fence_PW              (                                                 ), //i
    .io_cpu_writeBack_fence_PR              (                                                 ), //i
    .io_cpu_writeBack_fence_PO              (                                                 ), //i
    .io_cpu_writeBack_fence_PI              (                                                 ), //i
    .io_cpu_writeBack_fence_FM              (                                                 ), //i
    .io_cpu_writeBack_exclusiveOk           (dataCache_1_io_cpu_writeBack_exclusiveOk         ), //o
    .io_cpu_redo                            (dataCache_1_io_cpu_redo                          ), //o
    .io_cpu_flush_valid                     (dataCache_1_io_cpu_flush_valid                   ), //i
    .io_cpu_flush_ready                     (dataCache_1_io_cpu_flush_ready                   ), //o
    .io_cpu_flush_payload_singleLine        (dataCache_1_io_cpu_flush_payload_singleLine      ), //i
    .io_cpu_flush_payload_lineId            (dataCache_1_io_cpu_flush_payload_lineId[6:0]     ), //i
    .io_cpu_writesPending                   (dataCache_1_io_cpu_writesPending                 ), //o
    .io_mem_cmd_valid                       (dataCache_1_io_mem_cmd_valid                     ), //o
    .io_mem_cmd_ready                       (dBus_cmd_ready                                   ), //i
    .io_mem_cmd_payload_wr                  (dataCache_1_io_mem_cmd_payload_wr                ), //o
    .io_mem_cmd_payload_uncached            (dataCache_1_io_mem_cmd_payload_uncached          ), //o
    .io_mem_cmd_payload_address             (dataCache_1_io_mem_cmd_payload_address[31:0]     ), //o
    .io_mem_cmd_payload_data                (dataCache_1_io_mem_cmd_payload_data[31:0]        ), //o
    .io_mem_cmd_payload_mask                (dataCache_1_io_mem_cmd_payload_mask[3:0]         ), //o
    .io_mem_cmd_payload_size                (dataCache_1_io_mem_cmd_payload_size[2:0]         ), //o
    .io_mem_cmd_payload_last                (dataCache_1_io_mem_cmd_payload_last              ), //o
    .io_mem_rsp_valid                       (dBus_rsp_valid                                   ), //i
    .io_mem_rsp_payload_last                (dBus_rsp_payload_last                            ), //i
    .io_mem_rsp_payload_data                (dBus_rsp_payload_data[31:0]                      ), //i
    .io_mem_rsp_payload_error               (dBus_rsp_payload_error                           ), //i
    .aclk                                   (aclk                                             ), //i
    ._zz_7                                  (_zz_11                                           )  //i
  );
  always @(*) begin
    case(_zz_IBusCachedPlugin_jump_pcLoad_payload_6)
      2'b00 : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = DBusCachedPlugin_redoBranch_payload;
      2'b01 : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = CsrPlugin_jumpInterface_payload;
      2'b10 : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = BranchPlugin_jumpInterface_payload;
      default : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = IBusCachedPlugin_predictionJumpInterface_payload;
    endcase
  end

  always @(*) begin
    case(_zz_writeBack_DBusCachedPlugin_rspShifted_1)
      2'b00 : _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_0;
      2'b01 : _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_1;
      2'b10 : _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_2;
      default : _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_3;
    endcase
  end

  always @(*) begin
    case(_zz_writeBack_DBusCachedPlugin_rspShifted_3)
      1'b0 : _zz_writeBack_DBusCachedPlugin_rspShifted_2 = writeBack_DBusCachedPlugin_rspSplits_1;
      default : _zz_writeBack_DBusCachedPlugin_rspShifted_2 = writeBack_DBusCachedPlugin_rspSplits_3;
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_memory_to_writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_memory_to_writeBack_ENV_CTRL_string = "EBREAK";
      default : _zz_memory_to_writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_memory_to_writeBack_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_memory_to_writeBack_ENV_CTRL_1_string = "EBREAK";
      default : _zz_memory_to_writeBack_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_execute_to_memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_execute_to_memory_ENV_CTRL_string = "EBREAK";
      default : _zz_execute_to_memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_execute_to_memory_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_execute_to_memory_ENV_CTRL_1_string = "EBREAK";
      default : _zz_execute_to_memory_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : decode_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : decode_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : decode_ENV_CTRL_string = "EBREAK";
      default : decode_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_decode_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_ENV_CTRL_string = "EBREAK";
      default : _zz_decode_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_decode_to_execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_to_execute_ENV_CTRL_string = "EBREAK";
      default : _zz_decode_to_execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_decode_to_execute_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_to_execute_ENV_CTRL_1_string = "EBREAK";
      default : _zz_decode_to_execute_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      Src2CtrlEnum_RS : decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_string = "PC ";
      default : _zz_decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_decode_to_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_to_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_to_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_to_execute_SRC2_CTRL_string = "PC ";
      default : _zz_decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC2_CTRL_1)
      Src2CtrlEnum_RS : _zz_decode_to_execute_SRC2_CTRL_1_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_to_execute_SRC2_CTRL_1_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_to_execute_SRC2_CTRL_1_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_to_execute_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_to_execute_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      Src1CtrlEnum_RS : decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_decode_to_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_to_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC1_CTRL_1)
      Src1CtrlEnum_RS : _zz_decode_to_execute_SRC1_CTRL_1_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_to_execute_SRC1_CTRL_1_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_to_execute_SRC1_CTRL_1_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_to_execute_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_to_execute_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : memory_ENV_CTRL_string = "EBREAK";
      default : memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_memory_ENV_CTRL_string = "EBREAK";
      default : _zz_memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : execute_ENV_CTRL_string = "EBREAK";
      default : execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_execute_ENV_CTRL_string = "EBREAK";
      default : _zz_execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : writeBack_ENV_CTRL_string = "EBREAK";
      default : writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_writeBack_ENV_CTRL_string = "EBREAK";
      default : _zz_writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SRC2_CTRL)
      Src2CtrlEnum_RS : execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : execute_SRC2_CTRL_string = "PC ";
      default : execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_execute_SRC2_CTRL_string = "PC ";
      default : _zz_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(execute_SRC1_CTRL)
      Src1CtrlEnum_RS : execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : execute_SRC1_CTRL_string = "URS1        ";
      default : execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_execute_SRC1_CTRL_string = "URS1        ";
      default : _zz_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_decode_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_ENV_CTRL_1_string = "EBREAK";
      default : _zz_decode_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_1)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_1_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_1_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_1_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_1)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_1_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_1_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_1_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_2)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_2_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_2_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_2_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_2_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_2_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_2)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_2_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_2_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_2_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_2_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_2)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_2_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_2_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_2_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_2_string = "PC ";
      default : _zz_decode_SRC2_CTRL_2_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_2)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_2)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_2_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_2_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_2_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_2_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_2_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_2)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_2_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_2_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_2_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_2_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_2)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_2_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_2_string = "XRET  ";
      EnvCtrlEnum_ECALL : _zz_decode_ENV_CTRL_2_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_ENV_CTRL_2_string = "EBREAK";
      default : _zz_decode_ENV_CTRL_2_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : decode_to_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : decode_to_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : decode_to_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : decode_to_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : decode_to_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : decode_to_execute_SRC2_CTRL_string = "PC ";
      default : decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_to_execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : decode_to_execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : decode_to_execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : decode_to_execute_ENV_CTRL_string = "EBREAK";
      default : decode_to_execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_to_memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : execute_to_memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : execute_to_memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : execute_to_memory_ENV_CTRL_string = "EBREAK";
      default : execute_to_memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_ECALL : memory_to_writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : memory_to_writeBack_ENV_CTRL_string = "EBREAK";
      default : memory_to_writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  `endif

  assign memory_MUL_LOW = ($signed(_zz_memory_MUL_LOW) + $signed(_zz_memory_MUL_LOW_6));
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED1 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT;
  assign execute_REGFILE_WRITE_DATA = _zz_execute_REGFILE_WRITE_DATA;
  assign memory_MEMORY_STORE_DATA_RF = execute_to_memory_MEMORY_STORE_DATA_RF;
  assign execute_MEMORY_STORE_DATA_RF = _zz_execute_MEMORY_STORE_DATA_RF;
  assign decode_DO_EBREAK = (((! DebugPlugin_haltIt) && (decode_IS_EBREAK || (((1'b0 || (DebugPlugin_hardwareBreakpoints_0_valid && (DebugPlugin_hardwareBreakpoints_0_pc == _zz_decode_DO_EBREAK))) || (DebugPlugin_hardwareBreakpoints_1_valid && (DebugPlugin_hardwareBreakpoints_1_pc == _zz_decode_DO_EBREAK_1))) || (DebugPlugin_hardwareBreakpoints_2_valid && (DebugPlugin_hardwareBreakpoints_2_pc == _zz_decode_DO_EBREAK_2))))) && DebugPlugin_allowEBreak);
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_PREDICTION_HAD_BRANCHED1 = IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign _zz_memory_to_writeBack_ENV_CTRL = _zz_memory_to_writeBack_ENV_CTRL_1;
  assign _zz_execute_to_memory_ENV_CTRL = _zz_execute_to_memory_ENV_CTRL_1;
  assign decode_ENV_CTRL = _zz_decode_ENV_CTRL;
  assign _zz_decode_to_execute_ENV_CTRL = _zz_decode_to_execute_ENV_CTRL_1;
  assign decode_IS_CSR = _zz_decode_IS_CSR[29];
  assign _zz_decode_to_execute_BRANCH_CTRL = _zz_decode_to_execute_BRANCH_CTRL_1;
  assign decode_IS_RS2_SIGNED = _zz_decode_IS_CSR[26];
  assign decode_IS_RS1_SIGNED = _zz_decode_IS_CSR[25];
  assign decode_IS_DIV = _zz_decode_IS_CSR[24];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_decode_IS_CSR[23];
  assign _zz_execute_to_memory_SHIFT_CTRL = _zz_execute_to_memory_SHIFT_CTRL_1;
  assign decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL = _zz_decode_to_execute_SHIFT_CTRL_1;
  assign decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL = _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  assign decode_SRC_LESS_UNSIGNED = _zz_decode_IS_CSR[17];
  assign decode_MEMORY_MANAGMENT = _zz_decode_IS_CSR[16];
  assign memory_MEMORY_WR = execute_to_memory_MEMORY_WR;
  assign decode_MEMORY_WR = _zz_decode_IS_CSR[13];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_decode_IS_CSR[12];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_decode_IS_CSR[11];
  assign decode_SRC2_CTRL = _zz_decode_SRC2_CTRL;
  assign _zz_decode_to_execute_SRC2_CTRL = _zz_decode_to_execute_SRC2_CTRL_1;
  assign decode_ALU_CTRL = _zz_decode_ALU_CTRL;
  assign _zz_decode_to_execute_ALU_CTRL = _zz_decode_to_execute_ALU_CTRL_1;
  assign decode_SRC1_CTRL = _zz_decode_SRC1_CTRL;
  assign _zz_decode_to_execute_SRC1_CTRL = _zz_decode_to_execute_SRC1_CTRL_1;
  assign decode_MEMORY_FORCE_CONSTISTENCY = 1'b0;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign memory_PC = execute_to_memory_PC;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_decode_IS_CSR[32];
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_memory_ENV_CTRL;
  assign execute_ENV_CTRL = _zz_execute_ENV_CTRL;
  assign writeBack_ENV_CTRL = _zz_writeBack_ENV_CTRL;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_PREDICTION_HAD_BRANCHED1 = decode_to_execute_PREDICTION_HAD_BRANCHED1;
  assign execute_BRANCH_COND_RESULT = _zz_execute_BRANCH_COND_RESULT_1;
  assign execute_BRANCH_CTRL = _zz_execute_BRANCH_CTRL;
  assign decode_RS2_USE = _zz_decode_IS_CSR[15];
  assign decode_RS1_USE = _zz_decode_IS_CSR[5];
  always @(*) begin
    _zz_decode_RS2 = execute_REGFILE_WRITE_DATA;
    if(when_CsrPlugin_l1587) begin
      _zz_decode_RS2 = CsrPlugin_csrMapping_readDataSignal;
    end
  end

  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr1Match) begin
        decode_RS2 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l51) begin
          decode_RS2 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l51_1) begin
          decode_RS2 = _zz_decode_RS2_1;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l51_2) begin
          decode_RS2 = _zz_decode_RS2;
        end
      end
    end
  end

  always @(*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr0Match) begin
        decode_RS1 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l48) begin
          decode_RS1 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l48_1) begin
          decode_RS1 = _zz_decode_RS2_1;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l48_2) begin
          decode_RS1 = _zz_decode_RS2;
        end
      end
    end
  end

  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @(*) begin
    _zz_decode_RS2_1 = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid) begin
      case(memory_SHIFT_CTRL)
        ShiftCtrlEnum_SLL_1 : begin
          _zz_decode_RS2_1 = _zz_decode_RS2_3;
        end
        ShiftCtrlEnum_SRL_1, ShiftCtrlEnum_SRA_1 : begin
          _zz_decode_RS2_1 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(when_MulDivIterativePlugin_l128) begin
      _zz_decode_RS2_1 = memory_DivPlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_memory_SHIFT_CTRL;
  assign execute_SHIFT_CTRL = _zz_execute_SHIFT_CTRL;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_execute_to_memory_PC = execute_PC;
  assign execute_SRC2_CTRL = _zz_execute_SRC2_CTRL;
  assign execute_SRC1_CTRL = _zz_execute_SRC1_CTRL;
  assign decode_SRC_USE_SUB_LESS = _zz_decode_IS_CSR[3];
  assign decode_SRC_ADD_ZERO = _zz_decode_IS_CSR[20];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_execute_ALU_CTRL;
  assign execute_SRC2 = _zz_execute_SRC2_4;
  assign execute_SRC1 = _zz_execute_SRC1;
  assign execute_ALU_BITWISE_CTRL = _zz_execute_ALU_BITWISE_CTRL;
  assign _zz_lastStageRegFileWrite_payload_address = writeBack_INSTRUCTION;
  assign _zz_lastStageRegFileWrite_valid = writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    _zz_1 = 1'b0;
    if(lastStageRegFileWrite_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_cache_io_cpu_fetch_data);
  always @(*) begin
    decode_REGFILE_WRITE_VALID = _zz_decode_IS_CSR[10];
    if(when_RegFilePlugin_l63) begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = (|{((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION) == 32'h00001073),{(_zz_decode_LEGAL_INSTRUCTION_1 == _zz_decode_LEGAL_INSTRUCTION_2),{_zz_decode_LEGAL_INSTRUCTION_3,{_zz_decode_LEGAL_INSTRUCTION_4,_zz_decode_LEGAL_INSTRUCTION_5}}}}}});
  always @(*) begin
    _zz_decode_RS2_2 = writeBack_REGFILE_WRITE_DATA;
    if(when_DBusCachedPlugin_l581) begin
      _zz_decode_RS2_2 = writeBack_DBusCachedPlugin_rspFormated;
    end
    if(when_MulPlugin_l147) begin
      case(switch_MulPlugin_l148)
        2'b00 : begin
          _zz_decode_RS2_2 = _zz__zz_decode_RS2_2;
        end
        default : begin
          _zz_decode_RS2_2 = _zz__zz_decode_RS2_2_1;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_WR = memory_to_writeBack_MEMORY_WR;
  assign writeBack_MEMORY_STORE_DATA_RF = memory_to_writeBack_MEMORY_STORE_DATA_RF;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_MEMORY_FORCE_CONSTISTENCY = decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_MEMORY_MANAGMENT;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_MEMORY_WR = decode_to_execute_MEMORY_WR;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign decode_MEMORY_ENABLE = _zz_decode_IS_CSR[4];
  assign decode_FLUSH_ALL = _zz_decode_IS_CSR[0];
  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_4 = IBusCachedPlugin_rsp_issueDetected_3;
    if(when_IBusCachedPlugin_l262) begin
      IBusCachedPlugin_rsp_issueDetected_4 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_3 = IBusCachedPlugin_rsp_issueDetected_2;
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_rsp_issueDetected_3 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_2 = IBusCachedPlugin_rsp_issueDetected_1;
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_rsp_issueDetected_2 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_1 = IBusCachedPlugin_rsp_issueDetected;
    if(when_IBusCachedPlugin_l245) begin
      IBusCachedPlugin_rsp_issueDetected_1 = 1'b1;
    end
  end

  assign decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_1;
  assign decode_INSTRUCTION = IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  always @(*) begin
    _zz_memory_to_writeBack_FORMAL_PC_NEXT = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid) begin
      _zz_memory_to_writeBack_FORMAL_PC_NEXT = BranchPlugin_jumpInterface_payload;
    end
  end

  always @(*) begin
    _zz_decode_to_execute_FORMAL_PC_NEXT = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_predictionJumpInterface_valid) begin
      _zz_decode_to_execute_FORMAL_PC_NEXT = IBusCachedPlugin_predictionJumpInterface_payload;
    end
  end

  assign decode_PC = IBusCachedPlugin_iBusRsp_output_payload_pc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @(*) begin
    decode_arbitration_haltItself = 1'b0;
    if(when_DBusCachedPlugin_l353) begin
      decode_arbitration_haltItself = 1'b1;
    end
    case(IBusCachedPlugin_injector_port_state)
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(when_HazardSimplePlugin_l113) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_pipelineLiberator_active) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_CsrPlugin_l1527) begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    decode_arbitration_removeIt = 1'b0;
    if(_zz_when) begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @(*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusCachedPlugin_predictionJumpInterface_valid) begin
      decode_arbitration_flushNext = 1'b1;
    end
    if(_zz_when) begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_haltItself = 1'b0;
    if(when_DBusCachedPlugin_l395) begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(when_CsrPlugin_l1591) begin
      if(execute_CsrPlugin_blockedBySideEffects) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(when_DBusCachedPlugin_l411) begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if(when_DebugPlugin_l308) begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_removeIt = 1'b0;
    if(CsrPlugin_selfException_valid) begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed) begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_flushIt = 1'b0;
    if(when_DebugPlugin_l308) begin
      if(when_DebugPlugin_l311) begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_flushNext = 1'b0;
    if(CsrPlugin_selfException_valid) begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(when_DebugPlugin_l308) begin
      if(when_DebugPlugin_l311) begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_arbitration_haltItself = 1'b0;
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l129) begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @(*) begin
    memory_arbitration_removeIt = 1'b0;
    if(BranchPlugin_branchExceptionPort_valid) begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed) begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @(*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid) begin
      memory_arbitration_flushNext = 1'b1;
    end
    if(BranchPlugin_branchExceptionPort_valid) begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    writeBack_arbitration_haltItself = 1'b0;
    if(when_DBusCachedPlugin_l554) begin
      writeBack_arbitration_haltItself = 1'b1;
    end
  end

  assign writeBack_arbitration_haltByOther = 1'b0;
  always @(*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(DBusCachedPlugin_exceptionBus_valid) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
    if(writeBack_arbitration_isFlushed) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  always @(*) begin
    writeBack_arbitration_flushIt = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid) begin
      writeBack_arbitration_flushIt = 1'b1;
    end
  end

  always @(*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(DBusCachedPlugin_exceptionBus_valid) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(when_CsrPlugin_l1390) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(when_CsrPlugin_l1456) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @(*) begin
    IBusCachedPlugin_fetcherHalt = 1'b0;
    if(when_CsrPlugin_l1272) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1390) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1456) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l308) begin
      if(when_DebugPlugin_l311) begin
        IBusCachedPlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l324) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  assign IBusCachedPlugin_forceNoDecodeCond = 1'b0;
  always @(*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if(when_Fetcher_l242) begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_DBusCachedPlugin_l473 = 1'b0;
    if(DebugPlugin_godmode) begin
      _zz_when_DBusCachedPlugin_l473 = 1'b1;
    end
  end

  always @(*) begin
    BranchPlugin_inDebugNoFetchFlag = 1'b0;
    if(DebugPlugin_godmode) begin
      BranchPlugin_inDebugNoFetchFlag = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_csrMapping_allowCsrSignal = 1'b0;
    if(when_CsrPlugin_l1702) begin
      CsrPlugin_csrMapping_allowCsrSignal = 1'b1;
    end
    if(when_CsrPlugin_l1709) begin
      CsrPlugin_csrMapping_allowCsrSignal = 1'b1;
    end
  end

  assign CsrPlugin_csrMapping_doForceFailCsr = 1'b0;
  assign CsrPlugin_csrMapping_readDataSignal = CsrPlugin_csrMapping_readDataInit;
  assign CsrPlugin_inWfi = 1'b0;
  always @(*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt) begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(when_CsrPlugin_l1390) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(when_CsrPlugin_l1456) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_CsrPlugin_l1390) begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(when_CsrPlugin_l1456) begin
      case(switch_CsrPlugin_l1460)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode) begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if(when_DebugPlugin_l344) begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode) begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowEbreakException = 1'b1;
    if(DebugPlugin_allowEBreak) begin
      CsrPlugin_allowEbreakException = 1'b0;
    end
  end

  assign CsrPlugin_xretAwayFromMachine = 1'b0;
  assign IBusCachedPlugin_externalFlush = (|{writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}});
  assign IBusCachedPlugin_jump_pcLoad_valid = (|{CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,{DBusCachedPlugin_redoBranch_valid,IBusCachedPlugin_predictionJumpInterface_valid}}});
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload = {IBusCachedPlugin_predictionJumpInterface_valid,{BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}};
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_1 = (_zz_IBusCachedPlugin_jump_pcLoad_payload & (~ _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1));
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_2 = _zz_IBusCachedPlugin_jump_pcLoad_payload_1[3];
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_3 = (_zz_IBusCachedPlugin_jump_pcLoad_payload_1[1] || _zz_IBusCachedPlugin_jump_pcLoad_payload_2);
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_4 = (_zz_IBusCachedPlugin_jump_pcLoad_payload_1[2] || _zz_IBusCachedPlugin_jump_pcLoad_payload_2);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_IBusCachedPlugin_jump_pcLoad_payload_5;
  always @(*) begin
    IBusCachedPlugin_fetchPc_correction = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusCachedPlugin_fetchPc_output_fire = (IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready);
  assign IBusCachedPlugin_fetchPc_corrected = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_correctionReg);
  always @(*) begin
    IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready) begin
      IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  assign when_Fetcher_l133 = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_pcRegPropagate);
  assign when_Fetcher_l133_1 = ((! IBusCachedPlugin_fetchPc_output_valid) && IBusCachedPlugin_fetchPc_output_ready);
  always @(*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_IBusCachedPlugin_fetchPc_pc);
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_fetchPc_redo_payload;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
    IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
  end

  always @(*) begin
    IBusCachedPlugin_fetchPc_flushed = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign when_Fetcher_l160 = (IBusCachedPlugin_fetchPc_booted && ((IBusCachedPlugin_fetchPc_output_ready || IBusCachedPlugin_fetchPc_correction) || IBusCachedPlugin_fetchPc_pcRegPropagate));
  assign IBusCachedPlugin_fetchPc_output_valid = ((! IBusCachedPlugin_fetcherHalt) && IBusCachedPlugin_fetchPc_booted);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_pc;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_redoFetch = 1'b0;
    if(IBusCachedPlugin_rsp_redoFetch) begin
      IBusCachedPlugin_iBusRsp_redoFetch = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_stages_0_input_valid = IBusCachedPlugin_fetchPc_output_valid;
  assign IBusCachedPlugin_fetchPc_output_ready = IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_payload = IBusCachedPlugin_fetchPc_output_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt) begin
      IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_ready && _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_valid;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_ready = IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_mmuBus_busy) begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_ready && _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_ready = IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b0;
    if(when_IBusCachedPlugin_l273) begin
      IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready = (! IBusCachedPlugin_iBusRsp_stages_2_halt);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_valid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_ready = (IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_ready && _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_valid = IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_ready = IBusCachedPlugin_iBusRsp_stages_2_output_ready;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_payload = IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_payload;
  assign IBusCachedPlugin_fetchPc_redo_valid = IBusCachedPlugin_iBusRsp_redoFetch;
  assign IBusCachedPlugin_fetchPc_redo_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_iBusRsp_flush = ((decode_arbitration_removeIt || (decode_arbitration_flushNext && (! decode_arbitration_isStuck))) || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_valid = IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_ready = ((1'b0 && (! IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid)) || IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_ready);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid = _zz_IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_ready = IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid)) || IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid = _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload = _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_valid = IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready = IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_payload = IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
    if(when_Fetcher_l322) begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign when_Fetcher_l242 = (IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_stages_2_input_valid);
  assign when_Fetcher_l322 = (! IBusCachedPlugin_pcValids_0);
  assign when_Fetcher_l331 = (! (! IBusCachedPlugin_iBusRsp_stages_1_input_ready));
  assign when_Fetcher_l331_1 = (! (! IBusCachedPlugin_iBusRsp_stages_2_input_ready));
  assign when_Fetcher_l331_2 = (! execute_arbitration_isStuck);
  assign when_Fetcher_l331_3 = (! memory_arbitration_isStuck);
  assign when_Fetcher_l331_4 = (! writeBack_arbitration_isStuck);
  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_1;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_4;
  assign IBusCachedPlugin_iBusRsp_output_ready = (! decode_arbitration_isStuck);
  always @(*) begin
    decode_arbitration_isValid = IBusCachedPlugin_iBusRsp_output_valid;
    case(IBusCachedPlugin_injector_port_state)
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      default : begin
      end
    endcase
    if(IBusCachedPlugin_forceNoDecodeCond) begin
      decode_arbitration_isValid = 1'b0;
    end
  end

  assign _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch = _zz__zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch[11];
  always @(*) begin
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[18] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[17] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[16] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[15] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[14] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[13] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[12] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[11] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[10] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[9] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[8] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[7] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[6] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[5] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[4] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[3] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[2] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[1] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[0] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  end

  always @(*) begin
    IBusCachedPlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == BranchCtrlEnum_JAL) || ((decode_BRANCH_CTRL == BranchCtrlEnum_B) && _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_2[31]));
    if(_zz_6) begin
      IBusCachedPlugin_decodePrediction_cmd_hadBranch = 1'b0;
    end
  end

  assign _zz_2 = _zz__zz_2[19];
  always @(*) begin
    _zz_3[10] = _zz_2;
    _zz_3[9] = _zz_2;
    _zz_3[8] = _zz_2;
    _zz_3[7] = _zz_2;
    _zz_3[6] = _zz_2;
    _zz_3[5] = _zz_2;
    _zz_3[4] = _zz_2;
    _zz_3[3] = _zz_2;
    _zz_3[2] = _zz_2;
    _zz_3[1] = _zz_2;
    _zz_3[0] = _zz_2;
  end

  assign _zz_4 = _zz__zz_4[11];
  always @(*) begin
    _zz_5[18] = _zz_4;
    _zz_5[17] = _zz_4;
    _zz_5[16] = _zz_4;
    _zz_5[15] = _zz_4;
    _zz_5[14] = _zz_4;
    _zz_5[13] = _zz_4;
    _zz_5[12] = _zz_4;
    _zz_5[11] = _zz_4;
    _zz_5[10] = _zz_4;
    _zz_5[9] = _zz_4;
    _zz_5[8] = _zz_4;
    _zz_5[7] = _zz_4;
    _zz_5[6] = _zz_4;
    _zz_5[5] = _zz_4;
    _zz_5[4] = _zz_4;
    _zz_5[3] = _zz_4;
    _zz_5[2] = _zz_4;
    _zz_5[1] = _zz_4;
    _zz_5[0] = _zz_4;
  end

  always @(*) begin
    case(decode_BRANCH_CTRL)
      BranchCtrlEnum_JAL : begin
        _zz_6 = _zz__zz_6[1];
      end
      default : begin
        _zz_6 = _zz__zz_6_1[1];
      end
    endcase
  end

  assign IBusCachedPlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusCachedPlugin_decodePrediction_cmd_hadBranch);
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload = _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload[19];
  always @(*) begin
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[10] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[9] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[8] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[7] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[6] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[5] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[4] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[3] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[2] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[1] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[0] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
  end

  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_2 = _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload_2[11];
  always @(*) begin
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[18] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[17] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[16] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[15] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[14] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[13] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[12] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[11] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[10] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[9] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[8] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[7] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[6] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[5] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[4] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[3] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[2] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[1] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[0] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
  end

  assign IBusCachedPlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == BranchCtrlEnum_JAL) ? {{_zz_IBusCachedPlugin_predictionJumpInterface_payload_1,{{{_zz_IBusCachedPlugin_predictionJumpInterface_payload_4,decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_IBusCachedPlugin_predictionJumpInterface_payload_3,{{{_zz_IBusCachedPlugin_predictionJumpInterface_payload_5,_zz_IBusCachedPlugin_predictionJumpInterface_payload_6},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @(*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign IBusCachedPlugin_cache_io_cpu_prefetch_isValid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_fetch_isValid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_fetch_isStuck = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_isValid = IBusCachedPlugin_cache_io_cpu_fetch_isValid;
  assign IBusCachedPlugin_mmuBus_cmd_0_isStuck = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_virtualAddress = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  assign IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign IBusCachedPlugin_mmuBus_end = (IBusCachedPlugin_iBusRsp_stages_1_input_ready || IBusCachedPlugin_externalFlush);
  assign IBusCachedPlugin_cache_io_cpu_decode_isValid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_decode_isStuck = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_cache_io_cpu_decode_isUser = (CsrPlugin_privilege == 2'b00);
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_rsp_issueDetected = 1'b0;
  always @(*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(when_IBusCachedPlugin_l245) begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_cache_io_cpu_fill_valid = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_cache_io_cpu_fill_valid = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(when_IBusCachedPlugin_l262) begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @(*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = 4'bxxxx;
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b1100;
    end
    if(when_IBusCachedPlugin_l262) begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b0001;
    end
  end

  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_stages_2_input_payload[31 : 2],2'b00};
  assign when_IBusCachedPlugin_l245 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! IBusCachedPlugin_rsp_issueDetected));
  assign when_IBusCachedPlugin_l250 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_mmuException) && (! IBusCachedPlugin_rsp_issueDetected_1));
  assign when_IBusCachedPlugin_l256 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! IBusCachedPlugin_rsp_issueDetected_2));
  assign when_IBusCachedPlugin_l262 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_error) && (! IBusCachedPlugin_rsp_issueDetected_3));
  assign when_IBusCachedPlugin_l273 = (IBusCachedPlugin_rsp_issueDetected_4 || IBusCachedPlugin_rsp_iBusRspOutputHalt);
  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  assign IBusCachedPlugin_cache_io_flush = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign dBus_cmd_valid = dataCache_1_io_mem_cmd_valid;
  assign dBus_cmd_payload_wr = dataCache_1_io_mem_cmd_payload_wr;
  assign dBus_cmd_payload_uncached = dataCache_1_io_mem_cmd_payload_uncached;
  assign dBus_cmd_payload_address = dataCache_1_io_mem_cmd_payload_address;
  assign dBus_cmd_payload_data = dataCache_1_io_mem_cmd_payload_data;
  assign dBus_cmd_payload_mask = dataCache_1_io_mem_cmd_payload_mask;
  assign dBus_cmd_payload_size = dataCache_1_io_mem_cmd_payload_size;
  assign dBus_cmd_payload_last = dataCache_1_io_mem_cmd_payload_last;
  assign when_DBusCachedPlugin_l353 = ((DBusCachedPlugin_mmuBus_busy && decode_arbitration_isValid) && decode_MEMORY_ENABLE);
  assign execute_DBusCachedPlugin_size = execute_INSTRUCTION[13 : 12];
  assign dataCache_1_io_cpu_execute_isValid = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
  assign dataCache_1_io_cpu_execute_address = execute_SRC_ADD;
  always @(*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        _zz_execute_MEMORY_STORE_DATA_RF = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_execute_MEMORY_STORE_DATA_RF = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_execute_MEMORY_STORE_DATA_RF = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dataCache_1_io_cpu_flush_valid = (execute_arbitration_isValid && execute_MEMORY_MANAGMENT);
  assign dataCache_1_io_cpu_flush_payload_singleLine = (execute_INSTRUCTION[19 : 15] != 5'h0);
  assign dataCache_1_io_cpu_flush_payload_lineId = _zz_io_cpu_flush_payload_lineId[6:0];
  assign when_DBusCachedPlugin_l395 = ((dataCache_1_io_cpu_flush_valid && (! dataCache_1_io_cpu_flush_ready)) || dataCache_1_io_cpu_execute_haltIt);
  assign when_DBusCachedPlugin_l411 = (dataCache_1_io_cpu_execute_refilling && execute_arbitration_isValid);
  assign dataCache_1_io_cpu_memory_isValid = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
  assign dataCache_1_io_cpu_memory_address = memory_REGFILE_WRITE_DATA;
  assign DBusCachedPlugin_mmuBus_cmd_0_isValid = dataCache_1_io_cpu_memory_isValid;
  assign DBusCachedPlugin_mmuBus_cmd_0_isStuck = memory_arbitration_isStuck;
  assign DBusCachedPlugin_mmuBus_cmd_0_virtualAddress = dataCache_1_io_cpu_memory_address;
  assign DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign DBusCachedPlugin_mmuBus_end = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  always @(*) begin
    dataCache_1_io_cpu_memory_mmuRsp_isIoAccess = DBusCachedPlugin_mmuBus_rsp_isIoAccess;
    if(when_DBusCachedPlugin_l473) begin
      dataCache_1_io_cpu_memory_mmuRsp_isIoAccess = 1'b1;
    end
  end

  assign when_DBusCachedPlugin_l473 = (_zz_when_DBusCachedPlugin_l473 && (! dataCache_1_io_cpu_memory_isWrite));
  always @(*) begin
    dataCache_1_io_cpu_writeBack_isValid = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
    if(writeBack_arbitration_haltByOther) begin
      dataCache_1_io_cpu_writeBack_isValid = 1'b0;
    end
  end

  assign dataCache_1_io_cpu_writeBack_isUser = (CsrPlugin_privilege == 2'b00);
  assign dataCache_1_io_cpu_writeBack_address = writeBack_REGFILE_WRITE_DATA;
  assign dataCache_1_io_cpu_writeBack_storeData[31 : 0] = writeBack_MEMORY_STORE_DATA_RF;
  always @(*) begin
    DBusCachedPlugin_redoBranch_valid = 1'b0;
    if(when_DBusCachedPlugin_l534) begin
      if(dataCache_1_io_cpu_redo) begin
        DBusCachedPlugin_redoBranch_valid = 1'b1;
      end
    end
  end

  assign DBusCachedPlugin_redoBranch_payload = writeBack_PC;
  always @(*) begin
    DBusCachedPlugin_exceptionBus_valid = 1'b0;
    if(when_DBusCachedPlugin_l534) begin
      if(dataCache_1_io_cpu_writeBack_accessError) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_mmuException) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_redo) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b0;
      end
    end
  end

  assign DBusCachedPlugin_exceptionBus_payload_badAddr = writeBack_REGFILE_WRITE_DATA;
  always @(*) begin
    DBusCachedPlugin_exceptionBus_payload_code = 4'bxxxx;
    if(when_DBusCachedPlugin_l534) begin
      if(dataCache_1_io_cpu_writeBack_accessError) begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_DBusCachedPlugin_exceptionBus_payload_code};
      end
      if(dataCache_1_io_cpu_writeBack_mmuException) begin
        DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? 4'b1111 : 4'b1101);
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess) begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_DBusCachedPlugin_exceptionBus_payload_code_1};
      end
    end
  end

  assign when_DBusCachedPlugin_l534 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign when_DBusCachedPlugin_l554 = (dataCache_1_io_cpu_writeBack_isValid && dataCache_1_io_cpu_writeBack_haltIt);
  assign writeBack_DBusCachedPlugin_rspData = dataCache_1_io_cpu_writeBack_data;
  assign writeBack_DBusCachedPlugin_rspSplits_0 = writeBack_DBusCachedPlugin_rspData[7 : 0];
  assign writeBack_DBusCachedPlugin_rspSplits_1 = writeBack_DBusCachedPlugin_rspData[15 : 8];
  assign writeBack_DBusCachedPlugin_rspSplits_2 = writeBack_DBusCachedPlugin_rspData[23 : 16];
  assign writeBack_DBusCachedPlugin_rspSplits_3 = writeBack_DBusCachedPlugin_rspData[31 : 24];
  always @(*) begin
    writeBack_DBusCachedPlugin_rspShifted[7 : 0] = _zz_writeBack_DBusCachedPlugin_rspShifted;
    writeBack_DBusCachedPlugin_rspShifted[15 : 8] = _zz_writeBack_DBusCachedPlugin_rspShifted_2;
    writeBack_DBusCachedPlugin_rspShifted[23 : 16] = writeBack_DBusCachedPlugin_rspSplits_2;
    writeBack_DBusCachedPlugin_rspShifted[31 : 24] = writeBack_DBusCachedPlugin_rspSplits_3;
  end

  assign writeBack_DBusCachedPlugin_rspRf = writeBack_DBusCachedPlugin_rspShifted[31 : 0];
  assign switch_Misc_l245 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_writeBack_DBusCachedPlugin_rspFormated = (writeBack_DBusCachedPlugin_rspRf[7] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[31] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[30] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[29] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[28] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[27] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[26] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[25] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[24] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[23] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[22] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[21] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[20] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[19] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[18] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[17] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[16] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[15] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[14] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[13] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[12] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[11] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[10] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[9] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[8] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[7 : 0] = writeBack_DBusCachedPlugin_rspRf[7 : 0];
  end

  assign _zz_writeBack_DBusCachedPlugin_rspFormated_2 = (writeBack_DBusCachedPlugin_rspRf[15] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[31] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[30] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[29] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[28] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[27] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[26] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[25] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[24] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[23] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[22] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[21] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[20] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[19] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[18] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[17] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[16] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[15 : 0] = writeBack_DBusCachedPlugin_rspRf[15 : 0];
  end

  always @(*) begin
    case(switch_Misc_l245)
      2'b00 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_writeBack_DBusCachedPlugin_rspFormated_1;
      end
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_writeBack_DBusCachedPlugin_rspFormated_3;
      end
      default : begin
        writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspRf;
      end
    endcase
  end

  assign when_DBusCachedPlugin_l581 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  assign IBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b0001);
  assign IBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign IBusCachedPlugin_mmuBus_busy = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_physicalAddress = DBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  assign DBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_isIoAccess = (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b0001);
  assign DBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign DBusCachedPlugin_mmuBus_busy = 1'b0;
  assign _zz_decode_IS_CSR_1 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_decode_IS_CSR_2 = ((decode_INSTRUCTION & 32'h00000018) == 32'h0);
  assign _zz_decode_IS_CSR_3 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_decode_IS_CSR_4 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_decode_IS_CSR_5 = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_decode_IS_CSR_6 = ((decode_INSTRUCTION & 32'h00103050) == 32'h00100050);
  assign _zz_decode_IS_CSR = {(|_zz_decode_IS_CSR_6),{(|((decode_INSTRUCTION & _zz__zz_decode_IS_CSR) == 32'h00000050)),{(|{_zz_decode_IS_CSR_6,_zz__zz_decode_IS_CSR_1}),{(|{_zz__zz_decode_IS_CSR_2,_zz__zz_decode_IS_CSR_4}),{(|_zz__zz_decode_IS_CSR_6),{_zz__zz_decode_IS_CSR_9,{_zz__zz_decode_IS_CSR_12,_zz__zz_decode_IS_CSR_13}}}}}}};
  assign _zz_decode_SRC1_CTRL_2 = _zz_decode_IS_CSR[2 : 1];
  assign _zz_decode_SRC1_CTRL_1 = _zz_decode_SRC1_CTRL_2;
  assign _zz_decode_ALU_CTRL_2 = _zz_decode_IS_CSR[7 : 6];
  assign _zz_decode_ALU_CTRL_1 = _zz_decode_ALU_CTRL_2;
  assign _zz_decode_SRC2_CTRL_2 = _zz_decode_IS_CSR[9 : 8];
  assign _zz_decode_SRC2_CTRL_1 = _zz_decode_SRC2_CTRL_2;
  assign _zz_decode_ALU_BITWISE_CTRL_2 = _zz_decode_IS_CSR[19 : 18];
  assign _zz_decode_ALU_BITWISE_CTRL_1 = _zz_decode_ALU_BITWISE_CTRL_2;
  assign _zz_decode_SHIFT_CTRL_2 = _zz_decode_IS_CSR[22 : 21];
  assign _zz_decode_SHIFT_CTRL_1 = _zz_decode_SHIFT_CTRL_2;
  assign _zz_decode_BRANCH_CTRL_2 = _zz_decode_IS_CSR[28 : 27];
  assign _zz_decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_2;
  assign _zz_decode_ENV_CTRL_2 = _zz_decode_IS_CSR[31 : 30];
  assign _zz_decode_ENV_CTRL_1 = _zz_decode_ENV_CTRL_2;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign when_RegFilePlugin_l63 = (decode_INSTRUCTION[11 : 7] == 5'h0);
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = RegFilePlugin_regFile_spinal_port0;
  assign decode_RegFilePlugin_rs2Data = RegFilePlugin_regFile_spinal_port1;
  always @(*) begin
    lastStageRegFileWrite_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
    if(_zz_10) begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
    if(_zz_10) begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_data = _zz_decode_RS2_2;
    if(_zz_10) begin
      lastStageRegFileWrite_payload_data = 32'h0;
    end
  end

  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      AluBitwiseCtrlEnum_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_BITWISE : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_IntAluPlugin_bitwise;
      end
      AluCtrlEnum_SLT_SLTU : begin
        _zz_execute_REGFILE_WRITE_DATA = {31'd0, _zz__zz_execute_REGFILE_WRITE_DATA};
      end
      default : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @(*) begin
    case(execute_SRC1_CTRL)
      Src1CtrlEnum_RS : begin
        _zz_execute_SRC1 = execute_RS1;
      end
      Src1CtrlEnum_PC_INCREMENT : begin
        _zz_execute_SRC1 = {29'd0, _zz__zz_execute_SRC1};
      end
      Src1CtrlEnum_IMU : begin
        _zz_execute_SRC1 = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_execute_SRC1 = {27'd0, _zz__zz_execute_SRC1_1};
      end
    endcase
  end

  assign _zz_execute_SRC2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_SRC2_1[19] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[18] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[17] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[16] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[15] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[14] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[13] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[12] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[11] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[10] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[9] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[8] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[7] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[6] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[5] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[4] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[3] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[2] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[1] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[0] = _zz_execute_SRC2;
  end

  assign _zz_execute_SRC2_2 = _zz__zz_execute_SRC2_2[11];
  always @(*) begin
    _zz_execute_SRC2_3[19] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[18] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[17] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[16] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[15] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[14] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[13] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[12] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[11] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[10] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[9] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[8] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[7] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[6] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[5] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[4] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[3] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[2] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[1] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[0] = _zz_execute_SRC2_2;
  end

  always @(*) begin
    case(execute_SRC2_CTRL)
      Src2CtrlEnum_RS : begin
        _zz_execute_SRC2_4 = execute_RS2;
      end
      Src2CtrlEnum_IMI : begin
        _zz_execute_SRC2_4 = {_zz_execute_SRC2_1,execute_INSTRUCTION[31 : 20]};
      end
      Src2CtrlEnum_IMS : begin
        _zz_execute_SRC2_4 = {_zz_execute_SRC2_3,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_execute_SRC2_4 = _zz_execute_to_memory_PC;
      end
    endcase
  end

  always @(*) begin
    execute_SrcPlugin_addSub = _zz_execute_SrcPlugin_addSub;
    if(execute_SRC2_FORCE_ZERO) begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @(*) begin
    _zz_execute_FullBarrelShifterPlugin_reversed[0] = execute_SRC1[31];
    _zz_execute_FullBarrelShifterPlugin_reversed[1] = execute_SRC1[30];
    _zz_execute_FullBarrelShifterPlugin_reversed[2] = execute_SRC1[29];
    _zz_execute_FullBarrelShifterPlugin_reversed[3] = execute_SRC1[28];
    _zz_execute_FullBarrelShifterPlugin_reversed[4] = execute_SRC1[27];
    _zz_execute_FullBarrelShifterPlugin_reversed[5] = execute_SRC1[26];
    _zz_execute_FullBarrelShifterPlugin_reversed[6] = execute_SRC1[25];
    _zz_execute_FullBarrelShifterPlugin_reversed[7] = execute_SRC1[24];
    _zz_execute_FullBarrelShifterPlugin_reversed[8] = execute_SRC1[23];
    _zz_execute_FullBarrelShifterPlugin_reversed[9] = execute_SRC1[22];
    _zz_execute_FullBarrelShifterPlugin_reversed[10] = execute_SRC1[21];
    _zz_execute_FullBarrelShifterPlugin_reversed[11] = execute_SRC1[20];
    _zz_execute_FullBarrelShifterPlugin_reversed[12] = execute_SRC1[19];
    _zz_execute_FullBarrelShifterPlugin_reversed[13] = execute_SRC1[18];
    _zz_execute_FullBarrelShifterPlugin_reversed[14] = execute_SRC1[17];
    _zz_execute_FullBarrelShifterPlugin_reversed[15] = execute_SRC1[16];
    _zz_execute_FullBarrelShifterPlugin_reversed[16] = execute_SRC1[15];
    _zz_execute_FullBarrelShifterPlugin_reversed[17] = execute_SRC1[14];
    _zz_execute_FullBarrelShifterPlugin_reversed[18] = execute_SRC1[13];
    _zz_execute_FullBarrelShifterPlugin_reversed[19] = execute_SRC1[12];
    _zz_execute_FullBarrelShifterPlugin_reversed[20] = execute_SRC1[11];
    _zz_execute_FullBarrelShifterPlugin_reversed[21] = execute_SRC1[10];
    _zz_execute_FullBarrelShifterPlugin_reversed[22] = execute_SRC1[9];
    _zz_execute_FullBarrelShifterPlugin_reversed[23] = execute_SRC1[8];
    _zz_execute_FullBarrelShifterPlugin_reversed[24] = execute_SRC1[7];
    _zz_execute_FullBarrelShifterPlugin_reversed[25] = execute_SRC1[6];
    _zz_execute_FullBarrelShifterPlugin_reversed[26] = execute_SRC1[5];
    _zz_execute_FullBarrelShifterPlugin_reversed[27] = execute_SRC1[4];
    _zz_execute_FullBarrelShifterPlugin_reversed[28] = execute_SRC1[3];
    _zz_execute_FullBarrelShifterPlugin_reversed[29] = execute_SRC1[2];
    _zz_execute_FullBarrelShifterPlugin_reversed[30] = execute_SRC1[1];
    _zz_execute_FullBarrelShifterPlugin_reversed[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == ShiftCtrlEnum_SLL_1) ? _zz_execute_FullBarrelShifterPlugin_reversed : execute_SRC1);
  always @(*) begin
    _zz_decode_RS2_3[0] = memory_SHIFT_RIGHT[31];
    _zz_decode_RS2_3[1] = memory_SHIFT_RIGHT[30];
    _zz_decode_RS2_3[2] = memory_SHIFT_RIGHT[29];
    _zz_decode_RS2_3[3] = memory_SHIFT_RIGHT[28];
    _zz_decode_RS2_3[4] = memory_SHIFT_RIGHT[27];
    _zz_decode_RS2_3[5] = memory_SHIFT_RIGHT[26];
    _zz_decode_RS2_3[6] = memory_SHIFT_RIGHT[25];
    _zz_decode_RS2_3[7] = memory_SHIFT_RIGHT[24];
    _zz_decode_RS2_3[8] = memory_SHIFT_RIGHT[23];
    _zz_decode_RS2_3[9] = memory_SHIFT_RIGHT[22];
    _zz_decode_RS2_3[10] = memory_SHIFT_RIGHT[21];
    _zz_decode_RS2_3[11] = memory_SHIFT_RIGHT[20];
    _zz_decode_RS2_3[12] = memory_SHIFT_RIGHT[19];
    _zz_decode_RS2_3[13] = memory_SHIFT_RIGHT[18];
    _zz_decode_RS2_3[14] = memory_SHIFT_RIGHT[17];
    _zz_decode_RS2_3[15] = memory_SHIFT_RIGHT[16];
    _zz_decode_RS2_3[16] = memory_SHIFT_RIGHT[15];
    _zz_decode_RS2_3[17] = memory_SHIFT_RIGHT[14];
    _zz_decode_RS2_3[18] = memory_SHIFT_RIGHT[13];
    _zz_decode_RS2_3[19] = memory_SHIFT_RIGHT[12];
    _zz_decode_RS2_3[20] = memory_SHIFT_RIGHT[11];
    _zz_decode_RS2_3[21] = memory_SHIFT_RIGHT[10];
    _zz_decode_RS2_3[22] = memory_SHIFT_RIGHT[9];
    _zz_decode_RS2_3[23] = memory_SHIFT_RIGHT[8];
    _zz_decode_RS2_3[24] = memory_SHIFT_RIGHT[7];
    _zz_decode_RS2_3[25] = memory_SHIFT_RIGHT[6];
    _zz_decode_RS2_3[26] = memory_SHIFT_RIGHT[5];
    _zz_decode_RS2_3[27] = memory_SHIFT_RIGHT[4];
    _zz_decode_RS2_3[28] = memory_SHIFT_RIGHT[3];
    _zz_decode_RS2_3[29] = memory_SHIFT_RIGHT[2];
    _zz_decode_RS2_3[30] = memory_SHIFT_RIGHT[1];
    _zz_decode_RS2_3[31] = memory_SHIFT_RIGHT[0];
  end

  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  assign switch_MulPlugin_l87 = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    case(switch_MulPlugin_l87)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(switch_MulPlugin_l87)
      2'b01 : begin
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign writeBack_MulPlugin_result = ($signed(_zz_writeBack_MulPlugin_result) + $signed(_zz_writeBack_MulPlugin_result_1));
  assign when_MulPlugin_l147 = (writeBack_arbitration_isValid && writeBack_IS_MUL);
  assign switch_MulPlugin_l148 = writeBack_INSTRUCTION[13 : 12];
  assign memory_DivPlugin_frontendOk = 1'b1;
  always @(*) begin
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(when_MulDivIterativePlugin_l162) begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == 6'h21);
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @(*) begin
    if(memory_DivPlugin_div_counter_willOverflow) begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_memory_DivPlugin_div_counter_valueNext);
    end
    if(memory_DivPlugin_div_counter_willClear) begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign when_MulDivIterativePlugin_l126 = (memory_DivPlugin_div_counter_value == 6'h20);
  assign when_MulDivIterativePlugin_l126_1 = (! memory_arbitration_isStuck);
  assign when_MulDivIterativePlugin_l128 = (memory_arbitration_isValid && memory_IS_DIV);
  assign when_MulDivIterativePlugin_l129 = ((! memory_DivPlugin_frontendOk) || (! memory_DivPlugin_div_done));
  assign when_MulDivIterativePlugin_l132 = (memory_DivPlugin_frontendOk && (! memory_DivPlugin_div_done));
  assign _zz_memory_DivPlugin_div_stage_0_remainderShifted = memory_DivPlugin_rs1[31 : 0];
  assign memory_DivPlugin_div_stage_0_remainderShifted = {memory_DivPlugin_accumulator[31 : 0],_zz_memory_DivPlugin_div_stage_0_remainderShifted[31]};
  assign memory_DivPlugin_div_stage_0_remainderMinusDenominator = (memory_DivPlugin_div_stage_0_remainderShifted - _zz_memory_DivPlugin_div_stage_0_remainderMinusDenominator);
  assign memory_DivPlugin_div_stage_0_outRemainder = ((! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_memory_DivPlugin_div_stage_0_outRemainder : _zz_memory_DivPlugin_div_stage_0_outRemainder_1);
  assign memory_DivPlugin_div_stage_0_outNumerator = _zz_memory_DivPlugin_div_stage_0_outNumerator[31:0];
  assign when_MulDivIterativePlugin_l151 = (memory_DivPlugin_div_counter_value == 6'h20);
  assign _zz_memory_DivPlugin_div_result = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign when_MulDivIterativePlugin_l162 = (! memory_arbitration_isStuck);
  assign _zz_memory_DivPlugin_rs2 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_memory_DivPlugin_rs1 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @(*) begin
    _zz_memory_DivPlugin_rs1_1[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_memory_DivPlugin_rs1_1[31 : 0] = execute_RS1;
  end

  always @(*) begin
    HazardSimplePlugin_src0Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l48) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l48_1) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l48_2) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l105) begin
      HazardSimplePlugin_src0Hazard = 1'b0;
    end
  end

  always @(*) begin
    HazardSimplePlugin_src1Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l51) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l51_1) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l51_2) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l108) begin
      HazardSimplePlugin_src1Hazard = 1'b0;
    end
  end

  assign HazardSimplePlugin_writeBackWrites_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
  assign HazardSimplePlugin_writeBackWrites_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
  assign HazardSimplePlugin_writeBackWrites_payload_data = _zz_decode_RS2_2;
  assign HazardSimplePlugin_addr0Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[19 : 15]);
  assign HazardSimplePlugin_addr1Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l47 = 1'b1;
  assign when_HazardSimplePlugin_l48 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58 = (1'b0 || (! when_HazardSimplePlugin_l47));
  assign when_HazardSimplePlugin_l48_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_1 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign when_HazardSimplePlugin_l48_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_2 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign when_HazardSimplePlugin_l105 = (! decode_RS1_USE);
  assign when_HazardSimplePlugin_l108 = (! decode_RS2_USE);
  assign when_HazardSimplePlugin_l113 = (decode_arbitration_isValid && (HazardSimplePlugin_src0Hazard || HazardSimplePlugin_src1Hazard));
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign switch_Misc_l245_1 = execute_INSTRUCTION[14 : 12];
  always @(*) begin
    case(switch_Misc_l245_1)
      3'b000 : begin
        _zz_execute_BRANCH_COND_RESULT = execute_BranchPlugin_eq;
      end
      3'b001 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_BranchPlugin_eq);
      end
      3'b101 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_SRC_LESS);
      end
      3'b111 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_SRC_LESS);
      end
      default : begin
        _zz_execute_BRANCH_COND_RESULT = execute_SRC_LESS;
      end
    endcase
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b0;
      end
      BranchCtrlEnum_JAL : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b1;
      end
      BranchCtrlEnum_JALR : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b1;
      end
      default : begin
        _zz_execute_BRANCH_COND_RESULT_1 = _zz_execute_BRANCH_COND_RESULT;
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_missAlignedTarget = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_missAlignedTarget_1[19] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[18] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[17] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[16] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[15] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[14] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[13] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[12] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[11] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[10] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[9] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[8] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[7] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[6] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[5] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[4] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[3] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[2] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[1] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[0] = _zz_execute_BranchPlugin_missAlignedTarget;
  end

  assign _zz_execute_BranchPlugin_missAlignedTarget_2 = _zz__zz_execute_BranchPlugin_missAlignedTarget_2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_missAlignedTarget_3[10] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[9] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[8] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[7] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[6] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[5] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[4] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[3] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[2] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[1] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[0] = _zz_execute_BranchPlugin_missAlignedTarget_2;
  end

  assign _zz_execute_BranchPlugin_missAlignedTarget_4 = _zz__zz_execute_BranchPlugin_missAlignedTarget_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_missAlignedTarget_5[18] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[17] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[16] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[15] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[14] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[13] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[12] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[11] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[10] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[9] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[8] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[7] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[6] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[5] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[4] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[3] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[2] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[1] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[0] = _zz_execute_BranchPlugin_missAlignedTarget_4;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        _zz_execute_BranchPlugin_missAlignedTarget_6 = (_zz__zz_execute_BranchPlugin_missAlignedTarget_6[1] ^ execute_RS1[1]);
      end
      BranchCtrlEnum_JAL : begin
        _zz_execute_BranchPlugin_missAlignedTarget_6 = _zz__zz_execute_BranchPlugin_missAlignedTarget_6_1[1];
      end
      default : begin
        _zz_execute_BranchPlugin_missAlignedTarget_6 = _zz__zz_execute_BranchPlugin_missAlignedTarget_6_2[1];
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = (execute_BRANCH_COND_RESULT && _zz_execute_BranchPlugin_missAlignedTarget_6);
  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_branch_src2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_1[19] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[18] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[17] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[16] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[15] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[14] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[13] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[12] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[11] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[10] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[9] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[8] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[7] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[6] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[5] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[4] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[3] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[2] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[1] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[0] = _zz_execute_BranchPlugin_branch_src2;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_execute_BranchPlugin_branch_src2_1,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == BranchCtrlEnum_JAL) ? {{_zz_execute_BranchPlugin_branch_src2_3,{{{_zz_execute_BranchPlugin_branch_src2_6,_zz_execute_BranchPlugin_branch_src2_7},_zz_execute_BranchPlugin_branch_src2_8},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_execute_BranchPlugin_branch_src2_5,{{{_zz_execute_BranchPlugin_branch_src2_9,_zz_execute_BranchPlugin_branch_src2_10},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED1) begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_execute_BranchPlugin_branch_src2_11};
        end
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_branch_src2_2 = _zz__zz_execute_BranchPlugin_branch_src2_2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_3[10] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[9] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[8] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[7] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[6] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[5] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[4] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[3] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[2] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[1] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[0] = _zz_execute_BranchPlugin_branch_src2_2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_4 = _zz__zz_execute_BranchPlugin_branch_src2_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_5[18] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[17] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[16] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[15] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[14] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[13] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[12] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[11] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[10] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[9] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[8] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[7] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[6] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[5] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[4] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[3] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[2] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[1] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[0] = _zz_execute_BranchPlugin_branch_src2_4;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign BranchPlugin_branchExceptionPort_valid = (memory_arbitration_isValid && (memory_BRANCH_DO && memory_BRANCH_CALC[1]));
  assign BranchPlugin_branchExceptionPort_payload_code = 4'b0000;
  assign BranchPlugin_branchExceptionPort_payload_badAddr = memory_BRANCH_CALC;
  assign IBusCachedPlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  always @(*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire) begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign CsrPlugin_mtvec_mode = 2'b00;
  assign _zz_when_CsrPlugin_l1302 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_when_CsrPlugin_l1302_1 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_when_CsrPlugin_l1302_2 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1[0];
  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(CsrPlugin_selfException_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(BranchPlugin_branchExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(DBusCachedPlugin_exceptionBus_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b1;
    end
    if(writeBack_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign when_CsrPlugin_l1259 = (! decode_arbitration_isStuck);
  assign when_CsrPlugin_l1259_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1259_2 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l1259_3 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l1272 = (|{CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}});
  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign when_CsrPlugin_l1296 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign when_CsrPlugin_l1302 = ((_zz_when_CsrPlugin_l1302 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l1302_1 = ((_zz_when_CsrPlugin_l1302_1 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l1302_2 = ((_zz_when_CsrPlugin_l1302_2 && 1'b1) && (! 1'b0));
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  assign when_CsrPlugin_l1335 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1335_1 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l1335_2 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l1340 = ((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt);
  always @(*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(when_CsrPlugin_l1346) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign when_CsrPlugin_l1346 = (|{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}});
  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @(*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException) begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @(*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException) begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  assign CsrPlugin_trapCauseEbreakDebug = 1'b0;
  always @(*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    CsrPlugin_xtvec_base = 30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign CsrPlugin_trapEnterDebug = 1'b0;
  assign when_CsrPlugin_l1390 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign when_CsrPlugin_l1398 = (! CsrPlugin_trapEnterDebug);
  assign when_CsrPlugin_l1456 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET));
  assign switch_CsrPlugin_l1460 = writeBack_INSTRUCTION[29 : 28];
  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign when_CsrPlugin_l1527 = (|{(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == EnvCtrlEnum_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET))}});
  assign execute_CsrPlugin_blockedBySideEffects = ((|{writeBack_arbitration_isValid,memory_arbitration_isValid}) || 1'b0);
  always @(*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_773) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_833) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_832) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_835) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2816) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_2944) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_2818) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_2946) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(CsrPlugin_csrMapping_allowCsrSignal) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(when_CsrPlugin_l1719) begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(when_CsrPlugin_l1725) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if(when_CsrPlugin_l1547) begin
      if(when_CsrPlugin_l1548) begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @(*) begin
    CsrPlugin_selfException_valid = 1'b0;
    if(when_CsrPlugin_l1555) begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(when_CsrPlugin_l1565) begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_selfException_payload_code = 4'bxxxx;
    if(when_CsrPlugin_l1555) begin
      case(CsrPlugin_privilege)
        2'b00 : begin
          CsrPlugin_selfException_payload_code = 4'b1000;
        end
        default : begin
          CsrPlugin_selfException_payload_code = 4'b1011;
        end
      endcase
    end
    if(when_CsrPlugin_l1565) begin
      CsrPlugin_selfException_payload_code = 4'b0011;
    end
  end

  assign CsrPlugin_selfException_payload_badAddr = execute_INSTRUCTION;
  assign when_CsrPlugin_l1547 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET));
  assign when_CsrPlugin_l1548 = (CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]);
  assign when_CsrPlugin_l1555 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_ECALL));
  assign when_CsrPlugin_l1565 = ((execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_EBREAK)) && CsrPlugin_allowEbreakException);
  always @(*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(when_CsrPlugin_l1719) begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(when_CsrPlugin_l1719) begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign CsrPlugin_csrMapping_hazardFree = (! execute_CsrPlugin_blockedBySideEffects);
  assign execute_CsrPlugin_readToWriteData = CsrPlugin_csrMapping_readDataSignal;
  assign switch_Misc_l245_2 = execute_INSTRUCTION[13];
  always @(*) begin
    case(switch_Misc_l245_2)
      1'b0 : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = execute_SRC1;
      end
      default : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign CsrPlugin_csrMapping_writeDataSignal = _zz_CsrPlugin_csrMapping_writeDataSignal;
  assign when_CsrPlugin_l1587 = (execute_arbitration_isValid && execute_IS_CSR);
  assign when_CsrPlugin_l1591 = (execute_arbitration_isValid && (execute_IS_CSR || 1'b0));
  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign when_DebugPlugin_l238 = (DebugPlugin_haltIt && (! DebugPlugin_isPipBusy));
  assign DebugPlugin_allowEBreak = (DebugPlugin_debugUsed && (! DebugPlugin_disableEbreak));
  always @(*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l280)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            debug_bus_cmd_ready = DebugPlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if(when_DebugPlugin_l257) begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign when_DebugPlugin_l257 = (! _zz_when_DebugPlugin_l257);
  always @(*) begin
    DebugPlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l280)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            DebugPlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign DebugPlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign switch_DebugPlugin_l280 = debug_bus_cmd_payload_address[7 : 2];
  assign when_DebugPlugin_l284 = debug_bus_cmd_payload_data[16];
  assign when_DebugPlugin_l284_1 = debug_bus_cmd_payload_data[24];
  assign when_DebugPlugin_l285 = debug_bus_cmd_payload_data[17];
  assign when_DebugPlugin_l285_1 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l286 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l287 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l288 = debug_bus_cmd_payload_data[18];
  assign when_DebugPlugin_l288_1 = debug_bus_cmd_payload_data[26];
  assign when_DebugPlugin_l308 = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign when_DebugPlugin_l311 = ((|{writeBack_arbitration_isValid,memory_arbitration_isValid}) == 1'b0);
  assign when_DebugPlugin_l324 = (DebugPlugin_stepIt && IBusCachedPlugin_incomingInstruction);
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign when_DebugPlugin_l344 = (DebugPlugin_haltIt || DebugPlugin_stepIt);
  assign when_Pipeline_l124 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_1 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_2 = ((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack));
  assign when_Pipeline_l124_3 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_4 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_5 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_6 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_7 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_8 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_9 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_SRC1_CTRL_1 = decode_SRC1_CTRL;
  assign _zz_decode_SRC1_CTRL = _zz_decode_SRC1_CTRL_1;
  assign when_Pipeline_l124_10 = (! execute_arbitration_isStuck);
  assign _zz_execute_SRC1_CTRL = decode_to_execute_SRC1_CTRL;
  assign when_Pipeline_l124_11 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_12 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_13 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_14 = (! writeBack_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_CTRL_1 = decode_ALU_CTRL;
  assign _zz_decode_ALU_CTRL = _zz_decode_ALU_CTRL_1;
  assign when_Pipeline_l124_15 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_CTRL = decode_to_execute_ALU_CTRL;
  assign _zz_decode_to_execute_SRC2_CTRL_1 = decode_SRC2_CTRL;
  assign _zz_decode_SRC2_CTRL = _zz_decode_SRC2_CTRL_1;
  assign when_Pipeline_l124_16 = (! execute_arbitration_isStuck);
  assign _zz_execute_SRC2_CTRL = decode_to_execute_SRC2_CTRL;
  assign when_Pipeline_l124_17 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_18 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_19 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_20 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_21 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_22 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_23 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_24 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_25 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_26 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_27 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL_1 = decode_ALU_BITWISE_CTRL;
  assign _zz_decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL_1;
  assign when_Pipeline_l124_28 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_BITWISE_CTRL = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL_1 = decode_SHIFT_CTRL;
  assign _zz_execute_to_memory_SHIFT_CTRL_1 = execute_SHIFT_CTRL;
  assign _zz_decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL_1;
  assign when_Pipeline_l124_29 = (! execute_arbitration_isStuck);
  assign _zz_execute_SHIFT_CTRL = decode_to_execute_SHIFT_CTRL;
  assign when_Pipeline_l124_30 = (! memory_arbitration_isStuck);
  assign _zz_memory_SHIFT_CTRL = execute_to_memory_SHIFT_CTRL;
  assign when_Pipeline_l124_31 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_32 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_33 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_34 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_35 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_36 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_37 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_BRANCH_CTRL_1 = decode_BRANCH_CTRL;
  assign _zz_decode_BRANCH_CTRL_1 = _zz_decode_BRANCH_CTRL;
  assign when_Pipeline_l124_38 = (! execute_arbitration_isStuck);
  assign _zz_execute_BRANCH_CTRL = decode_to_execute_BRANCH_CTRL;
  assign when_Pipeline_l124_39 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ENV_CTRL_1 = decode_ENV_CTRL;
  assign _zz_execute_to_memory_ENV_CTRL_1 = execute_ENV_CTRL;
  assign _zz_memory_to_writeBack_ENV_CTRL_1 = memory_ENV_CTRL;
  assign _zz_decode_ENV_CTRL = _zz_decode_ENV_CTRL_1;
  assign when_Pipeline_l124_40 = (! execute_arbitration_isStuck);
  assign _zz_execute_ENV_CTRL = decode_to_execute_ENV_CTRL;
  assign when_Pipeline_l124_41 = (! memory_arbitration_isStuck);
  assign _zz_memory_ENV_CTRL = execute_to_memory_ENV_CTRL;
  assign when_Pipeline_l124_42 = (! writeBack_arbitration_isStuck);
  assign _zz_writeBack_ENV_CTRL = memory_to_writeBack_ENV_CTRL;
  assign when_Pipeline_l124_43 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_44 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_45 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_46 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_47 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_48 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_49 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_50 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_51 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_52 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_53 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_54 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_55 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_56 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_57 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_58 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_59 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_60 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_61 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_62 = (! writeBack_arbitration_isStuck);
  assign decode_arbitration_isFlushed = ((|{writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}}) || (|{writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}}));
  assign execute_arbitration_isFlushed = ((|{writeBack_arbitration_flushNext,memory_arbitration_flushNext}) || (|{writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}}));
  assign memory_arbitration_isFlushed = ((|writeBack_arbitration_flushNext) || (|{writeBack_arbitration_flushIt,memory_arbitration_flushIt}));
  assign writeBack_arbitration_isFlushed = (1'b0 || (|writeBack_arbitration_flushIt));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  assign when_Pipeline_l151 = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign when_Pipeline_l154 = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign when_Pipeline_l151_1 = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  assign when_Pipeline_l154_1 = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign when_Pipeline_l151_2 = ((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt);
  assign when_Pipeline_l154_2 = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  always @(*) begin
    DebugPlugin_injectionPort_ready = 1'b0;
    case(IBusCachedPlugin_injector_port_state)
      3'b100 : begin
        DebugPlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign when_Fetcher_l391 = (! decode_arbitration_isStuck);
  assign when_CsrPlugin_l1669 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_2 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_3 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_4 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_5 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_6 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_7 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_8 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_9 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_10 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_11 = (! execute_arbitration_isStuck);
  assign switch_CsrPlugin_l1031 = CsrPlugin_csrMapping_writeDataSignal[12 : 11];
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit = 32'h0;
    if(execute_CsrPlugin_csr_768) begin
      _zz_CsrPlugin_csrMapping_readDataInit[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_CsrPlugin_csrMapping_readDataInit[3 : 3] = CsrPlugin_mstatus_MIE;
      _zz_CsrPlugin_csrMapping_readDataInit[12 : 11] = CsrPlugin_mstatus_MPP;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_1 = 32'h0;
    if(execute_CsrPlugin_csr_836) begin
      _zz_CsrPlugin_csrMapping_readDataInit_1[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_CsrPlugin_csrMapping_readDataInit_1[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_CsrPlugin_csrMapping_readDataInit_1[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_2 = 32'h0;
    if(execute_CsrPlugin_csr_772) begin
      _zz_CsrPlugin_csrMapping_readDataInit_2[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_2[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_CsrPlugin_csrMapping_readDataInit_2[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_3 = 32'h0;
    if(execute_CsrPlugin_csr_773) begin
      _zz_CsrPlugin_csrMapping_readDataInit_3[31 : 2] = CsrPlugin_mtvec_base;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_4 = 32'h0;
    if(execute_CsrPlugin_csr_833) begin
      _zz_CsrPlugin_csrMapping_readDataInit_4[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_5 = 32'h0;
    if(execute_CsrPlugin_csr_832) begin
      _zz_CsrPlugin_csrMapping_readDataInit_5[31 : 0] = CsrPlugin_mscratch;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_6 = 32'h0;
    if(execute_CsrPlugin_csr_834) begin
      _zz_CsrPlugin_csrMapping_readDataInit_6[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_CsrPlugin_csrMapping_readDataInit_6[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_7 = 32'h0;
    if(execute_CsrPlugin_csr_835) begin
      _zz_CsrPlugin_csrMapping_readDataInit_7[31 : 0] = CsrPlugin_mtval;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_8 = 32'h0;
    if(execute_CsrPlugin_csr_2816) begin
      _zz_CsrPlugin_csrMapping_readDataInit_8[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_9 = 32'h0;
    if(execute_CsrPlugin_csr_2944) begin
      _zz_CsrPlugin_csrMapping_readDataInit_9[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_10 = 32'h0;
    if(execute_CsrPlugin_csr_2818) begin
      _zz_CsrPlugin_csrMapping_readDataInit_10[31 : 0] = CsrPlugin_minstret[31 : 0];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_11 = 32'h0;
    if(execute_CsrPlugin_csr_2946) begin
      _zz_CsrPlugin_csrMapping_readDataInit_11[31 : 0] = CsrPlugin_minstret[63 : 32];
    end
  end

  assign CsrPlugin_csrMapping_readDataInit = ((((_zz_CsrPlugin_csrMapping_readDataInit | _zz_CsrPlugin_csrMapping_readDataInit_1) | (_zz_CsrPlugin_csrMapping_readDataInit_2 | _zz_CsrPlugin_csrMapping_readDataInit_3)) | ((_zz_CsrPlugin_csrMapping_readDataInit_4 | _zz_CsrPlugin_csrMapping_readDataInit_5) | (_zz_CsrPlugin_csrMapping_readDataInit_6 | _zz_CsrPlugin_csrMapping_readDataInit_7))) | ((_zz_CsrPlugin_csrMapping_readDataInit_8 | _zz_CsrPlugin_csrMapping_readDataInit_9) | (_zz_CsrPlugin_csrMapping_readDataInit_10 | _zz_CsrPlugin_csrMapping_readDataInit_11)));
  assign when_CsrPlugin_l1702 = ((execute_arbitration_isValid && execute_IS_CSR) && (({execute_CsrPlugin_csrAddress[11 : 2],2'b00} == 12'h3a0) || ({execute_CsrPlugin_csrAddress[11 : 4],4'b0000} == 12'h3b0)));
  assign _zz_when_CsrPlugin_l1709 = (execute_CsrPlugin_csrAddress & 12'hf60);
  assign when_CsrPlugin_l1709 = (((execute_arbitration_isValid && execute_IS_CSR) && (5'h03 <= execute_CsrPlugin_csrAddress[4 : 0])) && (((_zz_when_CsrPlugin_l1709 == 12'hb00) || (((_zz_when_CsrPlugin_l1709 == 12'hc00) && (! execute_CsrPlugin_writeInstruction)) && (CsrPlugin_privilege == 2'b11))) || ((execute_CsrPlugin_csrAddress & 12'hfe0) == 12'h320)));
  always @(*) begin
    when_CsrPlugin_l1719 = CsrPlugin_csrMapping_doForceFailCsr;
    if(when_CsrPlugin_l1717) begin
      when_CsrPlugin_l1719 = 1'b1;
    end
  end

  assign when_CsrPlugin_l1717 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign when_CsrPlugin_l1725 = ((! execute_arbitration_isValid) || (! execute_IS_CSR));
  always @(posedge aclk or posedge _zz_11) begin
    if(_zz_11) begin
      IBusCachedPlugin_fetchPc_pcReg <= 32'h0;
      IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid <= 1'b0;
      _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusCachedPlugin_rspCounter <= 32'h0;
      DBusCachedPlugin_rspCounter <= 32'h0;
      _zz_10 <= 1'b1;
      memory_DivPlugin_div_counter_value <= 6'h0;
      HazardSimplePlugin_writeBackBuffer_valid <= 1'b0;
      CsrPlugin_mtvec_base <= 30'h00000008;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_mcycle <= 64'h0;
      CsrPlugin_minstret <= 64'h0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      IBusCachedPlugin_injector_port_state <= 3'b000;
    end else begin
      if(IBusCachedPlugin_fetchPc_correction) begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_output_fire) begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusCachedPlugin_fetchPc_booted <= 1'b1;
      if(when_Fetcher_l133) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_output_fire) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(when_Fetcher_l133_1) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(when_Fetcher_l160) begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      if(IBusCachedPlugin_iBusRsp_flush) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_ready) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid <= (IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_valid && (! 1'b0));
      end
      if(IBusCachedPlugin_iBusRsp_flush) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= (IBusCachedPlugin_iBusRsp_stages_1_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if(when_Fetcher_l331) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(when_Fetcher_l331_1) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(when_Fetcher_l331_2) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(when_Fetcher_l331_3) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(when_Fetcher_l331_4) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= IBusCachedPlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(iBus_rsp_valid) begin
        IBusCachedPlugin_rspCounter <= (IBusCachedPlugin_rspCounter + 32'h00000001);
      end
      if(dBus_rsp_valid) begin
        DBusCachedPlugin_rspCounter <= (DBusCachedPlugin_rspCounter + 32'h00000001);
      end
      _zz_10 <= 1'b0;
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      HazardSimplePlugin_writeBackBuffer_valid <= HazardSimplePlugin_writeBackWrites_valid;
      CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
      if(writeBack_arbitration_isFiring) begin
        CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
      end
      if(when_CsrPlugin_l1259) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if(when_CsrPlugin_l1259_1) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if(when_CsrPlugin_l1259_2) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if(when_CsrPlugin_l1259_3) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(when_CsrPlugin_l1296) begin
        if(when_CsrPlugin_l1302) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1302_1) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1302_2) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active) begin
        if(when_CsrPlugin_l1335) begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if(when_CsrPlugin_l1335_1) begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if(when_CsrPlugin_l1335_2) begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(when_CsrPlugin_l1340) begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump) begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(when_CsrPlugin_l1390) begin
        if(when_CsrPlugin_l1398) begin
          case(CsrPlugin_targetPrivilege)
            2'b11 : begin
              CsrPlugin_mstatus_MIE <= 1'b0;
              CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
              CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
            end
            default : begin
            end
          endcase
        end
      end
      if(when_CsrPlugin_l1456) begin
        case(switch_CsrPlugin_l1460)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= ((|{_zz_when_CsrPlugin_l1302_2,{_zz_when_CsrPlugin_l1302_1,_zz_when_CsrPlugin_l1302}}) || CsrPlugin_thirdPartyWake);
      if(when_Pipeline_l151) begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154) begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(when_Pipeline_l151_1) begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_1) begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(when_Pipeline_l151_2) begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_2) begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(IBusCachedPlugin_injector_port_state)
        3'b000 : begin
          if(DebugPlugin_injectionPort_valid) begin
            IBusCachedPlugin_injector_port_state <= 3'b001;
          end
        end
        3'b001 : begin
          IBusCachedPlugin_injector_port_state <= 3'b010;
        end
        3'b010 : begin
          IBusCachedPlugin_injector_port_state <= 3'b011;
        end
        3'b011 : begin
          if(when_Fetcher_l391) begin
            IBusCachedPlugin_injector_port_state <= 3'b100;
          end
        end
        3'b100 : begin
          IBusCachedPlugin_injector_port_state <= 3'b000;
        end
        default : begin
        end
      endcase
      if(execute_CsrPlugin_csr_768) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mstatus_MPIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mstatus_MIE <= CsrPlugin_csrMapping_writeDataSignal[3];
          case(switch_CsrPlugin_l1031)
            2'b11 : begin
              CsrPlugin_mstatus_MPP <= 2'b11;
            end
            default : begin
            end
          endcase
        end
      end
      if(execute_CsrPlugin_csr_772) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mie_MEIE <= CsrPlugin_csrMapping_writeDataSignal[11];
          CsrPlugin_mie_MTIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mie_MSIE <= CsrPlugin_csrMapping_writeDataSignal[3];
        end
      end
      if(execute_CsrPlugin_csr_773) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mtvec_base <= CsrPlugin_csrMapping_writeDataSignal[31 : 2];
        end
      end
      if(execute_CsrPlugin_csr_2816) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mcycle[31 : 0] <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
        end
      end
      if(execute_CsrPlugin_csr_2944) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mcycle[63 : 32] <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
        end
      end
      if(execute_CsrPlugin_csr_2818) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_minstret[31 : 0] <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
        end
      end
      if(execute_CsrPlugin_csr_2946) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_minstret[63 : 32] <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
        end
      end
    end
  end

  always @(posedge aclk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready) begin
      _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready) begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_input_ready) begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    if(when_MulDivIterativePlugin_l126) begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if(when_MulDivIterativePlugin_l126_1) begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_DivPlugin_rs1[31 : 0] <= memory_DivPlugin_div_stage_0_outNumerator;
        memory_DivPlugin_accumulator[31 : 0] <= memory_DivPlugin_div_stage_0_outRemainder;
        if(when_MulDivIterativePlugin_l151) begin
          memory_DivPlugin_div_result <= _zz_memory_DivPlugin_div_result_1[31:0];
        end
      end
    end
    if(when_MulDivIterativePlugin_l162) begin
      memory_DivPlugin_accumulator <= 65'h0;
      memory_DivPlugin_rs1 <= ((_zz_memory_DivPlugin_rs1 ? (~ _zz_memory_DivPlugin_rs1_1) : _zz_memory_DivPlugin_rs1_1) + _zz_memory_DivPlugin_rs1_2);
      memory_DivPlugin_rs2 <= ((_zz_memory_DivPlugin_rs2 ? (~ execute_RS2) : execute_RS2) + _zz_memory_DivPlugin_rs2_1);
      memory_DivPlugin_div_needRevert <= ((_zz_memory_DivPlugin_rs1 ^ (_zz_memory_DivPlugin_rs2 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    HazardSimplePlugin_writeBackBuffer_payload_address <= HazardSimplePlugin_writeBackWrites_payload_address;
    HazardSimplePlugin_writeBackBuffer_payload_data <= HazardSimplePlugin_writeBackWrites_payload_data;
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(CsrPlugin_selfException_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= CsrPlugin_selfException_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= CsrPlugin_selfException_payload_badAddr;
    end
    if(BranchPlugin_branchExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= BranchPlugin_branchExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= BranchPlugin_branchExceptionPort_payload_badAddr;
    end
    if(DBusCachedPlugin_exceptionBus_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= DBusCachedPlugin_exceptionBus_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusCachedPlugin_exceptionBus_payload_badAddr;
    end
    if(when_CsrPlugin_l1296) begin
      if(when_CsrPlugin_l1302) begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1302_1) begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1302_2) begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(when_CsrPlugin_l1390) begin
      if(when_CsrPlugin_l1398) begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
            CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
            CsrPlugin_mepc <= writeBack_PC;
            if(CsrPlugin_hadException) begin
              CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
            end
          end
          default : begin
          end
        endcase
      end
    end
    if(when_Pipeline_l124) begin
      decode_to_execute_PC <= decode_PC;
    end
    if(when_Pipeline_l124_1) begin
      execute_to_memory_PC <= _zz_execute_to_memory_PC;
    end
    if(when_Pipeline_l124_2) begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if(when_Pipeline_l124_3) begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if(when_Pipeline_l124_4) begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if(when_Pipeline_l124_5) begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if(when_Pipeline_l124_6) begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_decode_to_execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_7) begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_8) begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_memory_to_writeBack_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_9) begin
      decode_to_execute_MEMORY_FORCE_CONSTISTENCY <= decode_MEMORY_FORCE_CONSTISTENCY;
    end
    if(when_Pipeline_l124_10) begin
      decode_to_execute_SRC1_CTRL <= _zz_decode_to_execute_SRC1_CTRL;
    end
    if(when_Pipeline_l124_11) begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if(when_Pipeline_l124_12) begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_13) begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_14) begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_15) begin
      decode_to_execute_ALU_CTRL <= _zz_decode_to_execute_ALU_CTRL;
    end
    if(when_Pipeline_l124_16) begin
      decode_to_execute_SRC2_CTRL <= _zz_decode_to_execute_SRC2_CTRL;
    end
    if(when_Pipeline_l124_17) begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_18) begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_19) begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_20) begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if(when_Pipeline_l124_21) begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_22) begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_23) begin
      decode_to_execute_MEMORY_WR <= decode_MEMORY_WR;
    end
    if(when_Pipeline_l124_24) begin
      execute_to_memory_MEMORY_WR <= execute_MEMORY_WR;
    end
    if(when_Pipeline_l124_25) begin
      memory_to_writeBack_MEMORY_WR <= memory_MEMORY_WR;
    end
    if(when_Pipeline_l124_26) begin
      decode_to_execute_MEMORY_MANAGMENT <= decode_MEMORY_MANAGMENT;
    end
    if(when_Pipeline_l124_27) begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if(when_Pipeline_l124_28) begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_decode_to_execute_ALU_BITWISE_CTRL;
    end
    if(when_Pipeline_l124_29) begin
      decode_to_execute_SHIFT_CTRL <= _zz_decode_to_execute_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_30) begin
      execute_to_memory_SHIFT_CTRL <= _zz_execute_to_memory_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_31) begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if(when_Pipeline_l124_32) begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if(when_Pipeline_l124_33) begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if(when_Pipeline_l124_34) begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if(when_Pipeline_l124_35) begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if(when_Pipeline_l124_36) begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if(when_Pipeline_l124_37) begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if(when_Pipeline_l124_38) begin
      decode_to_execute_BRANCH_CTRL <= _zz_decode_to_execute_BRANCH_CTRL;
    end
    if(when_Pipeline_l124_39) begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if(when_Pipeline_l124_40) begin
      decode_to_execute_ENV_CTRL <= _zz_decode_to_execute_ENV_CTRL;
    end
    if(when_Pipeline_l124_41) begin
      execute_to_memory_ENV_CTRL <= _zz_execute_to_memory_ENV_CTRL;
    end
    if(when_Pipeline_l124_42) begin
      memory_to_writeBack_ENV_CTRL <= _zz_memory_to_writeBack_ENV_CTRL;
    end
    if(when_Pipeline_l124_43) begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if(when_Pipeline_l124_44) begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if(when_Pipeline_l124_45) begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if(when_Pipeline_l124_46) begin
      decode_to_execute_PREDICTION_HAD_BRANCHED1 <= decode_PREDICTION_HAD_BRANCHED1;
    end
    if(when_Pipeline_l124_47) begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if(when_Pipeline_l124_48) begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if(when_Pipeline_l124_49) begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if(when_Pipeline_l124_50) begin
      execute_to_memory_MEMORY_STORE_DATA_RF <= execute_MEMORY_STORE_DATA_RF;
    end
    if(when_Pipeline_l124_51) begin
      memory_to_writeBack_MEMORY_STORE_DATA_RF <= memory_MEMORY_STORE_DATA_RF;
    end
    if(when_Pipeline_l124_52) begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_decode_RS2;
    end
    if(when_Pipeline_l124_53) begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_decode_RS2_1;
    end
    if(when_Pipeline_l124_54) begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if(when_Pipeline_l124_55) begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if(when_Pipeline_l124_56) begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if(when_Pipeline_l124_57) begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if(when_Pipeline_l124_58) begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if(when_Pipeline_l124_59) begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if(when_Pipeline_l124_60) begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if(when_Pipeline_l124_61) begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if(when_Pipeline_l124_62) begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if(when_CsrPlugin_l1669) begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if(when_CsrPlugin_l1669_1) begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if(when_CsrPlugin_l1669_2) begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if(when_CsrPlugin_l1669_3) begin
      execute_CsrPlugin_csr_773 <= (decode_INSTRUCTION[31 : 20] == 12'h305);
    end
    if(when_CsrPlugin_l1669_4) begin
      execute_CsrPlugin_csr_833 <= (decode_INSTRUCTION[31 : 20] == 12'h341);
    end
    if(when_CsrPlugin_l1669_5) begin
      execute_CsrPlugin_csr_832 <= (decode_INSTRUCTION[31 : 20] == 12'h340);
    end
    if(when_CsrPlugin_l1669_6) begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if(when_CsrPlugin_l1669_7) begin
      execute_CsrPlugin_csr_835 <= (decode_INSTRUCTION[31 : 20] == 12'h343);
    end
    if(when_CsrPlugin_l1669_8) begin
      execute_CsrPlugin_csr_2816 <= (decode_INSTRUCTION[31 : 20] == 12'hb00);
    end
    if(when_CsrPlugin_l1669_9) begin
      execute_CsrPlugin_csr_2944 <= (decode_INSTRUCTION[31 : 20] == 12'hb80);
    end
    if(when_CsrPlugin_l1669_10) begin
      execute_CsrPlugin_csr_2818 <= (decode_INSTRUCTION[31 : 20] == 12'hb02);
    end
    if(when_CsrPlugin_l1669_11) begin
      execute_CsrPlugin_csr_2946 <= (decode_INSTRUCTION[31 : 20] == 12'hb82);
    end
    if(execute_CsrPlugin_csr_836) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mip_MSIP <= CsrPlugin_csrMapping_writeDataSignal[3];
      end
    end
    if(execute_CsrPlugin_csr_833) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mepc <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_832) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mscratch <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  always @(posedge aclk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready) begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= ((|{writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}}) || IBusCachedPlugin_incomingInstruction);
    if(writeBack_arbitration_isValid) begin
      DebugPlugin_busReadDataReg <= _zz_decode_RS2_2;
    end
    _zz_when_DebugPlugin_l257 <= debug_bus_cmd_payload_address[2];
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l280)
        6'h10 : begin
          if(debug_bus_cmd_payload_wr) begin
            DebugPlugin_hardwareBreakpoints_0_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        6'h11 : begin
          if(debug_bus_cmd_payload_wr) begin
            DebugPlugin_hardwareBreakpoints_1_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        6'h12 : begin
          if(debug_bus_cmd_payload_wr) begin
            DebugPlugin_hardwareBreakpoints_2_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        default : begin
        end
      endcase
    end
    if(when_DebugPlugin_l308) begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @(posedge aclk or posedge resetCtrl_debugReset) begin
    if(resetCtrl_debugReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      DebugPlugin_debugUsed <= 1'b0;
      DebugPlugin_disableEbreak <= 1'b0;
      DebugPlugin_hardwareBreakpoints_0_valid <= 1'b0;
      DebugPlugin_hardwareBreakpoints_1_valid <= 1'b0;
      DebugPlugin_hardwareBreakpoints_2_valid <= 1'b0;
    end else begin
      if(when_DebugPlugin_l238) begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        DebugPlugin_debugUsed <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        case(switch_DebugPlugin_l280)
          6'h0 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(when_DebugPlugin_l284) begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(when_DebugPlugin_l284_1) begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(when_DebugPlugin_l285) begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(when_DebugPlugin_l285_1) begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(when_DebugPlugin_l286) begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(when_DebugPlugin_l287) begin
                DebugPlugin_godmode <= 1'b0;
              end
              if(when_DebugPlugin_l288) begin
                DebugPlugin_disableEbreak <= 1'b1;
              end
              if(when_DebugPlugin_l288_1) begin
                DebugPlugin_disableEbreak <= 1'b0;
              end
            end
          end
          6'h10 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_hardwareBreakpoints_0_valid <= debug_bus_cmd_payload_data[0];
            end
          end
          6'h11 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_hardwareBreakpoints_1_valid <= debug_bus_cmd_payload_data[0];
            end
          end
          6'h12 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_hardwareBreakpoints_2_valid <= debug_bus_cmd_payload_data[0];
            end
          end
          default : begin
          end
        endcase
      end
      if(when_DebugPlugin_l308) begin
        if(when_DebugPlugin_l311) begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(when_DebugPlugin_l324) begin
        if(decode_arbitration_isValid) begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
    end
  end


endmodule

module Apb3Plic (
  input  wire [21:0]   io_bus_PADDR,
  input  wire [0:0]    io_bus_PSEL,
  input  wire          io_bus_PENABLE,
  output reg           io_bus_PREADY,
  input  wire          io_bus_PWRITE,
  input  wire [31:0]   io_bus_PWDATA,
  output reg  [31:0]   io_bus_PRDATA,
  output wire          io_bus_PSLVERROR,
  input  wire [5:0]    io_sources,
  output wire [0:0]    io_targets,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  wire                _zz_gateways_0_ip;
  wire                _zz_gateways_1_ip;
  wire                _zz_gateways_2_ip;
  wire                _zz_gateways_3_ip;
  wire                _zz_gateways_4_ip;
  wire                _zz_gateways_5_ip;
  wire       [1:0]    gateways_0_priority;
  reg                 gateways_0_ip;
  reg                 gateways_0_waitCompletion;
  wire                when_PlicGateway_l21;
  wire       [1:0]    gateways_1_priority;
  reg                 gateways_1_ip;
  reg                 gateways_1_waitCompletion;
  wire                when_PlicGateway_l21_1;
  wire       [1:0]    gateways_2_priority;
  reg                 gateways_2_ip;
  reg                 gateways_2_waitCompletion;
  wire                when_PlicGateway_l21_2;
  wire       [1:0]    gateways_3_priority;
  reg                 gateways_3_ip;
  reg                 gateways_3_waitCompletion;
  wire                when_PlicGateway_l21_3;
  wire       [1:0]    gateways_4_priority;
  reg                 gateways_4_ip;
  reg                 gateways_4_waitCompletion;
  wire                when_PlicGateway_l21_4;
  wire       [1:0]    gateways_5_priority;
  reg                 gateways_5_ip;
  reg                 gateways_5_waitCompletion;
  wire                when_PlicGateway_l21_5;
  wire                targets_0_ie_0;
  wire                targets_0_ie_1;
  wire                targets_0_ie_2;
  wire                targets_0_ie_3;
  wire                targets_0_ie_4;
  wire                targets_0_ie_5;
  wire       [1:0]    targets_0_threshold;
  wire       [1:0]    targets_0_requests_0_priority;
  wire       [2:0]    targets_0_requests_0_id;
  wire                targets_0_requests_0_valid;
  wire       [1:0]    targets_0_requests_1_priority;
  wire       [2:0]    targets_0_requests_1_id;
  wire                targets_0_requests_1_valid;
  wire       [1:0]    targets_0_requests_2_priority;
  wire       [2:0]    targets_0_requests_2_id;
  wire                targets_0_requests_2_valid;
  wire       [1:0]    targets_0_requests_3_priority;
  wire       [2:0]    targets_0_requests_3_id;
  wire                targets_0_requests_3_valid;
  wire       [1:0]    targets_0_requests_4_priority;
  wire       [2:0]    targets_0_requests_4_id;
  wire                targets_0_requests_4_valid;
  wire       [1:0]    targets_0_requests_5_priority;
  wire       [2:0]    targets_0_requests_5_id;
  wire                targets_0_requests_5_valid;
  wire       [1:0]    targets_0_requests_6_priority;
  wire       [2:0]    targets_0_requests_6_id;
  wire                targets_0_requests_6_valid;
  wire                _zz_targets_0_bestRequest_id;
  wire       [1:0]    _zz_targets_0_bestRequest_priority;
  wire                _zz_targets_0_bestRequest_id_1;
  wire                _zz_targets_0_bestRequest_id_2;
  wire       [1:0]    _zz_targets_0_bestRequest_priority_1;
  wire                _zz_targets_0_bestRequest_id_3;
  wire                _zz_targets_0_bestRequest_id_4;
  wire       [1:0]    _zz_targets_0_bestRequest_priority_2;
  wire                _zz_targets_0_bestRequest_id_5;
  wire                _zz_targets_0_bestRequest_id_6;
  wire       [1:0]    _zz_targets_0_bestRequest_priority_3;
  wire                _zz_targets_0_bestRequest_valid;
  wire                _zz_targets_0_bestRequest_id_7;
  wire       [1:0]    _zz_targets_0_bestRequest_priority_4;
  wire                _zz_targets_0_bestRequest_valid_1;
  wire                _zz_targets_0_bestRequest_priority_5;
  reg        [1:0]    targets_0_bestRequest_priority;
  reg        [2:0]    targets_0_bestRequest_id;
  reg                 targets_0_bestRequest_valid;
  wire                targets_0_iep;
  wire       [2:0]    targets_0_claim;
  wire                _zz_io_bus_PSLVERROR;
  wire                _zz_io_bus_PSLVERROR_1;
  wire                _zz_1;
  wire                _zz_2;
  wire                _zz_io_bus_PSLVERROR_2;
  wire                _zz_io_bus_PSLVERROR_3;
  reg        [1:0]    gateways_0_priority_driver;
  reg        [1:0]    gateways_1_priority_driver;
  reg        [1:0]    gateways_2_priority_driver;
  reg        [1:0]    gateways_3_priority_driver;
  reg        [1:0]    gateways_4_priority_driver;
  reg        [1:0]    gateways_5_priority_driver;
  reg                 _zz_3;
  reg        [2:0]    _zz_4;
  reg                 _zz_5;
  reg        [2:0]    _zz_6;
  reg                 _zz_when_PlicMapper_l122;
  reg        [0:0]    _zz_when_PlicMapper_l122_1;
  reg        [0:0]    _zz_when_PlicMapper_l122_2;
  wire                when_PlicMapper_l122;
  reg        [1:0]    targets_0_threshold_driver;
  reg                 _zz_7;
  reg                 targets_0_ie_0_driver;
  reg                 targets_0_ie_1_driver;
  reg                 targets_0_ie_2_driver;
  reg                 targets_0_ie_3_driver;
  reg                 targets_0_ie_4_driver;
  reg                 targets_0_ie_5_driver;
  wire                when_Apb3SlaveFactory_l81;

  assign _zz_gateways_0_ip = io_sources[0];
  assign _zz_gateways_1_ip = io_sources[1];
  assign _zz_gateways_2_ip = io_sources[2];
  assign _zz_gateways_3_ip = io_sources[3];
  assign _zz_gateways_4_ip = io_sources[4];
  assign _zz_gateways_5_ip = io_sources[5];
  assign when_PlicGateway_l21 = (! gateways_0_waitCompletion);
  assign when_PlicGateway_l21_1 = (! gateways_1_waitCompletion);
  assign when_PlicGateway_l21_2 = (! gateways_2_waitCompletion);
  assign when_PlicGateway_l21_3 = (! gateways_3_waitCompletion);
  assign when_PlicGateway_l21_4 = (! gateways_4_waitCompletion);
  assign when_PlicGateway_l21_5 = (! gateways_5_waitCompletion);
  assign targets_0_requests_0_priority = 2'b00;
  assign targets_0_requests_0_id = 3'b000;
  assign targets_0_requests_0_valid = 1'b1;
  assign targets_0_requests_1_priority = gateways_0_priority;
  assign targets_0_requests_1_id = 3'b001;
  assign targets_0_requests_1_valid = (gateways_0_ip && targets_0_ie_0);
  assign targets_0_requests_2_priority = gateways_1_priority;
  assign targets_0_requests_2_id = 3'b010;
  assign targets_0_requests_2_valid = (gateways_1_ip && targets_0_ie_1);
  assign targets_0_requests_3_priority = gateways_2_priority;
  assign targets_0_requests_3_id = 3'b011;
  assign targets_0_requests_3_valid = (gateways_2_ip && targets_0_ie_2);
  assign targets_0_requests_4_priority = gateways_3_priority;
  assign targets_0_requests_4_id = 3'b100;
  assign targets_0_requests_4_valid = (gateways_3_ip && targets_0_ie_3);
  assign targets_0_requests_5_priority = gateways_4_priority;
  assign targets_0_requests_5_id = 3'b101;
  assign targets_0_requests_5_valid = (gateways_4_ip && targets_0_ie_4);
  assign targets_0_requests_6_priority = gateways_5_priority;
  assign targets_0_requests_6_id = 3'b110;
  assign targets_0_requests_6_valid = (gateways_5_ip && targets_0_ie_5);
  assign _zz_targets_0_bestRequest_id = ((! targets_0_requests_1_valid) || (targets_0_requests_0_valid && (targets_0_requests_1_priority <= targets_0_requests_0_priority)));
  assign _zz_targets_0_bestRequest_priority = (_zz_targets_0_bestRequest_id ? targets_0_requests_0_priority : targets_0_requests_1_priority);
  assign _zz_targets_0_bestRequest_id_1 = (_zz_targets_0_bestRequest_id ? targets_0_requests_0_valid : targets_0_requests_1_valid);
  assign _zz_targets_0_bestRequest_id_2 = ((! targets_0_requests_3_valid) || (targets_0_requests_2_valid && (targets_0_requests_3_priority <= targets_0_requests_2_priority)));
  assign _zz_targets_0_bestRequest_priority_1 = (_zz_targets_0_bestRequest_id_2 ? targets_0_requests_2_priority : targets_0_requests_3_priority);
  assign _zz_targets_0_bestRequest_id_3 = (_zz_targets_0_bestRequest_id_2 ? targets_0_requests_2_valid : targets_0_requests_3_valid);
  assign _zz_targets_0_bestRequest_id_4 = ((! targets_0_requests_5_valid) || (targets_0_requests_4_valid && (targets_0_requests_5_priority <= targets_0_requests_4_priority)));
  assign _zz_targets_0_bestRequest_priority_2 = (_zz_targets_0_bestRequest_id_4 ? targets_0_requests_4_priority : targets_0_requests_5_priority);
  assign _zz_targets_0_bestRequest_id_5 = (_zz_targets_0_bestRequest_id_4 ? targets_0_requests_4_valid : targets_0_requests_5_valid);
  assign _zz_targets_0_bestRequest_id_6 = ((! _zz_targets_0_bestRequest_id_3) || (_zz_targets_0_bestRequest_id_1 && (_zz_targets_0_bestRequest_priority_1 <= _zz_targets_0_bestRequest_priority)));
  assign _zz_targets_0_bestRequest_priority_3 = (_zz_targets_0_bestRequest_id_6 ? _zz_targets_0_bestRequest_priority : _zz_targets_0_bestRequest_priority_1);
  assign _zz_targets_0_bestRequest_valid = (_zz_targets_0_bestRequest_id_6 ? _zz_targets_0_bestRequest_id_1 : _zz_targets_0_bestRequest_id_3);
  assign _zz_targets_0_bestRequest_id_7 = ((! targets_0_requests_6_valid) || (_zz_targets_0_bestRequest_id_5 && (targets_0_requests_6_priority <= _zz_targets_0_bestRequest_priority_2)));
  assign _zz_targets_0_bestRequest_priority_4 = (_zz_targets_0_bestRequest_id_7 ? _zz_targets_0_bestRequest_priority_2 : targets_0_requests_6_priority);
  assign _zz_targets_0_bestRequest_valid_1 = (_zz_targets_0_bestRequest_id_7 ? _zz_targets_0_bestRequest_id_5 : targets_0_requests_6_valid);
  assign _zz_targets_0_bestRequest_priority_5 = ((! _zz_targets_0_bestRequest_valid_1) || (_zz_targets_0_bestRequest_valid && (_zz_targets_0_bestRequest_priority_4 <= _zz_targets_0_bestRequest_priority_3)));
  assign targets_0_iep = (targets_0_threshold < targets_0_bestRequest_priority);
  assign targets_0_claim = (targets_0_iep ? targets_0_bestRequest_id : 3'b000);
  assign io_targets = targets_0_iep;
  assign _zz_io_bus_PSLVERROR = 1'b0;
  assign _zz_io_bus_PSLVERROR_1 = 1'b0;
  always @(*) begin
    io_bus_PREADY = 1'b1;
    if(when_PlicMapper_l122) begin
      io_bus_PREADY = 1'b0;
    end
  end

  always @(*) begin
    io_bus_PRDATA = 32'h0;
    case(io_bus_PADDR)
      22'h000004 : begin
        io_bus_PRDATA[1 : 0] = gateways_0_priority;
      end
      22'h001000 : begin
        io_bus_PRDATA[1 : 1] = gateways_0_ip;
        io_bus_PRDATA[2 : 2] = gateways_1_ip;
        io_bus_PRDATA[3 : 3] = gateways_2_ip;
        io_bus_PRDATA[4 : 4] = gateways_3_ip;
        io_bus_PRDATA[5 : 5] = gateways_4_ip;
        io_bus_PRDATA[6 : 6] = gateways_5_ip;
      end
      22'h000008 : begin
        io_bus_PRDATA[1 : 0] = gateways_1_priority;
      end
      22'h00000c : begin
        io_bus_PRDATA[1 : 0] = gateways_2_priority;
      end
      22'h000010 : begin
        io_bus_PRDATA[1 : 0] = gateways_3_priority;
      end
      22'h000014 : begin
        io_bus_PRDATA[1 : 0] = gateways_4_priority;
      end
      22'h000018 : begin
        io_bus_PRDATA[1 : 0] = gateways_5_priority;
      end
      22'h200000 : begin
        io_bus_PRDATA[1 : 0] = targets_0_threshold;
      end
      22'h200004 : begin
        io_bus_PRDATA[2 : 0] = targets_0_claim;
      end
      22'h002000 : begin
        io_bus_PRDATA[1 : 1] = targets_0_ie_0;
        io_bus_PRDATA[2 : 2] = targets_0_ie_1;
        io_bus_PRDATA[3 : 3] = targets_0_ie_2;
        io_bus_PRDATA[4 : 4] = targets_0_ie_3;
        io_bus_PRDATA[5 : 5] = targets_0_ie_4;
        io_bus_PRDATA[6 : 6] = targets_0_ie_5;
      end
      default : begin
      end
    endcase
  end

  assign _zz_1 = ((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PWRITE);
  assign _zz_2 = ((io_bus_PSEL[0] && io_bus_PENABLE) && (! io_bus_PWRITE));
  assign _zz_io_bus_PSLVERROR_2 = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && io_bus_PWRITE);
  assign _zz_io_bus_PSLVERROR_3 = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && (! io_bus_PWRITE));
  assign io_bus_PSLVERROR = ((_zz_io_bus_PSLVERROR_2 && _zz_io_bus_PSLVERROR_1) || (_zz_io_bus_PSLVERROR_3 && _zz_io_bus_PSLVERROR));
  assign gateways_0_priority = gateways_0_priority_driver;
  assign gateways_1_priority = gateways_1_priority_driver;
  assign gateways_2_priority = gateways_2_priority_driver;
  assign gateways_3_priority = gateways_3_priority_driver;
  assign gateways_4_priority = gateways_4_priority_driver;
  assign gateways_5_priority = gateways_5_priority_driver;
  always @(*) begin
    _zz_3 = 1'b0;
    case(io_bus_PADDR)
      22'h200004 : begin
        if(_zz_io_bus_PSLVERROR_3) begin
          _zz_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_4 = 3'bxxx;
    case(io_bus_PADDR)
      22'h200004 : begin
        if(_zz_io_bus_PSLVERROR_3) begin
          _zz_4 = targets_0_claim;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_5 = 1'b0;
    if(_zz_7) begin
      _zz_5 = 1'b1;
    end
  end

  always @(*) begin
    _zz_6 = 3'bxxx;
    if(_zz_7) begin
      _zz_6 = io_bus_PWDATA[2 : 0];
    end
  end

  always @(*) begin
    _zz_when_PlicMapper_l122 = 1'b0;
    if(when_PlicMapper_l122) begin
      _zz_when_PlicMapper_l122 = 1'b1;
    end
    if(when_Apb3SlaveFactory_l81) begin
      if(_zz_1) begin
        _zz_when_PlicMapper_l122 = 1'b1;
      end
      if(_zz_2) begin
        _zz_when_PlicMapper_l122 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_when_PlicMapper_l122_1 = (_zz_when_PlicMapper_l122_2 + _zz_when_PlicMapper_l122);
    if(1'b0) begin
      _zz_when_PlicMapper_l122_1 = 1'b0;
    end
  end

  assign when_PlicMapper_l122 = (_zz_when_PlicMapper_l122_2 != 1'b0);
  assign targets_0_threshold = targets_0_threshold_driver;
  always @(*) begin
    _zz_7 = 1'b0;
    case(io_bus_PADDR)
      22'h200004 : begin
        if(_zz_io_bus_PSLVERROR_2) begin
          _zz_7 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign targets_0_ie_0 = targets_0_ie_0_driver;
  assign targets_0_ie_1 = targets_0_ie_1_driver;
  assign targets_0_ie_2 = targets_0_ie_2_driver;
  assign targets_0_ie_3 = targets_0_ie_3_driver;
  assign targets_0_ie_4 = targets_0_ie_4_driver;
  assign targets_0_ie_5 = targets_0_ie_5_driver;
  assign when_Apb3SlaveFactory_l81 = 1'b1;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      gateways_0_ip <= 1'b0;
      gateways_0_waitCompletion <= 1'b0;
      gateways_1_ip <= 1'b0;
      gateways_1_waitCompletion <= 1'b0;
      gateways_2_ip <= 1'b0;
      gateways_2_waitCompletion <= 1'b0;
      gateways_3_ip <= 1'b0;
      gateways_3_waitCompletion <= 1'b0;
      gateways_4_ip <= 1'b0;
      gateways_4_waitCompletion <= 1'b0;
      gateways_5_ip <= 1'b0;
      gateways_5_waitCompletion <= 1'b0;
      gateways_0_priority_driver <= 2'b00;
      gateways_1_priority_driver <= 2'b00;
      gateways_2_priority_driver <= 2'b00;
      gateways_3_priority_driver <= 2'b00;
      gateways_4_priority_driver <= 2'b00;
      gateways_5_priority_driver <= 2'b00;
      _zz_when_PlicMapper_l122_2 <= 1'b0;
      targets_0_threshold_driver <= 2'b00;
      targets_0_ie_0_driver <= 1'b0;
      targets_0_ie_1_driver <= 1'b0;
      targets_0_ie_2_driver <= 1'b0;
      targets_0_ie_3_driver <= 1'b0;
      targets_0_ie_4_driver <= 1'b0;
      targets_0_ie_5_driver <= 1'b0;
    end else begin
      if(when_PlicGateway_l21) begin
        gateways_0_ip <= _zz_gateways_0_ip;
        gateways_0_waitCompletion <= _zz_gateways_0_ip;
      end
      if(when_PlicGateway_l21_1) begin
        gateways_1_ip <= _zz_gateways_1_ip;
        gateways_1_waitCompletion <= _zz_gateways_1_ip;
      end
      if(when_PlicGateway_l21_2) begin
        gateways_2_ip <= _zz_gateways_2_ip;
        gateways_2_waitCompletion <= _zz_gateways_2_ip;
      end
      if(when_PlicGateway_l21_3) begin
        gateways_3_ip <= _zz_gateways_3_ip;
        gateways_3_waitCompletion <= _zz_gateways_3_ip;
      end
      if(when_PlicGateway_l21_4) begin
        gateways_4_ip <= _zz_gateways_4_ip;
        gateways_4_waitCompletion <= _zz_gateways_4_ip;
      end
      if(when_PlicGateway_l21_5) begin
        gateways_5_ip <= _zz_gateways_5_ip;
        gateways_5_waitCompletion <= _zz_gateways_5_ip;
      end
      if(_zz_3) begin
        case(_zz_4)
          3'b001 : begin
            gateways_0_ip <= 1'b0;
          end
          3'b010 : begin
            gateways_1_ip <= 1'b0;
          end
          3'b011 : begin
            gateways_2_ip <= 1'b0;
          end
          3'b100 : begin
            gateways_3_ip <= 1'b0;
          end
          3'b101 : begin
            gateways_4_ip <= 1'b0;
          end
          3'b110 : begin
            gateways_5_ip <= 1'b0;
          end
          default : begin
          end
        endcase
      end
      if(_zz_5) begin
        case(_zz_6)
          3'b001 : begin
            gateways_0_waitCompletion <= 1'b0;
          end
          3'b010 : begin
            gateways_1_waitCompletion <= 1'b0;
          end
          3'b011 : begin
            gateways_2_waitCompletion <= 1'b0;
          end
          3'b100 : begin
            gateways_3_waitCompletion <= 1'b0;
          end
          3'b101 : begin
            gateways_4_waitCompletion <= 1'b0;
          end
          3'b110 : begin
            gateways_5_waitCompletion <= 1'b0;
          end
          default : begin
          end
        endcase
      end
      _zz_when_PlicMapper_l122_2 <= _zz_when_PlicMapper_l122_1;
      case(io_bus_PADDR)
        22'h000004 : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            gateways_0_priority_driver <= io_bus_PWDATA[1 : 0];
          end
        end
        22'h000008 : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            gateways_1_priority_driver <= io_bus_PWDATA[1 : 0];
          end
        end
        22'h00000c : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            gateways_2_priority_driver <= io_bus_PWDATA[1 : 0];
          end
        end
        22'h000010 : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            gateways_3_priority_driver <= io_bus_PWDATA[1 : 0];
          end
        end
        22'h000014 : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            gateways_4_priority_driver <= io_bus_PWDATA[1 : 0];
          end
        end
        22'h000018 : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            gateways_5_priority_driver <= io_bus_PWDATA[1 : 0];
          end
        end
        22'h200000 : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            targets_0_threshold_driver <= io_bus_PWDATA[1 : 0];
          end
        end
        22'h002000 : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            targets_0_ie_0_driver <= io_bus_PWDATA[1];
            targets_0_ie_1_driver <= io_bus_PWDATA[2];
            targets_0_ie_2_driver <= io_bus_PWDATA[3];
            targets_0_ie_3_driver <= io_bus_PWDATA[4];
            targets_0_ie_4_driver <= io_bus_PWDATA[5];
            targets_0_ie_5_driver <= io_bus_PWDATA[6];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge aclk) begin
    targets_0_bestRequest_priority <= (_zz_targets_0_bestRequest_priority_5 ? _zz_targets_0_bestRequest_priority_3 : _zz_targets_0_bestRequest_priority_4);
    targets_0_bestRequest_id <= (_zz_targets_0_bestRequest_priority_5 ? (_zz_targets_0_bestRequest_id_6 ? (_zz_targets_0_bestRequest_id ? targets_0_requests_0_id : targets_0_requests_1_id) : (_zz_targets_0_bestRequest_id_2 ? targets_0_requests_2_id : targets_0_requests_3_id)) : (_zz_targets_0_bestRequest_id_7 ? (_zz_targets_0_bestRequest_id_4 ? targets_0_requests_4_id : targets_0_requests_5_id) : targets_0_requests_6_id));
    targets_0_bestRequest_valid <= (_zz_targets_0_bestRequest_priority_5 ? _zz_targets_0_bestRequest_valid : _zz_targets_0_bestRequest_valid_1);
  end


endmodule

module Apb3Clint (
  input  wire [15:0]   io_bus_PADDR,
  input  wire [0:0]    io_bus_PSEL,
  input  wire          io_bus_PENABLE,
  output wire          io_bus_PREADY,
  input  wire          io_bus_PWRITE,
  input  wire [31:0]   io_bus_PWDATA,
  output reg  [31:0]   io_bus_PRDATA,
  output wire          io_bus_PSLVERROR,
  output wire [0:0]    io_timerInterrupt,
  output wire [0:0]    io_softwareInterrupt,
  output wire [63:0]   io_time,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  wire                factory_readErrorFlag;
  wire                factory_writeErrorFlag;
  wire                factory_askWrite;
  wire                factory_askRead;
  wire                factory_doWrite;
  wire                factory_doRead;
  wire                logic_stop;
  reg        [63:0]   logic_time;
  wire                when_Clint_l39;
  reg        [63:0]   logic_harts_0_cmp;
  reg                 logic_harts_0_timerInterrupt;
  reg                 logic_harts_0_softwareInterrupt;
  wire       [63:0]   _zz_io_bus_PRDATA;
  wire                when_Apb3SlaveFactory_l81;
  wire                when_Apb3SlaveFactory_l81_1;
  wire                when_Apb3SlaveFactory_l81_2;
  wire                when_Apb3SlaveFactory_l81_3;

  assign factory_readErrorFlag = 1'b0;
  assign factory_writeErrorFlag = 1'b0;
  assign io_bus_PREADY = 1'b1;
  always @(*) begin
    io_bus_PRDATA = 32'h0;
    case(io_bus_PADDR)
      16'h0 : begin
        io_bus_PRDATA[0 : 0] = logic_harts_0_softwareInterrupt;
      end
      default : begin
      end
    endcase
    if(when_Apb3SlaveFactory_l81) begin
      io_bus_PRDATA[31 : 0] = _zz_io_bus_PRDATA[31 : 0];
    end
    if(when_Apb3SlaveFactory_l81_1) begin
      io_bus_PRDATA[31 : 0] = _zz_io_bus_PRDATA[63 : 32];
    end
  end

  assign factory_askWrite = ((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PWRITE);
  assign factory_askRead = ((io_bus_PSEL[0] && io_bus_PENABLE) && (! io_bus_PWRITE));
  assign factory_doWrite = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && io_bus_PWRITE);
  assign factory_doRead = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && (! io_bus_PWRITE));
  assign io_bus_PSLVERROR = ((factory_doWrite && factory_writeErrorFlag) || (factory_doRead && factory_readErrorFlag));
  assign logic_stop = 1'b0;
  assign when_Clint_l39 = (! logic_stop);
  assign _zz_io_bus_PRDATA = logic_time;
  assign io_timerInterrupt[0] = logic_harts_0_timerInterrupt;
  assign io_softwareInterrupt[0] = logic_harts_0_softwareInterrupt;
  assign io_time = logic_time;
  assign when_Apb3SlaveFactory_l81 = ((io_bus_PADDR & (~ 16'h0003)) == 16'hbff8);
  assign when_Apb3SlaveFactory_l81_1 = ((io_bus_PADDR & (~ 16'h0003)) == 16'hbffc);
  assign when_Apb3SlaveFactory_l81_2 = ((io_bus_PADDR & (~ 16'h0003)) == 16'h4000);
  assign when_Apb3SlaveFactory_l81_3 = ((io_bus_PADDR & (~ 16'h0003)) == 16'h4004);
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      logic_time <= 64'h0;
      logic_harts_0_softwareInterrupt <= 1'b0;
    end else begin
      if(when_Clint_l39) begin
        logic_time <= (logic_time + 64'h0000000000000001);
      end
      case(io_bus_PADDR)
        16'h0 : begin
          if(factory_doWrite) begin
            logic_harts_0_softwareInterrupt <= io_bus_PWDATA[0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge aclk) begin
    logic_harts_0_timerInterrupt <= (logic_harts_0_cmp <= logic_time);
    if(when_Apb3SlaveFactory_l81_2) begin
      if(factory_doWrite) begin
        logic_harts_0_cmp[31 : 0] <= io_bus_PWDATA[31 : 0];
      end
    end
    if(when_Apb3SlaveFactory_l81_3) begin
      if(factory_doWrite) begin
        logic_harts_0_cmp[63 : 32] <= io_bus_PWDATA[31 : 0];
      end
    end
  end


endmodule

module Apb3UartCtrl (
  input  wire [4:0]    io_apb_PADDR,
  input  wire [0:0]    io_apb_PSEL,
  input  wire          io_apb_PENABLE,
  output wire          io_apb_PREADY,
  input  wire          io_apb_PWRITE,
  input  wire [31:0]   io_apb_PWDATA,
  output reg  [31:0]   io_apb_PRDATA,
  output wire          io_uart_txd,
  input  wire          io_uart_rxd,
  output wire          io_interrupt,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;

  reg                 uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready;
  wire                uartCtrl_1_io_write_ready;
  wire                uartCtrl_1_io_read_valid;
  wire       [7:0]    uartCtrl_1_io_read_payload;
  wire                uartCtrl_1_io_uart_txd;
  wire                uartCtrl_1_io_readError;
  wire                uartCtrl_1_io_readBreak;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload;
  wire       [4:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy;
  wire       [4:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_availability;
  wire                uartCtrl_1_io_read_queueWithOccupancy_io_push_ready;
  wire                uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload;
  wire       [4:0]    uartCtrl_1_io_read_queueWithOccupancy_io_occupancy;
  wire       [4:0]    uartCtrl_1_io_read_queueWithOccupancy_io_availability;
  wire       [0:0]    _zz_bridge_misc_readError;
  wire       [0:0]    _zz_bridge_misc_readOverflowError;
  wire       [0:0]    _zz_bridge_misc_breakDetected;
  wire       [0:0]    _zz_bridge_misc_doBreak;
  wire       [0:0]    _zz_bridge_misc_doBreak_1;
  wire       [4:0]    _zz_io_apb_PRDATA;
  wire                busCtrl_readErrorFlag;
  wire                busCtrl_writeErrorFlag;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  wire                bridge_busCtrlWrapped_readErrorFlag;
  wire                bridge_busCtrlWrapped_writeErrorFlag;
  wire       [2:0]    bridge_uartConfigReg_frame_dataLength;
  wire       [0:0]    bridge_uartConfigReg_frame_stop;
  wire       [1:0]    bridge_uartConfigReg_frame_parity;
  reg        [19:0]   bridge_uartConfigReg_clockDivider;
  reg                 _zz_bridge_write_streamUnbuffered_valid;
  wire                bridge_write_streamUnbuffered_valid;
  wire                bridge_write_streamUnbuffered_ready;
  wire       [7:0]    bridge_write_streamUnbuffered_payload;
  reg                 bridge_read_streamBreaked_valid;
  reg                 bridge_read_streamBreaked_ready;
  wire       [7:0]    bridge_read_streamBreaked_payload;
  reg                 bridge_interruptCtrl_writeIntEnable;
  reg                 bridge_interruptCtrl_readIntEnable;
  wire                bridge_interruptCtrl_readInt;
  wire                bridge_interruptCtrl_writeInt;
  wire                bridge_interruptCtrl_interrupt;
  reg                 bridge_misc_readError;
  reg                 when_BusSlaveFactory_l341;
  wire                when_BusSlaveFactory_l347;
  reg                 bridge_misc_readOverflowError;
  reg                 when_BusSlaveFactory_l341_1;
  wire                when_BusSlaveFactory_l347_1;
  wire                uartCtrl_1_io_read_isStall;
  reg                 bridge_misc_breakDetected;
  reg                 uartCtrl_1_io_readBreak_regNext;
  wire                when_UartCtrl_l155;
  reg                 when_BusSlaveFactory_l341_2;
  wire                when_BusSlaveFactory_l347_2;
  reg                 bridge_misc_doBreak;
  reg                 when_BusSlaveFactory_l377;
  wire                when_BusSlaveFactory_l379;
  reg                 when_BusSlaveFactory_l341_3;
  wire                when_BusSlaveFactory_l347_3;
  `ifndef SYNTHESIS
  reg [23:0] bridge_uartConfigReg_frame_stop_string;
  reg [31:0] bridge_uartConfigReg_frame_parity_string;
  `endif

  function [19:0] zz_bridge_uartConfigReg_clockDivider(input dummy);
    begin
      zz_bridge_uartConfigReg_clockDivider = 20'h0;
      zz_bridge_uartConfigReg_clockDivider = 20'h000ac;
    end
  endfunction
  wire [19:0] _zz_1;

  assign _zz_bridge_misc_readError = 1'b0;
  assign _zz_bridge_misc_readOverflowError = 1'b0;
  assign _zz_bridge_misc_breakDetected = 1'b0;
  assign _zz_bridge_misc_doBreak = 1'b1;
  assign _zz_bridge_misc_doBreak_1 = 1'b0;
  assign _zz_io_apb_PRDATA = (5'h10 - bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy);
  UartCtrl uartCtrl_1 (
    .io_config_frame_dataLength (bridge_uartConfigReg_frame_dataLength[2:0]                          ), //i
    .io_config_frame_stop       (bridge_uartConfigReg_frame_stop                                     ), //i
    .io_config_frame_parity     (bridge_uartConfigReg_frame_parity[1:0]                              ), //i
    .io_config_clockDivider     (bridge_uartConfigReg_clockDivider[19:0]                             ), //i
    .io_write_valid             (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid       ), //i
    .io_write_ready             (uartCtrl_1_io_write_ready                                           ), //o
    .io_write_payload           (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload[7:0]), //i
    .io_read_valid              (uartCtrl_1_io_read_valid                                            ), //o
    .io_read_ready              (uartCtrl_1_io_read_queueWithOccupancy_io_push_ready                 ), //i
    .io_read_payload            (uartCtrl_1_io_read_payload[7:0]                                     ), //o
    .io_uart_txd                (uartCtrl_1_io_uart_txd                                              ), //o
    .io_uart_rxd                (io_uart_rxd                                                         ), //i
    .io_readError               (uartCtrl_1_io_readError                                             ), //o
    .io_writeBreak              (bridge_misc_doBreak                                                 ), //i
    .io_readBreak               (uartCtrl_1_io_readBreak                                             ), //o
    .aclk                       (aclk                                                                ), //i
    .resetCtrl_mainClkReset     (resetCtrl_mainClkReset                                              )  //i
  );
  StreamFifo bridge_write_streamUnbuffered_queueWithOccupancy (
    .io_push_valid          (bridge_write_streamUnbuffered_valid                                  ), //i
    .io_push_ready          (bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready       ), //o
    .io_push_payload        (bridge_write_streamUnbuffered_payload[7:0]                           ), //i
    .io_pop_valid           (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid        ), //o
    .io_pop_ready           (uartCtrl_1_io_write_ready                                            ), //i
    .io_pop_payload         (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload[7:0] ), //o
    .io_flush               (1'b0                                                                 ), //i
    .io_occupancy           (bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy[4:0]   ), //o
    .io_availability        (bridge_write_streamUnbuffered_queueWithOccupancy_io_availability[4:0]), //o
    .aclk                   (aclk                                                                 ), //i
    .resetCtrl_mainClkReset (resetCtrl_mainClkReset                                               )  //i
  );
  StreamFifo uartCtrl_1_io_read_queueWithOccupancy (
    .io_push_valid          (uartCtrl_1_io_read_valid                                  ), //i
    .io_push_ready          (uartCtrl_1_io_read_queueWithOccupancy_io_push_ready       ), //o
    .io_push_payload        (uartCtrl_1_io_read_payload[7:0]                           ), //i
    .io_pop_valid           (uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid        ), //o
    .io_pop_ready           (uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready        ), //i
    .io_pop_payload         (uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload[7:0] ), //o
    .io_flush               (1'b0                                                      ), //i
    .io_occupancy           (uartCtrl_1_io_read_queueWithOccupancy_io_occupancy[4:0]   ), //o
    .io_availability        (uartCtrl_1_io_read_queueWithOccupancy_io_availability[4:0]), //o
    .aclk                   (aclk                                                      ), //i
    .resetCtrl_mainClkReset (resetCtrl_mainClkReset                                    )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(bridge_uartConfigReg_frame_stop)
      UartStopType_ONE : bridge_uartConfigReg_frame_stop_string = "ONE";
      UartStopType_TWO : bridge_uartConfigReg_frame_stop_string = "TWO";
      default : bridge_uartConfigReg_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(bridge_uartConfigReg_frame_parity)
      UartParityType_NONE : bridge_uartConfigReg_frame_parity_string = "NONE";
      UartParityType_EVEN : bridge_uartConfigReg_frame_parity_string = "EVEN";
      UartParityType_ODD : bridge_uartConfigReg_frame_parity_string = "ODD ";
      default : bridge_uartConfigReg_frame_parity_string = "????";
    endcase
  end
  `endif

  assign io_uart_txd = uartCtrl_1_io_uart_txd;
  assign busCtrl_readErrorFlag = 1'b0;
  assign busCtrl_writeErrorFlag = 1'b0;
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      5'h0 : begin
        io_apb_PRDATA[16 : 16] = (bridge_read_streamBreaked_valid ^ 1'b0);
        io_apb_PRDATA[7 : 0] = bridge_read_streamBreaked_payload;
      end
      5'h04 : begin
        io_apb_PRDATA[20 : 16] = _zz_io_apb_PRDATA;
        io_apb_PRDATA[15 : 15] = bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
        io_apb_PRDATA[28 : 24] = uartCtrl_1_io_read_queueWithOccupancy_io_occupancy;
        io_apb_PRDATA[0 : 0] = bridge_interruptCtrl_writeIntEnable;
        io_apb_PRDATA[1 : 1] = bridge_interruptCtrl_readIntEnable;
        io_apb_PRDATA[8 : 8] = bridge_interruptCtrl_writeInt;
        io_apb_PRDATA[9 : 9] = bridge_interruptCtrl_readInt;
      end
      5'h10 : begin
        io_apb_PRDATA[0 : 0] = bridge_misc_readError;
        io_apb_PRDATA[1 : 1] = bridge_misc_readOverflowError;
        io_apb_PRDATA[8 : 8] = uartCtrl_1_io_readBreak;
        io_apb_PRDATA[9 : 9] = bridge_misc_breakDetected;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign bridge_busCtrlWrapped_readErrorFlag = 1'b0;
  assign bridge_busCtrlWrapped_writeErrorFlag = 1'b0;
  assign _zz_1 = zz_bridge_uartConfigReg_clockDivider(1'b0);
  always @(*) bridge_uartConfigReg_clockDivider = _zz_1;
  assign bridge_uartConfigReg_frame_dataLength = 3'b111;
  assign bridge_uartConfigReg_frame_parity = UartParityType_NONE;
  assign bridge_uartConfigReg_frame_stop = UartStopType_ONE;
  always @(*) begin
    _zz_bridge_write_streamUnbuffered_valid = 1'b0;
    case(io_apb_PADDR)
      5'h0 : begin
        if(busCtrl_doWrite) begin
          _zz_bridge_write_streamUnbuffered_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_write_streamUnbuffered_valid = _zz_bridge_write_streamUnbuffered_valid;
  assign bridge_write_streamUnbuffered_payload = io_apb_PWDATA[7 : 0];
  assign bridge_write_streamUnbuffered_ready = bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  always @(*) begin
    bridge_read_streamBreaked_valid = uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid;
    if(uartCtrl_1_io_readBreak) begin
      bridge_read_streamBreaked_valid = 1'b0;
    end
  end

  always @(*) begin
    uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready = bridge_read_streamBreaked_ready;
    if(uartCtrl_1_io_readBreak) begin
      uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready = 1'b1;
    end
  end

  assign bridge_read_streamBreaked_payload = uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload;
  always @(*) begin
    bridge_read_streamBreaked_ready = 1'b0;
    case(io_apb_PADDR)
      5'h0 : begin
        if(busCtrl_doRead) begin
          bridge_read_streamBreaked_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_interruptCtrl_readInt = (bridge_interruptCtrl_readIntEnable && bridge_read_streamBreaked_valid);
  assign bridge_interruptCtrl_writeInt = (bridge_interruptCtrl_writeIntEnable && (! bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid));
  assign bridge_interruptCtrl_interrupt = (bridge_interruptCtrl_readInt || bridge_interruptCtrl_writeInt);
  always @(*) begin
    when_BusSlaveFactory_l341 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l341 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l347 = io_apb_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l341_1 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l341_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l347_1 = io_apb_PWDATA[1];
  assign uartCtrl_1_io_read_isStall = (uartCtrl_1_io_read_valid && (! uartCtrl_1_io_read_queueWithOccupancy_io_push_ready));
  assign when_UartCtrl_l155 = (uartCtrl_1_io_readBreak && (! uartCtrl_1_io_readBreak_regNext));
  always @(*) begin
    when_BusSlaveFactory_l341_2 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l341_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l347_2 = io_apb_PWDATA[9];
  always @(*) begin
    when_BusSlaveFactory_l377 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l377 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l379 = io_apb_PWDATA[10];
  always @(*) begin
    when_BusSlaveFactory_l341_3 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l341_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l347_3 = io_apb_PWDATA[11];
  assign io_interrupt = bridge_interruptCtrl_interrupt;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      bridge_interruptCtrl_writeIntEnable <= 1'b0;
      bridge_interruptCtrl_readIntEnable <= 1'b0;
      bridge_misc_readError <= 1'b0;
      bridge_misc_readOverflowError <= 1'b0;
      bridge_misc_breakDetected <= 1'b0;
      bridge_misc_doBreak <= 1'b0;
    end else begin
      if(when_BusSlaveFactory_l341) begin
        if(when_BusSlaveFactory_l347) begin
          bridge_misc_readError <= _zz_bridge_misc_readError[0];
        end
      end
      if(uartCtrl_1_io_readError) begin
        bridge_misc_readError <= 1'b1;
      end
      if(when_BusSlaveFactory_l341_1) begin
        if(when_BusSlaveFactory_l347_1) begin
          bridge_misc_readOverflowError <= _zz_bridge_misc_readOverflowError[0];
        end
      end
      if(uartCtrl_1_io_read_isStall) begin
        bridge_misc_readOverflowError <= 1'b1;
      end
      if(when_UartCtrl_l155) begin
        bridge_misc_breakDetected <= 1'b1;
      end
      if(when_BusSlaveFactory_l341_2) begin
        if(when_BusSlaveFactory_l347_2) begin
          bridge_misc_breakDetected <= _zz_bridge_misc_breakDetected[0];
        end
      end
      if(when_BusSlaveFactory_l377) begin
        if(when_BusSlaveFactory_l379) begin
          bridge_misc_doBreak <= _zz_bridge_misc_doBreak[0];
        end
      end
      if(when_BusSlaveFactory_l341_3) begin
        if(when_BusSlaveFactory_l347_3) begin
          bridge_misc_doBreak <= _zz_bridge_misc_doBreak_1[0];
        end
      end
      case(io_apb_PADDR)
        5'h04 : begin
          if(busCtrl_doWrite) begin
            bridge_interruptCtrl_writeIntEnable <= io_apb_PWDATA[0];
            bridge_interruptCtrl_readIntEnable <= io_apb_PWDATA[1];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge aclk) begin
    uartCtrl_1_io_readBreak_regNext <= uartCtrl_1_io_readBreak;
  end


endmodule

module Axi4SharedOnChipRam (
  input  wire          io_axi_arw_valid,
  output reg           io_axi_arw_ready,
  input  wire [17:0]   io_axi_arw_payload_addr,
  input  wire [6:0]    io_axi_arw_payload_id,
  input  wire [7:0]    io_axi_arw_payload_len,
  input  wire [2:0]    io_axi_arw_payload_size,
  input  wire [1:0]    io_axi_arw_payload_burst,
  input  wire          io_axi_arw_payload_write,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire [6:0]    io_axi_b_payload_id,
  output wire [1:0]    io_axi_b_payload_resp,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire [6:0]    io_axi_r_payload_id,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  reg        [31:0]   ram_spinal_port0;
  wire       [1:0]    _zz_Axi4Incr_alignMask;
  wire       [11:0]   _zz_Axi4Incr_baseIncr;
  wire       [2:0]    _zz_Axi4Incr_wrapCase_1;
  wire       [2:0]    _zz_Axi4Incr_wrapCase_2;
  reg        [11:0]   _zz_Axi4Incr_result;
  wire       [10:0]   _zz_Axi4Incr_result_1;
  wire       [0:0]    _zz_Axi4Incr_result_2;
  wire       [9:0]    _zz_Axi4Incr_result_3;
  wire       [1:0]    _zz_Axi4Incr_result_4;
  wire       [8:0]    _zz_Axi4Incr_result_5;
  wire       [2:0]    _zz_Axi4Incr_result_6;
  wire       [7:0]    _zz_Axi4Incr_result_7;
  wire       [3:0]    _zz_Axi4Incr_result_8;
  wire       [6:0]    _zz_Axi4Incr_result_9;
  wire       [4:0]    _zz_Axi4Incr_result_10;
  wire       [5:0]    _zz_Axi4Incr_result_11;
  wire       [5:0]    _zz_Axi4Incr_result_12;
  reg                 unburstify_result_valid;
  wire                unburstify_result_ready;
  reg                 unburstify_result_payload_last;
  reg        [17:0]   unburstify_result_payload_fragment_addr;
  reg        [6:0]    unburstify_result_payload_fragment_id;
  reg        [2:0]    unburstify_result_payload_fragment_size;
  reg        [1:0]    unburstify_result_payload_fragment_burst;
  reg                 unburstify_result_payload_fragment_write;
  wire                unburstify_doResult;
  reg                 unburstify_buffer_valid;
  reg        [7:0]    unburstify_buffer_len;
  reg        [7:0]    unburstify_buffer_beat;
  reg        [17:0]   unburstify_buffer_transaction_addr;
  reg        [6:0]    unburstify_buffer_transaction_id;
  reg        [2:0]    unburstify_buffer_transaction_size;
  reg        [1:0]    unburstify_buffer_transaction_burst;
  reg                 unburstify_buffer_transaction_write;
  wire                unburstify_buffer_last;
  wire       [1:0]    Axi4Incr_validSize;
  reg        [17:0]   Axi4Incr_result;
  wire       [5:0]    Axi4Incr_highCat;
  wire       [2:0]    Axi4Incr_sizeValue;
  wire       [11:0]   Axi4Incr_alignMask;
  wire       [11:0]   Axi4Incr_base;
  wire       [11:0]   Axi4Incr_baseIncr;
  reg        [1:0]    _zz_Axi4Incr_wrapCase;
  wire       [2:0]    Axi4Incr_wrapCase;
  wire                when_Axi4Channel_l337;
  wire                _zz_unburstify_result_ready;
  wire                stage0_valid;
  reg                 stage0_ready;
  wire                stage0_payload_last;
  wire       [17:0]   stage0_payload_fragment_addr;
  wire       [6:0]    stage0_payload_fragment_id;
  wire       [2:0]    stage0_payload_fragment_size;
  wire       [1:0]    stage0_payload_fragment_burst;
  wire                stage0_payload_fragment_write;
  wire       [15:0]   _zz_io_axi_r_payload_data;
  wire                stage0_fire;
  wire       [31:0]   _zz_io_axi_r_payload_data_1;
  wire                stage1_valid;
  wire                stage1_ready;
  wire                stage1_payload_last;
  wire       [17:0]   stage1_payload_fragment_addr;
  wire       [6:0]    stage1_payload_fragment_id;
  wire       [2:0]    stage1_payload_fragment_size;
  wire       [1:0]    stage1_payload_fragment_burst;
  wire                stage1_payload_fragment_write;
  reg                 stage0_rValid;
  reg                 stage0_rData_last;
  reg        [17:0]   stage0_rData_fragment_addr;
  reg        [6:0]    stage0_rData_fragment_id;
  reg        [2:0]    stage0_rData_fragment_size;
  reg        [1:0]    stage0_rData_fragment_burst;
  reg                 stage0_rData_fragment_write;
  wire                when_Stream_l477;
  reg [7:0] ram_symbol0 [0:65535];
  reg [7:0] ram_symbol1 [0:65535];
  reg [7:0] ram_symbol2 [0:65535];
  reg [7:0] ram_symbol3 [0:65535];
  reg [7:0] _zz_ramsymbol_read;
  reg [7:0] _zz_ramsymbol_read_1;
  reg [7:0] _zz_ramsymbol_read_2;
  reg [7:0] _zz_ramsymbol_read_3;

  assign _zz_Axi4Incr_alignMask = {(2'b01 < Axi4Incr_validSize),(2'b00 < Axi4Incr_validSize)};
  assign _zz_Axi4Incr_baseIncr = {9'd0, Axi4Incr_sizeValue};
  assign _zz_Axi4Incr_wrapCase_1 = {1'd0, Axi4Incr_validSize};
  assign _zz_Axi4Incr_wrapCase_2 = {1'd0, _zz_Axi4Incr_wrapCase};
  assign _zz_Axi4Incr_result_1 = Axi4Incr_base[11 : 1];
  assign _zz_Axi4Incr_result_2 = Axi4Incr_baseIncr[0 : 0];
  assign _zz_Axi4Incr_result_3 = Axi4Incr_base[11 : 2];
  assign _zz_Axi4Incr_result_4 = Axi4Incr_baseIncr[1 : 0];
  assign _zz_Axi4Incr_result_5 = Axi4Incr_base[11 : 3];
  assign _zz_Axi4Incr_result_6 = Axi4Incr_baseIncr[2 : 0];
  assign _zz_Axi4Incr_result_7 = Axi4Incr_base[11 : 4];
  assign _zz_Axi4Incr_result_8 = Axi4Incr_baseIncr[3 : 0];
  assign _zz_Axi4Incr_result_9 = Axi4Incr_base[11 : 5];
  assign _zz_Axi4Incr_result_10 = Axi4Incr_baseIncr[4 : 0];
  assign _zz_Axi4Incr_result_11 = Axi4Incr_base[11 : 6];
  assign _zz_Axi4Incr_result_12 = Axi4Incr_baseIncr[5 : 0];
  always @(*) begin
    ram_spinal_port0 = {_zz_ramsymbol_read_3, _zz_ramsymbol_read_2, _zz_ramsymbol_read_1, _zz_ramsymbol_read};
  end
  always @(posedge aclk) begin
    if(stage0_fire) begin
      _zz_ramsymbol_read <= ram_symbol0[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_1 <= ram_symbol1[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_2 <= ram_symbol2[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_3 <= ram_symbol3[_zz_io_axi_r_payload_data];
    end
  end

  always @(posedge aclk) begin
    if(io_axi_w_payload_strb[0] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol0[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[7 : 0];
    end
    if(io_axi_w_payload_strb[1] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol1[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[15 : 8];
    end
    if(io_axi_w_payload_strb[2] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol2[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[23 : 16];
    end
    if(io_axi_w_payload_strb[3] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol3[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[31 : 24];
    end
  end

  always @(*) begin
    case(Axi4Incr_wrapCase)
      3'b000 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_1,_zz_Axi4Incr_result_2};
      3'b001 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_3,_zz_Axi4Incr_result_4};
      3'b010 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_5,_zz_Axi4Incr_result_6};
      3'b011 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_7,_zz_Axi4Incr_result_8};
      3'b100 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_9,_zz_Axi4Incr_result_10};
      default : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_11,_zz_Axi4Incr_result_12};
    endcase
  end

  assign unburstify_buffer_last = (unburstify_buffer_beat == 8'h01);
  assign Axi4Incr_validSize = unburstify_buffer_transaction_size[1 : 0];
  assign Axi4Incr_highCat = unburstify_buffer_transaction_addr[17 : 12];
  assign Axi4Incr_sizeValue = {(2'b10 == Axi4Incr_validSize),{(2'b01 == Axi4Incr_validSize),(2'b00 == Axi4Incr_validSize)}};
  assign Axi4Incr_alignMask = {10'd0, _zz_Axi4Incr_alignMask};
  assign Axi4Incr_base = (unburstify_buffer_transaction_addr[11 : 0] & (~ Axi4Incr_alignMask));
  assign Axi4Incr_baseIncr = (Axi4Incr_base + _zz_Axi4Incr_baseIncr);
  always @(*) begin
    casez(unburstify_buffer_len)
      8'b????1??? : begin
        _zz_Axi4Incr_wrapCase = 2'b11;
      end
      8'b????01?? : begin
        _zz_Axi4Incr_wrapCase = 2'b10;
      end
      8'b????001? : begin
        _zz_Axi4Incr_wrapCase = 2'b01;
      end
      default : begin
        _zz_Axi4Incr_wrapCase = 2'b00;
      end
    endcase
  end

  assign Axi4Incr_wrapCase = (_zz_Axi4Incr_wrapCase_1 + _zz_Axi4Incr_wrapCase_2);
  always @(*) begin
    case(unburstify_buffer_transaction_burst)
      2'b00 : begin
        Axi4Incr_result = unburstify_buffer_transaction_addr;
      end
      2'b10 : begin
        Axi4Incr_result = {Axi4Incr_highCat,_zz_Axi4Incr_result};
      end
      default : begin
        Axi4Incr_result = {Axi4Incr_highCat,Axi4Incr_baseIncr};
      end
    endcase
  end

  always @(*) begin
    io_axi_arw_ready = 1'b0;
    if(!unburstify_buffer_valid) begin
      io_axi_arw_ready = unburstify_result_ready;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_valid = 1'b1;
    end else begin
      unburstify_result_valid = io_axi_arw_valid;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_last = unburstify_buffer_last;
    end else begin
      unburstify_result_payload_last = 1'b1;
      if(when_Axi4Channel_l337) begin
        unburstify_result_payload_last = 1'b0;
      end
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_id = unburstify_buffer_transaction_id;
    end else begin
      unburstify_result_payload_fragment_id = io_axi_arw_payload_id;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_size = unburstify_buffer_transaction_size;
    end else begin
      unburstify_result_payload_fragment_size = io_axi_arw_payload_size;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_burst = unburstify_buffer_transaction_burst;
    end else begin
      unburstify_result_payload_fragment_burst = io_axi_arw_payload_burst;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_write = unburstify_buffer_transaction_write;
    end else begin
      unburstify_result_payload_fragment_write = io_axi_arw_payload_write;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_addr = Axi4Incr_result;
    end else begin
      unburstify_result_payload_fragment_addr = io_axi_arw_payload_addr;
    end
  end

  assign when_Axi4Channel_l337 = (io_axi_arw_payload_len != 8'h0);
  assign _zz_unburstify_result_ready = (! (unburstify_result_payload_fragment_write && (! io_axi_w_valid)));
  assign stage0_valid = (unburstify_result_valid && _zz_unburstify_result_ready);
  assign unburstify_result_ready = (stage0_ready && _zz_unburstify_result_ready);
  assign stage0_payload_last = unburstify_result_payload_last;
  assign stage0_payload_fragment_addr = unburstify_result_payload_fragment_addr;
  assign stage0_payload_fragment_id = unburstify_result_payload_fragment_id;
  assign stage0_payload_fragment_size = unburstify_result_payload_fragment_size;
  assign stage0_payload_fragment_burst = unburstify_result_payload_fragment_burst;
  assign stage0_payload_fragment_write = unburstify_result_payload_fragment_write;
  assign _zz_io_axi_r_payload_data = stage0_payload_fragment_addr[17 : 2];
  assign stage0_fire = (stage0_valid && stage0_ready);
  assign _zz_io_axi_r_payload_data_1 = io_axi_w_payload_data;
  assign io_axi_r_payload_data = ram_spinal_port0;
  assign io_axi_w_ready = ((unburstify_result_valid && unburstify_result_payload_fragment_write) && stage0_ready);
  always @(*) begin
    stage0_ready = stage1_ready;
    if(when_Stream_l477) begin
      stage0_ready = 1'b1;
    end
  end

  assign when_Stream_l477 = (! stage1_valid);
  assign stage1_valid = stage0_rValid;
  assign stage1_payload_last = stage0_rData_last;
  assign stage1_payload_fragment_addr = stage0_rData_fragment_addr;
  assign stage1_payload_fragment_id = stage0_rData_fragment_id;
  assign stage1_payload_fragment_size = stage0_rData_fragment_size;
  assign stage1_payload_fragment_burst = stage0_rData_fragment_burst;
  assign stage1_payload_fragment_write = stage0_rData_fragment_write;
  assign stage1_ready = ((io_axi_r_ready && (! stage1_payload_fragment_write)) || ((io_axi_b_ready || (! stage1_payload_last)) && stage1_payload_fragment_write));
  assign io_axi_r_valid = (stage1_valid && (! stage1_payload_fragment_write));
  assign io_axi_r_payload_id = stage1_payload_fragment_id;
  assign io_axi_r_payload_last = stage1_payload_last;
  assign io_axi_r_payload_resp = 2'b00;
  assign io_axi_b_valid = ((stage1_valid && stage1_payload_fragment_write) && stage1_payload_last);
  assign io_axi_b_payload_resp = 2'b00;
  assign io_axi_b_payload_id = stage1_payload_fragment_id;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      unburstify_buffer_valid <= 1'b0;
      stage0_rValid <= 1'b0;
    end else begin
      if(unburstify_result_ready) begin
        if(unburstify_buffer_last) begin
          unburstify_buffer_valid <= 1'b0;
        end
      end
      if(!unburstify_buffer_valid) begin
        if(when_Axi4Channel_l337) begin
          if(unburstify_result_ready) begin
            unburstify_buffer_valid <= io_axi_arw_valid;
          end
        end
      end
      if(stage0_ready) begin
        stage0_rValid <= stage0_valid;
      end
    end
  end

  always @(posedge aclk) begin
    if(unburstify_result_ready) begin
      unburstify_buffer_beat <= (unburstify_buffer_beat - 8'h01);
      unburstify_buffer_transaction_addr[11 : 0] <= Axi4Incr_result[11 : 0];
    end
    if(!unburstify_buffer_valid) begin
      if(when_Axi4Channel_l337) begin
        if(unburstify_result_ready) begin
          unburstify_buffer_transaction_addr <= io_axi_arw_payload_addr;
          unburstify_buffer_transaction_id <= io_axi_arw_payload_id;
          unburstify_buffer_transaction_size <= io_axi_arw_payload_size;
          unburstify_buffer_transaction_burst <= io_axi_arw_payload_burst;
          unburstify_buffer_transaction_write <= io_axi_arw_payload_write;
          unburstify_buffer_beat <= io_axi_arw_payload_len;
          unburstify_buffer_len <= io_axi_arw_payload_len;
        end
      end
    end
    if(stage0_ready) begin
      stage0_rData_last <= stage0_payload_last;
      stage0_rData_fragment_addr <= stage0_payload_fragment_addr;
      stage0_rData_fragment_id <= stage0_payload_fragment_id;
      stage0_rData_fragment_size <= stage0_payload_fragment_size;
      stage0_rData_fragment_burst <= stage0_payload_fragment_burst;
      stage0_rData_fragment_write <= stage0_payload_fragment_write;
    end
  end


endmodule

//BufferCC_3 replaced by BufferCC_2

module BufferCC_2 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          aclk
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge aclk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

//StreamFifoLowLatency_2 replaced by StreamFifoLowLatency_1

module StreamArbiter_3 (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [31:0]   io_inputs_0_payload_addr,
  input  wire [3:0]    io_inputs_0_payload_id,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [31:0]   io_output_payload_addr,
  output wire [3:0]    io_output_payload_id,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire [0:0]    io_chosenOH,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  wire       [1:0]    _zz__zz_maskProposal_0_2;
  wire       [1:0]    _zz__zz_maskProposal_0_2_1;
  wire       [0:0]    _zz__zz_maskProposal_0_2_2;
  wire       [0:0]    _zz_maskProposal_0_3;
  reg                 locked;
  wire                maskProposal_0;
  reg                 maskLocked_0;
  wire                maskRouted_0;
  wire       [0:0]    _zz_maskProposal_0;
  wire       [1:0]    _zz_maskProposal_0_1;
  wire       [1:0]    _zz_maskProposal_0_2;
  wire                io_output_fire;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = maskLocked_0;
  assign _zz__zz_maskProposal_0_2_1 = {1'd0, _zz__zz_maskProposal_0_2_2};
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[1 : 1] | _zz_maskProposal_0_2[0 : 0]);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign _zz_maskProposal_0 = io_inputs_0_valid;
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = (io_inputs_0_valid && maskRouted_0);
  assign io_output_payload_addr = io_inputs_0_payload_addr;
  assign io_output_payload_id = io_inputs_0_payload_id;
  assign io_output_payload_len = io_inputs_0_payload_len;
  assign io_output_payload_size = io_inputs_0_payload_size;
  assign io_output_payload_burst = io_inputs_0_payload_burst;
  assign io_inputs_0_ready = ((1'b0 || maskRouted_0) && io_output_ready);
  assign io_chosenOH = maskRouted_0;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module StreamArbiter_2 (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [31:0]   io_inputs_0_payload_addr,
  input  wire [2:0]    io_inputs_0_payload_id,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  input  wire          io_inputs_1_valid,
  output wire          io_inputs_1_ready,
  input  wire [31:0]   io_inputs_1_payload_addr,
  input  wire [2:0]    io_inputs_1_payload_id,
  input  wire [7:0]    io_inputs_1_payload_len,
  input  wire [2:0]    io_inputs_1_payload_size,
  input  wire [1:0]    io_inputs_1_payload_burst,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [31:0]   io_output_payload_addr,
  output wire [2:0]    io_output_payload_id,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire [0:0]    io_chosen,
  output wire [1:0]    io_chosenOH,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  wire       [3:0]    _zz__zz_maskProposal_0_2;
  wire       [3:0]    _zz__zz_maskProposal_0_2_1;
  wire       [1:0]    _zz__zz_maskProposal_0_2_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_0;
  wire       [3:0]    _zz_maskProposal_0_1;
  wire       [3:0]    _zz_maskProposal_0_2;
  wire       [1:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire                _zz_io_chosen;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_0,maskLocked_1};
  assign _zz__zz_maskProposal_0_2_1 = {2'd0, _zz__zz_maskProposal_0_2_2};
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_0 = {io_inputs_1_valid,io_inputs_0_valid};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[3 : 2] | _zz_maskProposal_0_2[1 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_addr = (maskRouted_0 ? io_inputs_0_payload_addr : io_inputs_1_payload_addr);
  assign io_output_payload_id = (maskRouted_0 ? io_inputs_0_payload_id : io_inputs_1_payload_id);
  assign io_output_payload_len = (maskRouted_0 ? io_inputs_0_payload_len : io_inputs_1_payload_len);
  assign io_output_payload_size = (maskRouted_0 ? io_inputs_0_payload_size : io_inputs_1_payload_size);
  assign io_output_payload_burst = (maskRouted_0 ? io_inputs_0_payload_burst : io_inputs_1_payload_burst);
  assign io_inputs_0_ready = ((1'b0 || maskRouted_0) && io_output_ready);
  assign io_inputs_1_ready = ((1'b0 || maskRouted_1) && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module StreamFifoLowLatency_1 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [2:0]    fifo_io_occupancy;
  wire       [2:0]    fifo_io_availability;

  StreamFifo_3 fifo (
    .io_push_valid          (io_push_valid            ), //i
    .io_push_ready          (fifo_io_push_ready       ), //o
    .io_pop_valid           (fifo_io_pop_valid        ), //o
    .io_pop_ready           (io_pop_ready             ), //i
    .io_flush               (io_flush                 ), //i
    .io_occupancy           (fifo_io_occupancy[2:0]   ), //o
    .io_availability        (fifo_io_availability[2:0]), //o
    .aclk                   (aclk                     ), //i
    .resetCtrl_mainClkReset (resetCtrl_mainClkReset   )  //i
  );
  assign io_push_ready = fifo_io_push_ready;
  assign io_pop_valid = fifo_io_pop_valid;
  assign io_occupancy = fifo_io_occupancy;
  assign io_availability = fifo_io_availability;

endmodule

module StreamArbiter_1 (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [23:0]   io_inputs_0_payload_addr,
  input  wire [3:0]    io_inputs_0_payload_id,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  input  wire          io_inputs_0_payload_write,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [23:0]   io_output_payload_addr,
  output wire [3:0]    io_output_payload_id,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire          io_output_payload_write,
  output wire [0:0]    io_chosenOH,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  wire       [1:0]    _zz__zz_maskProposal_0_2;
  wire       [1:0]    _zz__zz_maskProposal_0_2_1;
  wire       [0:0]    _zz__zz_maskProposal_0_2_2;
  wire       [0:0]    _zz_maskProposal_0_3;
  reg                 locked;
  wire                maskProposal_0;
  reg                 maskLocked_0;
  wire                maskRouted_0;
  wire       [0:0]    _zz_maskProposal_0;
  wire       [1:0]    _zz_maskProposal_0_1;
  wire       [1:0]    _zz_maskProposal_0_2;
  wire                io_output_fire;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = maskLocked_0;
  assign _zz__zz_maskProposal_0_2_1 = {1'd0, _zz__zz_maskProposal_0_2_2};
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[1 : 1] | _zz_maskProposal_0_2[0 : 0]);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign _zz_maskProposal_0 = io_inputs_0_valid;
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = (io_inputs_0_valid && maskRouted_0);
  assign io_output_payload_addr = io_inputs_0_payload_addr;
  assign io_output_payload_id = io_inputs_0_payload_id;
  assign io_output_payload_len = io_inputs_0_payload_len;
  assign io_output_payload_size = io_inputs_0_payload_size;
  assign io_output_payload_burst = io_inputs_0_payload_burst;
  assign io_output_payload_write = io_inputs_0_payload_write;
  assign io_inputs_0_ready = ((1'b0 || maskRouted_0) && io_output_ready);
  assign io_chosenOH = maskRouted_0;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module StreamFifoLowLatency (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [0:0]    io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [0:0]    io_pop_payload,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [0:0]    fifo_io_pop_payload;
  wire       [2:0]    fifo_io_occupancy;
  wire       [2:0]    fifo_io_availability;

  StreamFifo_2 fifo (
    .io_push_valid          (io_push_valid            ), //i
    .io_push_ready          (fifo_io_push_ready       ), //o
    .io_push_payload        (io_push_payload          ), //i
    .io_pop_valid           (fifo_io_pop_valid        ), //o
    .io_pop_ready           (io_pop_ready             ), //i
    .io_pop_payload         (fifo_io_pop_payload      ), //o
    .io_flush               (io_flush                 ), //i
    .io_occupancy           (fifo_io_occupancy[2:0]   ), //o
    .io_availability        (fifo_io_availability[2:0]), //o
    .aclk                   (aclk                     ), //i
    .resetCtrl_mainClkReset (resetCtrl_mainClkReset   )  //i
  );
  assign io_push_ready = fifo_io_push_ready;
  assign io_pop_valid = fifo_io_pop_valid;
  assign io_pop_payload = fifo_io_pop_payload;
  assign io_occupancy = fifo_io_occupancy;
  assign io_availability = fifo_io_availability;

endmodule

module StreamArbiter (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [17:0]   io_inputs_0_payload_addr,
  input  wire [4:0]    io_inputs_0_payload_id,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  input  wire          io_inputs_0_payload_write,
  input  wire          io_inputs_1_valid,
  output wire          io_inputs_1_ready,
  input  wire [17:0]   io_inputs_1_payload_addr,
  input  wire [4:0]    io_inputs_1_payload_id,
  input  wire [7:0]    io_inputs_1_payload_len,
  input  wire [2:0]    io_inputs_1_payload_size,
  input  wire [1:0]    io_inputs_1_payload_burst,
  input  wire          io_inputs_1_payload_write,
  input  wire          io_inputs_2_valid,
  output wire          io_inputs_2_ready,
  input  wire [17:0]   io_inputs_2_payload_addr,
  input  wire [4:0]    io_inputs_2_payload_id,
  input  wire [7:0]    io_inputs_2_payload_len,
  input  wire [2:0]    io_inputs_2_payload_size,
  input  wire [1:0]    io_inputs_2_payload_burst,
  input  wire          io_inputs_2_payload_write,
  input  wire          io_inputs_3_valid,
  output wire          io_inputs_3_ready,
  input  wire [17:0]   io_inputs_3_payload_addr,
  input  wire [4:0]    io_inputs_3_payload_id,
  input  wire [7:0]    io_inputs_3_payload_len,
  input  wire [2:0]    io_inputs_3_payload_size,
  input  wire [1:0]    io_inputs_3_payload_burst,
  input  wire          io_inputs_3_payload_write,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [17:0]   io_output_payload_addr,
  output wire [4:0]    io_output_payload_id,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire          io_output_payload_write,
  output wire [1:0]    io_chosen,
  output wire [3:0]    io_chosenOH,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  wire       [7:0]    _zz__zz_maskProposal_0_2;
  wire       [7:0]    _zz__zz_maskProposal_0_2_1;
  wire       [3:0]    _zz__zz_maskProposal_0_2_2;
  reg        [17:0]   _zz_io_output_payload_addr_3;
  reg        [4:0]    _zz_io_output_payload_id;
  reg        [7:0]    _zz_io_output_payload_len;
  reg        [2:0]    _zz_io_output_payload_size;
  reg        [1:0]    _zz_io_output_payload_burst;
  reg                 _zz_io_output_payload_write;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  wire                maskProposal_2;
  wire                maskProposal_3;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  reg                 maskLocked_2;
  reg                 maskLocked_3;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire                maskRouted_2;
  wire                maskRouted_3;
  wire       [3:0]    _zz_maskProposal_0;
  wire       [7:0]    _zz_maskProposal_0_1;
  wire       [7:0]    _zz_maskProposal_0_2;
  wire       [3:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire                _zz_io_output_payload_addr;
  wire                _zz_io_output_payload_addr_1;
  wire       [1:0]    _zz_io_output_payload_addr_2;
  wire                _zz_io_chosen;
  wire                _zz_io_chosen_1;
  wire                _zz_io_chosen_2;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_2,{maskLocked_1,{maskLocked_0,maskLocked_3}}};
  assign _zz__zz_maskProposal_0_2_1 = {4'd0, _zz__zz_maskProposal_0_2_2};
  always @(*) begin
    case(_zz_io_output_payload_addr_2)
      2'b00 : begin
        _zz_io_output_payload_addr_3 = io_inputs_0_payload_addr;
        _zz_io_output_payload_id = io_inputs_0_payload_id;
        _zz_io_output_payload_len = io_inputs_0_payload_len;
        _zz_io_output_payload_size = io_inputs_0_payload_size;
        _zz_io_output_payload_burst = io_inputs_0_payload_burst;
        _zz_io_output_payload_write = io_inputs_0_payload_write;
      end
      2'b01 : begin
        _zz_io_output_payload_addr_3 = io_inputs_1_payload_addr;
        _zz_io_output_payload_id = io_inputs_1_payload_id;
        _zz_io_output_payload_len = io_inputs_1_payload_len;
        _zz_io_output_payload_size = io_inputs_1_payload_size;
        _zz_io_output_payload_burst = io_inputs_1_payload_burst;
        _zz_io_output_payload_write = io_inputs_1_payload_write;
      end
      2'b10 : begin
        _zz_io_output_payload_addr_3 = io_inputs_2_payload_addr;
        _zz_io_output_payload_id = io_inputs_2_payload_id;
        _zz_io_output_payload_len = io_inputs_2_payload_len;
        _zz_io_output_payload_size = io_inputs_2_payload_size;
        _zz_io_output_payload_burst = io_inputs_2_payload_burst;
        _zz_io_output_payload_write = io_inputs_2_payload_write;
      end
      default : begin
        _zz_io_output_payload_addr_3 = io_inputs_3_payload_addr;
        _zz_io_output_payload_id = io_inputs_3_payload_id;
        _zz_io_output_payload_len = io_inputs_3_payload_len;
        _zz_io_output_payload_size = io_inputs_3_payload_size;
        _zz_io_output_payload_burst = io_inputs_3_payload_burst;
        _zz_io_output_payload_write = io_inputs_3_payload_write;
      end
    endcase
  end

  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign maskRouted_2 = (locked ? maskLocked_2 : maskProposal_2);
  assign maskRouted_3 = (locked ? maskLocked_3 : maskProposal_3);
  assign _zz_maskProposal_0 = {io_inputs_3_valid,{io_inputs_2_valid,{io_inputs_1_valid,io_inputs_0_valid}}};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[7 : 4] | _zz_maskProposal_0_2[3 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign maskProposal_2 = _zz_maskProposal_0_3[2];
  assign maskProposal_3 = _zz_maskProposal_0_3[3];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1)) || (io_inputs_2_valid && maskRouted_2)) || (io_inputs_3_valid && maskRouted_3));
  assign _zz_io_output_payload_addr = (maskRouted_1 || maskRouted_3);
  assign _zz_io_output_payload_addr_1 = (maskRouted_2 || maskRouted_3);
  assign _zz_io_output_payload_addr_2 = {_zz_io_output_payload_addr_1,_zz_io_output_payload_addr};
  assign io_output_payload_addr = _zz_io_output_payload_addr_3;
  assign io_output_payload_id = _zz_io_output_payload_id;
  assign io_output_payload_len = _zz_io_output_payload_len;
  assign io_output_payload_size = _zz_io_output_payload_size;
  assign io_output_payload_burst = _zz_io_output_payload_burst;
  assign io_output_payload_write = _zz_io_output_payload_write;
  assign io_inputs_0_ready = ((1'b0 || maskRouted_0) && io_output_ready);
  assign io_inputs_1_ready = ((1'b0 || maskRouted_1) && io_output_ready);
  assign io_inputs_2_ready = ((1'b0 || maskRouted_2) && io_output_ready);
  assign io_inputs_3_ready = ((1'b0 || maskRouted_3) && io_output_ready);
  assign io_chosenOH = {maskRouted_3,{maskRouted_2,{maskRouted_1,maskRouted_0}}};
  assign _zz_io_chosen = io_chosenOH[3];
  assign _zz_io_chosen_1 = (io_chosenOH[1] || _zz_io_chosen);
  assign _zz_io_chosen_2 = (io_chosenOH[2] || _zz_io_chosen);
  assign io_chosen = {_zz_io_chosen_2,_zz_io_chosen_1};
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b0;
      maskLocked_2 <= 1'b0;
      maskLocked_3 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
        maskLocked_2 <= maskRouted_2;
        maskLocked_3 <= maskRouted_3;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module Axi4WriteOnlyErrorSlave (
  input  wire          io_axi_aw_valid,
  output wire          io_axi_aw_ready,
  input  wire [31:0]   io_axi_aw_payload_addr,
  input  wire [3:0]    io_axi_aw_payload_id,
  input  wire [7:0]    io_axi_aw_payload_len,
  input  wire [2:0]    io_axi_aw_payload_size,
  input  wire [1:0]    io_axi_aw_payload_burst,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire [3:0]    io_axi_b_payload_id,
  output wire [1:0]    io_axi_b_payload_resp,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  reg                 consumeData;
  reg                 sendRsp;
  reg        [3:0]    id;
  wire                io_axi_aw_fire;
  wire                io_axi_w_fire;
  wire                when_Axi4ErrorSlave_l24;
  wire                io_axi_b_fire;

  assign io_axi_aw_ready = (! (consumeData || sendRsp));
  assign io_axi_aw_fire = (io_axi_aw_valid && io_axi_aw_ready);
  assign io_axi_w_ready = consumeData;
  assign io_axi_w_fire = (io_axi_w_valid && io_axi_w_ready);
  assign when_Axi4ErrorSlave_l24 = (io_axi_w_fire && io_axi_w_payload_last);
  assign io_axi_b_valid = sendRsp;
  assign io_axi_b_payload_resp = 2'b11;
  assign io_axi_b_payload_id = id;
  assign io_axi_b_fire = (io_axi_b_valid && io_axi_b_ready);
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      consumeData <= 1'b0;
      sendRsp <= 1'b0;
    end else begin
      if(io_axi_aw_fire) begin
        consumeData <= 1'b1;
      end
      if(when_Axi4ErrorSlave_l24) begin
        consumeData <= 1'b0;
        sendRsp <= 1'b1;
      end
      if(io_axi_b_fire) begin
        sendRsp <= 1'b0;
      end
    end
  end

  always @(posedge aclk) begin
    if(io_axi_aw_fire) begin
      id <= io_axi_aw_payload_id;
    end
  end


endmodule

module Axi4ReadOnlyErrorSlave_1 (
  input  wire          io_axi_ar_valid,
  output wire          io_axi_ar_ready,
  input  wire [31:0]   io_axi_ar_payload_addr,
  input  wire [3:0]    io_axi_ar_payload_id,
  input  wire [7:0]    io_axi_ar_payload_len,
  input  wire [2:0]    io_axi_ar_payload_size,
  input  wire [1:0]    io_axi_ar_payload_burst,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire [3:0]    io_axi_r_payload_id,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  reg                 sendRsp;
  reg        [3:0]    id;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_ar_fire;

  assign remainingZero = (remaining == 8'h0);
  assign io_axi_ar_ready = (! sendRsp);
  assign io_axi_ar_fire = (io_axi_ar_valid && io_axi_ar_ready);
  assign io_axi_r_valid = sendRsp;
  assign io_axi_r_payload_id = id;
  assign io_axi_r_payload_resp = 2'b11;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      sendRsp <= 1'b0;
    end else begin
      if(io_axi_ar_fire) begin
        sendRsp <= 1'b1;
      end
      if(sendRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge aclk) begin
    if(io_axi_ar_fire) begin
      remaining <= io_axi_ar_payload_len;
      id <= io_axi_ar_payload_id;
    end
    if(sendRsp) begin
      if(io_axi_r_ready) begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule

module Axi4SharedErrorSlave (
  input  wire          io_axi_arw_valid,
  output wire          io_axi_arw_ready,
  input  wire [31:0]   io_axi_arw_payload_addr,
  input  wire [7:0]    io_axi_arw_payload_len,
  input  wire [2:0]    io_axi_arw_payload_size,
  input  wire [3:0]    io_axi_arw_payload_cache,
  input  wire [2:0]    io_axi_arw_payload_prot,
  input  wire          io_axi_arw_payload_write,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire [1:0]    io_axi_b_payload_resp,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  reg                 consumeData;
  reg                 sendReadRsp;
  reg                 sendWriteRsp;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_arw_fire;
  wire                io_axi_w_fire;
  wire                when_Axi4ErrorSlave_l92;
  wire                io_axi_b_fire;

  assign remainingZero = (remaining == 8'h0);
  assign io_axi_arw_ready = (! ((consumeData || sendWriteRsp) || sendReadRsp));
  assign io_axi_arw_fire = (io_axi_arw_valid && io_axi_arw_ready);
  assign io_axi_w_ready = consumeData;
  assign io_axi_w_fire = (io_axi_w_valid && io_axi_w_ready);
  assign when_Axi4ErrorSlave_l92 = (io_axi_w_fire && io_axi_w_payload_last);
  assign io_axi_b_valid = sendWriteRsp;
  assign io_axi_b_payload_resp = 2'b11;
  assign io_axi_b_fire = (io_axi_b_valid && io_axi_b_ready);
  assign io_axi_r_valid = sendReadRsp;
  assign io_axi_r_payload_resp = 2'b11;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      consumeData <= 1'b0;
      sendReadRsp <= 1'b0;
      sendWriteRsp <= 1'b0;
    end else begin
      if(io_axi_arw_fire) begin
        consumeData <= io_axi_arw_payload_write;
        sendReadRsp <= (! io_axi_arw_payload_write);
      end
      if(when_Axi4ErrorSlave_l92) begin
        consumeData <= 1'b0;
        sendWriteRsp <= 1'b1;
      end
      if(io_axi_b_fire) begin
        sendWriteRsp <= 1'b0;
      end
      if(sendReadRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendReadRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge aclk) begin
    if(io_axi_arw_fire) begin
      remaining <= io_axi_arw_payload_len;
    end
    if(sendReadRsp) begin
      if(io_axi_r_ready) begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule

module Axi4ReadOnlyErrorSlave (
  input  wire          io_axi_ar_valid,
  output wire          io_axi_ar_ready,
  input  wire [31:0]   io_axi_ar_payload_addr,
  input  wire [7:0]    io_axi_ar_payload_len,
  input  wire [1:0]    io_axi_ar_payload_burst,
  input  wire [3:0]    io_axi_ar_payload_cache,
  input  wire [2:0]    io_axi_ar_payload_prot,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  reg                 sendRsp;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_ar_fire;

  assign remainingZero = (remaining == 8'h0);
  assign io_axi_ar_ready = (! sendRsp);
  assign io_axi_ar_fire = (io_axi_ar_valid && io_axi_ar_ready);
  assign io_axi_r_valid = sendRsp;
  assign io_axi_r_payload_resp = 2'b11;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      sendRsp <= 1'b0;
    end else begin
      if(io_axi_ar_fire) begin
        sendRsp <= 1'b1;
      end
      if(sendRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge aclk) begin
    if(io_axi_ar_fire) begin
      remaining <= io_axi_ar_payload_len;
    end
    if(sendRsp) begin
      if(io_axi_r_ready) begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule

module FlowCCUnsafeByToggle (
  input  wire          io_input_valid,
  input  wire          io_input_payload_last,
  input  wire [0:0]    io_input_payload_fragment,
  output wire          io_output_valid,
  output wire          io_output_payload_last,
  output wire [0:0]    io_output_payload_fragment,
  input  wire          io_jtag_tck,
  input  wire          aclk,
  input  wire          resetCtrl_debugReset
);

  wire                inputArea_target_buffercc_io_dataOut;
  (* altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg                 inputArea_target;
  (* altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg                 inputArea_data_last;
  (* altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg        [0:0]    inputArea_data_fragment;
  wire                outputArea_target;
  (* altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg                 outputArea_hit;
  wire                outputArea_flow_valid;
  wire                outputArea_flow_payload_last;
  wire       [0:0]    outputArea_flow_payload_fragment;
  (* altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg                 outputArea_flow_m2sPipe_valid;
  (* async_reg = "true" , altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg                 outputArea_flow_m2sPipe_payload_last;
  (* async_reg = "true" , altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg        [0:0]    outputArea_flow_m2sPipe_payload_fragment;

  (* keep_hierarchy = "TRUE" *) BufferCC_1 inputArea_target_buffercc (
    .io_dataIn            (inputArea_target                    ), //i
    .io_dataOut           (inputArea_target_buffercc_io_dataOut), //o
    .aclk                 (aclk                                ), //i
    .resetCtrl_debugReset (resetCtrl_debugReset                )  //i
  );
  initial begin
  `ifndef SYNTHESIS
    inputArea_target = $urandom;
    outputArea_hit = $urandom;
  `endif
  end

  assign outputArea_target = inputArea_target_buffercc_io_dataOut;
  assign outputArea_flow_valid = (outputArea_target != outputArea_hit);
  assign outputArea_flow_payload_last = inputArea_data_last;
  assign outputArea_flow_payload_fragment = inputArea_data_fragment;
  assign io_output_valid = outputArea_flow_m2sPipe_valid;
  assign io_output_payload_last = outputArea_flow_m2sPipe_payload_last;
  assign io_output_payload_fragment = outputArea_flow_m2sPipe_payload_fragment;
  always @(posedge io_jtag_tck) begin
    if(io_input_valid) begin
      inputArea_target <= (! inputArea_target);
      inputArea_data_last <= io_input_payload_last;
      inputArea_data_fragment <= io_input_payload_fragment;
    end
  end

  always @(posedge aclk) begin
    outputArea_hit <= outputArea_target;
    if(outputArea_flow_valid) begin
      outputArea_flow_m2sPipe_payload_last <= outputArea_flow_payload_last;
      outputArea_flow_m2sPipe_payload_fragment <= outputArea_flow_payload_fragment;
    end
  end

  always @(posedge aclk or posedge resetCtrl_debugReset) begin
    if(resetCtrl_debugReset) begin
      outputArea_flow_m2sPipe_valid <= 1'b0;
    end else begin
      outputArea_flow_m2sPipe_valid <= outputArea_flow_valid;
    end
  end


endmodule

module DataCache (
  input  wire          io_cpu_execute_isValid,
  input  wire [31:0]   io_cpu_execute_address,
  output reg           io_cpu_execute_haltIt,
  input  wire          io_cpu_execute_args_wr,
  input  wire [1:0]    io_cpu_execute_args_size,
  input  wire          io_cpu_execute_args_totalyConsistent,
  output wire          io_cpu_execute_refilling,
  input  wire          io_cpu_memory_isValid,
  input  wire          io_cpu_memory_isStuck,
  output wire          io_cpu_memory_isWrite,
  input  wire [31:0]   io_cpu_memory_address,
  input  wire [31:0]   io_cpu_memory_mmuRsp_physicalAddress,
  input  wire          io_cpu_memory_mmuRsp_isIoAccess,
  input  wire          io_cpu_memory_mmuRsp_isPaging,
  input  wire          io_cpu_memory_mmuRsp_allowRead,
  input  wire          io_cpu_memory_mmuRsp_allowWrite,
  input  wire          io_cpu_memory_mmuRsp_allowExecute,
  input  wire          io_cpu_memory_mmuRsp_exception,
  input  wire          io_cpu_memory_mmuRsp_refilling,
  input  wire          io_cpu_memory_mmuRsp_bypassTranslation,
  input  wire          io_cpu_writeBack_isValid,
  input  wire          io_cpu_writeBack_isStuck,
  input  wire          io_cpu_writeBack_isFiring,
  input  wire          io_cpu_writeBack_isUser,
  output reg           io_cpu_writeBack_haltIt,
  output wire          io_cpu_writeBack_isWrite,
  input  wire [31:0]   io_cpu_writeBack_storeData,
  output reg  [31:0]   io_cpu_writeBack_data,
  input  wire [31:0]   io_cpu_writeBack_address,
  output wire          io_cpu_writeBack_mmuException,
  output wire          io_cpu_writeBack_unalignedAccess,
  output reg           io_cpu_writeBack_accessError,
  output wire          io_cpu_writeBack_keepMemRspData,
  input  wire          io_cpu_writeBack_fence_SW,
  input  wire          io_cpu_writeBack_fence_SR,
  input  wire          io_cpu_writeBack_fence_SO,
  input  wire          io_cpu_writeBack_fence_SI,
  input  wire          io_cpu_writeBack_fence_PW,
  input  wire          io_cpu_writeBack_fence_PR,
  input  wire          io_cpu_writeBack_fence_PO,
  input  wire          io_cpu_writeBack_fence_PI,
  input  wire [3:0]    io_cpu_writeBack_fence_FM,
  output wire          io_cpu_writeBack_exclusiveOk,
  output reg           io_cpu_redo,
  input  wire          io_cpu_flush_valid,
  output wire          io_cpu_flush_ready,
  input  wire          io_cpu_flush_payload_singleLine,
  input  wire [6:0]    io_cpu_flush_payload_lineId,
  output wire          io_cpu_writesPending,
  output reg           io_mem_cmd_valid,
  input  wire          io_mem_cmd_ready,
  output reg           io_mem_cmd_payload_wr,
  output wire          io_mem_cmd_payload_uncached,
  output reg  [31:0]   io_mem_cmd_payload_address,
  output wire [31:0]   io_mem_cmd_payload_data,
  output wire [3:0]    io_mem_cmd_payload_mask,
  output reg  [2:0]    io_mem_cmd_payload_size,
  output wire          io_mem_cmd_payload_last,
  input  wire          io_mem_rsp_valid,
  input  wire          io_mem_rsp_payload_last,
  input  wire [31:0]   io_mem_rsp_payload_data,
  input  wire          io_mem_rsp_payload_error,
  input  wire          aclk,
  input  wire          _zz_7
);

  reg        [20:0]   ways_0_tags_spinal_port0;
  reg        [31:0]   ways_0_data_spinal_port0;
  wire       [20:0]   _zz_ways_0_tags_port;
  wire       [0:0]    _zz_when;
  wire       [3:0]    _zz_loader_counter_valueNext;
  wire       [0:0]    _zz_loader_counter_valueNext_1;
  wire       [1:0]    _zz_loader_waysAllocator;
  reg                 _zz_1;
  reg                 _zz_2;
  wire                haltCpu;
  reg                 tagsReadCmd_valid;
  reg        [6:0]    tagsReadCmd_payload;
  reg                 tagsWriteCmd_valid;
  reg        [0:0]    tagsWriteCmd_payload_way;
  reg        [6:0]    tagsWriteCmd_payload_address;
  reg                 tagsWriteCmd_payload_data_valid;
  reg                 tagsWriteCmd_payload_data_error;
  reg        [18:0]   tagsWriteCmd_payload_data_address;
  reg                 tagsWriteLastCmd_valid;
  reg        [0:0]    tagsWriteLastCmd_payload_way;
  reg        [6:0]    tagsWriteLastCmd_payload_address;
  reg                 tagsWriteLastCmd_payload_data_valid;
  reg                 tagsWriteLastCmd_payload_data_error;
  reg        [18:0]   tagsWriteLastCmd_payload_data_address;
  reg                 dataReadCmd_valid;
  reg        [10:0]   dataReadCmd_payload;
  reg                 dataWriteCmd_valid;
  reg        [0:0]    dataWriteCmd_payload_way;
  reg        [10:0]   dataWriteCmd_payload_address;
  reg        [31:0]   dataWriteCmd_payload_data;
  reg        [3:0]    dataWriteCmd_payload_mask;
  wire                _zz_ways_0_tagsReadRsp_valid;
  wire                ways_0_tagsReadRsp_valid;
  wire                ways_0_tagsReadRsp_error;
  wire       [18:0]   ways_0_tagsReadRsp_address;
  wire       [20:0]   _zz_ways_0_tagsReadRsp_valid_1;
  wire                _zz_ways_0_dataReadRspMem;
  wire       [31:0]   ways_0_dataReadRspMem;
  wire       [31:0]   ways_0_dataReadRsp;
  wire                when_DataCache_l645;
  wire                when_DataCache_l648;
  wire                when_DataCache_l667;
  wire                rspSync;
  wire                rspLast;
  reg                 memCmdSent;
  wire                io_mem_cmd_fire;
  wire                when_DataCache_l689;
  reg        [3:0]    _zz_stage0_mask;
  wire       [3:0]    stage0_mask;
  wire       [0:0]    stage0_dataColisions;
  wire       [0:0]    stage0_wayInvalidate;
  wire                stage0_isAmo;
  wire                when_DataCache_l776;
  reg                 stageA_request_wr;
  reg        [1:0]    stageA_request_size;
  reg                 stageA_request_totalyConsistent;
  wire                when_DataCache_l776_1;
  reg        [3:0]    stageA_mask;
  wire                stageA_isAmo;
  wire                stageA_isLrsc;
  wire       [0:0]    stageA_wayHits;
  wire                when_DataCache_l776_2;
  reg        [0:0]    stageA_wayInvalidate;
  wire                when_DataCache_l776_3;
  reg        [0:0]    stage0_dataColisions_regNextWhen;
  wire       [0:0]    _zz_stageA_dataColisions;
  wire       [0:0]    stageA_dataColisions;
  wire                when_DataCache_l827;
  reg                 stageB_request_wr;
  reg        [1:0]    stageB_request_size;
  reg                 stageB_request_totalyConsistent;
  reg                 stageB_mmuRspFreeze;
  wire                when_DataCache_l829;
  reg        [31:0]   stageB_mmuRsp_physicalAddress;
  reg                 stageB_mmuRsp_isIoAccess;
  reg                 stageB_mmuRsp_isPaging;
  reg                 stageB_mmuRsp_allowRead;
  reg                 stageB_mmuRsp_allowWrite;
  reg                 stageB_mmuRsp_allowExecute;
  reg                 stageB_mmuRsp_exception;
  reg                 stageB_mmuRsp_refilling;
  reg                 stageB_mmuRsp_bypassTranslation;
  wire                when_DataCache_l826;
  reg                 stageB_tagsReadRsp_0_valid;
  reg                 stageB_tagsReadRsp_0_error;
  reg        [18:0]   stageB_tagsReadRsp_0_address;
  wire                when_DataCache_l826_1;
  reg        [31:0]   stageB_dataReadRsp_0;
  wire                when_DataCache_l825;
  reg        [0:0]    stageB_wayInvalidate;
  wire                stageB_consistancyHazard;
  wire                when_DataCache_l825_1;
  reg        [0:0]    stageB_dataColisions;
  wire                when_DataCache_l825_2;
  reg                 stageB_unaligned;
  wire                when_DataCache_l825_3;
  reg        [0:0]    stageB_waysHitsBeforeInvalidate;
  wire       [0:0]    stageB_waysHits;
  wire                stageB_waysHit;
  wire       [31:0]   stageB_dataMux;
  wire                when_DataCache_l825_4;
  reg        [3:0]    stageB_mask;
  reg                 stageB_loaderValid;
  wire       [31:0]   stageB_ioMemRspMuxed;
  reg                 stageB_flusher_waitDone;
  wire                stageB_flusher_hold;
  reg        [7:0]    stageB_flusher_counter;
  wire                when_DataCache_l855;
  wire                when_DataCache_l861;
  wire                when_DataCache_l863;
  reg                 stageB_flusher_start;
  wire                when_DataCache_l877;
  wire                stageB_isAmo;
  wire                stageB_isAmoCached;
  wire                stageB_isExternalLsrc;
  wire                stageB_isExternalAmo;
  wire       [31:0]   stageB_requestDataBypass;
  reg                 stageB_cpuWriteToCache;
  wire                when_DataCache_l931;
  wire                stageB_badPermissions;
  wire                stageB_loadStoreFault;
  wire                stageB_bypassCache;
  wire                when_DataCache_l1000;
  wire                when_DataCache_l1009;
  wire                when_DataCache_l1014;
  wire                when_DataCache_l1025;
  wire                when_DataCache_l1037;
  wire                when_DataCache_l996;
  wire                when_DataCache_l1072;
  wire                when_DataCache_l1081;
  reg                 loader_valid;
  reg                 loader_counter_willIncrement;
  wire                loader_counter_willClear;
  reg        [3:0]    loader_counter_valueNext;
  reg        [3:0]    loader_counter_value;
  wire                loader_counter_willOverflowIfInc;
  wire                loader_counter_willOverflow;
  reg        [0:0]    loader_waysAllocator;
  reg                 loader_error;
  wire                loader_kill;
  reg                 loader_killReg;
  wire                when_DataCache_l1097;
  wire                loader_done;
  wire                when_DataCache_l1125;
  reg                 loader_valid_regNext;
  wire                when_DataCache_l1129;
  wire                when_DataCache_l1132;
  reg [20:0] ways_0_tags [0:127];
  reg [7:0] ways_0_data_symbol0 [0:2047];
  reg [7:0] ways_0_data_symbol1 [0:2047];
  reg [7:0] ways_0_data_symbol2 [0:2047];
  reg [7:0] ways_0_data_symbol3 [0:2047];
  reg [7:0] _zz_ways_0_datasymbol_read;
  reg [7:0] _zz_ways_0_datasymbol_read_1;
  reg [7:0] _zz_ways_0_datasymbol_read_2;
  reg [7:0] _zz_ways_0_datasymbol_read_3;

  assign _zz_when = 1'b1;
  assign _zz_loader_counter_valueNext_1 = loader_counter_willIncrement;
  assign _zz_loader_counter_valueNext = {3'd0, _zz_loader_counter_valueNext_1};
  assign _zz_loader_waysAllocator = {loader_waysAllocator,loader_waysAllocator[0]};
  assign _zz_ways_0_tags_port = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  always @(posedge aclk) begin
    if(_zz_ways_0_tagsReadRsp_valid) begin
      ways_0_tags_spinal_port0 <= ways_0_tags[tagsReadCmd_payload];
    end
  end

  always @(posedge aclk) begin
    if(_zz_2) begin
      ways_0_tags[tagsWriteCmd_payload_address] <= _zz_ways_0_tags_port;
    end
  end

  always @(*) begin
    ways_0_data_spinal_port0 = {_zz_ways_0_datasymbol_read_3, _zz_ways_0_datasymbol_read_2, _zz_ways_0_datasymbol_read_1, _zz_ways_0_datasymbol_read};
  end
  always @(posedge aclk) begin
    if(_zz_ways_0_dataReadRspMem) begin
      _zz_ways_0_datasymbol_read <= ways_0_data_symbol0[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_1 <= ways_0_data_symbol1[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_2 <= ways_0_data_symbol2[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_3 <= ways_0_data_symbol3[dataReadCmd_payload];
    end
  end

  always @(posedge aclk) begin
    if(dataWriteCmd_payload_mask[0] && _zz_1) begin
      ways_0_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && _zz_1) begin
      ways_0_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && _zz_1) begin
      ways_0_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && _zz_1) begin
      ways_0_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_DataCache_l648) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_DataCache_l645) begin
      _zz_2 = 1'b1;
    end
  end

  assign haltCpu = 1'b0;
  assign _zz_ways_0_tagsReadRsp_valid = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_ways_0_tagsReadRsp_valid_1 = ways_0_tags_spinal_port0;
  assign ways_0_tagsReadRsp_valid = _zz_ways_0_tagsReadRsp_valid_1[0];
  assign ways_0_tagsReadRsp_error = _zz_ways_0_tagsReadRsp_valid_1[1];
  assign ways_0_tagsReadRsp_address = _zz_ways_0_tagsReadRsp_valid_1[20 : 2];
  assign _zz_ways_0_dataReadRspMem = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_0_dataReadRspMem = ways_0_data_spinal_port0;
  assign ways_0_dataReadRsp = ways_0_dataReadRspMem[31 : 0];
  assign when_DataCache_l645 = (tagsWriteCmd_valid && tagsWriteCmd_payload_way[0]);
  assign when_DataCache_l648 = (dataWriteCmd_valid && dataWriteCmd_payload_way[0]);
  always @(*) begin
    tagsReadCmd_valid = 1'b0;
    if(when_DataCache_l667) begin
      tagsReadCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    tagsReadCmd_payload = 7'bxxxxxxx;
    if(when_DataCache_l667) begin
      tagsReadCmd_payload = io_cpu_execute_address[12 : 6];
    end
  end

  always @(*) begin
    dataReadCmd_valid = 1'b0;
    if(when_DataCache_l667) begin
      dataReadCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    dataReadCmd_payload = 11'bxxxxxxxxxxx;
    if(when_DataCache_l667) begin
      dataReadCmd_payload = io_cpu_execute_address[12 : 2];
    end
  end

  always @(*) begin
    tagsWriteCmd_valid = 1'b0;
    if(when_DataCache_l855) begin
      tagsWriteCmd_valid = 1'b1;
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1072) begin
        tagsWriteCmd_valid = 1'b0;
      end
    end
    if(loader_done) begin
      tagsWriteCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_way = 1'bx;
    if(when_DataCache_l855) begin
      tagsWriteCmd_payload_way = 1'b1;
    end
    if(loader_done) begin
      tagsWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_address = 7'bxxxxxxx;
    if(when_DataCache_l855) begin
      tagsWriteCmd_payload_address = stageB_flusher_counter[6:0];
    end
    if(loader_done) begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[12 : 6];
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_data_valid = 1'bx;
    if(when_DataCache_l855) begin
      tagsWriteCmd_payload_data_valid = 1'b0;
    end
    if(loader_done) begin
      tagsWriteCmd_payload_data_valid = (! (loader_kill || loader_killReg));
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_data_error = 1'bx;
    if(loader_done) begin
      tagsWriteCmd_payload_data_error = (loader_error || (io_mem_rsp_valid && io_mem_rsp_payload_error));
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_data_address = 19'bxxxxxxxxxxxxxxxxxxx;
    if(loader_done) begin
      tagsWriteCmd_payload_data_address = stageB_mmuRsp_physicalAddress[31 : 13];
    end
  end

  always @(*) begin
    dataWriteCmd_valid = 1'b0;
    if(stageB_cpuWriteToCache) begin
      if(when_DataCache_l931) begin
        dataWriteCmd_valid = 1'b1;
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1072) begin
        dataWriteCmd_valid = 1'b0;
      end
    end
    if(when_DataCache_l1097) begin
      dataWriteCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    dataWriteCmd_payload_way = 1'bx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_way = stageB_waysHits;
    end
    if(when_DataCache_l1097) begin
      dataWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @(*) begin
    dataWriteCmd_payload_address = 11'bxxxxxxxxxxx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[12 : 2];
    end
    if(when_DataCache_l1097) begin
      dataWriteCmd_payload_address = {stageB_mmuRsp_physicalAddress[12 : 6],loader_counter_value};
    end
  end

  always @(*) begin
    dataWriteCmd_payload_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_data[31 : 0] = stageB_requestDataBypass;
    end
    if(when_DataCache_l1097) begin
      dataWriteCmd_payload_data = io_mem_rsp_payload_data;
    end
  end

  always @(*) begin
    dataWriteCmd_payload_mask = 4'bxxxx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_mask = 4'b0000;
      if(_zz_when[0]) begin
        dataWriteCmd_payload_mask[3 : 0] = stageB_mask;
      end
    end
    if(when_DataCache_l1097) begin
      dataWriteCmd_payload_mask = 4'b1111;
    end
  end

  assign when_DataCache_l667 = (io_cpu_execute_isValid && (! io_cpu_memory_isStuck));
  always @(*) begin
    io_cpu_execute_haltIt = 1'b0;
    if(when_DataCache_l855) begin
      io_cpu_execute_haltIt = 1'b1;
    end
  end

  assign rspSync = 1'b1;
  assign rspLast = 1'b1;
  assign io_mem_cmd_fire = (io_mem_cmd_valid && io_mem_cmd_ready);
  assign when_DataCache_l689 = (! io_cpu_writeBack_isStuck);
  always @(*) begin
    _zz_stage0_mask = 4'bxxxx;
    case(io_cpu_execute_args_size)
      2'b00 : begin
        _zz_stage0_mask = 4'b0001;
      end
      2'b01 : begin
        _zz_stage0_mask = 4'b0011;
      end
      2'b10 : begin
        _zz_stage0_mask = 4'b1111;
      end
      default : begin
      end
    endcase
  end

  assign stage0_mask = (_zz_stage0_mask <<< io_cpu_execute_address[1 : 0]);
  assign stage0_dataColisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == io_cpu_execute_address[12 : 2])) && ((stage0_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
  assign stage0_wayInvalidate = 1'b0;
  assign stage0_isAmo = 1'b0;
  assign when_DataCache_l776 = (! io_cpu_memory_isStuck);
  assign when_DataCache_l776_1 = (! io_cpu_memory_isStuck);
  assign io_cpu_memory_isWrite = stageA_request_wr;
  assign stageA_isAmo = 1'b0;
  assign stageA_isLrsc = 1'b0;
  assign stageA_wayHits = ((io_cpu_memory_mmuRsp_physicalAddress[31 : 13] == ways_0_tagsReadRsp_address) && ways_0_tagsReadRsp_valid);
  assign when_DataCache_l776_2 = (! io_cpu_memory_isStuck);
  assign when_DataCache_l776_3 = (! io_cpu_memory_isStuck);
  assign _zz_stageA_dataColisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == io_cpu_memory_address[12 : 2])) && ((stageA_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
  assign stageA_dataColisions = (stage0_dataColisions_regNextWhen | _zz_stageA_dataColisions);
  assign when_DataCache_l827 = (! io_cpu_writeBack_isStuck);
  always @(*) begin
    stageB_mmuRspFreeze = 1'b0;
    if(when_DataCache_l1132) begin
      stageB_mmuRspFreeze = 1'b1;
    end
  end

  assign when_DataCache_l829 = ((! io_cpu_writeBack_isStuck) && (! stageB_mmuRspFreeze));
  assign when_DataCache_l826 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l826_1 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l825 = (! io_cpu_writeBack_isStuck);
  assign stageB_consistancyHazard = 1'b0;
  assign when_DataCache_l825_1 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l825_2 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l825_3 = (! io_cpu_writeBack_isStuck);
  assign stageB_waysHits = (stageB_waysHitsBeforeInvalidate & (~ stageB_wayInvalidate));
  assign stageB_waysHit = (|stageB_waysHits);
  assign stageB_dataMux = stageB_dataReadRsp_0;
  assign when_DataCache_l825_4 = (! io_cpu_writeBack_isStuck);
  always @(*) begin
    stageB_loaderValid = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l996) begin
          if(!when_DataCache_l1009) begin
            if(io_mem_cmd_ready) begin
              stageB_loaderValid = 1'b1;
            end
          end
        end
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1072) begin
        stageB_loaderValid = 1'b0;
      end
    end
  end

  assign stageB_ioMemRspMuxed = io_mem_rsp_payload_data[31 : 0];
  always @(*) begin
    io_cpu_writeBack_haltIt = 1'b1;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(when_DataCache_l996) begin
          if(when_DataCache_l1000) begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
        end else begin
          if(when_DataCache_l1009) begin
            if(when_DataCache_l1014) begin
              io_cpu_writeBack_haltIt = 1'b0;
            end
          end
        end
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1072) begin
        io_cpu_writeBack_haltIt = 1'b0;
      end
    end
  end

  assign stageB_flusher_hold = 1'b0;
  assign when_DataCache_l855 = (! stageB_flusher_counter[7]);
  assign when_DataCache_l861 = (! stageB_flusher_hold);
  assign when_DataCache_l863 = (io_cpu_flush_valid && io_cpu_flush_payload_singleLine);
  assign io_cpu_flush_ready = (stageB_flusher_waitDone && stageB_flusher_counter[7]);
  assign when_DataCache_l877 = (io_cpu_flush_valid && io_cpu_flush_payload_singleLine);
  assign stageB_isAmo = 1'b0;
  assign stageB_isAmoCached = 1'b0;
  assign stageB_isExternalLsrc = 1'b0;
  assign stageB_isExternalAmo = 1'b0;
  assign stageB_requestDataBypass = io_cpu_writeBack_storeData;
  always @(*) begin
    stageB_cpuWriteToCache = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l996) begin
          if(when_DataCache_l1009) begin
            stageB_cpuWriteToCache = 1'b1;
          end
        end
      end
    end
  end

  assign when_DataCache_l931 = (stageB_request_wr && stageB_waysHit);
  assign stageB_badPermissions = (((! stageB_mmuRsp_allowWrite) && stageB_request_wr) || ((! stageB_mmuRsp_allowRead) && ((! stageB_request_wr) || stageB_isAmo)));
  assign stageB_loadStoreFault = (io_cpu_writeBack_isValid && (stageB_mmuRsp_exception || stageB_badPermissions));
  always @(*) begin
    io_cpu_redo = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l996) begin
          if(when_DataCache_l1009) begin
            if(when_DataCache_l1025) begin
              io_cpu_redo = 1'b1;
            end
          end
        end
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1081) begin
        io_cpu_redo = 1'b1;
      end
    end
    if(when_DataCache_l1129) begin
      io_cpu_redo = 1'b1;
    end
  end

  always @(*) begin
    io_cpu_writeBack_accessError = 1'b0;
    if(stageB_bypassCache) begin
      io_cpu_writeBack_accessError = ((((! stageB_request_wr) && 1'b1) && io_mem_rsp_valid) && io_mem_rsp_payload_error);
    end else begin
      io_cpu_writeBack_accessError = (((stageB_waysHits & stageB_tagsReadRsp_0_error) != 1'b0) || (stageB_loadStoreFault && (! stageB_mmuRsp_isPaging)));
    end
  end

  assign io_cpu_writeBack_mmuException = (stageB_loadStoreFault && stageB_mmuRsp_isPaging);
  assign io_cpu_writeBack_unalignedAccess = (io_cpu_writeBack_isValid && stageB_unaligned);
  assign io_cpu_writeBack_isWrite = stageB_request_wr;
  always @(*) begin
    io_mem_cmd_valid = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(when_DataCache_l996) begin
          io_mem_cmd_valid = (! memCmdSent);
        end else begin
          if(when_DataCache_l1009) begin
            if(stageB_request_wr) begin
              io_mem_cmd_valid = 1'b1;
            end
          end else begin
            if(when_DataCache_l1037) begin
              io_mem_cmd_valid = 1'b1;
            end
          end
        end
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1072) begin
        io_mem_cmd_valid = 1'b0;
      end
    end
  end

  always @(*) begin
    io_mem_cmd_payload_address = stageB_mmuRsp_physicalAddress;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l996) begin
          if(!when_DataCache_l1009) begin
            io_mem_cmd_payload_address[5 : 0] = 6'h0;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_last = 1'b1;
  always @(*) begin
    io_mem_cmd_payload_wr = stageB_request_wr;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l996) begin
          if(!when_DataCache_l1009) begin
            io_mem_cmd_payload_wr = 1'b0;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_mask = stageB_mask;
  assign io_mem_cmd_payload_data = stageB_requestDataBypass;
  assign io_mem_cmd_payload_uncached = stageB_mmuRsp_isIoAccess;
  always @(*) begin
    io_mem_cmd_payload_size = {1'd0, stageB_request_size};
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l996) begin
          if(!when_DataCache_l1009) begin
            io_mem_cmd_payload_size = 3'b110;
          end
        end
      end
    end
  end

  assign stageB_bypassCache = ((stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc) || stageB_isExternalAmo);
  assign io_cpu_writeBack_keepMemRspData = 1'b0;
  assign when_DataCache_l1000 = ((! stageB_request_wr) ? (io_mem_rsp_valid && rspSync) : io_mem_cmd_ready);
  assign when_DataCache_l1009 = (stageB_waysHit || (stageB_request_wr && (! stageB_isAmoCached)));
  assign when_DataCache_l1014 = ((! stageB_request_wr) || io_mem_cmd_ready);
  assign when_DataCache_l1025 = (((! stageB_request_wr) || stageB_isAmoCached) && ((stageB_dataColisions & stageB_waysHits) != 1'b0));
  assign when_DataCache_l1037 = (! memCmdSent);
  assign when_DataCache_l996 = (stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc);
  always @(*) begin
    if(stageB_bypassCache) begin
      io_cpu_writeBack_data = stageB_ioMemRspMuxed;
    end else begin
      io_cpu_writeBack_data = stageB_dataMux;
    end
  end

  assign when_DataCache_l1072 = ((((stageB_consistancyHazard || stageB_mmuRsp_refilling) || io_cpu_writeBack_accessError) || io_cpu_writeBack_mmuException) || io_cpu_writeBack_unalignedAccess);
  assign when_DataCache_l1081 = (stageB_mmuRsp_refilling || stageB_consistancyHazard);
  always @(*) begin
    loader_counter_willIncrement = 1'b0;
    if(when_DataCache_l1097) begin
      loader_counter_willIncrement = 1'b1;
    end
  end

  assign loader_counter_willClear = 1'b0;
  assign loader_counter_willOverflowIfInc = (loader_counter_value == 4'b1111);
  assign loader_counter_willOverflow = (loader_counter_willOverflowIfInc && loader_counter_willIncrement);
  always @(*) begin
    loader_counter_valueNext = (loader_counter_value + _zz_loader_counter_valueNext);
    if(loader_counter_willClear) begin
      loader_counter_valueNext = 4'b0000;
    end
  end

  assign loader_kill = 1'b0;
  assign when_DataCache_l1097 = ((loader_valid && io_mem_rsp_valid) && rspLast);
  assign loader_done = loader_counter_willOverflow;
  assign when_DataCache_l1125 = (! loader_valid);
  assign when_DataCache_l1129 = (loader_valid && (! loader_valid_regNext));
  assign io_cpu_execute_refilling = loader_valid;
  assign when_DataCache_l1132 = (stageB_loaderValid || loader_valid);
  always @(posedge aclk) begin
    tagsWriteLastCmd_valid <= tagsWriteCmd_valid;
    tagsWriteLastCmd_payload_way <= tagsWriteCmd_payload_way;
    tagsWriteLastCmd_payload_address <= tagsWriteCmd_payload_address;
    tagsWriteLastCmd_payload_data_valid <= tagsWriteCmd_payload_data_valid;
    tagsWriteLastCmd_payload_data_error <= tagsWriteCmd_payload_data_error;
    tagsWriteLastCmd_payload_data_address <= tagsWriteCmd_payload_data_address;
    if(when_DataCache_l776) begin
      stageA_request_wr <= io_cpu_execute_args_wr;
      stageA_request_size <= io_cpu_execute_args_size;
      stageA_request_totalyConsistent <= io_cpu_execute_args_totalyConsistent;
    end
    if(when_DataCache_l776_1) begin
      stageA_mask <= stage0_mask;
    end
    if(when_DataCache_l776_2) begin
      stageA_wayInvalidate <= stage0_wayInvalidate;
    end
    if(when_DataCache_l776_3) begin
      stage0_dataColisions_regNextWhen <= stage0_dataColisions;
    end
    if(when_DataCache_l827) begin
      stageB_request_wr <= stageA_request_wr;
      stageB_request_size <= stageA_request_size;
      stageB_request_totalyConsistent <= stageA_request_totalyConsistent;
    end
    if(when_DataCache_l829) begin
      stageB_mmuRsp_physicalAddress <= io_cpu_memory_mmuRsp_physicalAddress;
      stageB_mmuRsp_isIoAccess <= io_cpu_memory_mmuRsp_isIoAccess;
      stageB_mmuRsp_isPaging <= io_cpu_memory_mmuRsp_isPaging;
      stageB_mmuRsp_allowRead <= io_cpu_memory_mmuRsp_allowRead;
      stageB_mmuRsp_allowWrite <= io_cpu_memory_mmuRsp_allowWrite;
      stageB_mmuRsp_allowExecute <= io_cpu_memory_mmuRsp_allowExecute;
      stageB_mmuRsp_exception <= io_cpu_memory_mmuRsp_exception;
      stageB_mmuRsp_refilling <= io_cpu_memory_mmuRsp_refilling;
      stageB_mmuRsp_bypassTranslation <= io_cpu_memory_mmuRsp_bypassTranslation;
    end
    if(when_DataCache_l826) begin
      stageB_tagsReadRsp_0_valid <= ways_0_tagsReadRsp_valid;
      stageB_tagsReadRsp_0_error <= ways_0_tagsReadRsp_error;
      stageB_tagsReadRsp_0_address <= ways_0_tagsReadRsp_address;
    end
    if(when_DataCache_l826_1) begin
      stageB_dataReadRsp_0 <= ways_0_dataReadRsp;
    end
    if(when_DataCache_l825) begin
      stageB_wayInvalidate <= stageA_wayInvalidate;
    end
    if(when_DataCache_l825_1) begin
      stageB_dataColisions <= stageA_dataColisions;
    end
    if(when_DataCache_l825_2) begin
      stageB_unaligned <= (|{((stageA_request_size == 2'b10) && (io_cpu_memory_address[1 : 0] != 2'b00)),((stageA_request_size == 2'b01) && (io_cpu_memory_address[0 : 0] != 1'b0))});
    end
    if(when_DataCache_l825_3) begin
      stageB_waysHitsBeforeInvalidate <= stageA_wayHits;
    end
    if(when_DataCache_l825_4) begin
      stageB_mask <= stageA_mask;
    end
    loader_valid_regNext <= loader_valid;
  end

  always @(posedge aclk or posedge _zz_7) begin
    if(_zz_7) begin
      memCmdSent <= 1'b0;
      stageB_flusher_waitDone <= 1'b0;
      stageB_flusher_counter <= 8'h0;
      stageB_flusher_start <= 1'b1;
      loader_valid <= 1'b0;
      loader_counter_value <= 4'b0000;
      loader_waysAllocator <= 1'b1;
      loader_error <= 1'b0;
      loader_killReg <= 1'b0;
    end else begin
      if(io_mem_cmd_fire) begin
        memCmdSent <= 1'b1;
      end
      if(when_DataCache_l689) begin
        memCmdSent <= 1'b0;
      end
      if(io_cpu_flush_ready) begin
        stageB_flusher_waitDone <= 1'b0;
      end
      if(when_DataCache_l855) begin
        if(when_DataCache_l861) begin
          stageB_flusher_counter <= (stageB_flusher_counter + 8'h01);
          if(when_DataCache_l863) begin
            stageB_flusher_counter[7] <= 1'b1;
          end
        end
      end
      stageB_flusher_start <= (((((((! stageB_flusher_waitDone) && (! stageB_flusher_start)) && io_cpu_flush_valid) && (! io_cpu_execute_isValid)) && (! io_cpu_memory_isValid)) && (! io_cpu_writeBack_isValid)) && (! io_cpu_redo));
      if(stageB_flusher_start) begin
        stageB_flusher_waitDone <= 1'b1;
        stageB_flusher_counter <= 8'h0;
        if(when_DataCache_l877) begin
          stageB_flusher_counter <= {1'b0,io_cpu_flush_payload_lineId};
        end
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))); // DataCache.scala:L1084
        `else
          if(!(! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck)) && $realtime != 0) begin
            $display("ERROR writeBack stuck by another plugin is not allowed"); // DataCache.scala:L1084
          end
        `endif
      `endif
      if(stageB_loaderValid) begin
        loader_valid <= 1'b1;
      end
      loader_counter_value <= loader_counter_valueNext;
      if(loader_kill) begin
        loader_killReg <= 1'b1;
      end
      if(when_DataCache_l1097) begin
        loader_error <= (loader_error || io_mem_rsp_payload_error);
      end
      if(loader_done) begin
        loader_valid <= 1'b0;
        loader_error <= 1'b0;
        loader_killReg <= 1'b0;
      end
      if(when_DataCache_l1125) begin
        loader_waysAllocator <= _zz_loader_waysAllocator[0:0];
      end
    end
  end


endmodule

module InstructionCache (
  input  wire          io_flush,
  input  wire          io_cpu_prefetch_isValid,
  output reg           io_cpu_prefetch_haltIt,
  input  wire [31:0]   io_cpu_prefetch_pc,
  input  wire          io_cpu_fetch_isValid,
  input  wire          io_cpu_fetch_isStuck,
  input  wire          io_cpu_fetch_isRemoved,
  input  wire [31:0]   io_cpu_fetch_pc,
  output wire [31:0]   io_cpu_fetch_data,
  input  wire [31:0]   io_cpu_fetch_mmuRsp_physicalAddress,
  input  wire          io_cpu_fetch_mmuRsp_isIoAccess,
  input  wire          io_cpu_fetch_mmuRsp_isPaging,
  input  wire          io_cpu_fetch_mmuRsp_allowRead,
  input  wire          io_cpu_fetch_mmuRsp_allowWrite,
  input  wire          io_cpu_fetch_mmuRsp_allowExecute,
  input  wire          io_cpu_fetch_mmuRsp_exception,
  input  wire          io_cpu_fetch_mmuRsp_refilling,
  input  wire          io_cpu_fetch_mmuRsp_bypassTranslation,
  output wire [31:0]   io_cpu_fetch_physicalAddress,
  input  wire          io_cpu_decode_isValid,
  input  wire          io_cpu_decode_isStuck,
  input  wire [31:0]   io_cpu_decode_pc,
  output wire [31:0]   io_cpu_decode_physicalAddress,
  output wire [31:0]   io_cpu_decode_data,
  output wire          io_cpu_decode_cacheMiss,
  output wire          io_cpu_decode_error,
  output wire          io_cpu_decode_mmuRefilling,
  output wire          io_cpu_decode_mmuException,
  input  wire          io_cpu_decode_isUser,
  input  wire          io_cpu_fill_valid,
  input  wire [31:0]   io_cpu_fill_payload,
  output wire          io_mem_cmd_valid,
  input  wire          io_mem_cmd_ready,
  output wire [31:0]   io_mem_cmd_payload_address,
  output wire [2:0]    io_mem_cmd_payload_size,
  input  wire          io_mem_rsp_valid,
  input  wire [31:0]   io_mem_rsp_payload_data,
  input  wire          io_mem_rsp_payload_error,
  input  wire [2:0]    _zz_when_Fetcher_l411,
  input  wire [31:0]   _zz_decodeStage_hit_data_1,
  input  wire          aclk,
  input  wire          _zz_7
);

  reg        [31:0]   banks_0_spinal_port1;
  reg        [20:0]   ways_0_tags_spinal_port1;
  wire       [20:0]   _zz_ways_0_tags_port;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 lineLoader_fire;
  reg                 lineLoader_valid;
  (* keep , syn_keep *) reg        [31:0]   lineLoader_address /* synthesis syn_keep = 1 */ ;
  reg                 lineLoader_hadError;
  reg                 lineLoader_flushPending;
  reg        [8:0]    lineLoader_flushCounter;
  wire                when_InstructionCache_l339;
  reg                 _zz_when_InstructionCache_l343;
  wire                when_InstructionCache_l343;
  wire                when_InstructionCache_l352;
  reg                 lineLoader_cmdSent;
  wire                io_mem_cmd_fire;
  wire                when_Utils_l593;
  reg                 lineLoader_wayToAllocate_willIncrement;
  wire                lineLoader_wayToAllocate_willClear;
  wire                lineLoader_wayToAllocate_willOverflowIfInc;
  wire                lineLoader_wayToAllocate_willOverflow;
  (* keep , syn_keep *) reg        [2:0]    lineLoader_wordIndex /* synthesis syn_keep = 1 */ ;
  wire                lineLoader_write_tag_0_valid;
  wire       [7:0]    lineLoader_write_tag_0_payload_address;
  wire                lineLoader_write_tag_0_payload_data_valid;
  wire                lineLoader_write_tag_0_payload_data_error;
  wire       [18:0]   lineLoader_write_tag_0_payload_data_address;
  wire                lineLoader_write_data_0_valid;
  wire       [10:0]   lineLoader_write_data_0_payload_address;
  wire       [31:0]   lineLoader_write_data_0_payload_data;
  wire                when_InstructionCache_l402;
  wire       [10:0]   _zz_fetchStage_read_banksValue_0_dataMem;
  wire                _zz_fetchStage_read_banksValue_0_dataMem_1;
  wire       [31:0]   fetchStage_read_banksValue_0_dataMem;
  wire       [31:0]   fetchStage_read_banksValue_0_data;
  wire       [7:0]    _zz_fetchStage_read_waysValues_0_tag_valid;
  wire                _zz_fetchStage_read_waysValues_0_tag_valid_1;
  wire                fetchStage_read_waysValues_0_tag_valid;
  wire                fetchStage_read_waysValues_0_tag_error;
  wire       [18:0]   fetchStage_read_waysValues_0_tag_address;
  wire       [20:0]   _zz_fetchStage_read_waysValues_0_tag_valid_2;
  wire                when_InstructionCache_l460;
  reg        [31:0]   decodeStage_mmuRsp_physicalAddress;
  reg                 decodeStage_mmuRsp_isIoAccess;
  reg                 decodeStage_mmuRsp_isPaging;
  reg                 decodeStage_mmuRsp_allowRead;
  reg                 decodeStage_mmuRsp_allowWrite;
  reg                 decodeStage_mmuRsp_allowExecute;
  reg                 decodeStage_mmuRsp_exception;
  reg                 decodeStage_mmuRsp_refilling;
  reg                 decodeStage_mmuRsp_bypassTranslation;
  wire                when_InstructionCache_l460_1;
  reg                 decodeStage_hit_tags_0_valid;
  reg                 decodeStage_hit_tags_0_error;
  reg        [18:0]   decodeStage_hit_tags_0_address;
  wire                decodeStage_hit_hits_0;
  wire                decodeStage_hit_valid;
  wire                when_InstructionCache_l460_2;
  reg        [31:0]   _zz_decodeStage_hit_data;
  wire       [31:0]   decodeStage_hit_data;
  wire                when_Fetcher_l411;
  reg [31:0] banks_0 [0:2047];
  reg [20:0] ways_0_tags [0:255];

  assign _zz_ways_0_tags_port = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  always @(posedge aclk) begin
    if(_zz_1) begin
      banks_0[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @(posedge aclk) begin
    if(_zz_fetchStage_read_banksValue_0_dataMem_1) begin
      banks_0_spinal_port1 <= banks_0[_zz_fetchStage_read_banksValue_0_dataMem];
    end
  end

  always @(posedge aclk) begin
    if(_zz_2) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= _zz_ways_0_tags_port;
    end
  end

  always @(posedge aclk) begin
    if(_zz_fetchStage_read_waysValues_0_tag_valid_1) begin
      ways_0_tags_spinal_port1 <= ways_0_tags[_zz_fetchStage_read_waysValues_0_tag_valid];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(lineLoader_write_data_0_valid) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(lineLoader_write_tag_0_valid) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid) begin
      if(when_InstructionCache_l402) begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  always @(*) begin
    io_cpu_prefetch_haltIt = (lineLoader_valid || lineLoader_flushPending);
    if(when_InstructionCache_l339) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(when_InstructionCache_l343) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
  end

  assign when_InstructionCache_l339 = (! lineLoader_flushCounter[8]);
  assign when_InstructionCache_l343 = (! _zz_when_InstructionCache_l343);
  assign when_InstructionCache_l352 = (lineLoader_flushPending && (! (lineLoader_valid || io_cpu_fetch_isValid)));
  assign io_mem_cmd_fire = (io_mem_cmd_valid && io_mem_cmd_ready);
  assign io_mem_cmd_valid = (lineLoader_valid && (! lineLoader_cmdSent));
  assign io_mem_cmd_payload_address = {lineLoader_address[31 : 5],5'h0};
  assign io_mem_cmd_payload_size = 3'b101;
  assign when_Utils_l593 = (! lineLoader_valid);
  always @(*) begin
    lineLoader_wayToAllocate_willIncrement = 1'b0;
    if(when_Utils_l593) begin
      lineLoader_wayToAllocate_willIncrement = 1'b1;
    end
  end

  assign lineLoader_wayToAllocate_willClear = 1'b0;
  assign lineLoader_wayToAllocate_willOverflowIfInc = 1'b1;
  assign lineLoader_wayToAllocate_willOverflow = (lineLoader_wayToAllocate_willOverflowIfInc && lineLoader_wayToAllocate_willIncrement);
  assign lineLoader_write_tag_0_valid = ((1'b1 && lineLoader_fire) || (! lineLoader_flushCounter[8]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[8] ? lineLoader_address[12 : 5] : lineLoader_flushCounter[7 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[8];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 13];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && 1'b1);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[12 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign when_InstructionCache_l402 = (lineLoader_wordIndex == 3'b111);
  assign _zz_fetchStage_read_banksValue_0_dataMem = io_cpu_prefetch_pc[12 : 2];
  assign _zz_fetchStage_read_banksValue_0_dataMem_1 = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_banksValue_0_dataMem = banks_0_spinal_port1;
  assign fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[31 : 0];
  assign _zz_fetchStage_read_waysValues_0_tag_valid = io_cpu_prefetch_pc[12 : 5];
  assign _zz_fetchStage_read_waysValues_0_tag_valid_1 = (! io_cpu_fetch_isStuck);
  assign _zz_fetchStage_read_waysValues_0_tag_valid_2 = ways_0_tags_spinal_port1;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_fetchStage_read_waysValues_0_tag_valid_2[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_fetchStage_read_waysValues_0_tag_valid_2[1];
  assign fetchStage_read_waysValues_0_tag_address = _zz_fetchStage_read_waysValues_0_tag_valid_2[20 : 2];
  assign io_cpu_fetch_data = fetchStage_read_banksValue_0_data;
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuRsp_physicalAddress;
  assign when_InstructionCache_l460 = (! io_cpu_decode_isStuck);
  assign when_InstructionCache_l460_1 = (! io_cpu_decode_isStuck);
  assign decodeStage_hit_hits_0 = (decodeStage_hit_tags_0_valid && (decodeStage_hit_tags_0_address == decodeStage_mmuRsp_physicalAddress[31 : 13]));
  assign decodeStage_hit_valid = (|decodeStage_hit_hits_0);
  assign when_InstructionCache_l460_2 = (! io_cpu_decode_isStuck);
  assign decodeStage_hit_data = _zz_decodeStage_hit_data;
  assign io_cpu_decode_data = decodeStage_hit_data;
  assign io_cpu_decode_cacheMiss = (! decodeStage_hit_valid);
  assign io_cpu_decode_error = (decodeStage_hit_tags_0_error || ((! decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute))));
  assign io_cpu_decode_mmuRefilling = decodeStage_mmuRsp_refilling;
  assign io_cpu_decode_mmuException = (((! decodeStage_mmuRsp_refilling) && decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute)));
  assign io_cpu_decode_physicalAddress = decodeStage_mmuRsp_physicalAddress;
  assign when_Fetcher_l411 = (_zz_when_Fetcher_l411 != 3'b000);
  always @(posedge aclk or posedge _zz_7) begin
    if(_zz_7) begin
      lineLoader_valid <= 1'b0;
      lineLoader_hadError <= 1'b0;
      lineLoader_flushPending <= 1'b1;
      lineLoader_cmdSent <= 1'b0;
      lineLoader_wordIndex <= 3'b000;
    end else begin
      if(lineLoader_fire) begin
        lineLoader_valid <= 1'b0;
      end
      if(lineLoader_fire) begin
        lineLoader_hadError <= 1'b0;
      end
      if(io_cpu_fill_valid) begin
        lineLoader_valid <= 1'b1;
      end
      if(io_flush) begin
        lineLoader_flushPending <= 1'b1;
      end
      if(when_InstructionCache_l352) begin
        lineLoader_flushPending <= 1'b0;
      end
      if(io_mem_cmd_fire) begin
        lineLoader_cmdSent <= 1'b1;
      end
      if(lineLoader_fire) begin
        lineLoader_cmdSent <= 1'b0;
      end
      if(io_mem_rsp_valid) begin
        lineLoader_wordIndex <= (lineLoader_wordIndex + 3'b001);
        if(io_mem_rsp_payload_error) begin
          lineLoader_hadError <= 1'b1;
        end
      end
    end
  end

  always @(posedge aclk) begin
    if(io_cpu_fill_valid) begin
      lineLoader_address <= io_cpu_fill_payload;
    end
    if(when_InstructionCache_l339) begin
      lineLoader_flushCounter <= (lineLoader_flushCounter + 9'h001);
    end
    _zz_when_InstructionCache_l343 <= lineLoader_flushCounter[8];
    if(when_InstructionCache_l352) begin
      lineLoader_flushCounter <= 9'h0;
    end
    if(when_InstructionCache_l460) begin
      decodeStage_mmuRsp_physicalAddress <= io_cpu_fetch_mmuRsp_physicalAddress;
      decodeStage_mmuRsp_isIoAccess <= io_cpu_fetch_mmuRsp_isIoAccess;
      decodeStage_mmuRsp_isPaging <= io_cpu_fetch_mmuRsp_isPaging;
      decodeStage_mmuRsp_allowRead <= io_cpu_fetch_mmuRsp_allowRead;
      decodeStage_mmuRsp_allowWrite <= io_cpu_fetch_mmuRsp_allowWrite;
      decodeStage_mmuRsp_allowExecute <= io_cpu_fetch_mmuRsp_allowExecute;
      decodeStage_mmuRsp_exception <= io_cpu_fetch_mmuRsp_exception;
      decodeStage_mmuRsp_refilling <= io_cpu_fetch_mmuRsp_refilling;
      decodeStage_mmuRsp_bypassTranslation <= io_cpu_fetch_mmuRsp_bypassTranslation;
    end
    if(when_InstructionCache_l460_1) begin
      decodeStage_hit_tags_0_valid <= fetchStage_read_waysValues_0_tag_valid;
      decodeStage_hit_tags_0_error <= fetchStage_read_waysValues_0_tag_error;
      decodeStage_hit_tags_0_address <= fetchStage_read_waysValues_0_tag_address;
    end
    if(when_InstructionCache_l460_2) begin
      _zz_decodeStage_hit_data <= fetchStage_read_banksValue_0_data;
    end
    if(when_Fetcher_l411) begin
      _zz_decodeStage_hit_data <= _zz_decodeStage_hit_data_1;
    end
  end


endmodule

//StreamFifo_1 replaced by StreamFifo

module StreamFifo (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [7:0]    io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [7:0]    io_pop_payload,
  input  wire          io_flush,
  output wire [4:0]    io_occupancy,
  output wire [4:0]    io_availability,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  reg        [7:0]    logic_ram_spinal_port1;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [4:0]    logic_ptr_push;
  reg        [4:0]    logic_ptr_pop;
  wire       [4:0]    logic_ptr_occupancy;
  wire       [4:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1455;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_write_payload_address;
  wire       [7:0]    logic_push_onRam_write_payload_data;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [3:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l477;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [7:0]    logic_pop_sync_readPort_rsp;
  wire                logic_pop_addressGen_toFlowFire_valid;
  wire       [3:0]    logic_pop_addressGen_toFlowFire_payload;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire       [7:0]    logic_pop_sync_readArbitation_translated_payload;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [4:0]    logic_pop_sync_popReg;
  reg [7:0] logic_ram [0:15];

  always @(posedge aclk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= logic_push_onRam_write_payload_data;
    end
  end

  always @(posedge aclk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      logic_ram_spinal_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1455 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 5'h10) == 5'h0);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[3:0];
  assign logic_push_onRam_write_payload_data = io_push_payload;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[3:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l477) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l477 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign logic_pop_sync_readPort_rsp = logic_ram_spinal_port1;
  assign logic_pop_addressGen_toFlowFire_valid = logic_pop_addressGen_fire;
  assign logic_pop_addressGen_toFlowFire_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_toFlowFire_valid;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_toFlowFire_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload = logic_pop_sync_readPort_rsp;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload = logic_pop_sync_readArbitation_translated_payload;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (5'h10 - logic_ptr_occupancy);
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      logic_ptr_push <= 5'h0;
      logic_ptr_pop <= 5'h0;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 5'h0;
    end else begin
      if(when_Stream_l1455) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 5'h01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 5'h01);
      end
      if(io_flush) begin
        logic_ptr_push <= 5'h0;
        logic_ptr_pop <= 5'h0;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 5'h0;
      end
    end
  end

  always @(posedge aclk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module UartCtrl (
  input  wire [2:0]    io_config_frame_dataLength,
  input  wire [0:0]    io_config_frame_stop,
  input  wire [1:0]    io_config_frame_parity,
  input  wire [19:0]   io_config_clockDivider,
  input  wire          io_write_valid,
  output reg           io_write_ready,
  input  wire [7:0]    io_write_payload,
  output wire          io_read_valid,
  input  wire          io_read_ready,
  output wire [7:0]    io_read_payload,
  output wire          io_uart_txd,
  input  wire          io_uart_rxd,
  output wire          io_readError,
  input  wire          io_writeBreak,
  output wire          io_readBreak,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;

  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [7:0]    rx_io_read_payload;
  wire                rx_io_rts;
  wire                rx_io_error;
  wire                rx_io_break;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  reg                 clockDivider_tickReg;
  reg                 io_write_throwWhen_valid;
  wire                io_write_throwWhen_ready;
  wire       [7:0]    io_write_throwWhen_payload;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif


  UartCtrlTx tx (
    .io_configFrame_dataLength (io_config_frame_dataLength[2:0]), //i
    .io_configFrame_stop       (io_config_frame_stop           ), //i
    .io_configFrame_parity     (io_config_frame_parity[1:0]    ), //i
    .io_samplingTick           (clockDivider_tickReg           ), //i
    .io_write_valid            (io_write_throwWhen_valid       ), //i
    .io_write_ready            (tx_io_write_ready              ), //o
    .io_write_payload          (io_write_throwWhen_payload[7:0]), //i
    .io_cts                    (1'b0                           ), //i
    .io_txd                    (tx_io_txd                      ), //o
    .io_break                  (io_writeBreak                  ), //i
    .aclk                      (aclk                           ), //i
    .resetCtrl_mainClkReset    (resetCtrl_mainClkReset         )  //i
  );
  UartCtrlRx rx (
    .io_configFrame_dataLength (io_config_frame_dataLength[2:0]), //i
    .io_configFrame_stop       (io_config_frame_stop           ), //i
    .io_configFrame_parity     (io_config_frame_parity[1:0]    ), //i
    .io_samplingTick           (clockDivider_tickReg           ), //i
    .io_read_valid             (rx_io_read_valid               ), //o
    .io_read_ready             (io_read_ready                  ), //i
    .io_read_payload           (rx_io_read_payload[7:0]        ), //o
    .io_rxd                    (io_uart_rxd                    ), //i
    .io_rts                    (rx_io_rts                      ), //o
    .io_error                  (rx_io_error                    ), //o
    .io_break                  (rx_io_break                    ), //o
    .aclk                      (aclk                           ), //i
    .resetCtrl_mainClkReset    (resetCtrl_mainClkReset         )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      UartStopType_ONE : io_config_frame_stop_string = "ONE";
      UartStopType_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      UartParityType_NONE : io_config_frame_parity_string = "NONE";
      UartParityType_EVEN : io_config_frame_parity_string = "EVEN";
      UartParityType_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == 20'h0);
  always @(*) begin
    io_write_throwWhen_valid = io_write_valid;
    if(rx_io_break) begin
      io_write_throwWhen_valid = 1'b0;
    end
  end

  always @(*) begin
    io_write_ready = io_write_throwWhen_ready;
    if(rx_io_break) begin
      io_write_ready = 1'b1;
    end
  end

  assign io_write_throwWhen_payload = io_write_payload;
  assign io_write_throwWhen_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  assign io_readError = rx_io_error;
  assign io_readBreak = rx_io_break;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      clockDivider_counter <= 20'h0;
      clockDivider_tickReg <= 1'b0;
    end else begin
      clockDivider_tickReg <= clockDivider_tick;
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick) begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end


endmodule

//StreamFifo_4 replaced by StreamFifo_3

module StreamFifo_3 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  output reg           io_pop_valid,
  input  wire          io_pop_ready,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  reg                 logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [2:0]    logic_ptr_push;
  reg        [2:0]    logic_ptr_pop;
  wire       [2:0]    logic_ptr_occupancy;
  wire       [2:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1455;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [1:0]    logic_push_onRam_write_payload_address;
  wire                logic_pop_addressGen_valid;
  wire                logic_pop_addressGen_ready;
  wire       [1:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_addressGen_translated_valid;
  wire                logic_pop_addressGen_translated_ready;

  assign when_Stream_l1455 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 3'b100) == 3'b000);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  always @(*) begin
    logic_ptr_doPush = io_push_fire;
    if(logic_ptr_empty) begin
      if(io_pop_ready) begin
        logic_ptr_doPush = 1'b0;
      end
    end
  end

  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[1:0];
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[1:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  assign logic_pop_addressGen_translated_valid = logic_pop_addressGen_valid;
  assign logic_pop_addressGen_ready = logic_pop_addressGen_translated_ready;
  always @(*) begin
    io_pop_valid = logic_pop_addressGen_translated_valid;
    if(logic_ptr_empty) begin
      io_pop_valid = io_push_valid;
    end
  end

  assign logic_pop_addressGen_translated_ready = io_pop_ready;
  assign logic_ptr_popOnIo = logic_ptr_pop;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (3'b100 - logic_ptr_occupancy);
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      logic_ptr_push <= 3'b000;
      logic_ptr_pop <= 3'b000;
      logic_ptr_wentUp <= 1'b0;
    end else begin
      if(when_Stream_l1455) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 3'b001);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 3'b001);
      end
      if(io_flush) begin
        logic_ptr_push <= 3'b000;
        logic_ptr_pop <= 3'b000;
      end
    end
  end


endmodule

module StreamFifo_2 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [0:0]    io_push_payload,
  output reg           io_pop_valid,
  input  wire          io_pop_ready,
  output reg  [0:0]    io_pop_payload,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  wire       [0:0]    logic_ram_spinal_port1;
  wire       [0:0]    _zz_logic_ram_port;
  reg                 _zz_1;
  reg                 logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [2:0]    logic_ptr_push;
  reg        [2:0]    logic_ptr_pop;
  wire       [2:0]    logic_ptr_occupancy;
  wire       [2:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1455;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [1:0]    logic_push_onRam_write_payload_address;
  wire       [0:0]    logic_push_onRam_write_payload_data;
  wire                logic_pop_addressGen_valid;
  wire                logic_pop_addressGen_ready;
  wire       [1:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire       [0:0]    logic_pop_async_readed;
  wire                logic_pop_addressGen_translated_valid;
  wire                logic_pop_addressGen_translated_ready;
  wire       [0:0]    logic_pop_addressGen_translated_payload;
  (* ram_style = "distributed" *) reg [0:0] logic_ram [0:3];

  assign _zz_logic_ram_port = logic_push_onRam_write_payload_data;
  always @(posedge aclk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  assign logic_ram_spinal_port1 = logic_ram[logic_pop_addressGen_payload];
  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1455 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 3'b100) == 3'b000);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  always @(*) begin
    logic_ptr_doPush = io_push_fire;
    if(logic_ptr_empty) begin
      if(io_pop_ready) begin
        logic_ptr_doPush = 1'b0;
      end
    end
  end

  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[1:0];
  assign logic_push_onRam_write_payload_data = io_push_payload;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[1:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  assign logic_pop_async_readed = logic_ram_spinal_port1;
  assign logic_pop_addressGen_translated_valid = logic_pop_addressGen_valid;
  assign logic_pop_addressGen_ready = logic_pop_addressGen_translated_ready;
  assign logic_pop_addressGen_translated_payload = logic_pop_async_readed;
  always @(*) begin
    io_pop_valid = logic_pop_addressGen_translated_valid;
    if(logic_ptr_empty) begin
      io_pop_valid = io_push_valid;
    end
  end

  assign logic_pop_addressGen_translated_ready = io_pop_ready;
  always @(*) begin
    io_pop_payload = logic_pop_addressGen_translated_payload;
    if(logic_ptr_empty) begin
      io_pop_payload = io_push_payload;
    end
  end

  assign logic_ptr_popOnIo = logic_ptr_pop;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (3'b100 - logic_ptr_occupancy);
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      logic_ptr_push <= 3'b000;
      logic_ptr_pop <= 3'b000;
      logic_ptr_wentUp <= 1'b0;
    end else begin
      if(when_Stream_l1455) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 3'b001);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 3'b001);
      end
      if(io_flush) begin
        logic_ptr_push <= 3'b000;
        logic_ptr_pop <= 3'b000;
      end
    end
  end


endmodule

module BufferCC_1 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          aclk,
  input  wire          resetCtrl_debugReset
);

  (* async_reg = "true" , altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg                 buffers_0;
  (* altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" , async_reg = "true" *) reg                 buffers_1;

  initial begin
  `ifndef SYNTHESIS
    buffers_0 = $urandom;
    buffers_1 = $urandom;
  `endif
  end

  assign io_dataOut = buffers_1;
  always @(posedge aclk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module UartCtrlRx (
  input  wire [2:0]    io_configFrame_dataLength,
  input  wire [0:0]    io_configFrame_stop,
  input  wire [1:0]    io_configFrame_parity,
  input  wire          io_samplingTick,
  output wire          io_read_valid,
  input  wire          io_read_ready,
  output wire [7:0]    io_read_payload,
  input  wire          io_rxd,
  output wire          io_rts,
  output reg           io_error,
  output wire          io_break,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;
  localparam UartCtrlRxState_IDLE = 3'd0;
  localparam UartCtrlRxState_START = 3'd1;
  localparam UartCtrlRxState_DATA = 3'd2;
  localparam UartCtrlRxState_PARITY = 3'd3;
  localparam UartCtrlRxState_STOP = 3'd4;

  wire                io_rxd_buffercc_io_dataOut;
  wire       [2:0]    _zz_when_UartCtrlRx_l139;
  wire       [0:0]    _zz_when_UartCtrlRx_l139_1;
  reg                 _zz_io_rts;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  wire                when_UartCtrlRx_l43;
  reg        [2:0]    bitCounter_value;
  reg        [6:0]    break_counter;
  wire                break_valid;
  wire                when_UartCtrlRx_l69;
  reg        [2:0]    stateMachine_state;
  reg                 stateMachine_parity;
  reg        [7:0]    stateMachine_shifter;
  reg                 stateMachine_validReg;
  wire                when_UartCtrlRx_l93;
  wire                when_UartCtrlRx_l103;
  wire                when_UartCtrlRx_l111;
  wire                when_UartCtrlRx_l113;
  wire                when_UartCtrlRx_l125;
  wire                when_UartCtrlRx_l136;
  wire                when_UartCtrlRx_l139;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_when_UartCtrlRx_l139_1 = ((io_configFrame_stop == UartStopType_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlRx_l139 = {2'd0, _zz_when_UartCtrlRx_l139_1};
  (* keep_hierarchy = "TRUE" *) BufferCC io_rxd_buffercc (
    .io_dataIn              (io_rxd                    ), //i
    .io_dataOut             (io_rxd_buffercc_io_dataOut), //o
    .aclk                   (aclk                      ), //i
    .resetCtrl_mainClkReset (resetCtrl_mainClkReset    )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      UartStopType_ONE : io_configFrame_stop_string = "ONE";
      UartStopType_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      UartParityType_NONE : io_configFrame_parity_string = "NONE";
      UartParityType_EVEN : io_configFrame_parity_string = "EVEN";
      UartParityType_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      UartCtrlRxState_IDLE : stateMachine_state_string = "IDLE  ";
      UartCtrlRxState_START : stateMachine_state_string = "START ";
      UartCtrlRxState_DATA : stateMachine_state_string = "DATA  ";
      UartCtrlRxState_PARITY : stateMachine_state_string = "PARITY";
      UartCtrlRxState_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    io_error = 1'b0;
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
      end
      UartCtrlRxState_START : begin
      end
      UartCtrlRxState_DATA : begin
      end
      UartCtrlRxState_PARITY : begin
        if(bitTimer_tick) begin
          if(!when_UartCtrlRx_l125) begin
            io_error = 1'b1;
          end
        end
      end
      default : begin
        if(bitTimer_tick) begin
          if(when_UartCtrlRx_l136) begin
            io_error = 1'b1;
          end
        end
      end
    endcase
  end

  assign io_rts = _zz_io_rts;
  assign sampler_synchroniser = io_rxd_buffercc_io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @(*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick) begin
      if(when_UartCtrlRx_l43) begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign when_UartCtrlRx_l43 = (bitTimer_counter == 3'b000);
  assign break_valid = (break_counter == 7'h41);
  assign when_UartCtrlRx_l69 = (io_samplingTick && (! break_valid));
  assign io_break = break_valid;
  assign io_read_valid = stateMachine_validReg;
  assign when_UartCtrlRx_l93 = ((sampler_tick && (! sampler_value)) && (! break_valid));
  assign when_UartCtrlRx_l103 = (sampler_value == 1'b1);
  assign when_UartCtrlRx_l111 = (bitCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlRx_l113 = (io_configFrame_parity == UartParityType_NONE);
  assign when_UartCtrlRx_l125 = (stateMachine_parity == sampler_value);
  assign when_UartCtrlRx_l136 = (! sampler_value);
  assign when_UartCtrlRx_l139 = (bitCounter_value == _zz_when_UartCtrlRx_l139);
  assign io_read_payload = stateMachine_shifter;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      _zz_io_rts <= 1'b0;
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      break_counter <= 7'h0;
      stateMachine_state <= UartCtrlRxState_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      _zz_io_rts <= (! io_read_ready);
      if(io_samplingTick) begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick) begin
        sampler_samples_2 <= sampler_samples_1;
      end
      sampler_value <= (((1'b0 || ((1'b1 && sampler_samples_0) && sampler_samples_1)) || ((1'b1 && sampler_samples_0) && sampler_samples_2)) || ((1'b1 && sampler_samples_1) && sampler_samples_2));
      sampler_tick <= io_samplingTick;
      if(sampler_value) begin
        break_counter <= 7'h0;
      end else begin
        if(when_UartCtrlRx_l69) begin
          break_counter <= (break_counter + 7'h01);
        end
      end
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        UartCtrlRxState_IDLE : begin
          if(when_UartCtrlRx_l93) begin
            stateMachine_state <= UartCtrlRxState_START;
          end
        end
        UartCtrlRxState_START : begin
          if(bitTimer_tick) begin
            stateMachine_state <= UartCtrlRxState_DATA;
            if(when_UartCtrlRx_l103) begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end
          end
        end
        UartCtrlRxState_DATA : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l111) begin
              if(when_UartCtrlRx_l113) begin
                stateMachine_state <= UartCtrlRxState_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= UartCtrlRxState_PARITY;
              end
            end
          end
        end
        UartCtrlRxState_PARITY : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l125) begin
              stateMachine_state <= UartCtrlRxState_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l136) begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end else begin
              if(when_UartCtrlRx_l139) begin
                stateMachine_state <= UartCtrlRxState_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @(posedge aclk) begin
    if(sampler_tick) begin
      bitTimer_counter <= (bitTimer_counter - 3'b001);
      if(when_UartCtrlRx_l43) begin
        bitTimer_counter <= 3'b100;
      end
    end
    if(bitTimer_tick) begin
      bitCounter_value <= (bitCounter_value + 3'b001);
    end
    if(bitTimer_tick) begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
        if(when_UartCtrlRx_l93) begin
          bitTimer_counter <= 3'b001;
        end
      end
      UartCtrlRxState_START : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
          stateMachine_parity <= (io_configFrame_parity == UartParityType_ODD);
        end
      end
      UartCtrlRxState_DATA : begin
        if(bitTimer_tick) begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(when_UartCtrlRx_l111) begin
            bitCounter_value <= 3'b000;
          end
        end
      end
      UartCtrlRxState_PARITY : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module UartCtrlTx (
  input  wire [2:0]    io_configFrame_dataLength,
  input  wire [0:0]    io_configFrame_stop,
  input  wire [1:0]    io_configFrame_parity,
  input  wire          io_samplingTick,
  input  wire          io_write_valid,
  output reg           io_write_ready,
  input  wire [7:0]    io_write_payload,
  input  wire          io_cts,
  output wire          io_txd,
  input  wire          io_break,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;
  localparam UartCtrlTxState_IDLE = 3'd0;
  localparam UartCtrlTxState_START = 3'd1;
  localparam UartCtrlTxState_DATA = 3'd2;
  localparam UartCtrlTxState_PARITY = 3'd3;
  localparam UartCtrlTxState_STOP = 3'd4;

  wire       [2:0]    _zz_clockDivider_counter_valueNext;
  wire       [0:0]    _zz_clockDivider_counter_valueNext_1;
  wire       [2:0]    _zz_when_UartCtrlTx_l93;
  wire       [0:0]    _zz_when_UartCtrlTx_l93_1;
  reg                 clockDivider_counter_willIncrement;
  wire                clockDivider_counter_willClear;
  reg        [2:0]    clockDivider_counter_valueNext;
  reg        [2:0]    clockDivider_counter_value;
  wire                clockDivider_counter_willOverflowIfInc;
  wire                clockDivider_counter_willOverflow;
  reg        [2:0]    tickCounter_value;
  reg        [2:0]    stateMachine_state;
  reg                 stateMachine_parity;
  reg                 stateMachine_txd;
  wire                when_UartCtrlTx_l58;
  wire                when_UartCtrlTx_l73;
  wire                when_UartCtrlTx_l76;
  wire                when_UartCtrlTx_l93;
  wire       [2:0]    _zz_stateMachine_state;
  reg                 _zz_io_txd;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  reg [47:0] _zz_stateMachine_state_string;
  `endif


  assign _zz_clockDivider_counter_valueNext_1 = clockDivider_counter_willIncrement;
  assign _zz_clockDivider_counter_valueNext = {2'd0, _zz_clockDivider_counter_valueNext_1};
  assign _zz_when_UartCtrlTx_l93_1 = ((io_configFrame_stop == UartStopType_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlTx_l93 = {2'd0, _zz_when_UartCtrlTx_l93_1};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      UartStopType_ONE : io_configFrame_stop_string = "ONE";
      UartStopType_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      UartParityType_NONE : io_configFrame_parity_string = "NONE";
      UartParityType_EVEN : io_configFrame_parity_string = "EVEN";
      UartParityType_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      UartCtrlTxState_IDLE : stateMachine_state_string = "IDLE  ";
      UartCtrlTxState_START : stateMachine_state_string = "START ";
      UartCtrlTxState_DATA : stateMachine_state_string = "DATA  ";
      UartCtrlTxState_PARITY : stateMachine_state_string = "PARITY";
      UartCtrlTxState_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_stateMachine_state)
      UartCtrlTxState_IDLE : _zz_stateMachine_state_string = "IDLE  ";
      UartCtrlTxState_START : _zz_stateMachine_state_string = "START ";
      UartCtrlTxState_DATA : _zz_stateMachine_state_string = "DATA  ";
      UartCtrlTxState_PARITY : _zz_stateMachine_state_string = "PARITY";
      UartCtrlTxState_STOP : _zz_stateMachine_state_string = "STOP  ";
      default : _zz_stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick) begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == 3'b100);
  assign clockDivider_counter_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @(*) begin
    if(clockDivider_counter_willOverflow) begin
      clockDivider_counter_valueNext = 3'b000;
    end else begin
      clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_clockDivider_counter_valueNext);
    end
    if(clockDivider_counter_willClear) begin
      clockDivider_counter_valueNext = 3'b000;
    end
  end

  always @(*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
        stateMachine_txd = 1'b0;
      end
      UartCtrlTxState_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      UartCtrlTxState_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_write_ready = io_break;
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
      end
      UartCtrlTxState_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            io_write_ready = 1'b1;
          end
        end
      end
      UartCtrlTxState_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign when_UartCtrlTx_l58 = ((io_write_valid && (! io_cts)) && clockDivider_counter_willOverflow);
  assign when_UartCtrlTx_l73 = (tickCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlTx_l76 = (io_configFrame_parity == UartParityType_NONE);
  assign when_UartCtrlTx_l93 = (tickCounter_value == _zz_when_UartCtrlTx_l93);
  assign _zz_stateMachine_state = (io_write_valid ? UartCtrlTxState_START : UartCtrlTxState_IDLE);
  assign io_txd = _zz_io_txd;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      clockDivider_counter_value <= 3'b000;
      stateMachine_state <= UartCtrlTxState_IDLE;
      _zz_io_txd <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        UartCtrlTxState_IDLE : begin
          if(when_UartCtrlTx_l58) begin
            stateMachine_state <= UartCtrlTxState_START;
          end
        end
        UartCtrlTxState_START : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= UartCtrlTxState_DATA;
          end
        end
        UartCtrlTxState_DATA : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l73) begin
              if(when_UartCtrlTx_l76) begin
                stateMachine_state <= UartCtrlTxState_STOP;
              end else begin
                stateMachine_state <= UartCtrlTxState_PARITY;
              end
            end
          end
        end
        UartCtrlTxState_PARITY : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= UartCtrlTxState_STOP;
          end
        end
        default : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l93) begin
              stateMachine_state <= _zz_stateMachine_state;
            end
          end
        end
      endcase
      _zz_io_txd <= (stateMachine_txd && (! io_break));
    end
  end

  always @(posedge aclk) begin
    if(clockDivider_counter_willOverflow) begin
      tickCounter_value <= (tickCounter_value + 3'b001);
    end
    if(clockDivider_counter_willOverflow) begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
        if(clockDivider_counter_willOverflow) begin
          stateMachine_parity <= (io_configFrame_parity == UartParityType_ODD);
          tickCounter_value <= 3'b000;
        end
      end
      UartCtrlTxState_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            tickCounter_value <= 3'b000;
          end
        end
      end
      UartCtrlTxState_PARITY : begin
        if(clockDivider_counter_willOverflow) begin
          tickCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module BufferCC (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          aclk,
  input  wire          resetCtrl_mainClkReset
);

  (* async_reg = "true" , altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge aclk or posedge resetCtrl_mainClkReset) begin
    if(resetCtrl_mainClkReset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
