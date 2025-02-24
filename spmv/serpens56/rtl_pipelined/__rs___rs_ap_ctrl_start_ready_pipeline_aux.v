`timescale 1 ns / 1 ps
module __rs___rs_ap_ctrl_start_ready_pipeline_aux #(
    parameter HEAD_LEVEL      = 0,
    parameter BODY_LEVEL      = 2,
    parameter TAIL_LEVEL      = 0,
    parameter __HEAD_REGION   = "",
    parameter __BODY_0_REGION = "",
    parameter __BODY_1_REGION = "",
    parameter __BODY_2_REGION = "",
    parameter __BODY_3_REGION = "",
    parameter __BODY_4_REGION = "",
    parameter __BODY_5_REGION = "",
    parameter __BODY_6_REGION = "",
    parameter __BODY_7_REGION = "",
    parameter __BODY_8_REGION = "",
    parameter __TAIL_REGION   = "",
    parameter GRACE_PERIOD    = ( BODY_LEVEL + HEAD_LEVEL + TAIL_LEVEL ) * 2
) (
    input wire        clk,
    input wire        reset,
    output wire       if_full_n,
    input wire        if_write,
    output wire       if_empty_n,
    input wire        if_read,
    output wire       RS_AP_PP_HEAD_clk,
    output wire [0:0] RS_AP_PP_HEAD_if_din,
    input wire  [0:0] RS_AP_PP_HEAD_if_dout,
    input wire        RS_AP_PP_HEAD_if_empty_n,
    input wire        RS_AP_PP_HEAD_if_full_n,
    output wire       RS_AP_PP_HEAD_if_read,
    output wire       RS_AP_PP_HEAD_if_write,
    output wire       RS_AP_PP_HEAD_reset,
    output wire       RS_AP_PP_BODY_0_clk,
    output wire [0:0] RS_AP_PP_BODY_0_if_din,
    input wire  [0:0] RS_AP_PP_BODY_0_if_dout,
    input wire        RS_AP_PP_BODY_0_if_empty_n,
    input wire        RS_AP_PP_BODY_0_if_full_n,
    output wire       RS_AP_PP_BODY_0_if_read,
    output wire       RS_AP_PP_BODY_0_if_write,
    output wire       RS_AP_PP_BODY_0_reset,
    output wire       RS_AP_PP_BODY_1_clk,
    output wire [0:0] RS_AP_PP_BODY_1_if_din,
    input wire  [0:0] RS_AP_PP_BODY_1_if_dout,
    input wire        RS_AP_PP_BODY_1_if_empty_n,
    input wire        RS_AP_PP_BODY_1_if_full_n,
    output wire       RS_AP_PP_BODY_1_if_read,
    output wire       RS_AP_PP_BODY_1_if_write,
    output wire       RS_AP_PP_BODY_1_reset,
    output wire       RS_AP_PP_BODY_2_clk,
    output wire [0:0] RS_AP_PP_BODY_2_if_din,
    input wire  [0:0] RS_AP_PP_BODY_2_if_dout,
    input wire        RS_AP_PP_BODY_2_if_empty_n,
    input wire        RS_AP_PP_BODY_2_if_full_n,
    output wire       RS_AP_PP_BODY_2_if_read,
    output wire       RS_AP_PP_BODY_2_if_write,
    output wire       RS_AP_PP_BODY_2_reset,
    output wire       RS_AP_PP_BODY_3_clk,
    output wire [0:0] RS_AP_PP_BODY_3_if_din,
    input wire  [0:0] RS_AP_PP_BODY_3_if_dout,
    input wire        RS_AP_PP_BODY_3_if_empty_n,
    input wire        RS_AP_PP_BODY_3_if_full_n,
    output wire       RS_AP_PP_BODY_3_if_read,
    output wire       RS_AP_PP_BODY_3_if_write,
    output wire       RS_AP_PP_BODY_3_reset,
    output wire       RS_AP_PP_BODY_4_clk,
    output wire [0:0] RS_AP_PP_BODY_4_if_din,
    input wire  [0:0] RS_AP_PP_BODY_4_if_dout,
    input wire        RS_AP_PP_BODY_4_if_empty_n,
    input wire        RS_AP_PP_BODY_4_if_full_n,
    output wire       RS_AP_PP_BODY_4_if_read,
    output wire       RS_AP_PP_BODY_4_if_write,
    output wire       RS_AP_PP_BODY_4_reset,
    output wire       RS_AP_PP_BODY_5_clk,
    output wire [0:0] RS_AP_PP_BODY_5_if_din,
    input wire  [0:0] RS_AP_PP_BODY_5_if_dout,
    input wire        RS_AP_PP_BODY_5_if_empty_n,
    input wire        RS_AP_PP_BODY_5_if_full_n,
    output wire       RS_AP_PP_BODY_5_if_read,
    output wire       RS_AP_PP_BODY_5_if_write,
    output wire       RS_AP_PP_BODY_5_reset,
    output wire       RS_AP_PP_BODY_6_clk,
    output wire [0:0] RS_AP_PP_BODY_6_if_din,
    input wire  [0:0] RS_AP_PP_BODY_6_if_dout,
    input wire        RS_AP_PP_BODY_6_if_empty_n,
    input wire        RS_AP_PP_BODY_6_if_full_n,
    output wire       RS_AP_PP_BODY_6_if_read,
    output wire       RS_AP_PP_BODY_6_if_write,
    output wire       RS_AP_PP_BODY_6_reset,
    output wire       RS_AP_PP_BODY_7_clk,
    output wire [0:0] RS_AP_PP_BODY_7_if_din,
    input wire  [0:0] RS_AP_PP_BODY_7_if_dout,
    input wire        RS_AP_PP_BODY_7_if_empty_n,
    input wire        RS_AP_PP_BODY_7_if_full_n,
    output wire       RS_AP_PP_BODY_7_if_read,
    output wire       RS_AP_PP_BODY_7_if_write,
    output wire       RS_AP_PP_BODY_7_reset,
    output wire       RS_AP_PP_BODY_8_clk,
    output wire [0:0] RS_AP_PP_BODY_8_if_din,
    input wire  [0:0] RS_AP_PP_BODY_8_if_dout,
    input wire        RS_AP_PP_BODY_8_if_empty_n,
    input wire        RS_AP_PP_BODY_8_if_full_n,
    output wire       RS_AP_PP_BODY_8_if_read,
    output wire       RS_AP_PP_BODY_8_if_write,
    output wire       RS_AP_PP_BODY_8_reset,
    output wire       RS_AP_PP_TAIL_GATE_clk,
    output wire [0:0] RS_AP_PP_TAIL_GATE_if_din,
    input wire  [0:0] RS_AP_PP_TAIL_GATE_if_dout,
    input wire        RS_AP_PP_TAIL_GATE_if_empty_n,
    input wire        RS_AP_PP_TAIL_GATE_if_full_n,
    output wire       RS_AP_PP_TAIL_GATE_if_read,
    output wire       RS_AP_PP_TAIL_GATE_if_write,
    output wire       RS_AP_PP_TAIL_GATE_reset,
    output wire       RS_AP_PP_TAIL_clk,
    input wire        RS_AP_PP_TAIL_if_empty_n,
    input wire        RS_AP_PP_TAIL_if_full_n,
    output wire       RS_AP_PP_TAIL_if_read,
    output wire       RS_AP_PP_TAIL_if_write,
    output wire       RS_AP_PP_TAIL_reset
);
    wire                  body_outbound_0_valid;
    wire                  body_outbound_0_ready;
    wire                  body_outbound_1_valid;
    wire                  body_outbound_1_ready;
    wire                  body_outbound_2_valid;
    wire                  body_outbound_2_ready;
    wire                  body_outbound_3_valid;
    wire                  body_outbound_3_ready;
    wire                  body_outbound_4_valid;
    wire                  body_outbound_4_ready;
    wire                  body_outbound_5_valid;
    wire                  body_outbound_5_ready;
    wire                  body_outbound_6_valid;
    wire                  body_outbound_6_ready;
    wire                  body_outbound_7_valid;
    wire                  body_outbound_7_ready;
    wire                  body_outbound_8_valid;
    wire                  body_outbound_8_ready;
    wire                  body_outbound_9_valid;
    wire                  body_outbound_9_ready;
    wire                  tail_gate_valid;
    wire                  tail_gate_ready;
  assign RS_AP_PP_HEAD_clk = clk;
  assign body_outbound_0_valid = RS_AP_PP_HEAD_if_empty_n;
  assign if_full_n = RS_AP_PP_HEAD_if_full_n;
  assign RS_AP_PP_HEAD_if_read = body_outbound_0_ready;
  assign RS_AP_PP_HEAD_if_write = if_write;
  assign RS_AP_PP_HEAD_reset = reset;
  assign RS_AP_PP_BODY_0_clk = clk;
  assign RS_AP_PP_BODY_0_if_din = 1'b0;
  assign body_outbound_1_valid = RS_AP_PP_BODY_0_if_empty_n;
  assign body_outbound_0_ready = RS_AP_PP_BODY_0_if_full_n;
  assign RS_AP_PP_BODY_0_if_read = body_outbound_1_ready;
  assign RS_AP_PP_BODY_0_if_write = body_outbound_0_valid;
  assign RS_AP_PP_BODY_0_reset = reset;
  assign RS_AP_PP_BODY_1_clk = clk;
  assign RS_AP_PP_BODY_1_if_din = 1'b0;
  assign body_outbound_2_valid = RS_AP_PP_BODY_1_if_empty_n;
  assign body_outbound_1_ready = RS_AP_PP_BODY_1_if_full_n;
  assign RS_AP_PP_BODY_1_if_read = body_outbound_2_ready;
  assign RS_AP_PP_BODY_1_if_write = body_outbound_1_valid;
  assign RS_AP_PP_BODY_1_reset = reset;
  assign RS_AP_PP_BODY_2_clk = clk;
  assign RS_AP_PP_BODY_2_if_din = 1'b0;
  assign body_outbound_3_valid = RS_AP_PP_BODY_2_if_empty_n;
  assign body_outbound_2_ready = RS_AP_PP_BODY_2_if_full_n;
  assign RS_AP_PP_BODY_2_if_read = body_outbound_3_ready;
  assign RS_AP_PP_BODY_2_if_write = body_outbound_2_valid;
  assign RS_AP_PP_BODY_2_reset = reset;
  assign RS_AP_PP_BODY_3_clk = clk;
  assign RS_AP_PP_BODY_3_if_din = 1'b0;
  assign body_outbound_4_valid = RS_AP_PP_BODY_3_if_empty_n;
  assign body_outbound_3_ready = RS_AP_PP_BODY_3_if_full_n;
  assign RS_AP_PP_BODY_3_if_read = body_outbound_4_ready;
  assign RS_AP_PP_BODY_3_if_write = body_outbound_3_valid;
  assign RS_AP_PP_BODY_3_reset = reset;
  assign RS_AP_PP_BODY_4_clk = clk;
  assign RS_AP_PP_BODY_4_if_din = 1'b0;
  assign body_outbound_5_valid = RS_AP_PP_BODY_4_if_empty_n;
  assign body_outbound_4_ready = RS_AP_PP_BODY_4_if_full_n;
  assign RS_AP_PP_BODY_4_if_read = body_outbound_5_ready;
  assign RS_AP_PP_BODY_4_if_write = body_outbound_4_valid;
  assign RS_AP_PP_BODY_4_reset = reset;
  assign RS_AP_PP_BODY_5_clk = clk;
  assign RS_AP_PP_BODY_5_if_din = 1'b0;
  assign body_outbound_6_valid = RS_AP_PP_BODY_5_if_empty_n;
  assign body_outbound_5_ready = RS_AP_PP_BODY_5_if_full_n;
  assign RS_AP_PP_BODY_5_if_read = body_outbound_6_ready;
  assign RS_AP_PP_BODY_5_if_write = body_outbound_5_valid;
  assign RS_AP_PP_BODY_5_reset = reset;
  assign RS_AP_PP_BODY_6_clk = clk;
  assign RS_AP_PP_BODY_6_if_din = 1'b0;
  assign body_outbound_7_valid = RS_AP_PP_BODY_6_if_empty_n;
  assign body_outbound_6_ready = RS_AP_PP_BODY_6_if_full_n;
  assign RS_AP_PP_BODY_6_if_read = body_outbound_7_ready;
  assign RS_AP_PP_BODY_6_if_write = body_outbound_6_valid;
  assign RS_AP_PP_BODY_6_reset = reset;
  assign RS_AP_PP_BODY_7_clk = clk;
  assign RS_AP_PP_BODY_7_if_din = 1'b0;
  assign body_outbound_8_valid = RS_AP_PP_BODY_7_if_empty_n;
  assign body_outbound_7_ready = RS_AP_PP_BODY_7_if_full_n;
  assign RS_AP_PP_BODY_7_if_read = body_outbound_8_ready;
  assign RS_AP_PP_BODY_7_if_write = body_outbound_7_valid;
  assign RS_AP_PP_BODY_7_reset = reset;
  assign RS_AP_PP_BODY_8_clk = clk;
  assign RS_AP_PP_BODY_8_if_din = 1'b0;
  assign body_outbound_9_valid = RS_AP_PP_BODY_8_if_empty_n;
  assign body_outbound_8_ready = RS_AP_PP_BODY_8_if_full_n;
  assign RS_AP_PP_BODY_8_if_read = body_outbound_9_ready;
  assign RS_AP_PP_BODY_8_if_write = body_outbound_8_valid;
  assign RS_AP_PP_BODY_8_reset = reset;
  assign RS_AP_PP_TAIL_GATE_clk = clk;
  assign RS_AP_PP_TAIL_GATE_if_din = 1'b0;
  assign tail_gate_valid = RS_AP_PP_TAIL_GATE_if_empty_n;
  assign body_outbound_9_ready = RS_AP_PP_TAIL_GATE_if_full_n;
  assign RS_AP_PP_TAIL_GATE_if_read = tail_gate_ready;
  assign RS_AP_PP_TAIL_GATE_if_write = body_outbound_9_valid;
  assign RS_AP_PP_TAIL_GATE_reset = reset;
  assign RS_AP_PP_TAIL_clk = clk;
  assign if_empty_n = RS_AP_PP_TAIL_if_empty_n;
  assign tail_gate_ready = RS_AP_PP_TAIL_if_full_n;
  assign RS_AP_PP_TAIL_if_read = if_read;
  assign RS_AP_PP_TAIL_if_write = tail_gate_valid;
  assign RS_AP_PP_TAIL_reset = reset;
endmodule