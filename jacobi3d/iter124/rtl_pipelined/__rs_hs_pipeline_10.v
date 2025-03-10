// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
module __rs_hs_pipeline_10 #(
    parameter DATA_WIDTH                      = 32,
    parameter DEPTH                           = 24,
    parameter PIPELINE_READY_IN_HEAD          = 1,
    parameter PIPELINE_VALID_AND_DATA_IN_HEAD = 0,
    parameter BODY_LEVEL                      = 10,
    parameter EXTRA_PIPELINE_BEFORE_TAIL      = 0,
    parameter MEM_STYLE                       = 0,
    parameter __HEAD_REGION                   = "",
    parameter __BODY_0_REGION                 = "",
    parameter __BODY_1_REGION                 = "",
    parameter __BODY_2_REGION                 = "",
    parameter __BODY_3_REGION                 = "",
    parameter __BODY_4_REGION                 = "",
    parameter __BODY_5_REGION                 = "",
    parameter __BODY_6_REGION                 = "",
    parameter __BODY_7_REGION                 = "",
    parameter __BODY_8_REGION                 = "",
    parameter __BODY_9_REGION                 = "",
    parameter __TAIL_REGION                   = "",
    parameter GRACE_PERIOD                    = BODY_LEVEL * 2 + PIPELINE_READY_IN_HEAD + PIPELINE_VALID_AND_DATA_IN_HEAD + EXTRA_PIPELINE_BEFORE_TAIL * 2,
    parameter REAL_DEPTH                      = GRACE_PERIOD + DEPTH + 4,
    parameter REAL_ADDR_WIDTH                 = $clog2 ( REAL_DEPTH )
) (
    input wire                       clk,
    input wire  [(DATA_WIDTH - 1):0] if_din,
    output wire [(DATA_WIDTH - 1):0] if_dout,
    output wire                      if_empty_n,
    output wire                      if_full_n,
    input wire                       if_read,
    input wire                       if_write,
    input wire                       reset
);

