// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
module __rs_kernel0_aux_split_aux_55 #(
    parameter C_S_AXI_CONTROL_DATA_WIDTH  = 32,
    parameter C_S_AXI_CONTROL_ADDR_WIDTH  = 6,
    parameter C_S_AXI_DATA_WIDTH          = 32,
    parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 4,
    parameter C_S_AXI_WSTRB_WIDTH         = 4
) (
    output wire [512:0] B_IO_L2_in_boundary_0_fifo_B_in_peek_dout,
    output wire         B_IO_L2_in_boundary_0_fifo_B_in_peek_empty_n,
    input wire          B_IO_L2_in_boundary_0_fifo_B_in_peek_read,
    output wire [512:0] B_IO_L2_in_boundary_0_fifo_B_in_s_dout,
    output wire         B_IO_L2_in_boundary_0_fifo_B_in_s_empty_n,
    input wire          B_IO_L2_in_boundary_0_fifo_B_in_s_read,
    input wire  [512:0] fifo_B_B_IO_L2_in_18_if_dout,
    input wire          fifo_B_B_IO_L2_in_18_if_empty_n,
    output wire         fifo_B_B_IO_L2_in_18_if_read
);
assign B_IO_L2_in_boundary_0_fifo_B_in_peek_dout = fifo_B_B_IO_L2_in_18_if_dout;
assign B_IO_L2_in_boundary_0_fifo_B_in_peek_empty_n = fifo_B_B_IO_L2_in_18_if_empty_n;
assign B_IO_L2_in_boundary_0_fifo_B_in_s_dout = fifo_B_B_IO_L2_in_18_if_dout;
assign B_IO_L2_in_boundary_0_fifo_B_in_s_empty_n = fifo_B_B_IO_L2_in_18_if_empty_n;
assign fifo_B_B_IO_L2_in_18_if_read = B_IO_L2_in_boundary_0_fifo_B_in_s_read;
endmodule
