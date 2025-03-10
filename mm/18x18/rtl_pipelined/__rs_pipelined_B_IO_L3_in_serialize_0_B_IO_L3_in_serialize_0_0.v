// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pipelined_B_IO_L3_in_serialize_0_B_IO_L3_in_serialize_0_0 (
    output wire [ 63:0] __rs_pt_kernel0_inner_m_axi_B_ARADDR,
    output wire [  1:0] __rs_pt_kernel0_inner_m_axi_B_ARBURST,
    output wire [  3:0] __rs_pt_kernel0_inner_m_axi_B_ARCACHE,
    output wire [  0:0] __rs_pt_kernel0_inner_m_axi_B_ARID,
    output wire [  7:0] __rs_pt_kernel0_inner_m_axi_B_ARLEN,
    output wire         __rs_pt_kernel0_inner_m_axi_B_ARLOCK,
    output wire [  2:0] __rs_pt_kernel0_inner_m_axi_B_ARPROT,
    output wire [  3:0] __rs_pt_kernel0_inner_m_axi_B_ARQOS,
    input wire          __rs_pt_kernel0_inner_m_axi_B_ARREADY,
    output wire [  2:0] __rs_pt_kernel0_inner_m_axi_B_ARSIZE,
    output wire         __rs_pt_kernel0_inner_m_axi_B_ARVALID,
    output wire [ 63:0] __rs_pt_kernel0_inner_m_axi_B_AWADDR,
    output wire [  1:0] __rs_pt_kernel0_inner_m_axi_B_AWBURST,
    output wire [  3:0] __rs_pt_kernel0_inner_m_axi_B_AWCACHE,
    output wire [  0:0] __rs_pt_kernel0_inner_m_axi_B_AWID,
    output wire [  7:0] __rs_pt_kernel0_inner_m_axi_B_AWLEN,
    output wire         __rs_pt_kernel0_inner_m_axi_B_AWLOCK,
    output wire [  2:0] __rs_pt_kernel0_inner_m_axi_B_AWPROT,
    output wire [  3:0] __rs_pt_kernel0_inner_m_axi_B_AWQOS,
    input wire          __rs_pt_kernel0_inner_m_axi_B_AWREADY,
    output wire [  2:0] __rs_pt_kernel0_inner_m_axi_B_AWSIZE,
    output wire         __rs_pt_kernel0_inner_m_axi_B_AWVALID,
    input wire  [  0:0] __rs_pt_kernel0_inner_m_axi_B_BID,
    output wire         __rs_pt_kernel0_inner_m_axi_B_BREADY,
    input wire  [  1:0] __rs_pt_kernel0_inner_m_axi_B_BRESP,
    input wire          __rs_pt_kernel0_inner_m_axi_B_BVALID,
    input wire  [511:0] __rs_pt_kernel0_inner_m_axi_B_RDATA,
    input wire  [  0:0] __rs_pt_kernel0_inner_m_axi_B_RID,
    input wire          __rs_pt_kernel0_inner_m_axi_B_RLAST,
    output wire         __rs_pt_kernel0_inner_m_axi_B_RREADY,
    input wire  [  1:0] __rs_pt_kernel0_inner_m_axi_B_RRESP,
    input wire          __rs_pt_kernel0_inner_m_axi_B_RVALID,
    output wire [511:0] __rs_pt_kernel0_inner_m_axi_B_WDATA,
    output wire         __rs_pt_kernel0_inner_m_axi_B_WLAST,
    input wire          __rs_pt_kernel0_inner_m_axi_B_WREADY,
    output wire [ 63:0] __rs_pt_kernel0_inner_m_axi_B_WSTRB,
    output wire         __rs_pt_kernel0_inner_m_axi_B_WVALID,
    input wire          ap_clk,
    output wire         kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_done,
    output wire         kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_idle,
    output wire         kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_ready,
    input wire          kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_rst_n,
    output wire [512:0] kernel0_inner_inst_B_IO_L3_in_serialize_0_fifo_B_local_out_din,
    output wire         kernel0_inner_inst_B_IO_L3_in_serialize_0_fifo_B_local_out_write,
    input wire  [ 63:0] kernel0_inner_inst___tapa_fsm_unit_B_IO_L3_in_serialize_0___B__q0,
    input wire          kernel0_inner_inst___tapa_fsm_unit_B_IO_L3_in_serialize_0__ap_start,
    input wire          kernel0_inner_inst_fifo_B_B_IO_L3_in_serialize_if_full_n
);