wire                      RS_HS_PP_BODY_0_clk;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_0_if_din;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_0_if_dout;
wire                      RS_HS_PP_BODY_0_if_empty_n;
wire                      RS_HS_PP_BODY_0_if_full_n;
wire                      RS_HS_PP_BODY_0_if_read;
wire                      RS_HS_PP_BODY_0_if_write;
wire                      RS_HS_PP_BODY_0_reset;
wire                      RS_HS_PP_BODY_1_clk;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_1_if_din;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_1_if_dout;
wire                      RS_HS_PP_BODY_1_if_empty_n;
wire                      RS_HS_PP_BODY_1_if_full_n;
wire                      RS_HS_PP_BODY_1_if_read;
wire                      RS_HS_PP_BODY_1_if_write;
wire                      RS_HS_PP_BODY_1_reset;
wire                      RS_HS_PP_BODY_2_clk;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_2_if_din;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_2_if_dout;
wire                      RS_HS_PP_BODY_2_if_empty_n;
wire                      RS_HS_PP_BODY_2_if_full_n;
wire                      RS_HS_PP_BODY_2_if_read;
wire                      RS_HS_PP_BODY_2_if_write;
wire                      RS_HS_PP_BODY_2_reset;
wire                      RS_HS_PP_BODY_3_clk;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_3_if_din;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_3_if_dout;
wire                      RS_HS_PP_BODY_3_if_empty_n;
wire                      RS_HS_PP_BODY_3_if_full_n;
wire                      RS_HS_PP_BODY_3_if_read;
wire                      RS_HS_PP_BODY_3_if_write;
wire                      RS_HS_PP_BODY_3_reset;
wire                      RS_HS_PP_BODY_4_clk;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_4_if_din;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_4_if_dout;
wire                      RS_HS_PP_BODY_4_if_empty_n;
wire                      RS_HS_PP_BODY_4_if_full_n;
wire                      RS_HS_PP_BODY_4_if_read;
wire                      RS_HS_PP_BODY_4_if_write;
wire                      RS_HS_PP_BODY_4_reset;
wire                      RS_HS_PP_BODY_5_clk;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_5_if_din;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_5_if_dout;
wire                      RS_HS_PP_BODY_5_if_empty_n;
wire                      RS_HS_PP_BODY_5_if_full_n;
wire                      RS_HS_PP_BODY_5_if_read;
wire                      RS_HS_PP_BODY_5_if_write;
wire                      RS_HS_PP_BODY_5_reset;
wire                      RS_HS_PP_BODY_6_clk;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_6_if_din;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_6_if_dout;
wire                      RS_HS_PP_BODY_6_if_empty_n;
wire                      RS_HS_PP_BODY_6_if_full_n;
wire                      RS_HS_PP_BODY_6_if_read;
wire                      RS_HS_PP_BODY_6_if_write;
wire                      RS_HS_PP_BODY_6_reset;
wire                      RS_HS_PP_BODY_7_clk;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_7_if_din;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_7_if_dout;
wire                      RS_HS_PP_BODY_7_if_empty_n;
wire                      RS_HS_PP_BODY_7_if_full_n;
wire                      RS_HS_PP_BODY_7_if_read;
wire                      RS_HS_PP_BODY_7_if_write;
wire                      RS_HS_PP_BODY_7_reset;
wire                      RS_HS_PP_BODY_8_clk;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_8_if_din;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_8_if_dout;
wire                      RS_HS_PP_BODY_8_if_empty_n;
wire                      RS_HS_PP_BODY_8_if_full_n;
wire                      RS_HS_PP_BODY_8_if_read;
wire                      RS_HS_PP_BODY_8_if_write;
wire                      RS_HS_PP_BODY_8_reset;
wire                      RS_HS_PP_BODY_9_clk;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_9_if_din;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_9_if_dout;
wire                      RS_HS_PP_BODY_9_if_empty_n;
wire                      RS_HS_PP_BODY_9_if_full_n;
wire                      RS_HS_PP_BODY_9_if_read;
wire                      RS_HS_PP_BODY_9_if_write;
wire                      RS_HS_PP_BODY_9_reset;
wire                      RS_HS_PP_HEAD_GATE_clk;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_HEAD_GATE_if_din;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_HEAD_GATE_if_dout;
wire                      RS_HS_PP_HEAD_GATE_if_empty_n;
wire                      RS_HS_PP_HEAD_GATE_if_full_n;
wire                      RS_HS_PP_HEAD_GATE_if_read;
wire                      RS_HS_PP_HEAD_GATE_if_write;
wire                      RS_HS_PP_HEAD_GATE_reset;
wire                      RS_HS_PP_HEAD_clk;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_HEAD_if_din;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_HEAD_if_dout;
wire                      RS_HS_PP_HEAD_if_empty_n;
wire                      RS_HS_PP_HEAD_if_full_n;
wire                      RS_HS_PP_HEAD_if_read;
wire                      RS_HS_PP_HEAD_if_write;
wire                      RS_HS_PP_HEAD_reset;
wire                      RS_HS_PP_TAIL_GATE_clk;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_TAIL_GATE_if_din;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_TAIL_GATE_if_dout;
wire                      RS_HS_PP_TAIL_GATE_if_empty_n;
wire                      RS_HS_PP_TAIL_GATE_if_full_n;
wire                      RS_HS_PP_TAIL_GATE_if_read;
wire                      RS_HS_PP_TAIL_GATE_if_write;
wire                      RS_HS_PP_TAIL_GATE_reset;
wire                      RS_HS_PP_TAIL_clk;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_TAIL_if_din;
wire [(DATA_WIDTH - 1):0] RS_HS_PP_TAIL_if_dout;
wire                      RS_HS_PP_TAIL_if_empty_n;
wire                      RS_HS_PP_TAIL_if_full_n;
wire                      RS_HS_PP_TAIL_if_read;
wire                      RS_HS_PP_TAIL_if_write;
wire                      RS_HS_PP_TAIL_reset;


