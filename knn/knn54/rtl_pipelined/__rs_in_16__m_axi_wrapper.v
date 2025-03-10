// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_in_16__m_axi_wrapper (
    output wire         Knn_inner_inst_in_16__m_axi_read_addr_full_n,
    output wire [255:0] Knn_inner_inst_in_16__m_axi_read_data_dout,
    output wire         Knn_inner_inst_in_16__m_axi_read_data_empty_n,
    input wire          Knn_inner_inst_in_16__m_axi_read_data_read,
    input wire          Knn_inner_inst_in_16__m_axi_rst,
    input wire  [ 63:0] Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_din,
    input wire          Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_write,
    output wire [ 63:0] __rs_pt_Knn_inner_m_axi_in_16_ARADDR,
    output wire [  1:0] __rs_pt_Knn_inner_m_axi_in_16_ARBURST,
    output wire [  3:0] __rs_pt_Knn_inner_m_axi_in_16_ARCACHE,
    output wire [  0:0] __rs_pt_Knn_inner_m_axi_in_16_ARID,
    output wire [  7:0] __rs_pt_Knn_inner_m_axi_in_16_ARLEN,
    output wire         __rs_pt_Knn_inner_m_axi_in_16_ARLOCK,
    output wire [  2:0] __rs_pt_Knn_inner_m_axi_in_16_ARPROT,
    output wire [  3:0] __rs_pt_Knn_inner_m_axi_in_16_ARQOS,
    input wire          __rs_pt_Knn_inner_m_axi_in_16_ARREADY,
    output wire [  2:0] __rs_pt_Knn_inner_m_axi_in_16_ARSIZE,
    output wire         __rs_pt_Knn_inner_m_axi_in_16_ARVALID,
    output wire [ 63:0] __rs_pt_Knn_inner_m_axi_in_16_AWADDR,
    output wire [  1:0] __rs_pt_Knn_inner_m_axi_in_16_AWBURST,
    output wire [  3:0] __rs_pt_Knn_inner_m_axi_in_16_AWCACHE,
    output wire [  0:0] __rs_pt_Knn_inner_m_axi_in_16_AWID,
    output wire [  7:0] __rs_pt_Knn_inner_m_axi_in_16_AWLEN,
    output wire         __rs_pt_Knn_inner_m_axi_in_16_AWLOCK,
    output wire [  2:0] __rs_pt_Knn_inner_m_axi_in_16_AWPROT,
    output wire [  3:0] __rs_pt_Knn_inner_m_axi_in_16_AWQOS,
    input wire          __rs_pt_Knn_inner_m_axi_in_16_AWREADY,
    output wire [  2:0] __rs_pt_Knn_inner_m_axi_in_16_AWSIZE,
    output wire         __rs_pt_Knn_inner_m_axi_in_16_AWVALID,
    input wire  [  0:0] __rs_pt_Knn_inner_m_axi_in_16_BID,
    output wire         __rs_pt_Knn_inner_m_axi_in_16_BREADY,
    input wire  [  1:0] __rs_pt_Knn_inner_m_axi_in_16_BRESP,
    input wire          __rs_pt_Knn_inner_m_axi_in_16_BVALID,
    input wire  [255:0] __rs_pt_Knn_inner_m_axi_in_16_RDATA,
    input wire  [  0:0] __rs_pt_Knn_inner_m_axi_in_16_RID,
    input wire          __rs_pt_Knn_inner_m_axi_in_16_RLAST,
    output wire         __rs_pt_Knn_inner_m_axi_in_16_RREADY,
    input wire  [  1:0] __rs_pt_Knn_inner_m_axi_in_16_RRESP,
    input wire          __rs_pt_Knn_inner_m_axi_in_16_RVALID,
    output wire [255:0] __rs_pt_Knn_inner_m_axi_in_16_WDATA,
    output wire         __rs_pt_Knn_inner_m_axi_in_16_WLAST,
    input wire          __rs_pt_Knn_inner_m_axi_in_16_WREADY,
    output wire [ 31:0] __rs_pt_Knn_inner_m_axi_in_16_WSTRB,
    output wire         __rs_pt_Knn_inner_m_axi_in_16_WVALID,
    input wire          ap_clk
);