wire        __rs_pipelined_kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_done;
wire        __rs_pipelined_kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_idle;
wire        __rs_pipelined_kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_ready;
wire [63:0] __rs_pipelined_kernel0_inner_inst___tapa_fsm_unit_B_IO_L3_in_serialize_0___B__q0;
wire        __rs_pipelined_kernel0_inner_inst___tapa_fsm_unit_B_IO_L3_in_serialize_0__ap_start;



B_IO_L3_in_serialize_0 _ (
    .__rs_pt_kernel0_inner_m_axi_B_ARADDR                                (__rs_pt_kernel0_inner_m_axi_B_ARADDR),
    .__rs_pt_kernel0_inner_m_axi_B_ARBURST                               (__rs_pt_kernel0_inner_m_axi_B_ARBURST),
    .__rs_pt_kernel0_inner_m_axi_B_ARCACHE                               (__rs_pt_kernel0_inner_m_axi_B_ARCACHE),
    .__rs_pt_kernel0_inner_m_axi_B_ARID                                  (__rs_pt_kernel0_inner_m_axi_B_ARID),
    .__rs_pt_kernel0_inner_m_axi_B_ARLEN                                 (__rs_pt_kernel0_inner_m_axi_B_ARLEN),
    .__rs_pt_kernel0_inner_m_axi_B_ARLOCK                                (__rs_pt_kernel0_inner_m_axi_B_ARLOCK),
    .__rs_pt_kernel0_inner_m_axi_B_ARPROT                                (__rs_pt_kernel0_inner_m_axi_B_ARPROT),
    .__rs_pt_kernel0_inner_m_axi_B_ARQOS                                 (__rs_pt_kernel0_inner_m_axi_B_ARQOS),
    .__rs_pt_kernel0_inner_m_axi_B_ARREADY                               (__rs_pt_kernel0_inner_m_axi_B_ARREADY),
    .__rs_pt_kernel0_inner_m_axi_B_ARSIZE                                (__rs_pt_kernel0_inner_m_axi_B_ARSIZE),
    .__rs_pt_kernel0_inner_m_axi_B_ARVALID                               (__rs_pt_kernel0_inner_m_axi_B_ARVALID),
    .__rs_pt_kernel0_inner_m_axi_B_AWADDR                                (__rs_pt_kernel0_inner_m_axi_B_AWADDR),
    .__rs_pt_kernel0_inner_m_axi_B_AWBURST                               (__rs_pt_kernel0_inner_m_axi_B_AWBURST),
    .__rs_pt_kernel0_inner_m_axi_B_AWCACHE                               (__rs_pt_kernel0_inner_m_axi_B_AWCACHE),
    .__rs_pt_kernel0_inner_m_axi_B_AWID                                  (__rs_pt_kernel0_inner_m_axi_B_AWID),
    .__rs_pt_kernel0_inner_m_axi_B_AWLEN                                 (__rs_pt_kernel0_inner_m_axi_B_AWLEN),
    .__rs_pt_kernel0_inner_m_axi_B_AWLOCK                                (__rs_pt_kernel0_inner_m_axi_B_AWLOCK),
    .__rs_pt_kernel0_inner_m_axi_B_AWPROT                                (__rs_pt_kernel0_inner_m_axi_B_AWPROT),
    .__rs_pt_kernel0_inner_m_axi_B_AWQOS                                 (__rs_pt_kernel0_inner_m_axi_B_AWQOS),
    .__rs_pt_kernel0_inner_m_axi_B_AWREADY                               (__rs_pt_kernel0_inner_m_axi_B_AWREADY),
    .__rs_pt_kernel0_inner_m_axi_B_AWSIZE                                (__rs_pt_kernel0_inner_m_axi_B_AWSIZE),
    .__rs_pt_kernel0_inner_m_axi_B_AWVALID                               (__rs_pt_kernel0_inner_m_axi_B_AWVALID),
    .__rs_pt_kernel0_inner_m_axi_B_BID                                   (__rs_pt_kernel0_inner_m_axi_B_BID),
    .__rs_pt_kernel0_inner_m_axi_B_BREADY                                (__rs_pt_kernel0_inner_m_axi_B_BREADY),
    .__rs_pt_kernel0_inner_m_axi_B_BRESP                                 (__rs_pt_kernel0_inner_m_axi_B_BRESP),
    .__rs_pt_kernel0_inner_m_axi_B_BVALID                                (__rs_pt_kernel0_inner_m_axi_B_BVALID),
    .__rs_pt_kernel0_inner_m_axi_B_RDATA                                 (__rs_pt_kernel0_inner_m_axi_B_RDATA),
    .__rs_pt_kernel0_inner_m_axi_B_RID                                   (__rs_pt_kernel0_inner_m_axi_B_RID),
    .__rs_pt_kernel0_inner_m_axi_B_RLAST                                 (__rs_pt_kernel0_inner_m_axi_B_RLAST),
    .__rs_pt_kernel0_inner_m_axi_B_RREADY                                (__rs_pt_kernel0_inner_m_axi_B_RREADY),
    .__rs_pt_kernel0_inner_m_axi_B_RRESP                                 (__rs_pt_kernel0_inner_m_axi_B_RRESP),
    .__rs_pt_kernel0_inner_m_axi_B_RVALID                                (__rs_pt_kernel0_inner_m_axi_B_RVALID),
    .__rs_pt_kernel0_inner_m_axi_B_WDATA                                 (__rs_pt_kernel0_inner_m_axi_B_WDATA),
    .__rs_pt_kernel0_inner_m_axi_B_WLAST                                 (__rs_pt_kernel0_inner_m_axi_B_WLAST),
    .__rs_pt_kernel0_inner_m_axi_B_WREADY                                (__rs_pt_kernel0_inner_m_axi_B_WREADY),
    .__rs_pt_kernel0_inner_m_axi_B_WSTRB                                 (__rs_pt_kernel0_inner_m_axi_B_WSTRB),
    .__rs_pt_kernel0_inner_m_axi_B_WVALID                                (__rs_pt_kernel0_inner_m_axi_B_WVALID),
    .ap_clk                                                              (ap_clk),
    .kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_done                   (__rs_pipelined_kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_done),
    .kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_idle                   (__rs_pipelined_kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_idle),
    .kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_ready                  (__rs_pipelined_kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_ready),
    .kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_rst_n                  (kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_rst_n),
    .kernel0_inner_inst_B_IO_L3_in_serialize_0_fifo_B_local_out_din      (kernel0_inner_inst_B_IO_L3_in_serialize_0_fifo_B_local_out_din),
    .kernel0_inner_inst_B_IO_L3_in_serialize_0_fifo_B_local_out_write    (kernel0_inner_inst_B_IO_L3_in_serialize_0_fifo_B_local_out_write),
    .kernel0_inner_inst___tapa_fsm_unit_B_IO_L3_in_serialize_0___B__q0   (__rs_pipelined_kernel0_inner_inst___tapa_fsm_unit_B_IO_L3_in_serialize_0___B__q0),
    .kernel0_inner_inst___tapa_fsm_unit_B_IO_L3_in_serialize_0__ap_start (__rs_pipelined_kernel0_inner_inst___tapa_fsm_unit_B_IO_L3_in_serialize_0__ap_start),
    .kernel0_inner_inst_fifo_B_B_IO_L3_in_serialize_if_full_n            (kernel0_inner_inst_fifo_B_B_IO_L3_in_serialize_if_full_n)
);