(* KEEP_HIERARCHY="TRUE" *)
__rs_fifo_reg #(
    .DATA_WIDTH    (DATA_WIDTH),
    .ENABLE_REG    (BODY_LEVEL - 0),
    .__NEXT_REGION (__BODY_1_REGION),
    .__PREV_REGION (__HEAD_REGION),
    .__REGION      (__BODY_0_REGION)
) RS_HS_PP_BODY_0 (
    .clk        (clk),
    .if_din     (RS_HS_PP_HEAD_if_dout),
    .if_dout    (RS_HS_PP_BODY_0_if_dout),
    .if_empty_n (RS_HS_PP_BODY_0_if_empty_n),
    .if_full_n  (RS_HS_PP_BODY_0_if_full_n),
    .if_read    (RS_HS_PP_BODY_1_if_full_n),
    .if_write   (RS_HS_PP_HEAD_if_empty_n),
    .reset      (reset)
);

(* KEEP_HIERARCHY="TRUE" *)
__rs_fifo_reg #(
    .DATA_WIDTH    (DATA_WIDTH),
    .ENABLE_REG    (BODY_LEVEL - 1),
    .__NEXT_REGION (__BODY_2_REGION),
    .__PREV_REGION (__BODY_0_REGION),
    .__REGION      (__BODY_1_REGION)
) RS_HS_PP_BODY_1 (
    .clk        (clk),
    .if_din     (RS_HS_PP_BODY_0_if_dout),
    .if_dout    (RS_HS_PP_BODY_1_if_dout),
    .if_empty_n (RS_HS_PP_BODY_1_if_empty_n),
    .if_full_n  (RS_HS_PP_BODY_1_if_full_n),
    .if_read    (RS_HS_PP_BODY_2_if_full_n),
    .if_write   (RS_HS_PP_BODY_0_if_empty_n),
    .reset      (reset)
);

(* KEEP_HIERARCHY="TRUE" *)
__rs_fifo_reg #(
    .DATA_WIDTH    (DATA_WIDTH),
    .ENABLE_REG    (BODY_LEVEL - 2),
    .__NEXT_REGION (__BODY_3_REGION),
    .__PREV_REGION (__BODY_1_REGION),
    .__REGION      (__BODY_2_REGION)
) RS_HS_PP_BODY_2 (
    .clk        (clk),
    .if_din     (RS_HS_PP_BODY_1_if_dout),
    .if_dout    (RS_HS_PP_BODY_2_if_dout),
    .if_empty_n (RS_HS_PP_BODY_2_if_empty_n),
    .if_full_n  (RS_HS_PP_BODY_2_if_full_n),
    .if_read    (RS_HS_PP_BODY_3_if_full_n),
    .if_write   (RS_HS_PP_BODY_1_if_empty_n),
    .reset      (reset)
);

(* KEEP_HIERARCHY="TRUE" *)
__rs_fifo_reg #(
    .DATA_WIDTH    (DATA_WIDTH),
    .ENABLE_REG    (BODY_LEVEL - 3),
    .__NEXT_REGION (__BODY_4_REGION),
    .__PREV_REGION (__BODY_2_REGION),
    .__REGION      (__BODY_3_REGION)
) RS_HS_PP_BODY_3 (
    .clk        (clk),
    .if_din     (RS_HS_PP_BODY_2_if_dout),
    .if_dout    (RS_HS_PP_BODY_3_if_dout),
    .if_empty_n (RS_HS_PP_BODY_3_if_empty_n),
    .if_full_n  (RS_HS_PP_BODY_3_if_full_n),
    .if_read    (RS_HS_PP_BODY_4_if_full_n),
    .if_write   (RS_HS_PP_BODY_2_if_empty_n),
    .reset      (reset)
);

(* KEEP_HIERARCHY="TRUE" *)
__rs_fifo_reg #(
    .DATA_WIDTH    (DATA_WIDTH),
    .ENABLE_REG    (BODY_LEVEL - 4),
    .__NEXT_REGION (__BODY_5_REGION),
    .__PREV_REGION (__BODY_3_REGION),
    .__REGION      (__BODY_4_REGION)
) RS_HS_PP_BODY_4 (
    .clk        (clk),
    .if_din     (RS_HS_PP_BODY_3_if_dout),
    .if_dout    (RS_HS_PP_BODY_4_if_dout),
    .if_empty_n (RS_HS_PP_BODY_4_if_empty_n),
    .if_full_n  (RS_HS_PP_BODY_4_if_full_n),
    .if_read    (RS_HS_PP_BODY_5_if_full_n),
    .if_write   (RS_HS_PP_BODY_3_if_empty_n),
    .reset      (reset)
);

