// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pipelined_B_IO_L2_in_B_IO_L2_in_13 #(
    parameter ap_ST_fsm_state1 = 5'd1,
    parameter ap_ST_fsm_state2 = 5'd2,
    parameter ap_ST_fsm_state3 = 5'd4,
    parameter ap_ST_fsm_state4 = 5'd8,
    parameter ap_ST_fsm_state5 = 5'd16
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
    output wire [512:0] fifo_B_local_out_din,
    input wire          fifo_B_local_out_full_n,
    output wire         fifo_B_local_out_write,
    output wire [512:0] fifo_B_out_din,
    input wire          fifo_B_out_full_n,
    output wire         fifo_B_out_write,
    input wire  [ 31:0] idx
);

wire        __rs_pipelined_ap_done;
wire        __rs_pipelined_ap_idle;
wire        __rs_pipelined_ap_ready;
wire        __rs_pipelined_ap_rst_n;
wire        __rs_pipelined_ap_start;
wire [31:0] __rs_pipelined_idx;



B_IO_L2_in _ /**   B_IO_L2_in_13   **/ (
    .ap_clk                  (ap_clk),
    .ap_done                 (__rs_pipelined_ap_done),
    .ap_idle                 (__rs_pipelined_ap_idle),
    .ap_ready                (__rs_pipelined_ap_ready),
    .ap_rst_n                (__rs_pipelined_ap_rst_n),
    .ap_start                (__rs_pipelined_ap_start),
    .fifo_B_in_peek_dout     (fifo_B_in_peek_dout),
    .fifo_B_in_peek_empty_n  (fifo_B_in_peek_empty_n),
    .fifo_B_in_peek_read     (fifo_B_in_peek_read),
    .fifo_B_in_s_dout        (fifo_B_in_s_dout),
    .fifo_B_in_s_empty_n     (fifo_B_in_s_empty_n),
    .fifo_B_in_s_read        (fifo_B_in_s_read),
    .fifo_B_local_out_din    (fifo_B_local_out_din),
    .fifo_B_local_out_full_n (fifo_B_local_out_full_n),
    .fifo_B_local_out_write  (fifo_B_local_out_write),
    .fifo_B_out_din          (fifo_B_out_din),
    .fifo_B_out_full_n       (fifo_B_out_full_n),
    .fifo_B_out_write        (fifo_B_out_write),
    .idx                     (32'd13)
);

(* RS_ROUTE="SLOT_X0Y2_TO_SLOT_X0Y2,SLOT_X1Y2_TO_SLOT_X1Y2,SLOT_X1Y3_TO_SLOT_X1Y3,SLOT_X0Y3_TO_SLOT_X0Y3" *)
__rs_ap_ctrl_start_ready_pipeline_6 #(
    .BODY_LEVEL      (6),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X0Y2_TO_SLOT_X0Y2"),
    .__BODY_1_REGION ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_2_REGION ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_3_REGION ("SLOT_X1Y3_TO_SLOT_X1Y3"),
    .__BODY_4_REGION ("SLOT_X1Y3_TO_SLOT_X1Y3"),
    .__BODY_5_REGION ("SLOT_X0Y3_TO_SLOT_X0Y3"),
    .__HEAD_REGION   ("SLOT_X0Y2_TO_SLOT_X0Y2"),
    .__TAIL_REGION   ("SLOT_X0Y3_TO_SLOT_X0Y3")
) ap_1_ap_start /**   Generated by RapidStream   **/ (
    .clk        (ap_clk),
    .if_empty_n (__rs_pipelined_ap_start),
    .if_full_n  (ap_ready),
    .if_read    (__rs_pipelined_ap_ready),
    .if_write   (ap_start),
    .reset      (1'b0)
);

(* RS_ROUTE="SLOT_X0Y0_TO_SLOT_X0Y0,SLOT_X1Y0_TO_SLOT_X1Y0,SLOT_X1Y1_TO_SLOT_X1Y1,SLOT_X1Y2_TO_SLOT_X1Y2,SLOT_X1Y3_TO_SLOT_X1Y3,SLOT_X0Y3_TO_SLOT_X0Y3" *)
__rs_ff_pipeline_10 #(
    .BODY_LEVEL      (10),
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
    .__BODY_7_REGION ("SLOT_X1Y3_TO_SLOT_X1Y3"),
    .__BODY_8_REGION ("SLOT_X1Y3_TO_SLOT_X1Y3"),
    .__BODY_9_REGION ("SLOT_X0Y3_TO_SLOT_X0Y3"),
    .__HEAD_REGION   ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__TAIL_REGION   ("SLOT_X0Y3_TO_SLOT_X0Y3")
) ff_0 /**   Generated by RapidStream   **/ (
    .clk     (ap_clk),
    .if_din  ({ ap_rst_n }),
    .if_dout ({ __rs_pipelined_ap_rst_n })
);

(* RS_ROUTE="SLOT_X0Y2_TO_SLOT_X0Y2,SLOT_X1Y2_TO_SLOT_X1Y2,SLOT_X1Y3_TO_SLOT_X1Y3,SLOT_X0Y3_TO_SLOT_X0Y3" *)
__rs_ff_pipeline_6 #(
    .BODY_LEVEL      (6),
    .DATA_WIDTH      (32),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X0Y2_TO_SLOT_X0Y2"),
    .__BODY_1_REGION ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_2_REGION ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_3_REGION ("SLOT_X1Y3_TO_SLOT_X1Y3"),
    .__BODY_4_REGION ("SLOT_X1Y3_TO_SLOT_X1Y3"),
    .__BODY_5_REGION ("SLOT_X0Y3_TO_SLOT_X0Y3"),
    .__HEAD_REGION   ("SLOT_X0Y2_TO_SLOT_X0Y2"),
    .__TAIL_REGION   ("SLOT_X0Y3_TO_SLOT_X0Y3")
) ff_1_ff_in /**   Generated by RapidStream   **/ (
    .clk     (ap_clk),
    .if_din  ({ idx }),
    .if_dout ({ __rs_pipelined_idx })
);

(* RS_ROUTE="SLOT_X0Y3_TO_SLOT_X0Y3,SLOT_X1Y3_TO_SLOT_X1Y3,SLOT_X1Y2_TO_SLOT_X1Y2,SLOT_X0Y2_TO_SLOT_X0Y2" *)
__rs_ff_pipeline_6 #(
    .BODY_LEVEL      (6),
    .DATA_WIDTH      (2),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X0Y3_TO_SLOT_X0Y3"),
    .__BODY_1_REGION ("SLOT_X1Y3_TO_SLOT_X1Y3"),
    .__BODY_2_REGION ("SLOT_X1Y3_TO_SLOT_X1Y3"),
    .__BODY_3_REGION ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_4_REGION ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_5_REGION ("SLOT_X0Y2_TO_SLOT_X0Y2"),
    .__HEAD_REGION   ("SLOT_X0Y3_TO_SLOT_X0Y3"),
    .__TAIL_REGION   ("SLOT_X0Y2_TO_SLOT_X0Y2")
) ff_1_ff_out /**   Generated by RapidStream   **/ (
    .clk     (ap_clk),
    .if_din  ({ __rs_pipelined_ap_done , __rs_pipelined_ap_idle }),
    .if_dout ({ ap_done , ap_idle })
);

endmodule  // __rs_pipelined_B_IO_L2_in_B_IO_L2_in_13