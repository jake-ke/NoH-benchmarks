// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pipelined_B_PE_dummy_in_B_PE_dummy_in_16 #(
    parameter ap_ST_fsm_state1 = 3'd1,
    parameter ap_ST_fsm_state2 = 3'd2,
    parameter ap_ST_fsm_state3 = 3'd4
) (
    input wire          ap_clk,
    output wire         ap_done,
    output wire         ap_idle,
    output wire         ap_ready,
    input wire          ap_rst_n,
    input wire          ap_start,
    input wire  [512:0] fifo_B_in_peek_dout,
    input wire          fifo_B_in_peek_empty_n,
    output wire         fifo_B_in_peek_read,
    input wire  [512:0] fifo_B_in_s_dout,
    input wire          fifo_B_in_s_empty_n,
    output wire         fifo_B_in_s_read,
    input wire  [ 31:0] idx,
    input wire  [ 31:0] idy
);

wire        __rs_pipelined_ap_rst_n;



B_PE_dummy_in _ /**   B_PE_dummy_in_16   **/ (
    .ap_clk                 (ap_clk),
    .ap_done                (ap_done),
    .ap_idle                (ap_idle),
    .ap_ready               (ap_ready),
    .ap_rst_n               (__rs_pipelined_ap_rst_n),
    .ap_start               (ap_start),
    .fifo_B_in_peek_dout    (fifo_B_in_peek_dout),
    .fifo_B_in_peek_empty_n (fifo_B_in_peek_empty_n),
    .fifo_B_in_peek_read    (fifo_B_in_peek_read),
    .fifo_B_in_s_dout       (fifo_B_in_s_dout),
    .fifo_B_in_s_empty_n    (fifo_B_in_s_empty_n),
    .fifo_B_in_s_read       (fifo_B_in_s_read),
    .idx                    (32'd17),
    .idy                    (32'd16)
);

(* RS_ROUTE="SLOT_X0Y0_TO_SLOT_X0Y0,SLOT_X1Y0_TO_SLOT_X1Y0,SLOT_X1Y1_TO_SLOT_X1Y1,SLOT_X1Y2_TO_SLOT_X1Y2,SLOT_X0Y2_TO_SLOT_X0Y2" *)
__rs_ff_pipeline_8 #(
    .BODY_LEVEL      (8),
    .DATA_WIDTH      (1),
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
) ff_0 /**   Generated by RapidStream   **/ (
    .clk     (ap_clk),
    .if_din  ({ ap_rst_n }),
    .if_dout ({ __rs_pipelined_ap_rst_n })
);

endmodule  // __rs_pipelined_B_PE_dummy_in_B_PE_dummy_in_16