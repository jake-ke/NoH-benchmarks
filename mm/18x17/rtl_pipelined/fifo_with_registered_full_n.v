`timescale 1 ns / 1 ps

// first-word fall-through (FWFT) FIFO that is friendly for floorplanning
module fifo_with_registered_full_n #(
    parameter DATA_WIDTH = 32,
    parameter DEPTH = 24,
    parameter PIPELINE_READY_IN_HEAD = 1,
    parameter PIPELINE_VALID_AND_DATA_IN_HEAD = 0,
    parameter BODY_LEVEL = 0,
    parameter EXTRA_PIPELINE_BEFORE_TAIL = 0,
    parameter MEM_STYLE = 0,   // 0: SRL, 1: ULTRA, 2: BLOCK
    parameter __HEAD_REGION = "",
    
    parameter __TAIL_REGION = ""
) (
    // pragma RS clk port=clk
    input wire clk,
    // pragma RS rst port=reset active=high
    input wire reset,
    // inbound
    // pragma RS handshake valid=if_write ready=if_full_n data=if_din
    output wire                  if_full_n,
    input  wire                  if_write,
    input  wire [DATA_WIDTH-1:0] if_din,
    // outbound
    // pragma RS handshake valid=if_empty_n ready=if_read data=if_dout
    output wire                  if_empty_n,
    input  wire                  if_read,
    output wire [DATA_WIDTH-1:0] if_dout
);
    parameter GRACE_PERIOD = BODY_LEVEL * 2 + PIPELINE_READY_IN_HEAD + PIPELINE_VALID_AND_DATA_IN_HEAD + EXTRA_PIPELINE_BEFORE_TAIL * 2;
    parameter REAL_DEPTH = GRACE_PERIOD + DEPTH + 4;
    parameter REAL_ADDR_WIDTH  = $clog2(REAL_DEPTH);
    wire                  gate_valid;
    wire                  gate_ready;
    wire [DATA_WIDTH-1:0] gate_data ;
    
    wire                  body_outbound_0_valid;
    wire                  body_outbound_0_ready;
    wire [DATA_WIDTH-1:0] body_outbound_0_data ;
    
    wire                  tail_gate_valid;
    wire                  tail_gate_ready;
    wire [DATA_WIDTH-1:0] tail_gate_data ;
    
    __rs_hs_pipeline_head_gate #(
        .DATA_WIDTH(DATA_WIDTH),
        .__REGION(__HEAD_REGION)
    ) RS_HS_PP_HEAD_GATE (
        .clk(clk),
        .reset(reset),
        // inbound
        .if_full_n  (if_full_n),
        .if_write   (if_write),
        .if_din     (if_din),
        // outbound
        .if_empty_n (gate_valid),
        .if_read    (gate_ready),
        .if_dout    (gate_data)
    );
    
    __rs_hs_pipeline_head #(
        .DATA_WIDTH(DATA_WIDTH),
        .PIPELINE_READY(PIPELINE_READY_IN_HEAD),
        .PIPELINE_VALID_AND_DATA(PIPELINE_VALID_AND_DATA_IN_HEAD),
        .__REGION(__HEAD_REGION)
    ) RS_HS_PP_HEAD (
        .clk(clk),
        .reset(reset),
        // inbound
        .if_full_n  (gate_ready),
        .if_write   (gate_valid),
        .if_din     (gate_data),
        // outbound
        .if_empty_n (body_outbound_0_valid),
        .if_read    (body_outbound_0_ready),
        .if_dout    (body_outbound_0_data)
    );
    
    // tail gate is always together with the tail module
    // insulate the timing path between to the tail module
    __rs_fifo_reg #(
        .DATA_WIDTH(DATA_WIDTH),
        .ENABLE_REG(EXTRA_PIPELINE_BEFORE_TAIL),
        .__REGION(__TAIL_REGION)
    ) RS_HS_PP_TAIL_GATE (
        .clk(clk),
        .reset(reset),
        // inbound
        .if_full_n  (body_outbound_0_ready),
        .if_write   (body_outbound_0_valid),
        .if_din     (body_outbound_0_data),
        // outbound
        .if_empty_n(tail_gate_valid),
        .if_read   (tail_gate_ready),
        .if_dout   (tail_gate_data)
    );
    
    __rs_hs_pipeline_tail #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(REAL_ADDR_WIDTH),
        .DEPTH(REAL_DEPTH),
        .GRACE_PERIOD(GRACE_PERIOD),
        .MEM_STYLE(MEM_STYLE),
        .__REGION(__TAIL_REGION)
    ) RS_HS_PP_TAIL (
        .clk(clk),
        .reset(reset),
        // inbound
        .if_full_n  (tail_gate_ready),
        .if_write   (tail_gate_valid),
        .if_din     (tail_gate_data),
        // outbound
        .if_empty_n(if_empty_n),
        .if_read   (if_read),
        .if_dout   (if_dout)
    );
    
endmodule