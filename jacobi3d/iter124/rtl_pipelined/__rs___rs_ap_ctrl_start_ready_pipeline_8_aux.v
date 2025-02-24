`timescale 1 ns / 1 ps
module __rs___rs_ap_ctrl_start_ready_pipeline_8_aux #(
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
    parameter __TAIL_REGION   = "",
    parameter GRACE_PERIOD    = ( BODY_LEVEL + HEAD_LEVEL + TAIL_LEVEL ) * 2
) (
    output wire RS_AP_PP_BODY_0_clk,
    output wire RS_AP_PP_BODY_0_reset,
    output wire RS_AP_PP_BODY_1_clk,
    output wire RS_AP_PP_BODY_1_reset,
    output wire RS_AP_PP_BODY_2_clk,
    output wire RS_AP_PP_BODY_2_reset,
    output wire RS_AP_PP_BODY_3_clk,
    output wire RS_AP_PP_BODY_3_reset,
    output wire RS_AP_PP_BODY_4_clk,
    output wire RS_AP_PP_BODY_4_reset,
    output wire RS_AP_PP_BODY_5_clk,
    output wire RS_AP_PP_BODY_5_reset,
    output wire RS_AP_PP_BODY_6_clk,
    output wire RS_AP_PP_BODY_6_reset,
    output wire RS_AP_PP_BODY_7_clk,
    output wire RS_AP_PP_BODY_7_reset,
    output wire RS_AP_PP_HEAD_clk,
    output wire RS_AP_PP_HEAD_reset,
    output wire RS_AP_PP_TAIL_GATE_clk,
    output wire RS_AP_PP_TAIL_GATE_reset,
    output wire RS_AP_PP_TAIL_clk,
    output wire RS_AP_PP_TAIL_reset,
    input wire  clk,
    input wire  reset
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
    
    wire                  tail_gate_valid;
    wire                  tail_gate_ready;
  assign RS_AP_PP_HEAD_clk = clk;
  assign RS_AP_PP_HEAD_reset = reset;
  assign RS_AP_PP_BODY_0_clk = clk;
  assign RS_AP_PP_BODY_0_reset = reset;
  assign RS_AP_PP_BODY_1_clk = clk;
  assign RS_AP_PP_BODY_1_reset = reset;
  assign RS_AP_PP_BODY_2_clk = clk;
  assign RS_AP_PP_BODY_2_reset = reset;
  assign RS_AP_PP_BODY_3_clk = clk;
  assign RS_AP_PP_BODY_3_reset = reset;
  assign RS_AP_PP_BODY_4_clk = clk;
  assign RS_AP_PP_BODY_4_reset = reset;
  assign RS_AP_PP_BODY_5_clk = clk;
  assign RS_AP_PP_BODY_5_reset = reset;
  assign RS_AP_PP_BODY_6_clk = clk;
  assign RS_AP_PP_BODY_6_reset = reset;
  assign RS_AP_PP_BODY_7_clk = clk;
  assign RS_AP_PP_BODY_7_reset = reset;
  assign RS_AP_PP_TAIL_GATE_clk = clk;
  assign RS_AP_PP_TAIL_GATE_reset = reset;
  assign RS_AP_PP_TAIL_clk = clk;
  assign RS_AP_PP_TAIL_reset = reset;
endmodule