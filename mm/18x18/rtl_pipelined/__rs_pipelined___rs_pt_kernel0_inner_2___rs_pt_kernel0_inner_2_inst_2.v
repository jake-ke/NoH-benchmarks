// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pipelined___rs_pt_kernel0_inner_2___rs_pt_kernel0_inner_2_inst_2 #(
    parameter C_S_AXI_CONTROL_DATA_WIDTH  = 32,
    parameter C_S_AXI_CONTROL_ADDR_WIDTH  = 6,
    parameter C_S_AXI_DATA_WIDTH          = 32,
    parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 4,
    parameter C_S_AXI_WSTRB_WIDTH         = 4
) (
    input wire  __rs_pt_interrupt,
    input wire  ap_clk,
    input wire  ap_rst_n,
    output wire interrupt
);

wire        __rs_pipelined___rs_pt_interrupt;



__rs_pt_kernel0_inner_2 #(
    .C_S_AXI_CONTROL_ADDR_WIDTH  (C_S_AXI_CONTROL_ADDR_WIDTH),
    .C_S_AXI_CONTROL_DATA_WIDTH  (C_S_AXI_CONTROL_DATA_WIDTH),
    .C_S_AXI_CONTROL_WSTRB_WIDTH (C_S_AXI_CONTROL_WSTRB_WIDTH),
    .C_S_AXI_DATA_WIDTH          (C_S_AXI_DATA_WIDTH),
    .C_S_AXI_WSTRB_WIDTH         (C_S_AXI_WSTRB_WIDTH)
) _ /**   Generated by RapidStream   **/ (
    .__rs_pt_interrupt (__rs_pipelined___rs_pt_interrupt),
    .ap_clk            (ap_clk),
    .ap_rst_n          (ap_rst_n),
    .interrupt         (interrupt)
);

(* RS_ROUTE="SLOT_X0Y2_TO_SLOT_X0Y2,SLOT_X1Y2_TO_SLOT_X1Y2,SLOT_X1Y1_TO_SLOT_X1Y1,SLOT_X1Y0_TO_SLOT_X1Y0,SLOT_X0Y0_TO_SLOT_X0Y0" *)
__rs_ff_pipeline_8 #(
    .BODY_LEVEL      (8),
    .DATA_WIDTH      (1),
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
) ff_0 /**   Generated by RapidStream   **/ (
    .clk     (ap_clk),
    .if_din  ({ __rs_pt_interrupt }),
    .if_dout ({ __rs_pipelined___rs_pt_interrupt })
);

endmodule  // __rs_pipelined___rs_pt_kernel0_inner_2___rs_pt_kernel0_inner_2_inst_2