`timescale 1 ns / 1 ps
module __rs___rs_hs_pipeline_10_aux #(
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
    output wire RS_HS_PP_BODY_0_clk,
    output wire RS_HS_PP_BODY_0_reset,
    output wire RS_HS_PP_BODY_1_clk,
    output wire RS_HS_PP_BODY_1_reset,
    output wire RS_HS_PP_BODY_2_clk,
    output wire RS_HS_PP_BODY_2_reset,
    output wire RS_HS_PP_BODY_3_clk,
    output wire RS_HS_PP_BODY_3_reset,
    output wire RS_HS_PP_BODY_4_clk,
    output wire RS_HS_PP_BODY_4_reset,
    output wire RS_HS_PP_BODY_5_clk,
    output wire RS_HS_PP_BODY_5_reset,
    output wire RS_HS_PP_BODY_6_clk,
    output wire RS_HS_PP_BODY_6_reset,
    output wire RS_HS_PP_BODY_7_clk,
    output wire RS_HS_PP_BODY_7_reset,
    output wire RS_HS_PP_BODY_8_clk,
    output wire RS_HS_PP_BODY_8_reset,
    output wire RS_HS_PP_BODY_9_clk,
    output wire RS_HS_PP_BODY_9_reset,
    output wire RS_HS_PP_HEAD_GATE_clk,
    output wire RS_HS_PP_HEAD_GATE_reset,
    output wire RS_HS_PP_HEAD_clk,
    output wire RS_HS_PP_HEAD_reset,
    output wire RS_HS_PP_TAIL_GATE_clk,
    output wire RS_HS_PP_TAIL_GATE_reset,
    output wire RS_HS_PP_TAIL_clk,
    output wire RS_HS_PP_TAIL_reset,
    input wire  clk,
    input wire  reset
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
    
    wire                  body_outbound_10_valid;
    wire                  body_outbound_10_ready;
    wire [DATA_WIDTH-1:0] body_outbound_10_data ;
    
    wire                  tail_gate_valid;
    wire                  tail_gate_ready;
    wire [DATA_WIDTH-1:0] tail_gate_data ;
  assign RS_HS_PP_HEAD_GATE_clk = clk;
  assign RS_HS_PP_HEAD_GATE_reset = reset;
  assign RS_HS_PP_HEAD_clk = clk;
  assign RS_HS_PP_HEAD_reset = reset;
  assign RS_HS_PP_BODY_0_clk = clk;
  assign RS_HS_PP_BODY_0_reset = reset;
  assign RS_HS_PP_BODY_1_clk = clk;
  assign RS_HS_PP_BODY_1_reset = reset;
  assign RS_HS_PP_BODY_2_clk = clk;
  assign RS_HS_PP_BODY_2_reset = reset;
  assign RS_HS_PP_BODY_3_clk = clk;
  assign RS_HS_PP_BODY_3_reset = reset;
  assign RS_HS_PP_BODY_4_clk = clk;
  assign RS_HS_PP_BODY_4_reset = reset;
  assign RS_HS_PP_BODY_5_clk = clk;
  assign RS_HS_PP_BODY_5_reset = reset;
  assign RS_HS_PP_BODY_6_clk = clk;
  assign RS_HS_PP_BODY_6_reset = reset;
  assign RS_HS_PP_BODY_7_clk = clk;
  assign RS_HS_PP_BODY_7_reset = reset;
  assign RS_HS_PP_BODY_8_clk = clk;
  assign RS_HS_PP_BODY_8_reset = reset;
  assign RS_HS_PP_BODY_9_clk = clk;
  assign RS_HS_PP_BODY_9_reset = reset;
  assign RS_HS_PP_TAIL_GATE_clk = clk;
  assign RS_HS_PP_TAIL_GATE_reset = reset;
  assign RS_HS_PP_TAIL_clk = clk;
  assign RS_HS_PP_TAIL_reset = reset;
    
endmodule