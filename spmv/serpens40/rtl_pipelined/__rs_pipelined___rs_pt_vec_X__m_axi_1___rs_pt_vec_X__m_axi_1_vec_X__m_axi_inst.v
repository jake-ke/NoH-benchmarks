// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pipelined___rs_pt_vec_X__m_axi_1___rs_pt_vec_X__m_axi_1_vec_X__m_axi_inst #(
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
    input wire  [(AxiSideAddrWidth - 1):0] __rs_pt_m_axi_ARADDR,
    input wire  [                     1:0] __rs_pt_m_axi_ARBURST,
    input wire  [                     3:0] __rs_pt_m_axi_ARCACHE,
    input wire  [                     0:0] __rs_pt_m_axi_ARID,
    input wire  [                     7:0] __rs_pt_m_axi_ARLEN,
    input wire  [                     0:0] __rs_pt_m_axi_ARLOCK,
    input wire  [                     2:0] __rs_pt_m_axi_ARPROT,
    input wire  [                     3:0] __rs_pt_m_axi_ARQOS,
    output wire                            __rs_pt_m_axi_ARREADY,
    input wire  [                     2:0] __rs_pt_m_axi_ARSIZE,
    input wire                             __rs_pt_m_axi_ARVALID,
    input wire                             clk,
    output wire [(AxiSideAddrWidth - 1):0] m_axi_ARADDR,
    output wire [                     1:0] m_axi_ARBURST,
    output wire [                     3:0] m_axi_ARCACHE,
    output wire [                     0:0] m_axi_ARID,
    output wire [                     7:0] m_axi_ARLEN,
    output wire [                     0:0] m_axi_ARLOCK,
    output wire [                     2:0] m_axi_ARPROT,
    output wire [                     3:0] m_axi_ARQOS,
    input wire                             m_axi_ARREADY,
    output wire [                     2:0] m_axi_ARSIZE,
    output wire                            m_axi_ARVALID,
    input wire                             rst
);

wire        __rs_pipelined_rst;



__rs_pt_vec_X__m_axi_1 #(
    .AddrWidth         (AddrWidth),
    .BurstLenWidth     (BurstLenWidth),
    .DataWidth         (DataWidth),
    .DataWidthBytesLog (DataWidthBytesLog),
    .MaxBurstLen       (MaxBurstLen),
    .MaxWaitTime       (MaxWaitTime),
    .WaitTimeWidth     (WaitTimeWidth)
) _ /**   Generated by RapidStream   **/ (
    .__rs_pt_m_axi_ARADDR  (__rs_pt_m_axi_ARADDR),
    .__rs_pt_m_axi_ARBURST (__rs_pt_m_axi_ARBURST),
    .__rs_pt_m_axi_ARCACHE (__rs_pt_m_axi_ARCACHE),
    .__rs_pt_m_axi_ARID    (__rs_pt_m_axi_ARID),
    .__rs_pt_m_axi_ARLEN   (__rs_pt_m_axi_ARLEN),
    .__rs_pt_m_axi_ARLOCK  (__rs_pt_m_axi_ARLOCK),
    .__rs_pt_m_axi_ARPROT  (__rs_pt_m_axi_ARPROT),
    .__rs_pt_m_axi_ARQOS   (__rs_pt_m_axi_ARQOS),
    .__rs_pt_m_axi_ARREADY (__rs_pt_m_axi_ARREADY),
    .__rs_pt_m_axi_ARSIZE  (__rs_pt_m_axi_ARSIZE),
    .__rs_pt_m_axi_ARVALID (__rs_pt_m_axi_ARVALID),
    .clk                   (clk),
    .m_axi_ARADDR          (m_axi_ARADDR),
    .m_axi_ARBURST         (m_axi_ARBURST),
    .m_axi_ARCACHE         (m_axi_ARCACHE),
    .m_axi_ARID            (m_axi_ARID),
    .m_axi_ARLEN           (m_axi_ARLEN),
    .m_axi_ARLOCK          (m_axi_ARLOCK),
    .m_axi_ARPROT          (m_axi_ARPROT),
    .m_axi_ARQOS           (m_axi_ARQOS),
    .m_axi_ARREADY         (m_axi_ARREADY),
    .m_axi_ARSIZE          (m_axi_ARSIZE),
    .m_axi_ARVALID         (m_axi_ARVALID),
    .rst                   (__rs_pipelined_rst)
);

(* RS_ROUTE="SLOT_X0Y1_TO_SLOT_X0Y1,SLOT_X1Y1_TO_SLOT_X1Y1" *)
__rs_ff_pipeline_2 #(
    .BODY_LEVEL      (2),
    .DATA_WIDTH      (1),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_1_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__HEAD_REGION   ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__TAIL_REGION   ("SLOT_X1Y1_TO_SLOT_X1Y1")
) ff_0 /**   Generated by RapidStream   **/ (
    .clk     (clk),
    .if_din  ({ rst }),
    .if_dout ({ __rs_pipelined_rst })
);

endmodule  // __rs_pipelined___rs_pt_vec_X__m_axi_1___rs_pt_vec_X__m_axi_1_vec_X__m_axi_inst