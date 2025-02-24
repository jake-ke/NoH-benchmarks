`timescale 1 ns / 1 ps
module __rs___rs_ff_pipeline_aux #(
    parameter DATA_WIDTH      = 32,
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
    parameter __TAIL_REGION   = ""
) (
    input wire                       clk,
    input wire  [(DATA_WIDTH - 1):0] if_din,
    output wire [(DATA_WIDTH - 1):0] if_dout,
    output wire                      RS_FF_PP_HEAD_clk,
    output wire [(DATA_WIDTH - 1):0] RS_FF_PP_HEAD_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_FF_PP_HEAD_if_dout,
    output wire                      RS_FF_PP_BODY_0_clk,
    output wire [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_0_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_0_if_dout,
    output wire                      RS_FF_PP_BODY_1_clk,
    output wire [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_1_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_1_if_dout,
    output wire                      RS_FF_PP_BODY_2_clk,
    output wire [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_2_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_2_if_dout,
    output wire                      RS_FF_PP_BODY_3_clk,
    output wire [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_3_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_3_if_dout,
    output wire                      RS_FF_PP_BODY_4_clk,
    output wire [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_4_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_4_if_dout,
    output wire                      RS_FF_PP_BODY_5_clk,
    output wire [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_5_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_5_if_dout,
    output wire                      RS_FF_PP_BODY_6_clk,
    output wire [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_6_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_6_if_dout,
    output wire                      RS_FF_PP_BODY_7_clk,
    output wire [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_7_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_7_if_dout,
    output wire                      RS_FF_PP_BODY_8_clk,
    output wire [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_8_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_FF_PP_BODY_8_if_dout,
    output wire                      RS_FF_PP_TAIL_clk,
    output wire [(DATA_WIDTH - 1):0] RS_FF_PP_TAIL_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_FF_PP_TAIL_if_dout
);
  wire [DATA_WIDTH-1:0] body_dout_0;
  wire [DATA_WIDTH-1:0] body_dout_1;
  wire [DATA_WIDTH-1:0] body_dout_2;
  wire [DATA_WIDTH-1:0] body_dout_3;
  wire [DATA_WIDTH-1:0] body_dout_4;
  wire [DATA_WIDTH-1:0] body_dout_5;
  wire [DATA_WIDTH-1:0] body_dout_6;
  wire [DATA_WIDTH-1:0] body_dout_7;
  wire [DATA_WIDTH-1:0] body_dout_8;
  wire [DATA_WIDTH-1:0] body_dout_9;
  assign RS_FF_PP_HEAD_clk = clk;
  assign RS_FF_PP_HEAD_if_din = if_din;
  assign body_dout_0 = RS_FF_PP_HEAD_if_dout;
  assign RS_FF_PP_BODY_0_clk = clk;
  assign RS_FF_PP_BODY_0_if_din = body_dout_0;
  assign body_dout_1 = RS_FF_PP_BODY_0_if_dout;
  assign RS_FF_PP_BODY_1_clk = clk;
  assign RS_FF_PP_BODY_1_if_din = body_dout_1;
  assign body_dout_2 = RS_FF_PP_BODY_1_if_dout;
  assign RS_FF_PP_BODY_2_clk = clk;
  assign RS_FF_PP_BODY_2_if_din = body_dout_2;
  assign body_dout_3 = RS_FF_PP_BODY_2_if_dout;
  assign RS_FF_PP_BODY_3_clk = clk;
  assign RS_FF_PP_BODY_3_if_din = body_dout_3;
  assign body_dout_4 = RS_FF_PP_BODY_3_if_dout;
  assign RS_FF_PP_BODY_4_clk = clk;
  assign RS_FF_PP_BODY_4_if_din = body_dout_4;
  assign body_dout_5 = RS_FF_PP_BODY_4_if_dout;
  assign RS_FF_PP_BODY_5_clk = clk;
  assign RS_FF_PP_BODY_5_if_din = body_dout_5;
  assign body_dout_6 = RS_FF_PP_BODY_5_if_dout;
  assign RS_FF_PP_BODY_6_clk = clk;
  assign RS_FF_PP_BODY_6_if_din = body_dout_6;
  assign body_dout_7 = RS_FF_PP_BODY_6_if_dout;
  assign RS_FF_PP_BODY_7_clk = clk;
  assign RS_FF_PP_BODY_7_if_din = body_dout_7;
  assign body_dout_8 = RS_FF_PP_BODY_7_if_dout;
  assign RS_FF_PP_BODY_8_clk = clk;
  assign RS_FF_PP_BODY_8_if_din = body_dout_8;
  assign body_dout_9 = RS_FF_PP_BODY_8_if_dout;
  assign RS_FF_PP_TAIL_clk = clk;
  assign RS_FF_PP_TAIL_if_din = body_dout_9;
  assign if_dout = RS_FF_PP_TAIL_if_dout;
endmodule