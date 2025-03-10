// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt_in_4__m_axi_8 #(
    parameter BufferSize         = 32,
    parameter BufferSizeLog      = 5,
    parameter AddrWidth          = 64,
    parameter AxiSideAddrWidth   = 64,
    parameter DataWidth          = 512,
    parameter DataWidthBytesLog  = 6,
    parameter WaitTimeWidth      = 4,
    parameter BurstLenWidth      = 8,
    parameter EnableReadChannel  = 1,
    parameter EnableWriteChannel = 1,
    parameter MaxWaitTime        = 3,
    parameter MaxBurstLen        = 15
) (
    output wire __rs_pt_rst,
    input wire  clk,
    input wire  rst
);




__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_async_mmap_rst_inst /**   Generated by RapidStream   **/ (
    .din  (rst),
    .dout (__rs_pt_rst)
);

endmodule  // __rs_pt_in_4__m_axi_8