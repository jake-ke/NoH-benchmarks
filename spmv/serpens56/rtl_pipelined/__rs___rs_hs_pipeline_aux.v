`timescale 1 ns / 1 ps
module __rs___rs_hs_pipeline_aux #(
    parameter DATA_WIDTH                      = 32,
    parameter DEPTH                           = 24,
    parameter PIPELINE_READY_IN_HEAD          = 1,
    parameter PIPELINE_VALID_AND_DATA_IN_HEAD = 0,
    parameter BODY_LEVEL                      = 2,
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
    parameter __TAIL_REGION                   = "",
    parameter GRACE_PERIOD                    = BODY_LEVEL * 2 + PIPELINE_READY_IN_HEAD + PIPELINE_VALID_AND_DATA_IN_HEAD + EXTRA_PIPELINE_BEFORE_TAIL * 2,
    parameter REAL_DEPTH                      = GRACE_PERIOD + DEPTH + 4,
    parameter REAL_ADDR_WIDTH                 = $clog2 ( REAL_DEPTH )
) (
    input wire                       clk,
    input wire                       reset,
    output wire                      if_full_n,
    input wire                       if_write,
    input wire  [(DATA_WIDTH - 1):0] if_din,
    output wire                      if_empty_n,
    input wire                       if_read,
    output wire [(DATA_WIDTH - 1):0] if_dout,
    output wire                      RS_HS_PP_HEAD_GATE_clk,
    output wire [(DATA_WIDTH - 1):0] RS_HS_PP_HEAD_GATE_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_HS_PP_HEAD_GATE_if_dout,
    input wire                       RS_HS_PP_HEAD_GATE_if_empty_n,
    input wire                       RS_HS_PP_HEAD_GATE_if_full_n,
    output wire                      RS_HS_PP_HEAD_GATE_if_read,
    output wire                      RS_HS_PP_HEAD_GATE_if_write,
    output wire                      RS_HS_PP_HEAD_GATE_reset,
    output wire                      RS_HS_PP_HEAD_clk,
    output wire [(DATA_WIDTH - 1):0] RS_HS_PP_HEAD_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_HS_PP_HEAD_if_dout,
    input wire                       RS_HS_PP_HEAD_if_empty_n,
    input wire                       RS_HS_PP_HEAD_if_full_n,
    output wire                      RS_HS_PP_HEAD_if_read,
    output wire                      RS_HS_PP_HEAD_if_write,
    output wire                      RS_HS_PP_HEAD_reset,
    output wire                      RS_HS_PP_BODY_0_clk,
    output wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_0_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_0_if_dout,
    input wire                       RS_HS_PP_BODY_0_if_empty_n,
    input wire                       RS_HS_PP_BODY_0_if_full_n,
    output wire                      RS_HS_PP_BODY_0_if_read,
    output wire                      RS_HS_PP_BODY_0_if_write,
    output wire                      RS_HS_PP_BODY_0_reset,
    output wire                      RS_HS_PP_BODY_1_clk,
    output wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_1_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_1_if_dout,
    input wire                       RS_HS_PP_BODY_1_if_empty_n,
    input wire                       RS_HS_PP_BODY_1_if_full_n,
    output wire                      RS_HS_PP_BODY_1_if_read,
    output wire                      RS_HS_PP_BODY_1_if_write,
    output wire                      RS_HS_PP_BODY_1_reset,
    output wire                      RS_HS_PP_BODY_2_clk,
    output wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_2_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_2_if_dout,
    input wire                       RS_HS_PP_BODY_2_if_empty_n,
    input wire                       RS_HS_PP_BODY_2_if_full_n,
    output wire                      RS_HS_PP_BODY_2_if_read,
    output wire                      RS_HS_PP_BODY_2_if_write,
    output wire                      RS_HS_PP_BODY_2_reset,
    output wire                      RS_HS_PP_BODY_3_clk,
    output wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_3_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_3_if_dout,
    input wire                       RS_HS_PP_BODY_3_if_empty_n,
    input wire                       RS_HS_PP_BODY_3_if_full_n,
    output wire                      RS_HS_PP_BODY_3_if_read,
    output wire                      RS_HS_PP_BODY_3_if_write,
    output wire                      RS_HS_PP_BODY_3_reset,
    output wire                      RS_HS_PP_BODY_4_clk,
    output wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_4_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_4_if_dout,
    input wire                       RS_HS_PP_BODY_4_if_empty_n,
    input wire                       RS_HS_PP_BODY_4_if_full_n,
    output wire                      RS_HS_PP_BODY_4_if_read,
    output wire                      RS_HS_PP_BODY_4_if_write,
    output wire                      RS_HS_PP_BODY_4_reset,
    output wire                      RS_HS_PP_BODY_5_clk,
    output wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_5_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_5_if_dout,
    input wire                       RS_HS_PP_BODY_5_if_empty_n,
    input wire                       RS_HS_PP_BODY_5_if_full_n,
    output wire                      RS_HS_PP_BODY_5_if_read,
    output wire                      RS_HS_PP_BODY_5_if_write,
    output wire                      RS_HS_PP_BODY_5_reset,
    output wire                      RS_HS_PP_BODY_6_clk,
    output wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_6_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_6_if_dout,
    input wire                       RS_HS_PP_BODY_6_if_empty_n,
    input wire                       RS_HS_PP_BODY_6_if_full_n,
    output wire                      RS_HS_PP_BODY_6_if_read,
    output wire                      RS_HS_PP_BODY_6_if_write,
    output wire                      RS_HS_PP_BODY_6_reset,
    output wire                      RS_HS_PP_BODY_7_clk,
    output wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_7_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_7_if_dout,
    input wire                       RS_HS_PP_BODY_7_if_empty_n,
    input wire                       RS_HS_PP_BODY_7_if_full_n,
    output wire                      RS_HS_PP_BODY_7_if_read,
    output wire                      RS_HS_PP_BODY_7_if_write,
    output wire                      RS_HS_PP_BODY_7_reset,
    output wire                      RS_HS_PP_BODY_8_clk,
    output wire [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_8_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_HS_PP_BODY_8_if_dout,
    input wire                       RS_HS_PP_BODY_8_if_empty_n,
    input wire                       RS_HS_PP_BODY_8_if_full_n,
    output wire                      RS_HS_PP_BODY_8_if_read,
    output wire                      RS_HS_PP_BODY_8_if_write,
    output wire                      RS_HS_PP_BODY_8_reset,
    output wire                      RS_HS_PP_TAIL_GATE_clk,
    output wire [(DATA_WIDTH - 1):0] RS_HS_PP_TAIL_GATE_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_HS_PP_TAIL_GATE_if_dout,
    input wire                       RS_HS_PP_TAIL_GATE_if_empty_n,
    input wire                       RS_HS_PP_TAIL_GATE_if_full_n,
    output wire                      RS_HS_PP_TAIL_GATE_if_read,
    output wire                      RS_HS_PP_TAIL_GATE_if_write,
    output wire                      RS_HS_PP_TAIL_GATE_reset,
    output wire                      RS_HS_PP_TAIL_clk,
    output wire [(DATA_WIDTH - 1):0] RS_HS_PP_TAIL_if_din,
    input wire  [(DATA_WIDTH - 1):0] RS_HS_PP_TAIL_if_dout,
    input wire                       RS_HS_PP_TAIL_if_empty_n,
    input wire                       RS_HS_PP_TAIL_if_full_n,
    output wire                      RS_HS_PP_TAIL_if_read,
    output wire                      RS_HS_PP_TAIL_if_write,
    output wire                      RS_HS_PP_TAIL_reset
);
    wire                  gate_valid;
    wire                  gate_ready;
    wire [DATA_WIDTH-1:0] gate_data ;
    wire                  body_outbound_0_valid;
    wire                  body_outbound_0_ready;
    wire [DATA_WIDTH-1:0] body_outbound_0_data ;
    wire                  body_outbound_1_valid;
    wire                  body_outbound_1_ready;
    wire [DATA_WIDTH-1:0] body_outbound_1_data ;
    wire                  body_outbound_2_valid;
    wire                  body_outbound_2_ready;
    wire [DATA_WIDTH-1:0] body_outbound_2_data ;
    wire                  body_outbound_3_valid;
    wire                  body_outbound_3_ready;
    wire [DATA_WIDTH-1:0] body_outbound_3_data ;
    wire                  body_outbound_4_valid;
    wire                  body_outbound_4_ready;
    wire [DATA_WIDTH-1:0] body_outbound_4_data ;
    wire                  body_outbound_5_valid;
    wire                  body_outbound_5_ready;
    wire [DATA_WIDTH-1:0] body_outbound_5_data ;
    wire                  body_outbound_6_valid;
    wire                  body_outbound_6_ready;
    wire [DATA_WIDTH-1:0] body_outbound_6_data ;
    wire                  body_outbound_7_valid;
    wire                  body_outbound_7_ready;
    wire [DATA_WIDTH-1:0] body_outbound_7_data ;
    wire                  body_outbound_8_valid;
    wire                  body_outbound_8_ready;
    wire [DATA_WIDTH-1:0] body_outbound_8_data ;
    wire                  body_outbound_9_valid;
    wire                  body_outbound_9_ready;
    wire [DATA_WIDTH-1:0] body_outbound_9_data ;
    wire                  tail_gate_valid;
    wire                  tail_gate_ready;
    wire [DATA_WIDTH-1:0] tail_gate_data ;
  assign RS_HS_PP_HEAD_GATE_clk = clk;
  assign RS_HS_PP_HEAD_GATE_if_din = if_din;
  assign gate_data = RS_HS_PP_HEAD_GATE_if_dout;
  assign gate_valid = RS_HS_PP_HEAD_GATE_if_empty_n;
  assign if_full_n = RS_HS_PP_HEAD_GATE_if_full_n;
  assign RS_HS_PP_HEAD_GATE_if_read = gate_ready;
  assign RS_HS_PP_HEAD_GATE_if_write = if_write;
  assign RS_HS_PP_HEAD_GATE_reset = reset;
  assign RS_HS_PP_HEAD_clk = clk;
  assign RS_HS_PP_HEAD_if_din = gate_data;
  assign body_outbound_0_data = RS_HS_PP_HEAD_if_dout;
  assign body_outbound_0_valid = RS_HS_PP_HEAD_if_empty_n;
  assign gate_ready = RS_HS_PP_HEAD_if_full_n;
  assign RS_HS_PP_HEAD_if_read = body_outbound_0_ready;
  assign RS_HS_PP_HEAD_if_write = gate_valid;
  assign RS_HS_PP_HEAD_reset = reset;
  assign RS_HS_PP_BODY_0_clk = clk;
  assign RS_HS_PP_BODY_0_if_din = body_outbound_0_data;
  assign body_outbound_1_data = RS_HS_PP_BODY_0_if_dout;
  assign body_outbound_1_valid = RS_HS_PP_BODY_0_if_empty_n;
  assign body_outbound_0_ready = RS_HS_PP_BODY_0_if_full_n;
  assign RS_HS_PP_BODY_0_if_read = body_outbound_1_ready;
  assign RS_HS_PP_BODY_0_if_write = body_outbound_0_valid;
  assign RS_HS_PP_BODY_0_reset = reset;
  assign RS_HS_PP_BODY_1_clk = clk;
  assign RS_HS_PP_BODY_1_if_din = body_outbound_1_data;
  assign body_outbound_2_data = RS_HS_PP_BODY_1_if_dout;
  assign body_outbound_2_valid = RS_HS_PP_BODY_1_if_empty_n;
  assign body_outbound_1_ready = RS_HS_PP_BODY_1_if_full_n;
  assign RS_HS_PP_BODY_1_if_read = body_outbound_2_ready;
  assign RS_HS_PP_BODY_1_if_write = body_outbound_1_valid;
  assign RS_HS_PP_BODY_1_reset = reset;
  assign RS_HS_PP_BODY_2_clk = clk;
  assign RS_HS_PP_BODY_2_if_din = body_outbound_2_data;
  assign body_outbound_3_data = RS_HS_PP_BODY_2_if_dout;
  assign body_outbound_3_valid = RS_HS_PP_BODY_2_if_empty_n;
  assign body_outbound_2_ready = RS_HS_PP_BODY_2_if_full_n;
  assign RS_HS_PP_BODY_2_if_read = body_outbound_3_ready;
  assign RS_HS_PP_BODY_2_if_write = body_outbound_2_valid;
  assign RS_HS_PP_BODY_2_reset = reset;
  assign RS_HS_PP_BODY_3_clk = clk;
  assign RS_HS_PP_BODY_3_if_din = body_outbound_3_data;
  assign body_outbound_4_data = RS_HS_PP_BODY_3_if_dout;
  assign body_outbound_4_valid = RS_HS_PP_BODY_3_if_empty_n;
  assign body_outbound_3_ready = RS_HS_PP_BODY_3_if_full_n;
  assign RS_HS_PP_BODY_3_if_read = body_outbound_4_ready;
  assign RS_HS_PP_BODY_3_if_write = body_outbound_3_valid;
  assign RS_HS_PP_BODY_3_reset = reset;
  assign RS_HS_PP_BODY_4_clk = clk;
  assign RS_HS_PP_BODY_4_if_din = body_outbound_4_data;
  assign body_outbound_5_data = RS_HS_PP_BODY_4_if_dout;
  assign body_outbound_5_valid = RS_HS_PP_BODY_4_if_empty_n;
  assign body_outbound_4_ready = RS_HS_PP_BODY_4_if_full_n;
  assign RS_HS_PP_BODY_4_if_read = body_outbound_5_ready;
  assign RS_HS_PP_BODY_4_if_write = body_outbound_4_valid;
  assign RS_HS_PP_BODY_4_reset = reset;
  assign RS_HS_PP_BODY_5_clk = clk;
  assign RS_HS_PP_BODY_5_if_din = body_outbound_5_data;
  assign body_outbound_6_data = RS_HS_PP_BODY_5_if_dout;
  assign body_outbound_6_valid = RS_HS_PP_BODY_5_if_empty_n;
  assign body_outbound_5_ready = RS_HS_PP_BODY_5_if_full_n;
  assign RS_HS_PP_BODY_5_if_read = body_outbound_6_ready;
  assign RS_HS_PP_BODY_5_if_write = body_outbound_5_valid;
  assign RS_HS_PP_BODY_5_reset = reset;
  assign RS_HS_PP_BODY_6_clk = clk;
  assign RS_HS_PP_BODY_6_if_din = body_outbound_6_data;
  assign body_outbound_7_data = RS_HS_PP_BODY_6_if_dout;
  assign body_outbound_7_valid = RS_HS_PP_BODY_6_if_empty_n;
  assign body_outbound_6_ready = RS_HS_PP_BODY_6_if_full_n;
  assign RS_HS_PP_BODY_6_if_read = body_outbound_7_ready;
  assign RS_HS_PP_BODY_6_if_write = body_outbound_6_valid;
  assign RS_HS_PP_BODY_6_reset = reset;
  assign RS_HS_PP_BODY_7_clk = clk;
  assign RS_HS_PP_BODY_7_if_din = body_outbound_7_data;
  assign body_outbound_8_data = RS_HS_PP_BODY_7_if_dout;
  assign body_outbound_8_valid = RS_HS_PP_BODY_7_if_empty_n;
  assign body_outbound_7_ready = RS_HS_PP_BODY_7_if_full_n;
  assign RS_HS_PP_BODY_7_if_read = body_outbound_8_ready;
  assign RS_HS_PP_BODY_7_if_write = body_outbound_7_valid;
  assign RS_HS_PP_BODY_7_reset = reset;
  assign RS_HS_PP_BODY_8_clk = clk;
  assign RS_HS_PP_BODY_8_if_din = body_outbound_8_data;
  assign body_outbound_9_data = RS_HS_PP_BODY_8_if_dout;
  assign body_outbound_9_valid = RS_HS_PP_BODY_8_if_empty_n;
  assign body_outbound_8_ready = RS_HS_PP_BODY_8_if_full_n;
  assign RS_HS_PP_BODY_8_if_read = body_outbound_9_ready;
  assign RS_HS_PP_BODY_8_if_write = body_outbound_8_valid;
  assign RS_HS_PP_BODY_8_reset = reset;
  assign RS_HS_PP_TAIL_GATE_clk = clk;
  assign RS_HS_PP_TAIL_GATE_if_din = body_outbound_9_data;
  assign tail_gate_data = RS_HS_PP_TAIL_GATE_if_dout;
  assign tail_gate_valid = RS_HS_PP_TAIL_GATE_if_empty_n;
  assign body_outbound_9_ready = RS_HS_PP_TAIL_GATE_if_full_n;
  assign RS_HS_PP_TAIL_GATE_if_read = tail_gate_ready;
  assign RS_HS_PP_TAIL_GATE_if_write = body_outbound_9_valid;
  assign RS_HS_PP_TAIL_GATE_reset = reset;
  assign RS_HS_PP_TAIL_clk = clk;
  assign RS_HS_PP_TAIL_if_din = tail_gate_data;
  assign if_dout = RS_HS_PP_TAIL_if_dout;
  assign if_empty_n = RS_HS_PP_TAIL_if_empty_n;
  assign tail_gate_ready = RS_HS_PP_TAIL_if_full_n;
  assign RS_HS_PP_TAIL_if_read = if_read;
  assign RS_HS_PP_TAIL_if_write = tail_gate_valid;
  assign RS_HS_PP_TAIL_reset = reset;
endmodule