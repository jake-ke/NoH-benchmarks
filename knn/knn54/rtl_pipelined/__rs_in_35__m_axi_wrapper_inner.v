// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_in_35__m_axi_wrapper_inner (
    output wire         Knn_inner_inst_in_35__m_axi_read_addr_full_n,
    output wire [255:0] Knn_inner_inst_in_35__m_axi_read_data_dout,
    output wire         Knn_inner_inst_in_35__m_axi_read_data_empty_n,
    input wire          Knn_inner_inst_in_35__m_axi_read_data_read,
    input wire          Knn_inner_inst_in_35__m_axi_rst,
    input wire  [ 63:0] Knn_inner_inst_krnl_partialKnn_wrapper_35_0_searchSpace_0_read_addr_s_din,
    input wire          Knn_inner_inst_krnl_partialKnn_wrapper_35_0_searchSpace_0_read_addr_s_write,
    output wire [ 63:0] __rs_pt_Knn_inner_m_axi_in_35_ARADDR,
    output wire [  1:0] __rs_pt_Knn_inner_m_axi_in_35_ARBURST,
    output wire [  3:0] __rs_pt_Knn_inner_m_axi_in_35_ARCACHE,
    output wire [  0:0] __rs_pt_Knn_inner_m_axi_in_35_ARID,
    output wire [  7:0] __rs_pt_Knn_inner_m_axi_in_35_ARLEN,
    output wire         __rs_pt_Knn_inner_m_axi_in_35_ARLOCK,
    output wire [  2:0] __rs_pt_Knn_inner_m_axi_in_35_ARPROT,
    output wire [  3:0] __rs_pt_Knn_inner_m_axi_in_35_ARQOS,
    input wire          __rs_pt_Knn_inner_m_axi_in_35_ARREADY,
    output wire [  2:0] __rs_pt_Knn_inner_m_axi_in_35_ARSIZE,
    output wire         __rs_pt_Knn_inner_m_axi_in_35_ARVALID,
    output wire [ 63:0] __rs_pt_Knn_inner_m_axi_in_35_AWADDR,
    output wire [  1:0] __rs_pt_Knn_inner_m_axi_in_35_AWBURST,
    output wire [  3:0] __rs_pt_Knn_inner_m_axi_in_35_AWCACHE,
    output wire [  0:0] __rs_pt_Knn_inner_m_axi_in_35_AWID,
    output wire [  7:0] __rs_pt_Knn_inner_m_axi_in_35_AWLEN,
    output wire         __rs_pt_Knn_inner_m_axi_in_35_AWLOCK,
    output wire [  2:0] __rs_pt_Knn_inner_m_axi_in_35_AWPROT,
    output wire [  3:0] __rs_pt_Knn_inner_m_axi_in_35_AWQOS,
    input wire          __rs_pt_Knn_inner_m_axi_in_35_AWREADY,
    output wire [  2:0] __rs_pt_Knn_inner_m_axi_in_35_AWSIZE,
    output wire         __rs_pt_Knn_inner_m_axi_in_35_AWVALID,
    input wire  [  0:0] __rs_pt_Knn_inner_m_axi_in_35_BID,
    output wire         __rs_pt_Knn_inner_m_axi_in_35_BREADY,
    input wire  [  1:0] __rs_pt_Knn_inner_m_axi_in_35_BRESP,
    input wire          __rs_pt_Knn_inner_m_axi_in_35_BVALID,
    input wire  [255:0] __rs_pt_Knn_inner_m_axi_in_35_RDATA,
    input wire  [  0:0] __rs_pt_Knn_inner_m_axi_in_35_RID,
    input wire          __rs_pt_Knn_inner_m_axi_in_35_RLAST,
    output wire         __rs_pt_Knn_inner_m_axi_in_35_RREADY,
    input wire  [  1:0] __rs_pt_Knn_inner_m_axi_in_35_RRESP,
    input wire          __rs_pt_Knn_inner_m_axi_in_35_RVALID,
    output wire [255:0] __rs_pt_Knn_inner_m_axi_in_35_WDATA,
    output wire         __rs_pt_Knn_inner_m_axi_in_35_WLAST,
    input wire          __rs_pt_Knn_inner_m_axi_in_35_WREADY,
    output wire [ 31:0] __rs_pt_Knn_inner_m_axi_in_35_WSTRB,
    output wire         __rs_pt_Knn_inner_m_axi_in_35_WVALID,
    input wire          ap_clk
);