wire         __rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_in_16__m_axi_read_addr_full_n;
wire [255:0] __rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_in_16__m_axi_read_data_dout;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_in_16__m_axi_read_data_empty_n;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_in_16__m_axi_read_data_read;
wire [ 63:0] __rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_din;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_write;
wire [ 63:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARADDR;
wire [  1:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARBURST;
wire [  3:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARCACHE;
wire [  0:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARID;
wire [  7:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARLEN;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARLOCK;
wire [  2:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARPROT;
wire [  3:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARQOS;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARREADY;
wire [  2:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARSIZE;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARVALID;
wire [ 63:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWADDR;
wire [  1:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWBURST;
wire [  3:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWCACHE;
wire [  0:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWID;
wire [  7:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWLEN;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWLOCK;
wire [  2:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWPROT;
wire [  3:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWQOS;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWREADY;
wire [  2:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWSIZE;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWVALID;
wire [  0:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_BID;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_BREADY;
wire [  1:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_BRESP;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_BVALID;
wire [255:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RDATA;
wire [  0:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RID;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RLAST;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RREADY;
wire [  1:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RRESP;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RVALID;
wire [255:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_WDATA;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_WLAST;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_WREADY;
wire [ 31:0] __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_WSTRB;
wire         __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_WVALID;



__rs_in_16__m_axi_wrapper_inner __rs_in_16__m_axi_wrapper_inner_inst (
    .Knn_inner_inst_in_16__m_axi_read_addr_full_n                                (__rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_in_16__m_axi_read_addr_full_n),
    .Knn_inner_inst_in_16__m_axi_read_data_dout                                  (__rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_in_16__m_axi_read_data_dout),
    .Knn_inner_inst_in_16__m_axi_read_data_empty_n                               (__rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_in_16__m_axi_read_data_empty_n),
    .Knn_inner_inst_in_16__m_axi_read_data_read                                  (__rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_in_16__m_axi_read_data_read),
    .Knn_inner_inst_in_16__m_axi_rst                                             (Knn_inner_inst_in_16__m_axi_rst),
    .Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_din   (__rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_din),
    .Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_write (__rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_write),
    .__rs_pt_Knn_inner_m_axi_in_16_ARADDR                                        (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARADDR),
    .__rs_pt_Knn_inner_m_axi_in_16_ARBURST                                       (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARBURST),
    .__rs_pt_Knn_inner_m_axi_in_16_ARCACHE                                       (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARCACHE),
    .__rs_pt_Knn_inner_m_axi_in_16_ARID                                          (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARID),
    .__rs_pt_Knn_inner_m_axi_in_16_ARLEN                                         (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARLEN),
    .__rs_pt_Knn_inner_m_axi_in_16_ARLOCK                                        (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARLOCK),
    .__rs_pt_Knn_inner_m_axi_in_16_ARPROT                                        (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARPROT),
    .__rs_pt_Knn_inner_m_axi_in_16_ARQOS                                         (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARQOS),
    .__rs_pt_Knn_inner_m_axi_in_16_ARREADY                                       (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARREADY),
    .__rs_pt_Knn_inner_m_axi_in_16_ARSIZE                                        (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARSIZE),
    .__rs_pt_Knn_inner_m_axi_in_16_ARVALID                                       (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARVALID),
    .__rs_pt_Knn_inner_m_axi_in_16_AWADDR                                        (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWADDR),
    .__rs_pt_Knn_inner_m_axi_in_16_AWBURST                                       (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWBURST),
    .__rs_pt_Knn_inner_m_axi_in_16_AWCACHE                                       (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWCACHE),
    .__rs_pt_Knn_inner_m_axi_in_16_AWID                                          (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWID),
    .__rs_pt_Knn_inner_m_axi_in_16_AWLEN                                         (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWLEN),
    .__rs_pt_Knn_inner_m_axi_in_16_AWLOCK                                        (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWLOCK),
    .__rs_pt_Knn_inner_m_axi_in_16_AWPROT                                        (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWPROT),
    .__rs_pt_Knn_inner_m_axi_in_16_AWQOS                                         (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWQOS),
    .__rs_pt_Knn_inner_m_axi_in_16_AWREADY                                       (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWREADY),
    .__rs_pt_Knn_inner_m_axi_in_16_AWSIZE                                        (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWSIZE),
    .__rs_pt_Knn_inner_m_axi_in_16_AWVALID                                       (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWVALID),
    .__rs_pt_Knn_inner_m_axi_in_16_BID                                           (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_BID),
    .__rs_pt_Knn_inner_m_axi_in_16_BREADY                                        (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_BREADY),
    .__rs_pt_Knn_inner_m_axi_in_16_BRESP                                         (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_BRESP),
    .__rs_pt_Knn_inner_m_axi_in_16_BVALID                                        (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_BVALID),
    .__rs_pt_Knn_inner_m_axi_in_16_RDATA                                         (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RDATA),
    .__rs_pt_Knn_inner_m_axi_in_16_RID                                           (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RID),
    .__rs_pt_Knn_inner_m_axi_in_16_RLAST                                         (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RLAST),
    .__rs_pt_Knn_inner_m_axi_in_16_RREADY                                        (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RREADY),
    .__rs_pt_Knn_inner_m_axi_in_16_RRESP                                         (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RRESP),
    .__rs_pt_Knn_inner_m_axi_in_16_RVALID                                        (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RVALID),
    .__rs_pt_Knn_inner_m_axi_in_16_WDATA                                         (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_WDATA),
    .__rs_pt_Knn_inner_m_axi_in_16_WLAST                                         (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_WLAST),
    .__rs_pt_Knn_inner_m_axi_in_16_WREADY                                        (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_WREADY),
    .__rs_pt_Knn_inner_m_axi_in_16_WSTRB                                         (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_WSTRB),
    .__rs_pt_Knn_inner_m_axi_in_16_WVALID                                        (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_WVALID),
    .ap_clk                                                                      (ap_clk)
);


__rs_pt___rs_in_16__m_axi_wrapper_inner_0 __rs_pt___rs_in_16__m_axi_wrapper_inner_0_inst_0 /**   Generated by RapidStream   **/ (
    .Knn_inner_inst_in_16__m_axi_read_addr_full_n                                        (Knn_inner_inst_in_16__m_axi_read_addr_full_n),
    .Knn_inner_inst_in_16__m_axi_rst                                                     (Knn_inner_inst_in_16__m_axi_rst),
    .Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_din           (Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_din),
    .Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_write         (Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_write),
    .__rs_pt_Knn_inner_inst_in_16__m_axi_read_addr_full_n                                (__rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_in_16__m_axi_read_addr_full_n),
    .__rs_pt_Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_din   (__rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_din),
    .__rs_pt_Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_write (__rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_krnl_partialKnn_wrapper_16_0_searchSpace_0_read_addr_s_write),
    .ap_clk                                                                              (ap_clk)
);


__rs_pt___rs_in_16__m_axi_wrapper_inner_1 __rs_pt___rs_in_16__m_axi_wrapper_inner_1_inst_1 /**   Generated by RapidStream   **/ (
    .Knn_inner_inst_in_16__m_axi_read_data_dout            (Knn_inner_inst_in_16__m_axi_read_data_dout),
    .Knn_inner_inst_in_16__m_axi_read_data_empty_n         (Knn_inner_inst_in_16__m_axi_read_data_empty_n),
    .Knn_inner_inst_in_16__m_axi_read_data_read            (Knn_inner_inst_in_16__m_axi_read_data_read),
    .Knn_inner_inst_in_16__m_axi_rst                       (Knn_inner_inst_in_16__m_axi_rst),
    .__rs_pt_Knn_inner_inst_in_16__m_axi_read_data_dout    (__rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_in_16__m_axi_read_data_dout),
    .__rs_pt_Knn_inner_inst_in_16__m_axi_read_data_empty_n (__rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_in_16__m_axi_read_data_empty_n),
    .__rs_pt_Knn_inner_inst_in_16__m_axi_read_data_read    (__rs_pt___rs_in_16__m_axi_wrapper_inner_Knn_inner_inst_in_16__m_axi_read_data_read),
    .ap_clk                                                (ap_clk)
);


__rs_pt___rs_in_16__m_axi_wrapper_inner_2 __rs_pt___rs_in_16__m_axi_wrapper_inner_2_inst_2 /**   Generated by RapidStream   **/ (
    .Knn_inner_inst_in_16__m_axi_rst               (Knn_inner_inst_in_16__m_axi_rst),
    .__rs_pt_Knn_inner_m_axi_in_16_ARADDR          (__rs_pt_Knn_inner_m_axi_in_16_ARADDR),
    .__rs_pt_Knn_inner_m_axi_in_16_ARBURST         (__rs_pt_Knn_inner_m_axi_in_16_ARBURST),
    .__rs_pt_Knn_inner_m_axi_in_16_ARCACHE         (__rs_pt_Knn_inner_m_axi_in_16_ARCACHE),
    .__rs_pt_Knn_inner_m_axi_in_16_ARID            (__rs_pt_Knn_inner_m_axi_in_16_ARID),
    .__rs_pt_Knn_inner_m_axi_in_16_ARLEN           (__rs_pt_Knn_inner_m_axi_in_16_ARLEN),
    .__rs_pt_Knn_inner_m_axi_in_16_ARLOCK          (__rs_pt_Knn_inner_m_axi_in_16_ARLOCK),
    .__rs_pt_Knn_inner_m_axi_in_16_ARPROT          (__rs_pt_Knn_inner_m_axi_in_16_ARPROT),
    .__rs_pt_Knn_inner_m_axi_in_16_ARQOS           (__rs_pt_Knn_inner_m_axi_in_16_ARQOS),
    .__rs_pt_Knn_inner_m_axi_in_16_ARREADY         (__rs_pt_Knn_inner_m_axi_in_16_ARREADY),
    .__rs_pt_Knn_inner_m_axi_in_16_ARSIZE          (__rs_pt_Knn_inner_m_axi_in_16_ARSIZE),
    .__rs_pt_Knn_inner_m_axi_in_16_ARVALID         (__rs_pt_Knn_inner_m_axi_in_16_ARVALID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_ARADDR  (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARADDR),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_ARBURST (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARBURST),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_ARCACHE (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARCACHE),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_ARID    (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_ARLEN   (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARLEN),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_ARLOCK  (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARLOCK),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_ARPROT  (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARPROT),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_ARQOS   (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARQOS),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_ARREADY (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARREADY),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_ARSIZE  (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARSIZE),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_ARVALID (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_ARVALID),
    .ap_clk                                        (ap_clk)
);


__rs_pt___rs_in_16__m_axi_wrapper_inner_3 __rs_pt___rs_in_16__m_axi_wrapper_inner_3_inst_3 /**   Generated by RapidStream   **/ (
    .Knn_inner_inst_in_16__m_axi_rst               (Knn_inner_inst_in_16__m_axi_rst),
    .__rs_pt_Knn_inner_m_axi_in_16_AWADDR          (__rs_pt_Knn_inner_m_axi_in_16_AWADDR),
    .__rs_pt_Knn_inner_m_axi_in_16_AWBURST         (__rs_pt_Knn_inner_m_axi_in_16_AWBURST),
    .__rs_pt_Knn_inner_m_axi_in_16_AWCACHE         (__rs_pt_Knn_inner_m_axi_in_16_AWCACHE),
    .__rs_pt_Knn_inner_m_axi_in_16_AWID            (__rs_pt_Knn_inner_m_axi_in_16_AWID),
    .__rs_pt_Knn_inner_m_axi_in_16_AWLEN           (__rs_pt_Knn_inner_m_axi_in_16_AWLEN),
    .__rs_pt_Knn_inner_m_axi_in_16_AWLOCK          (__rs_pt_Knn_inner_m_axi_in_16_AWLOCK),
    .__rs_pt_Knn_inner_m_axi_in_16_AWPROT          (__rs_pt_Knn_inner_m_axi_in_16_AWPROT),
    .__rs_pt_Knn_inner_m_axi_in_16_AWQOS           (__rs_pt_Knn_inner_m_axi_in_16_AWQOS),
    .__rs_pt_Knn_inner_m_axi_in_16_AWREADY         (__rs_pt_Knn_inner_m_axi_in_16_AWREADY),
    .__rs_pt_Knn_inner_m_axi_in_16_AWSIZE          (__rs_pt_Knn_inner_m_axi_in_16_AWSIZE),
    .__rs_pt_Knn_inner_m_axi_in_16_AWVALID         (__rs_pt_Knn_inner_m_axi_in_16_AWVALID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_AWADDR  (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWADDR),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_AWBURST (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWBURST),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_AWCACHE (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWCACHE),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_AWID    (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_AWLEN   (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWLEN),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_AWLOCK  (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWLOCK),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_AWPROT  (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWPROT),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_AWQOS   (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWQOS),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_AWREADY (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWREADY),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_AWSIZE  (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWSIZE),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_AWVALID (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_AWVALID),
    .ap_clk                                        (ap_clk)
);


__rs_pt___rs_in_16__m_axi_wrapper_inner_4 __rs_pt___rs_in_16__m_axi_wrapper_inner_4_inst_4 /**   Generated by RapidStream   **/ (
    .Knn_inner_inst_in_16__m_axi_rst              (Knn_inner_inst_in_16__m_axi_rst),
    .__rs_pt_Knn_inner_m_axi_in_16_BID            (__rs_pt_Knn_inner_m_axi_in_16_BID),
    .__rs_pt_Knn_inner_m_axi_in_16_BREADY         (__rs_pt_Knn_inner_m_axi_in_16_BREADY),
    .__rs_pt_Knn_inner_m_axi_in_16_BRESP          (__rs_pt_Knn_inner_m_axi_in_16_BRESP),
    .__rs_pt_Knn_inner_m_axi_in_16_BVALID         (__rs_pt_Knn_inner_m_axi_in_16_BVALID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_BID    (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_BID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_BREADY (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_BREADY),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_BRESP  (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_BRESP),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_BVALID (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_BVALID),
    .ap_clk                                       (ap_clk)
);


__rs_pt___rs_in_16__m_axi_wrapper_inner_5 __rs_pt___rs_in_16__m_axi_wrapper_inner_5_inst_5 /**   Generated by RapidStream   **/ (
    .Knn_inner_inst_in_16__m_axi_rst              (Knn_inner_inst_in_16__m_axi_rst),
    .__rs_pt_Knn_inner_m_axi_in_16_RDATA          (__rs_pt_Knn_inner_m_axi_in_16_RDATA),
    .__rs_pt_Knn_inner_m_axi_in_16_RID            (__rs_pt_Knn_inner_m_axi_in_16_RID),
    .__rs_pt_Knn_inner_m_axi_in_16_RLAST          (__rs_pt_Knn_inner_m_axi_in_16_RLAST),
    .__rs_pt_Knn_inner_m_axi_in_16_RREADY         (__rs_pt_Knn_inner_m_axi_in_16_RREADY),
    .__rs_pt_Knn_inner_m_axi_in_16_RRESP          (__rs_pt_Knn_inner_m_axi_in_16_RRESP),
    .__rs_pt_Knn_inner_m_axi_in_16_RVALID         (__rs_pt_Knn_inner_m_axi_in_16_RVALID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_RDATA  (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RDATA),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_RID    (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_RLAST  (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RLAST),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_RREADY (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RREADY),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_RRESP  (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RRESP),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_RVALID (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RVALID),
    .ap_clk                                       (ap_clk)
);


__rs_pt___rs_in_16__m_axi_wrapper_inner_6 __rs_pt___rs_in_16__m_axi_wrapper_inner_6_inst_6 /**   Generated by RapidStream   **/ (
    .Knn_inner_inst_in_16__m_axi_rst              (Knn_inner_inst_in_16__m_axi_rst),
    .__rs_pt_Knn_inner_m_axi_in_16_WDATA          (__rs_pt_Knn_inner_m_axi_in_16_WDATA),
    .__rs_pt_Knn_inner_m_axi_in_16_WLAST          (__rs_pt_Knn_inner_m_axi_in_16_WLAST),
    .__rs_pt_Knn_inner_m_axi_in_16_WREADY         (__rs_pt_Knn_inner_m_axi_in_16_WREADY),
    .__rs_pt_Knn_inner_m_axi_in_16_WSTRB          (__rs_pt_Knn_inner_m_axi_in_16_WSTRB),
    .__rs_pt_Knn_inner_m_axi_in_16_WVALID         (__rs_pt_Knn_inner_m_axi_in_16_WVALID),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_WDATA  (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_WDATA),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_WLAST  (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_WLAST),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_WREADY (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_WREADY),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_WSTRB  (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_WSTRB),
    .__rs_pt___rs_pt_Knn_inner_m_axi_in_16_WVALID (__rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_WVALID),
    .ap_clk                                       (ap_clk)
);

endmodule  // __rs_in_16__m_axi_wrapper