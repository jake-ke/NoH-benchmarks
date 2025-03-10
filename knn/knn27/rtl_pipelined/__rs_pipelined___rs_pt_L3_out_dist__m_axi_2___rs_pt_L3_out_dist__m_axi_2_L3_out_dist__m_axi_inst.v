// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pipelined___rs_pt_L3_out_dist__m_axi_2___rs_pt_L3_out_dist__m_axi_2_L3_out_dist__m_axi_inst #(
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
    input wire  [(AxiSideAddrWidth - 1):0] __rs_pt_m_axi_AWADDR,
    input wire  [                     1:0] __rs_pt_m_axi_AWBURST,
    input wire  [                     3:0] __rs_pt_m_axi_AWCACHE,
    input wire  [                     0:0] __rs_pt_m_axi_AWID,
    input wire  [                     7:0] __rs_pt_m_axi_AWLEN,
    input wire  [                     0:0] __rs_pt_m_axi_AWLOCK,
    input wire  [                     2:0] __rs_pt_m_axi_AWPROT,
    input wire  [                     3:0] __rs_pt_m_axi_AWQOS,
    output wire                            __rs_pt_m_axi_AWREADY,
    input wire  [                     2:0] __rs_pt_m_axi_AWSIZE,
    input wire                             __rs_pt_m_axi_AWVALID,
    input wire                             clk,
    output wire [(AxiSideAddrWidth - 1):0] m_axi_AWADDR,
    output wire [                     1:0] m_axi_AWBURST,
    output wire [                     3:0] m_axi_AWCACHE,
    output wire [                     0:0] m_axi_AWID,
    output wire [                     7:0] m_axi_AWLEN,
    output wire [                     0:0] m_axi_AWLOCK,
    output wire [                     2:0] m_axi_AWPROT,
    output wire [                     3:0] m_axi_AWQOS,
    input wire                             m_axi_AWREADY,
    output wire [                     2:0] m_axi_AWSIZE,
    output wire                            m_axi_AWVALID,
    input wire                             rst
);

wire [(AxiSideAddrWidth - 1):0] __rs_pipelined___rs_pt_m_axi_AWADDR;
wire [                     1:0] __rs_pipelined___rs_pt_m_axi_AWBURST;
wire [                     3:0] __rs_pipelined___rs_pt_m_axi_AWCACHE;
wire [                     0:0] __rs_pipelined___rs_pt_m_axi_AWID;
wire [                     7:0] __rs_pipelined___rs_pt_m_axi_AWLEN;
wire [                     0:0] __rs_pipelined___rs_pt_m_axi_AWLOCK;
wire [                     2:0] __rs_pipelined___rs_pt_m_axi_AWPROT;
wire [                     3:0] __rs_pipelined___rs_pt_m_axi_AWQOS;
wire                            __rs_pipelined___rs_pt_m_axi_AWREADY;
wire [                     2:0] __rs_pipelined___rs_pt_m_axi_AWSIZE;
wire                            __rs_pipelined___rs_pt_m_axi_AWVALID;



