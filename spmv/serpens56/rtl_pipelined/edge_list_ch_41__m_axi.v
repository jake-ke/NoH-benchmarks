// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module edge_list_ch_41__m_axi (
    input wire  [ 63:0] Serpens_inner_inst_edge_list_ch_41__m_axi_offset,
    output wire         Serpens_inner_inst_edge_list_ch_41__m_axi_read_addr_full_n,
    output wire [255:0] Serpens_inner_inst_edge_list_ch_41__m_axi_read_data_dout,
    output wire         Serpens_inner_inst_edge_list_ch_41__m_axi_read_data_empty_n,
    input wire          Serpens_inner_inst_edge_list_ch_41__m_axi_read_data_read,
    input wire          Serpens_inner_inst_edge_list_ch_41__m_axi_rst,
    output wire         Serpens_inner_inst_edge_list_ch_41__m_axi_write_addr_full_n,
    output wire         Serpens_inner_inst_edge_list_ch_41__m_axi_write_data_full_n,
    output wire [  7:0] Serpens_inner_inst_edge_list_ch_41__m_axi_write_resp_dout,
    output wire         Serpens_inner_inst_edge_list_ch_41__m_axi_write_resp_empty_n,
    input wire          Serpens_inner_inst_edge_list_ch_41__m_axi_write_resp_read,
    input wire  [ 64:0] Serpens_inner_inst_read_A_41_A_read_addr_din,
    input wire          Serpens_inner_inst_read_A_41_A_read_addr_write,
    input wire  [ 64:0] Serpens_inner_inst_read_A_41_A_write_addr_din,
    input wire          Serpens_inner_inst_read_A_41_A_write_addr_write,
    input wire  [256:0] Serpens_inner_inst_read_A_41_A_write_data_din,
    input wire          Serpens_inner_inst_read_A_41_A_write_data_write,
    output wire [ 63:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARADDR,
    output wire [  1:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARBURST,
    output wire [  3:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARCACHE,
    output wire [  0:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARID,
    output wire [  7:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARLEN,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARLOCK,
    output wire [  2:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARPROT,
    output wire [  3:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARQOS,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARREADY,
    output wire [  2:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARSIZE,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARVALID,
    output wire [ 63:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWADDR,
    output wire [  1:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWBURST,
    output wire [  3:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWCACHE,
    output wire [  0:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWID,
    output wire [  7:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWLEN,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWLOCK,
    output wire [  2:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWPROT,
    output wire [  3:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWQOS,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWREADY,
    output wire [  2:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWSIZE,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWVALID,
    input wire  [  0:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_BID,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_BREADY,
    input wire  [  1:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_BRESP,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_BVALID,
    input wire  [255:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_RDATA,
    input wire  [  0:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_RID,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_RLAST,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_RREADY,
    input wire  [  1:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_RRESP,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_RVALID,
    output wire [255:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_WDATA,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_WLAST,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_WREADY,
    output wire [ 31:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_WSTRB,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_41_WVALID,
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
) edge_list_ch_41__m_axi (
    .clk                (ap_clk),
    .m_axi_ARADDR       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARADDR),
    .m_axi_ARBURST      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARBURST),
    .m_axi_ARCACHE      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARCACHE),
    .m_axi_ARID         (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARID),
    .m_axi_ARLEN        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARLEN),
    .m_axi_ARLOCK       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARLOCK),
    .m_axi_ARPROT       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARPROT),
    .m_axi_ARQOS        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARQOS),
    .m_axi_ARREADY      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARREADY),
    .m_axi_ARSIZE       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARSIZE),
    .m_axi_ARVALID      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_ARVALID),
    .m_axi_AWADDR       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWADDR),
    .m_axi_AWBURST      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWBURST),
    .m_axi_AWCACHE      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWCACHE),
    .m_axi_AWID         (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWID),
    .m_axi_AWLEN        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWLEN),
    .m_axi_AWLOCK       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWLOCK),
    .m_axi_AWPROT       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWPROT),
    .m_axi_AWQOS        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWQOS),
    .m_axi_AWREADY      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWREADY),
    .m_axi_AWSIZE       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWSIZE),
    .m_axi_AWVALID      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_AWVALID),
    .m_axi_BID          (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_BID),
    .m_axi_BREADY       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_BREADY),
    .m_axi_BRESP        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_BRESP),
    .m_axi_BVALID       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_BVALID),
    .m_axi_RDATA        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_RDATA),
    .m_axi_RID          (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_RID),
    .m_axi_RLAST        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_RLAST),
    .m_axi_RREADY       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_RREADY),
    .m_axi_RRESP        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_RRESP),
    .m_axi_RVALID       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_RVALID),
    .m_axi_WDATA        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_WDATA),
    .m_axi_WLAST        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_WLAST),
    .m_axi_WREADY       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_WREADY),
    .m_axi_WSTRB        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_WSTRB),
    .m_axi_WVALID       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_41_WVALID),
    .offset             (Serpens_inner_inst_edge_list_ch_41__m_axi_offset),
    .read_addr_din      (Serpens_inner_inst_read_A_41_A_read_addr_din),
    .read_addr_full_n   (Serpens_inner_inst_edge_list_ch_41__m_axi_read_addr_full_n),
    .read_addr_write    (Serpens_inner_inst_read_A_41_A_read_addr_write),
    .read_data_dout     (Serpens_inner_inst_edge_list_ch_41__m_axi_read_data_dout),
    .read_data_empty_n  (Serpens_inner_inst_edge_list_ch_41__m_axi_read_data_empty_n),
    .read_data_read     (Serpens_inner_inst_edge_list_ch_41__m_axi_read_data_read),
    .rst                (Serpens_inner_inst_edge_list_ch_41__m_axi_rst),
    .write_addr_din     (Serpens_inner_inst_read_A_41_A_write_addr_din),
    .write_addr_full_n  (Serpens_inner_inst_edge_list_ch_41__m_axi_write_addr_full_n),
    .write_addr_write   (Serpens_inner_inst_read_A_41_A_write_addr_write),
    .write_data_din     (Serpens_inner_inst_read_A_41_A_write_data_din),
    .write_data_full_n  (Serpens_inner_inst_edge_list_ch_41__m_axi_write_data_full_n),
    .write_data_write   (Serpens_inner_inst_read_A_41_A_write_data_write),
    .write_resp_dout    (Serpens_inner_inst_edge_list_ch_41__m_axi_write_resp_dout),
    .write_resp_empty_n (Serpens_inner_inst_edge_list_ch_41__m_axi_write_resp_empty_n),
    .write_resp_read    (Serpens_inner_inst_edge_list_ch_41__m_axi_write_resp_read)
);

endmodule  // edge_list_ch_41__m_axi