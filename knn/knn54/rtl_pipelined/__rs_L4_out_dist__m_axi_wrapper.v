// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_L4_out_dist__m_axi_wrapper (
    input wire         Knn_inner_inst_L4_out_dist__m_axi_rst,
    output wire        Knn_inner_inst_L4_out_dist__m_axi_write_addr_full_n,
    output wire        Knn_inner_inst_L4_out_dist__m_axi_write_data_full_n,
    output wire [ 7:0] Knn_inner_inst_L4_out_dist__m_axi_write_resp_dout,
    output wire        Knn_inner_inst_L4_out_dist__m_axi_write_resp_empty_n,
    input wire         Knn_inner_inst_L4_out_dist__m_axi_write_resp_read,
    input wire  [63:0] Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_din,
    input wire         Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_write,
    input wire  [32:0] Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_din,
    input wire         Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_write,
    output wire [63:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_ARADDR,
    output wire [ 1:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_ARBURST,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_ARCACHE,
    output wire [ 0:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_ARID,
    output wire [ 7:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_ARLEN,
    output wire        __rs_pt_Knn_inner_m_axi_L4_out_dist_ARLOCK,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_ARPROT,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_ARQOS,
    input wire         __rs_pt_Knn_inner_m_axi_L4_out_dist_ARREADY,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_ARSIZE,
    output wire        __rs_pt_Knn_inner_m_axi_L4_out_dist_ARVALID,
    output wire [63:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_AWADDR,
    output wire [ 1:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_AWBURST,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_AWCACHE,
    output wire [ 0:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_AWID,
    output wire [ 7:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_AWLEN,
    output wire        __rs_pt_Knn_inner_m_axi_L4_out_dist_AWLOCK,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_AWPROT,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_AWQOS,
    input wire         __rs_pt_Knn_inner_m_axi_L4_out_dist_AWREADY,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_AWSIZE,
    output wire        __rs_pt_Knn_inner_m_axi_L4_out_dist_AWVALID,
    input wire  [ 0:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_BID,
    output wire        __rs_pt_Knn_inner_m_axi_L4_out_dist_BREADY,
    input wire  [ 1:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_BRESP,
    input wire         __rs_pt_Knn_inner_m_axi_L4_out_dist_BVALID,
    input wire  [31:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_RDATA,
    input wire  [ 0:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_RID,
    input wire         __rs_pt_Knn_inner_m_axi_L4_out_dist_RLAST,
    output wire        __rs_pt_Knn_inner_m_axi_L4_out_dist_RREADY,
    input wire  [ 1:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_RRESP,
    input wire         __rs_pt_Knn_inner_m_axi_L4_out_dist_RVALID,
    output wire [31:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_WDATA,
    output wire        __rs_pt_Knn_inner_m_axi_L4_out_dist_WLAST,
    input wire         __rs_pt_Knn_inner_m_axi_L4_out_dist_WREADY,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_L4_out_dist_WSTRB,
    output wire        __rs_pt_Knn_inner_m_axi_L4_out_dist_WVALID,
    input wire         ap_clk
);

wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_addr_full_n;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_data_full_n;
wire [ 7:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_resp_dout;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_resp_empty_n;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_resp_read;
wire [63:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_din;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_write;
wire [32:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_din;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_write;
wire [63:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARADDR;
wire [ 1:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARBURST;
wire [ 3:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARCACHE;
wire [ 0:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARID;
wire [ 7:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARLEN;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARLOCK;
wire [ 2:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARPROT;
wire [ 3:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARQOS;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARREADY;
wire [ 2:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARSIZE;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARVALID;
wire [63:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWADDR;
wire [ 1:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWBURST;
wire [ 3:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWCACHE;
wire [ 0:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWID;
wire [ 7:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWLEN;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWLOCK;
wire [ 2:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWPROT;
wire [ 3:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWQOS;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWREADY;
wire [ 2:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWSIZE;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWVALID;
wire [ 0:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BID;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BREADY;
wire [ 1:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BRESP;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BVALID;
wire [31:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RDATA;
wire [ 0:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RID;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RLAST;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RREADY;
wire [ 1:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RRESP;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RVALID;
wire [31:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WDATA;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WLAST;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WREADY;
wire [ 3:0] __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WSTRB;
wire        __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WVALID;



__rs_L4_out_dist__m_axi_wrapper_inner __rs_L4_out_dist__m_axi_wrapper_inner_inst (
    .Knn_inner_inst_L4_out_dist__m_axi_rst                                 (Knn_inner_inst_L4_out_dist__m_axi_rst),
    .Knn_inner_inst_L4_out_dist__m_axi_write_addr_full_n                   (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_addr_full_n),
    .Knn_inner_inst_L4_out_dist__m_axi_write_data_full_n                   (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_data_full_n),
    .Knn_inner_inst_L4_out_dist__m_axi_write_resp_dout                     (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_resp_dout),
    .Knn_inner_inst_L4_out_dist__m_axi_write_resp_empty_n                  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_resp_empty_n),
    .Knn_inner_inst_L4_out_dist__m_axi_write_resp_read                     (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_resp_read),
    .Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_din   (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_din),
    .Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_write (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_write),
    .Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_din     (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_din),
    .Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_write   (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_write),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARADDR                            (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARADDR),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARBURST                           (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARBURST),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARCACHE                           (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARCACHE),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARID                              (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARID),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARLEN                             (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARLEN),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARLOCK                            (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARLOCK),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARPROT                            (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARPROT),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARQOS                             (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARQOS),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARREADY                           (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARREADY),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARSIZE                            (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARSIZE),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARVALID                           (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARVALID),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWADDR                            (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWADDR),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWBURST                           (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWBURST),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWCACHE                           (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWCACHE),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWID                              (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWID),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWLEN                             (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWLEN),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWLOCK                            (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWLOCK),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWPROT                            (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWPROT),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWQOS                             (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWQOS),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWREADY                           (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWREADY),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWSIZE                            (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWSIZE),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWVALID                           (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWVALID),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_BID                               (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BID),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_BREADY                            (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BREADY),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_BRESP                             (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BRESP),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_BVALID                            (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BVALID),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_RDATA                             (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RDATA),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_RID                               (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RID),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_RLAST                             (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RLAST),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_RREADY                            (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RREADY),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_RRESP                             (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RRESP),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_RVALID                            (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RVALID),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_WDATA                             (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WDATA),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_WLAST                             (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WLAST),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_WREADY                            (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WREADY),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_WSTRB                             (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WSTRB),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_WVALID                            (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WVALID),
    .ap_clk                                                                (ap_clk)
);


__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_0 __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_0_inst_0 /**   Generated by RapidStream   **/ (
    .Knn_inner_inst_L4_out_dist__m_axi_rst                                         (Knn_inner_inst_L4_out_dist__m_axi_rst),
    .Knn_inner_inst_L4_out_dist__m_axi_write_addr_full_n                           (Knn_inner_inst_L4_out_dist__m_axi_write_addr_full_n),
    .Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_din           (Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_din),
    .Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_write         (Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_write),
    .__rs_pt_Knn_inner_inst_L4_out_dist__m_axi_write_addr_full_n                   (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_addr_full_n),
    .__rs_pt_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_din   (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_din),
    .__rs_pt_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_write (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_write),
    .ap_clk                                                                        (ap_clk)
);


__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_1 __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_1_inst_1 /**   Generated by RapidStream   **/ (
    .Knn_inner_inst_L4_out_dist__m_axi_rst                                       (Knn_inner_inst_L4_out_dist__m_axi_rst),
    .Knn_inner_inst_L4_out_dist__m_axi_write_data_full_n                         (Knn_inner_inst_L4_out_dist__m_axi_write_data_full_n),
    .Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_din           (Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_din),
    .Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_write         (Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_write),
    .__rs_pt_Knn_inner_inst_L4_out_dist__m_axi_write_data_full_n                 (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_data_full_n),
    .__rs_pt_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_din   (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_din),
    .__rs_pt_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_write (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_write),
    .ap_clk                                                                      (ap_clk)
);


__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_2 __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_2_inst_2 /**   Generated by RapidStream   **/ (
    .Knn_inner_inst_L4_out_dist__m_axi_rst                        (Knn_inner_inst_L4_out_dist__m_axi_rst),
    .Knn_inner_inst_L4_out_dist__m_axi_write_resp_dout            (Knn_inner_inst_L4_out_dist__m_axi_write_resp_dout),
    .Knn_inner_inst_L4_out_dist__m_axi_write_resp_empty_n         (Knn_inner_inst_L4_out_dist__m_axi_write_resp_empty_n),
    .Knn_inner_inst_L4_out_dist__m_axi_write_resp_read            (Knn_inner_inst_L4_out_dist__m_axi_write_resp_read),
    .__rs_pt_Knn_inner_inst_L4_out_dist__m_axi_write_resp_dout    (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_resp_dout),
    .__rs_pt_Knn_inner_inst_L4_out_dist__m_axi_write_resp_empty_n (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_resp_empty_n),
    .__rs_pt_Knn_inner_inst_L4_out_dist__m_axi_write_resp_read    (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_resp_read),
    .ap_clk                                                       (ap_clk)
);


__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_3 __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_3_inst_3 /**   Generated by RapidStream   **/ (
    .Knn_inner_inst_L4_out_dist__m_axi_rst               (Knn_inner_inst_L4_out_dist__m_axi_rst),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARADDR          (__rs_pt_Knn_inner_m_axi_L4_out_dist_ARADDR),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARBURST         (__rs_pt_Knn_inner_m_axi_L4_out_dist_ARBURST),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARCACHE         (__rs_pt_Knn_inner_m_axi_L4_out_dist_ARCACHE),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARID            (__rs_pt_Knn_inner_m_axi_L4_out_dist_ARID),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARLEN           (__rs_pt_Knn_inner_m_axi_L4_out_dist_ARLEN),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARLOCK          (__rs_pt_Knn_inner_m_axi_L4_out_dist_ARLOCK),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARPROT          (__rs_pt_Knn_inner_m_axi_L4_out_dist_ARPROT),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARQOS           (__rs_pt_Knn_inner_m_axi_L4_out_dist_ARQOS),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARREADY         (__rs_pt_Knn_inner_m_axi_L4_out_dist_ARREADY),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARSIZE          (__rs_pt_Knn_inner_m_axi_L4_out_dist_ARSIZE),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_ARVALID         (__rs_pt_Knn_inner_m_axi_L4_out_dist_ARVALID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_ARADDR  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARADDR),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_ARBURST (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARBURST),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_ARCACHE (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARCACHE),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_ARID    (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_ARLEN   (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARLEN),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_ARLOCK  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARLOCK),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_ARPROT  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARPROT),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_ARQOS   (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARQOS),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_ARREADY (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARREADY),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_ARSIZE  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARSIZE),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_ARVALID (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARVALID),
    .ap_clk                                              (ap_clk)
);


__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_4 __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_4_inst_4 /**   Generated by RapidStream   **/ (
    .Knn_inner_inst_L4_out_dist__m_axi_rst               (Knn_inner_inst_L4_out_dist__m_axi_rst),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWADDR          (__rs_pt_Knn_inner_m_axi_L4_out_dist_AWADDR),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWBURST         (__rs_pt_Knn_inner_m_axi_L4_out_dist_AWBURST),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWCACHE         (__rs_pt_Knn_inner_m_axi_L4_out_dist_AWCACHE),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWID            (__rs_pt_Knn_inner_m_axi_L4_out_dist_AWID),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWLEN           (__rs_pt_Knn_inner_m_axi_L4_out_dist_AWLEN),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWLOCK          (__rs_pt_Knn_inner_m_axi_L4_out_dist_AWLOCK),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWPROT          (__rs_pt_Knn_inner_m_axi_L4_out_dist_AWPROT),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWQOS           (__rs_pt_Knn_inner_m_axi_L4_out_dist_AWQOS),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWREADY         (__rs_pt_Knn_inner_m_axi_L4_out_dist_AWREADY),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWSIZE          (__rs_pt_Knn_inner_m_axi_L4_out_dist_AWSIZE),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_AWVALID         (__rs_pt_Knn_inner_m_axi_L4_out_dist_AWVALID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_AWADDR  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWADDR),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_AWBURST (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWBURST),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_AWCACHE (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWCACHE),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_AWID    (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_AWLEN   (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWLEN),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_AWLOCK  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWLOCK),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_AWPROT  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWPROT),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_AWQOS   (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWQOS),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_AWREADY (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWREADY),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_AWSIZE  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWSIZE),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_AWVALID (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWVALID),
    .ap_clk                                              (ap_clk)
);


__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_5 __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_5_inst_5 /**   Generated by RapidStream   **/ (
    .Knn_inner_inst_L4_out_dist__m_axi_rst              (Knn_inner_inst_L4_out_dist__m_axi_rst),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_BID            (__rs_pt_Knn_inner_m_axi_L4_out_dist_BID),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_BREADY         (__rs_pt_Knn_inner_m_axi_L4_out_dist_BREADY),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_BRESP          (__rs_pt_Knn_inner_m_axi_L4_out_dist_BRESP),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_BVALID         (__rs_pt_Knn_inner_m_axi_L4_out_dist_BVALID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_BID    (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_BREADY (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BREADY),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_BRESP  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BRESP),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_BVALID (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BVALID),
    .ap_clk                                             (ap_clk)
);


__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_6 __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_6_inst_6 /**   Generated by RapidStream   **/ (
    .Knn_inner_inst_L4_out_dist__m_axi_rst              (Knn_inner_inst_L4_out_dist__m_axi_rst),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_RDATA          (__rs_pt_Knn_inner_m_axi_L4_out_dist_RDATA),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_RID            (__rs_pt_Knn_inner_m_axi_L4_out_dist_RID),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_RLAST          (__rs_pt_Knn_inner_m_axi_L4_out_dist_RLAST),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_RREADY         (__rs_pt_Knn_inner_m_axi_L4_out_dist_RREADY),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_RRESP          (__rs_pt_Knn_inner_m_axi_L4_out_dist_RRESP),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_RVALID         (__rs_pt_Knn_inner_m_axi_L4_out_dist_RVALID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_RDATA  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RDATA),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_RID    (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_RLAST  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RLAST),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_RREADY (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RREADY),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_RRESP  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RRESP),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_RVALID (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RVALID),
    .ap_clk                                             (ap_clk)
);


__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_7 __rs_pt___rs_L4_out_dist__m_axi_wrapper_inner_7_inst_7 /**   Generated by RapidStream   **/ (
    .Knn_inner_inst_L4_out_dist__m_axi_rst              (Knn_inner_inst_L4_out_dist__m_axi_rst),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_WDATA          (__rs_pt_Knn_inner_m_axi_L4_out_dist_WDATA),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_WLAST          (__rs_pt_Knn_inner_m_axi_L4_out_dist_WLAST),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_WREADY         (__rs_pt_Knn_inner_m_axi_L4_out_dist_WREADY),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_WSTRB          (__rs_pt_Knn_inner_m_axi_L4_out_dist_WSTRB),
    .__rs_pt_Knn_inner_m_axi_L4_out_dist_WVALID         (__rs_pt_Knn_inner_m_axi_L4_out_dist_WVALID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_WDATA  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WDATA),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_WLAST  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WLAST),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_WREADY (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WREADY),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_WSTRB  (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WSTRB),
    .__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_dist_WVALID (__rs_pt___rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WVALID),
    .ap_clk                                             (ap_clk)
);

endmodule  // __rs_L4_out_dist__m_axi_wrapper