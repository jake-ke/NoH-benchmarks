// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
module __rs_kernel0_aux_split_aux_83 #(
    parameter C_S_AXI_CONTROL_DATA_WIDTH  = 32,
    parameter C_S_AXI_CONTROL_ADDR_WIDTH  = 6,
    parameter C_S_AXI_DATA_WIDTH          = 32,
    parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 4,
    parameter C_S_AXI_WSTRB_WIDTH         = 4
) (
    output wire [16:0] C_drain_IO_L1_out_boundary_wrapper_1_fifo_C_local_in_peek_dout,
    input wire         C_drain_IO_L1_out_boundary_wrapper_1_fifo_C_local_in_peek_read,
    output wire [16:0] C_drain_IO_L1_out_boundary_wrapper_1_fifo_C_local_in_s_dout,
    output wire        C_drain_IO_L1_out_boundary_wrapper_1_fifo_C_local_in_s_empty_n,
    input wire         C_drain_IO_L1_out_boundary_wrapper_1_fifo_C_local_in_s_read,
    output wire        C_drain_IO_L1_out_boundary_wrapper_1_fifo_local_in_peek_empty_n,
    input wire  [16:0] fifo_C_drain_PE_17_1_if_dout,
    input wire         fifo_C_drain_PE_17_1_if_empty_n,
    output wire        fifo_C_drain_PE_17_1_if_read
);
assign C_drain_IO_L1_out_boundary_wrapper_1_fifo_C_local_in_peek_dout = fifo_C_drain_PE_17_1_if_dout;
assign C_drain_IO_L1_out_boundary_wrapper_1_fifo_C_local_in_s_dout = fifo_C_drain_PE_17_1_if_dout;
assign C_drain_IO_L1_out_boundary_wrapper_1_fifo_C_local_in_s_empty_n = fifo_C_drain_PE_17_1_if_empty_n;
assign C_drain_IO_L1_out_boundary_wrapper_1_fifo_local_in_peek_empty_n = fifo_C_drain_PE_17_1_if_empty_n;
assign fifo_C_drain_PE_17_1_if_read = C_drain_IO_L1_out_boundary_wrapper_1_fifo_C_local_in_s_read;
endmodule
