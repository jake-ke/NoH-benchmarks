// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pipelined_FloatvMultConst_FloatvMultConst_1 #(
    parameter ap_ST_fsm_state1 = 5'd1,
    parameter ap_ST_fsm_state2 = 5'd2,
    parameter ap_ST_fsm_state3 = 5'd4,
    parameter ap_ST_fsm_state4 = 5'd8,
    parameter ap_ST_fsm_state5 = 5'd16
) (
    input wire  [ 31:0] M,
    input wire  [ 31:0] P_N,
    input wire  [ 31:0] alpha_u,
    input wire          ap_clk,
    output wire         ap_done,
    output wire         ap_idle,
    output wire         ap_ready,
    input wire          ap_rst_n,
    input wire          ap_start,
    input wire  [512:0] fifo_in_peek_dout,
    input wire          fifo_in_peek_empty_n,
    output wire         fifo_in_peek_read,
    input wire  [512:0] fifo_in_s_dout,
    input wire          fifo_in_s_empty_n,
    output wire         fifo_in_s_read,
    output wire [512:0] fifo_out_din,
    input wire          fifo_out_full_n,
    output wire         fifo_out_write
);

wire        __rs_pipelined_ap_rst_n;



FloatvMultConst _ /**   FloatvMultConst_1   **/ (
    .M                    (M),
    .P_N                  (P_N),
    .alpha_u              (alpha_u),
    .ap_clk               (ap_clk),
    .ap_done              (ap_done),
    .ap_idle              (ap_idle),
    .ap_ready             (ap_ready),
    .ap_rst_n             (__rs_pipelined_ap_rst_n),
    .ap_start             (ap_start),
    .fifo_in_peek_dout    (fifo_in_peek_dout),
    .fifo_in_peek_empty_n (fifo_in_peek_empty_n),
    .fifo_in_peek_read    (fifo_in_peek_read),
    .fifo_in_s_dout       (fifo_in_s_dout),
    .fifo_in_s_empty_n    (fifo_in_s_empty_n),
    .fifo_in_s_read       (fifo_in_s_read),
    .fifo_out_din         (fifo_out_din),
    .fifo_out_full_n      (fifo_out_full_n),
    .fifo_out_write       (fifo_out_write)
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

endmodule  // __rs_pipelined_FloatvMultConst_FloatvMultConst_1