(* KEEP_HIERARCHY="TRUE" *)
__rs_fifo_reg #(
    .DATA_WIDTH    (DATA_WIDTH),
    .ENABLE_REG    (BODY_LEVEL - 5),
    .__NEXT_REGION (__BODY_6_REGION),
    .__PREV_REGION (__BODY_4_REGION),
    .__REGION      (__BODY_5_REGION)
) RS_HS_PP_BODY_5 (
    .clk        (clk),
    .if_din     (RS_HS_PP_BODY_4_if_dout),
    .if_dout    (RS_HS_PP_BODY_5_if_dout),
    .if_empty_n (RS_HS_PP_BODY_5_if_empty_n),
    .if_full_n  (RS_HS_PP_BODY_5_if_full_n),
    .if_read    (RS_HS_PP_BODY_6_if_full_n),
    .if_write   (RS_HS_PP_BODY_4_if_empty_n),
    .reset      (reset)
);

(* KEEP_HIERARCHY="TRUE" *)
__rs_fifo_reg #(
    .DATA_WIDTH    (DATA_WIDTH),
    .ENABLE_REG    (BODY_LEVEL - 6),
    .__NEXT_REGION (__BODY_7_REGION),
    .__PREV_REGION (__BODY_5_REGION),
    .__REGION      (__BODY_6_REGION)
) RS_HS_PP_BODY_6 (
    .clk        (clk),
    .if_din     (RS_HS_PP_BODY_5_if_dout),
    .if_dout    (RS_HS_PP_BODY_6_if_dout),
    .if_empty_n (RS_HS_PP_BODY_6_if_empty_n),
    .if_full_n  (RS_HS_PP_BODY_6_if_full_n),
    .if_read    (RS_HS_PP_BODY_7_if_full_n),
    .if_write   (RS_HS_PP_BODY_5_if_empty_n),
    .reset      (reset)
);

(* KEEP_HIERARCHY="TRUE" *)
__rs_fifo_reg #(
    .DATA_WIDTH    (DATA_WIDTH),
    .ENABLE_REG    (BODY_LEVEL - 7),
    .__NEXT_REGION (__BODY_8_REGION),
    .__PREV_REGION (__BODY_6_REGION),
    .__REGION      (__BODY_7_REGION)
) RS_HS_PP_BODY_7 (
    .clk        (clk),
    .if_din     (RS_HS_PP_BODY_6_if_dout),
    .if_dout    (RS_HS_PP_BODY_7_if_dout),
    .if_empty_n (RS_HS_PP_BODY_7_if_empty_n),
    .if_full_n  (RS_HS_PP_BODY_7_if_full_n),
    .if_read    (RS_HS_PP_BODY_8_if_full_n),
    .if_write   (RS_HS_PP_BODY_6_if_empty_n),
    .reset      (reset)
);

(* KEEP_HIERARCHY="TRUE" *)
__rs_fifo_reg #(
    .DATA_WIDTH    (DATA_WIDTH),
    .ENABLE_REG    (BODY_LEVEL - 8),
    .__NEXT_REGION (__BODY_9_REGION),
    .__PREV_REGION (__BODY_7_REGION),
    .__REGION      (__BODY_8_REGION)
) RS_HS_PP_BODY_8 (
    .clk        (clk),
    .if_din     (RS_HS_PP_BODY_7_if_dout),
    .if_dout    (RS_HS_PP_BODY_8_if_dout),
    .if_empty_n (RS_HS_PP_BODY_8_if_empty_n),
    .if_full_n  (RS_HS_PP_BODY_8_if_full_n),
    .if_read    (RS_HS_PP_BODY_9_if_full_n),
    .if_write   (RS_HS_PP_BODY_7_if_empty_n),
    .reset      (reset)
);

