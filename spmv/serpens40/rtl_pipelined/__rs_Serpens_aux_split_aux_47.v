// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
module __rs_Serpens_aux_split_aux_47 #(
    parameter C_S_AXI_CONTROL_DATA_WIDTH  = 32,
    parameter C_S_AXI_CONTROL_ADDR_WIDTH  = 10,
    parameter C_S_AXI_DATA_WIDTH          = 32,
    parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 4,
    parameter C_S_AXI_WSTRB_WIDTH         = 4
) (
    output wire [64:0] Merger_Y_0_fifo_in_3_dout,
    output wire        Merger_Y_0_fifo_in_3_empty_n,
    input wire         Merger_Y_0_fifo_in_3_read,
    output wire [64:0] Merger_Y_0_fifo_in_peek_3_dout,
    output wire        Merger_Y_0_fifo_in_peek_3_empty_n,
    input wire         Merger_Y_0_fifo_in_peek_3_read,
    input wire  [64:0] fifo_Y_pe_abd_3_if_dout,
    input wire         fifo_Y_pe_abd_3_if_empty_n,
    output wire        fifo_Y_pe_abd_3_if_read
);
assign Merger_Y_0_fifo_in_3_dout = fifo_Y_pe_abd_3_if_dout;
assign Merger_Y_0_fifo_in_3_empty_n = fifo_Y_pe_abd_3_if_empty_n;
assign Merger_Y_0_fifo_in_peek_3_dout = fifo_Y_pe_abd_3_if_dout;
assign Merger_Y_0_fifo_in_peek_3_empty_n = fifo_Y_pe_abd_3_if_empty_n;
assign fifo_Y_pe_abd_3_if_read = Merger_Y_0_fifo_in_3_read;
endmodule
