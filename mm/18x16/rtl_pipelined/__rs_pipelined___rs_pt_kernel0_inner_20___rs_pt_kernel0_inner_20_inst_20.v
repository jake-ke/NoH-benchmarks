// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pipelined___rs_pt_kernel0_inner_20___rs_pt_kernel0_inner_20_inst_20 #(
    parameter C_S_AXI_CONTROL_DATA_WIDTH  = 32,
    parameter C_S_AXI_CONTROL_ADDR_WIDTH  = 6,
    parameter C_S_AXI_DATA_WIDTH          = 32,
    parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 4,
    parameter C_S_AXI_WSTRB_WIDTH         = 4
) (
    output wire       __rs_pt_s_axi_control_BREADY,
    input wire  [1:0] __rs_pt_s_axi_control_BRESP,
    input wire        __rs_pt_s_axi_control_BVALID,
    input wire        ap_clk,
    input wire        ap_rst_n,
    input wire        s_axi_control_BREADY,
    output wire [1:0] s_axi_control_BRESP,
    output wire       s_axi_control_BVALID
);

wire        __rs_pipelined___rs_pt_s_axi_control_BREADY;
wire [ 1:0] __rs_pipelined___rs_pt_s_axi_control_BRESP;
wire        __rs_pipelined___rs_pt_s_axi_control_BVALID;



__rs_pt_kernel0_inner_20 #(
    .C_S_AXI_CONTROL_ADDR_WIDTH  (C_S_AXI_CONTROL_ADDR_WIDTH),
    .C_S_AXI_CONTROL_DATA_WIDTH  (C_S_AXI_CONTROL_DATA_WIDTH),
    .C_S_AXI_CONTROL_WSTRB_WIDTH (C_S_AXI_CONTROL_WSTRB_WIDTH),
    .C_S_AXI_DATA_WIDTH          (C_S_AXI_DATA_WIDTH),
    .C_S_AXI_WSTRB_WIDTH         (C_S_AXI_WSTRB_WIDTH)
) _ /**   Generated by RapidStream   **/ (
    .__rs_pt_s_axi_control_BREADY (__rs_pipelined___rs_pt_s_axi_control_BREADY),
    .__rs_pt_s_axi_control_BRESP  (__rs_pipelined___rs_pt_s_axi_control_BRESP),
    .__rs_pt_s_axi_control_BVALID (__rs_pipelined___rs_pt_s_axi_control_BVALID),
    .ap_clk                       (ap_clk),
    .ap_rst_n                     (ap_rst_n),
    .s_axi_control_BREADY         (s_axi_control_BREADY),
    .s_axi_control_BRESP          (s_axi_control_BRESP),
    .s_axi_control_BVALID         (s_axi_control_BVALID)
);

(* RS_ROUTE="SLOT_X1Y3_TO_SLOT_X1Y3,SLOT_X1Y2_TO_SLOT_X1Y2,SLOT_X0Y2_TO_SLOT_X0Y2,SLOT_X0Y1_TO_SLOT_X0Y1,SLOT_X0Y0_TO_SLOT_X0Y0" *)
__rs_hs_pipeline_8 #(
    .BODY_LEVEL                      (8),
    .DATA_WIDTH                      (2),
    .DEPTH                           (8),
    .EXTRA_PIPELINE_BEFORE_TAIL      (0),
    .PIPELINE_READY_IN_HEAD          (1),
    .PIPELINE_VALID_AND_DATA_IN_HEAD (1),
    .__BODY_0_REGION                 ("SLOT_X1Y3_TO_SLOT_X1Y3"),
    .__BODY_1_REGION                 ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_2_REGION                 ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_3_REGION                 ("SLOT_X0Y2_TO_SLOT_X0Y2"),
    .__BODY_4_REGION                 ("SLOT_X0Y2_TO_SLOT_X0Y2"),
    .__BODY_5_REGION                 ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_6_REGION                 ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_7_REGION                 ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__HEAD_REGION                   ("SLOT_X1Y3_TO_SLOT_X1Y3"),
    .__TAIL_REGION                   ("SLOT_X0Y0_TO_SLOT_X0Y0")
) hs_0 /**   Generated by RapidStream   **/ (
    .clk        (ap_clk),
    .if_din     ({ __rs_pt_s_axi_control_BRESP }),
    .if_dout    ({ __rs_pipelined___rs_pt_s_axi_control_BRESP }),
    .if_empty_n (__rs_pipelined___rs_pt_s_axi_control_BVALID),
    .if_full_n  (__rs_pt_s_axi_control_BREADY),
    .if_read    (__rs_pipelined___rs_pt_s_axi_control_BREADY),
    .if_write   (__rs_pt_s_axi_control_BVALID),
    .reset      (1'b0)
);

endmodule  // __rs_pipelined___rs_pt_kernel0_inner_20___rs_pt_kernel0_inner_20_inst_20