__rs_pt_L3_out_dist__m_axi_2 #(
    .AddrWidth         (AddrWidth),
    .BurstLenWidth     (BurstLenWidth),
    .DataWidth         (DataWidth),
    .DataWidthBytesLog (DataWidthBytesLog),
    .MaxBurstLen       (MaxBurstLen),
    .MaxWaitTime       (MaxWaitTime),
    .WaitTimeWidth     (WaitTimeWidth)
) _ /**   Generated by RapidStream   **/ (
    .__rs_pt_m_axi_AWADDR  (__rs_pipelined___rs_pt_m_axi_AWADDR),
    .__rs_pt_m_axi_AWBURST (__rs_pipelined___rs_pt_m_axi_AWBURST),
    .__rs_pt_m_axi_AWCACHE (__rs_pipelined___rs_pt_m_axi_AWCACHE),
    .__rs_pt_m_axi_AWID    (__rs_pipelined___rs_pt_m_axi_AWID),
    .__rs_pt_m_axi_AWLEN   (__rs_pipelined___rs_pt_m_axi_AWLEN),
    .__rs_pt_m_axi_AWLOCK  (__rs_pipelined___rs_pt_m_axi_AWLOCK),
    .__rs_pt_m_axi_AWPROT  (__rs_pipelined___rs_pt_m_axi_AWPROT),
    .__rs_pt_m_axi_AWQOS   (__rs_pipelined___rs_pt_m_axi_AWQOS),
    .__rs_pt_m_axi_AWREADY (__rs_pipelined___rs_pt_m_axi_AWREADY),
    .__rs_pt_m_axi_AWSIZE  (__rs_pipelined___rs_pt_m_axi_AWSIZE),
    .__rs_pt_m_axi_AWVALID (__rs_pipelined___rs_pt_m_axi_AWVALID),
    .clk                   (clk),
    .m_axi_AWADDR          (m_axi_AWADDR),
    .m_axi_AWBURST         (m_axi_AWBURST),
    .m_axi_AWCACHE         (m_axi_AWCACHE),
    .m_axi_AWID            (m_axi_AWID),
    .m_axi_AWLEN           (m_axi_AWLEN),
    .m_axi_AWLOCK          (m_axi_AWLOCK),
    .m_axi_AWPROT          (m_axi_AWPROT),
    .m_axi_AWQOS           (m_axi_AWQOS),
    .m_axi_AWREADY         (m_axi_AWREADY),
    .m_axi_AWSIZE          (m_axi_AWSIZE),
    .m_axi_AWVALID         (m_axi_AWVALID),
    .rst                   (rst)
);

(* RS_ROUTE="SLOT_X0Y1_TO_SLOT_X0Y1,SLOT_X1Y1_TO_SLOT_X1Y1" *)
__rs_hs_pipeline_2 #(
    .BODY_LEVEL                      (2),
    .DATA_WIDTH                      (( ( ( ( AxiSideAddrWidth - 1 ) - ( 0 ) + 1 ) ) + ( 2 ) + ( 4 ) + ( 1 ) + ( 8 ) + ( 1 ) + ( 3 ) + ( 4 ) + ( 3 ) + 0 )),
    .DEPTH                           (8),
    .EXTRA_PIPELINE_BEFORE_TAIL      (0),
    .PIPELINE_READY_IN_HEAD          (1),
    .PIPELINE_VALID_AND_DATA_IN_HEAD (1),
    .__BODY_0_REGION                 ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_1_REGION                 ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__HEAD_REGION                   ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__TAIL_REGION                   ("SLOT_X1Y1_TO_SLOT_X1Y1")
) hs_0 /**   Generated by RapidStream   **/ (
    .clk        (clk),
    .if_din     ({ __rs_pt_m_axi_AWADDR , __rs_pt_m_axi_AWBURST , __rs_pt_m_axi_AWCACHE , __rs_pt_m_axi_AWID , __rs_pt_m_axi_AWLEN , __rs_pt_m_axi_AWLOCK , __rs_pt_m_axi_AWPROT , __rs_pt_m_axi_AWQOS , __rs_pt_m_axi_AWSIZE }),
    .if_dout    ({ __rs_pipelined___rs_pt_m_axi_AWADDR , __rs_pipelined___rs_pt_m_axi_AWBURST , __rs_pipelined___rs_pt_m_axi_AWCACHE , __rs_pipelined___rs_pt_m_axi_AWID , __rs_pipelined___rs_pt_m_axi_AWLEN , __rs_pipelined___rs_pt_m_axi_AWLOCK , __rs_pipelined___rs_pt_m_axi_AWPROT , __rs_pipelined___rs_pt_m_axi_AWQOS , __rs_pipelined___rs_pt_m_axi_AWSIZE }),
    .if_empty_n (__rs_pipelined___rs_pt_m_axi_AWVALID),
    .if_full_n  (__rs_pt_m_axi_AWREADY),
    .if_read    (__rs_pipelined___rs_pt_m_axi_AWREADY),
    .if_write   (__rs_pt_m_axi_AWVALID),
    .reset      (1'b0)
);

endmodule  // __rs_pipelined___rs_pt_L3_out_dist__m_axi_2___rs_pt_L3_out_dist__m_axi_2_L3_out_dist__m_axi_inst