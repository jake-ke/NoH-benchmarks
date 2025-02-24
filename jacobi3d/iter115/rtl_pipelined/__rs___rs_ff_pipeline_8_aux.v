`timescale 1 ns / 1 ps
module __rs___rs_ff_pipeline_8_aux #(
    parameter DATA_WIDTH      = 32,
    parameter HEAD_LEVEL      = 0,
    parameter BODY_LEVEL      = 8,
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
    parameter __TAIL_REGION   = ""
) (
    output wire RS_FF_PP_BODY_0_clk,
    output wire RS_FF_PP_BODY_1_clk,
    output wire RS_FF_PP_BODY_2_clk,
    output wire RS_FF_PP_BODY_3_clk,
    output wire RS_FF_PP_BODY_4_clk,
    output wire RS_FF_PP_BODY_5_clk,
    output wire RS_FF_PP_BODY_6_clk,
    output wire RS_FF_PP_BODY_7_clk,
    output wire RS_FF_PP_HEAD_clk,
    output wire RS_FF_PP_TAIL_clk,
    input wire  clk
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
  assign RS_FF_PP_HEAD_clk = clk;
  assign RS_FF_PP_BODY_0_clk = clk;
  assign RS_FF_PP_BODY_1_clk = clk;
  assign RS_FF_PP_BODY_2_clk = clk;
  assign RS_FF_PP_BODY_3_clk = clk;
  assign RS_FF_PP_BODY_4_clk = clk;
  assign RS_FF_PP_BODY_5_clk = clk;
  assign RS_FF_PP_BODY_6_clk = clk;
  assign RS_FF_PP_BODY_7_clk = clk;
  assign RS_FF_PP_TAIL_clk = clk;
endmodule