async_mmap #(
    .AddrWidth         (64),
    .BurstLenWidth     (9),
    .DataWidth         (256),
    .DataWidthBytesLog (5),
    .MaxBurstLen       (31),
    .MaxWaitTime       (3),
    .WaitTimeWidth     (2)
) in_35__m_axi (
    .clk               (ap_clk),
    .m_axi_ARADDR      (__rs_pt_Knn_inner_m_axi_in_35_ARADDR),
    .m_axi_ARBURST     (__rs_pt_Knn_inner_m_axi_in_35_ARBURST),
    .m_axi_ARCACHE     (__rs_pt_Knn_inner_m_axi_in_35_ARCACHE),
    .m_axi_ARID        (__rs_pt_Knn_inner_m_axi_in_35_ARID),
    .m_axi_ARLEN       (__rs_pt_Knn_inner_m_axi_in_35_ARLEN),
    .m_axi_ARLOCK      (__rs_pt_Knn_inner_m_axi_in_35_ARLOCK),
    .m_axi_ARPROT      (__rs_pt_Knn_inner_m_axi_in_35_ARPROT),
    .m_axi_ARQOS       (__rs_pt_Knn_inner_m_axi_in_35_ARQOS),
    .m_axi_ARREADY     (__rs_pt_Knn_inner_m_axi_in_35_ARREADY),
    .m_axi_ARSIZE      (__rs_pt_Knn_inner_m_axi_in_35_ARSIZE),
    .m_axi_ARVALID     (__rs_pt_Knn_inner_m_axi_in_35_ARVALID),
    .m_axi_AWADDR      (__rs_pt_Knn_inner_m_axi_in_35_AWADDR),
    .m_axi_AWBURST     (__rs_pt_Knn_inner_m_axi_in_35_AWBURST),
    .m_axi_AWCACHE     (__rs_pt_Knn_inner_m_axi_in_35_AWCACHE),
    .m_axi_AWID        (__rs_pt_Knn_inner_m_axi_in_35_AWID),
    .m_axi_AWLEN       (__rs_pt_Knn_inner_m_axi_in_35_AWLEN),
    .m_axi_AWLOCK      (__rs_pt_Knn_inner_m_axi_in_35_AWLOCK),
    .m_axi_AWPROT      (__rs_pt_Knn_inner_m_axi_in_35_AWPROT),
    .m_axi_AWQOS       (__rs_pt_Knn_inner_m_axi_in_35_AWQOS),
    .m_axi_AWREADY     (__rs_pt_Knn_inner_m_axi_in_35_AWREADY),
    .m_axi_AWSIZE      (__rs_pt_Knn_inner_m_axi_in_35_AWSIZE),
    .m_axi_AWVALID     (__rs_pt_Knn_inner_m_axi_in_35_AWVALID),
    .m_axi_BID         (__rs_pt_Knn_inner_m_axi_in_35_BID),
    .m_axi_BREADY      (__rs_pt_Knn_inner_m_axi_in_35_BREADY),
    .m_axi_BRESP       (__rs_pt_Knn_inner_m_axi_in_35_BRESP),
    .m_axi_BVALID      (__rs_pt_Knn_inner_m_axi_in_35_BVALID),
    .m_axi_RDATA       (__rs_pt_Knn_inner_m_axi_in_35_RDATA),
    .m_axi_RID         (__rs_pt_Knn_inner_m_axi_in_35_RID),
    .m_axi_RLAST       (__rs_pt_Knn_inner_m_axi_in_35_RLAST),
    .m_axi_RREADY      (__rs_pt_Knn_inner_m_axi_in_35_RREADY),
    .m_axi_RRESP       (__rs_pt_Knn_inner_m_axi_in_35_RRESP),
    .m_axi_RVALID      (__rs_pt_Knn_inner_m_axi_in_35_RVALID),
    .m_axi_WDATA       (__rs_pt_Knn_inner_m_axi_in_35_WDATA),
    .m_axi_WLAST       (__rs_pt_Knn_inner_m_axi_in_35_WLAST),
    .m_axi_WREADY      (__rs_pt_Knn_inner_m_axi_in_35_WREADY),
    .m_axi_WSTRB       (__rs_pt_Knn_inner_m_axi_in_35_WSTRB),
    .m_axi_WVALID      (__rs_pt_Knn_inner_m_axi_in_35_WVALID),
    .read_addr_din     (Knn_inner_inst_krnl_partialKnn_wrapper_35_0_searchSpace_0_read_addr_s_din),
    .read_addr_full_n  (Knn_inner_inst_in_35__m_axi_read_addr_full_n),
    .read_addr_write   (Knn_inner_inst_krnl_partialKnn_wrapper_35_0_searchSpace_0_read_addr_s_write),
    .read_data_dout    (Knn_inner_inst_in_35__m_axi_read_data_dout),
    .read_data_empty_n (Knn_inner_inst_in_35__m_axi_read_data_empty_n),
    .read_data_read    (Knn_inner_inst_in_35__m_axi_read_data_read),
    .rst               (Knn_inner_inst_in_35__m_axi_rst),
    .write_addr_write  (1'b0),
    .write_data_write  (1'b0),
    .write_resp_read   (1'b0)
);

endmodule  // __rs_in_35__m_axi_wrapper_inner