// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pipelined_Merger_Y_Merger_Y_0 #(
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
    input wire  [ 64:0] fifo_in_0_dout,
    input wire          fifo_in_0_empty_n,
    output wire         fifo_in_0_read,
    input wire  [ 64:0] fifo_in_1_dout,
    input wire          fifo_in_1_empty_n,
    output wire         fifo_in_1_read,
    input wire  [ 64:0] fifo_in_2_dout,
    input wire          fifo_in_2_empty_n,
    output wire         fifo_in_2_read,
    input wire  [ 64:0] fifo_in_3_dout,
    input wire          fifo_in_3_empty_n,
    output wire         fifo_in_3_read,
    input wire  [ 64:0] fifo_in_4_dout,
    input wire          fifo_in_4_empty_n,
    output wire         fifo_in_4_read,
    input wire  [ 64:0] fifo_in_5_dout,
    input wire          fifo_in_5_empty_n,
    output wire         fifo_in_5_read,
    input wire  [ 64:0] fifo_in_6_dout,
    input wire          fifo_in_6_empty_n,
    output wire         fifo_in_6_read,
    input wire  [ 64:0] fifo_in_7_dout,
    input wire          fifo_in_7_empty_n,
    output wire         fifo_in_7_read,
    input wire  [ 64:0] fifo_in_peek_0_dout,
    input wire          fifo_in_peek_0_empty_n,
    output wire         fifo_in_peek_0_read,
    input wire  [ 64:0] fifo_in_peek_1_dout,
    input wire          fifo_in_peek_1_empty_n,
    output wire         fifo_in_peek_1_read,
    input wire  [ 64:0] fifo_in_peek_2_dout,
    input wire          fifo_in_peek_2_empty_n,
    output wire         fifo_in_peek_2_read,
    input wire  [ 64:0] fifo_in_peek_3_dout,
    input wire          fifo_in_peek_3_empty_n,
    output wire         fifo_in_peek_3_read,
    input wire  [ 64:0] fifo_in_peek_4_dout,
    input wire          fifo_in_peek_4_empty_n,
    output wire         fifo_in_peek_4_read,
    input wire  [ 64:0] fifo_in_peek_5_dout,
    input wire          fifo_in_peek_5_empty_n,
    output wire         fifo_in_peek_5_read,
    input wire  [ 64:0] fifo_in_peek_6_dout,
    input wire          fifo_in_peek_6_empty_n,
    output wire         fifo_in_peek_6_read,
    input wire  [ 64:0] fifo_in_peek_7_dout,
    input wire          fifo_in_peek_7_empty_n,
    output wire         fifo_in_peek_7_read,
    output wire [512:0] fifo_out_din,
    input wire          fifo_out_full_n,
    output wire         fifo_out_write
);

wire        __rs_pipelined_ap_rst_n;



Merger_Y _ /**   Merger_Y_0   **/ (
    .ap_clk                 (ap_clk),
    .ap_done                (ap_done),
    .ap_idle                (ap_idle),
    .ap_ready               (ap_ready),
    .ap_rst_n               (__rs_pipelined_ap_rst_n),
    .ap_start               (ap_start),
    .fifo_in_0_dout         (fifo_in_0_dout),
    .fifo_in_0_empty_n      (fifo_in_0_empty_n),
    .fifo_in_0_read         (fifo_in_0_read),
    .fifo_in_1_dout         (fifo_in_1_dout),
    .fifo_in_1_empty_n      (fifo_in_1_empty_n),
    .fifo_in_1_read         (fifo_in_1_read),
    .fifo_in_2_dout         (fifo_in_2_dout),
    .fifo_in_2_empty_n      (fifo_in_2_empty_n),
    .fifo_in_2_read         (fifo_in_2_read),
    .fifo_in_3_dout         (fifo_in_3_dout),
    .fifo_in_3_empty_n      (fifo_in_3_empty_n),
    .fifo_in_3_read         (fifo_in_3_read),
    .fifo_in_4_dout         (fifo_in_4_dout),
    .fifo_in_4_empty_n      (fifo_in_4_empty_n),
    .fifo_in_4_read         (fifo_in_4_read),
    .fifo_in_5_dout         (fifo_in_5_dout),
    .fifo_in_5_empty_n      (fifo_in_5_empty_n),
    .fifo_in_5_read         (fifo_in_5_read),
    .fifo_in_6_dout         (fifo_in_6_dout),
    .fifo_in_6_empty_n      (fifo_in_6_empty_n),
    .fifo_in_6_read         (fifo_in_6_read),
    .fifo_in_7_dout         (fifo_in_7_dout),
    .fifo_in_7_empty_n      (fifo_in_7_empty_n),
    .fifo_in_7_read         (fifo_in_7_read),
    .fifo_in_peek_0_dout    (fifo_in_peek_0_dout),
    .fifo_in_peek_0_empty_n (fifo_in_peek_0_empty_n),
    .fifo_in_peek_0_read    (fifo_in_peek_0_read),
    .fifo_in_peek_1_dout    (fifo_in_peek_1_dout),
    .fifo_in_peek_1_empty_n (fifo_in_peek_1_empty_n),
    .fifo_in_peek_1_read    (fifo_in_peek_1_read),
    .fifo_in_peek_2_dout    (fifo_in_peek_2_dout),
    .fifo_in_peek_2_empty_n (fifo_in_peek_2_empty_n),
    .fifo_in_peek_2_read    (fifo_in_peek_2_read),
    .fifo_in_peek_3_dout    (fifo_in_peek_3_dout),
    .fifo_in_peek_3_empty_n (fifo_in_peek_3_empty_n),
    .fifo_in_peek_3_read    (fifo_in_peek_3_read),
    .fifo_in_peek_4_dout    (fifo_in_peek_4_dout),
    .fifo_in_peek_4_empty_n (fifo_in_peek_4_empty_n),
    .fifo_in_peek_4_read    (fifo_in_peek_4_read),
    .fifo_in_peek_5_dout    (fifo_in_peek_5_dout),
    .fifo_in_peek_5_empty_n (fifo_in_peek_5_empty_n),
    .fifo_in_peek_5_read    (fifo_in_peek_5_read),
    .fifo_in_peek_6_dout    (fifo_in_peek_6_dout),
    .fifo_in_peek_6_empty_n (fifo_in_peek_6_empty_n),
    .fifo_in_peek_6_read    (fifo_in_peek_6_read),
    .fifo_in_peek_7_dout    (fifo_in_peek_7_dout),
    .fifo_in_peek_7_empty_n (fifo_in_peek_7_empty_n),
    .fifo_in_peek_7_read    (fifo_in_peek_7_read),
    .fifo_out_din           (fifo_out_din),
    .fifo_out_full_n        (fifo_out_full_n),
    .fifo_out_write         (fifo_out_write)
);

(* RS_ROUTE="SLOT_X0Y1_TO_SLOT_X0Y1,SLOT_X1Y1_TO_SLOT_X1Y1" *)
__rs_ff_pipeline_2 #(
    .BODY_LEVEL      (2),
    .DATA_WIDTH      (1),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_1_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__HEAD_REGION   ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__TAIL_REGION   ("SLOT_X1Y1_TO_SLOT_X1Y1")
) ff_0 /**   Generated by RapidStream   **/ (
    .clk     (ap_clk),
    .if_din  ({ ap_rst_n }),
    .if_dout ({ __rs_pipelined_ap_rst_n })
);

endmodule  // __rs_pipelined_Merger_Y_Merger_Y_0