(* KEEP_HIERARCHY="TRUE" *)
__rs_fifo_reg #(
    .DATA_WIDTH    (DATA_WIDTH),
    .ENABLE_REG    (BODY_LEVEL - 9),
    .__NEXT_REGION (__TAIL_REGION),
    .__PREV_REGION (__BODY_8_REGION),
    .__REGION      (__BODY_9_REGION)
) RS_HS_PP_BODY_9 (
    .clk        (clk),
    .if_din     (RS_HS_PP_BODY_8_if_dout),
    .if_dout    (RS_HS_PP_BODY_9_if_dout),
    .if_empty_n (RS_HS_PP_BODY_9_if_empty_n),
    .if_full_n  (RS_HS_PP_BODY_9_if_full_n),
    .if_read    (RS_HS_PP_TAIL_GATE_if_full_n),
    .if_write   (RS_HS_PP_BODY_8_if_empty_n),
    .reset      (reset)
);

(* KEEP_HIERARCHY="TRUE" *)
__rs_hs_pipeline_head #(
    .DATA_WIDTH              (DATA_WIDTH),
    .PIPELINE_READY          (PIPELINE_READY_IN_HEAD),
    .PIPELINE_VALID_AND_DATA (PIPELINE_VALID_AND_DATA_IN_HEAD),
    .__REGION                (__HEAD_REGION)
) RS_HS_PP_HEAD (
    .clk        (clk),
    .if_din     (RS_HS_PP_HEAD_GATE_if_dout),
    .if_dout    (RS_HS_PP_HEAD_if_dout),
    .if_empty_n (RS_HS_PP_HEAD_if_empty_n),
    .if_full_n  (RS_HS_PP_HEAD_if_full_n),
    .if_read    (RS_HS_PP_BODY_0_if_full_n),
    .if_write   (RS_HS_PP_HEAD_GATE_if_empty_n),
    .reset      (reset)
);

(* KEEP_HIERARCHY="TRUE" *)
__rs_hs_pipeline_head_gate #(
    .DATA_WIDTH (DATA_WIDTH),
    .__REGION   (__HEAD_REGION)
) RS_HS_PP_HEAD_GATE (
    .clk        (clk),
    .if_din     (if_din),
    .if_dout    (RS_HS_PP_HEAD_GATE_if_dout),
    .if_empty_n (RS_HS_PP_HEAD_GATE_if_empty_n),
    .if_full_n  (if_full_n),
    .if_read    (RS_HS_PP_HEAD_if_full_n),
    .if_write   (if_write),
    .reset      (reset)
);

(* KEEP_HIERARCHY="TRUE" *)
__rs_hs_pipeline_tail #(
    .ADDR_WIDTH   (REAL_ADDR_WIDTH),
    .DATA_WIDTH   (DATA_WIDTH),
    .DEPTH        (REAL_DEPTH),
    .GRACE_PERIOD (GRACE_PERIOD),
    .MEM_STYLE    (MEM_STYLE),
    .__REGION     (__TAIL_REGION)
) RS_HS_PP_TAIL (
    .clk        (clk),
    .if_din     (RS_HS_PP_TAIL_GATE_if_dout),
    .if_dout    (if_dout),
    .if_empty_n (if_empty_n),
    .if_full_n  (RS_HS_PP_TAIL_if_full_n),
    .if_read    (if_read),
    .if_write   (RS_HS_PP_TAIL_GATE_if_empty_n),
    .reset      (reset)
);

(* KEEP_HIERARCHY="TRUE" *)
__rs_fifo_reg #(
    .DATA_WIDTH (DATA_WIDTH),
    .ENABLE_REG (EXTRA_PIPELINE_BEFORE_TAIL),
    .__REGION   (__TAIL_REGION)
) RS_HS_PP_TAIL_GATE (
    .clk        (clk),
    .if_din     (RS_HS_PP_BODY_9_if_dout),
    .if_dout    (RS_HS_PP_TAIL_GATE_if_dout),
    .if_empty_n (RS_HS_PP_TAIL_GATE_if_empty_n),
    .if_full_n  (RS_HS_PP_TAIL_GATE_if_full_n),
    .if_read    (RS_HS_PP_TAIL_if_full_n),
    .if_write   (RS_HS_PP_BODY_9_if_empty_n),
    .reset      (reset)
);

endmodule  // __rs_hs_pipeline_10