(* RS_ROUTE="SLOT_X0Y2_TO_SLOT_X0Y2,SLOT_X1Y2_TO_SLOT_X1Y2,SLOT_X1Y1_TO_SLOT_X1Y1,SLOT_X1Y0_TO_SLOT_X1Y0,SLOT_X0Y0_TO_SLOT_X0Y0" *)
__rs_ap_ctrl_start_ready_pipeline_8 #(
    .BODY_LEVEL      (8),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X0Y2_TO_SLOT_X0Y2"),
    .__BODY_1_REGION ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_2_REGION ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_3_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_4_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_5_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_6_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_7_REGION ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__HEAD_REGION   ("SLOT_X0Y2_TO_SLOT_X0Y2"),
    .__TAIL_REGION   ("SLOT_X0Y0_TO_SLOT_X0Y0")
) ap_0_ap_start /**   Generated by RapidStream   **/ (
    .clk        (ap_clk),
    .if_empty_n (__rs_pipelined_kernel0_inner_inst___tapa_fsm_unit_B_IO_L3_in_serialize_0__ap_start),
    .if_full_n  (kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_ready),
    .if_read    (__rs_pipelined_kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_ready),
    .if_write   (kernel0_inner_inst___tapa_fsm_unit_B_IO_L3_in_serialize_0__ap_start),
    .reset      (1'b0)
);

(* RS_ROUTE="SLOT_X0Y2_TO_SLOT_X0Y2,SLOT_X1Y2_TO_SLOT_X1Y2,SLOT_X1Y1_TO_SLOT_X1Y1,SLOT_X1Y0_TO_SLOT_X1Y0,SLOT_X0Y0_TO_SLOT_X0Y0" *)
__rs_ff_pipeline_8 #(
    .BODY_LEVEL      (8),
    .DATA_WIDTH      (64),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X0Y2_TO_SLOT_X0Y2"),
    .__BODY_1_REGION ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_2_REGION ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_3_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_4_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_5_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_6_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_7_REGION ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__HEAD_REGION   ("SLOT_X0Y2_TO_SLOT_X0Y2"),
    .__TAIL_REGION   ("SLOT_X0Y0_TO_SLOT_X0Y0")
) ff_0_ff_in /**   Generated by RapidStream   **/ (
    .clk     (ap_clk),
    .if_din  ({ kernel0_inner_inst___tapa_fsm_unit_B_IO_L3_in_serialize_0___B__q0 }),
    .if_dout ({ __rs_pipelined_kernel0_inner_inst___tapa_fsm_unit_B_IO_L3_in_serialize_0___B__q0 })
);

(* RS_ROUTE="SLOT_X0Y0_TO_SLOT_X0Y0,SLOT_X1Y0_TO_SLOT_X1Y0,SLOT_X1Y1_TO_SLOT_X1Y1,SLOT_X1Y2_TO_SLOT_X1Y2,SLOT_X0Y2_TO_SLOT_X0Y2" *)
__rs_ff_pipeline_8 #(
    .BODY_LEVEL      (8),
    .DATA_WIDTH      (2),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__BODY_1_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_2_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_3_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_4_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_5_REGION ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_6_REGION ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_7_REGION ("SLOT_X0Y2_TO_SLOT_X0Y2"),
    .__HEAD_REGION   ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__TAIL_REGION   ("SLOT_X0Y2_TO_SLOT_X0Y2")
) ff_0_ff_out /**   Generated by RapidStream   **/ (
    .clk     (ap_clk),
    .if_din  ({ __rs_pipelined_kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_done , __rs_pipelined_kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_idle }),
    .if_dout ({ kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_done , kernel0_inner_inst_B_IO_L3_in_serialize_0_ap_idle })
);

endmodule  // __rs_pipelined_B_IO_L3_in_serialize_0_B_IO_L3_in_serialize_0_0