// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
module __rs_Serpens_aux_split_aux_72 #(
    parameter C_S_AXI_CONTROL_DATA_WIDTH  = 32,
    parameter C_S_AXI_CONTROL_ADDR_WIDTH  = 9,
    parameter C_S_AXI_DATA_WIDTH          = 32,
    parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 4,
    parameter C_S_AXI_WSTRB_WIDTH         = 4
) (
    output wire [512:0] PEG_Xvec_18_fifo_X_in_peek_dout,
    output wire         PEG_Xvec_18_fifo_X_in_peek_empty_n,
    input wire          PEG_Xvec_18_fifo_X_in_peek_read,
    output wire [512:0] PEG_Xvec_18_fifo_X_in_s_dout,
    output wire         PEG_Xvec_18_fifo_X_in_s_empty_n,
    input wire          PEG_Xvec_18_fifo_X_in_s_read,
    input wire  [512:0] fifo_X_pe_18_if_dout,
    input wire          fifo_X_pe_18_if_empty_n,
    output wire         fifo_X_pe_18_if_read
);
assign PEG_Xvec_18_fifo_X_in_peek_dout = fifo_X_pe_18_if_dout;
assign PEG_Xvec_18_fifo_X_in_peek_empty_n = fifo_X_pe_18_if_empty_n;
assign PEG_Xvec_18_fifo_X_in_s_dout = fifo_X_pe_18_if_dout;
assign PEG_Xvec_18_fifo_X_in_s_empty_n = fifo_X_pe_18_if_empty_n;
assign fifo_X_pe_18_if_read = PEG_Xvec_18_fifo_X_in_s_read;
endmodule
