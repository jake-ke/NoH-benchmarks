// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module edge_list_ch_54__m_axi (
    input wire  [ 63:0] Serpens_inner_inst_edge_list_ch_54__m_axi_offset,
    output wire         Serpens_inner_inst_edge_list_ch_54__m_axi_read_addr_full_n,
    output wire [255:0] Serpens_inner_inst_edge_list_ch_54__m_axi_read_data_dout,
    output wire         Serpens_inner_inst_edge_list_ch_54__m_axi_read_data_empty_n,
    input wire          Serpens_inner_inst_edge_list_ch_54__m_axi_read_data_read,
    input wire          Serpens_inner_inst_edge_list_ch_54__m_axi_rst,
    output wire         Serpens_inner_inst_edge_list_ch_54__m_axi_write_addr_full_n,
    output wire         Serpens_inner_inst_edge_list_ch_54__m_axi_write_data_full_n,
    output wire [  7:0] Serpens_inner_inst_edge_list_ch_54__m_axi_write_resp_dout,
    output wire         Serpens_inner_inst_edge_list_ch_54__m_axi_write_resp_empty_n,
    input wire          Serpens_inner_inst_edge_list_ch_54__m_axi_write_resp_read,
    input wire  [ 64:0] Serpens_inner_inst_read_A_54_A_read_addr_din,
    input wire          Serpens_inner_inst_read_A_54_A_read_addr_write,
    input wire  [ 64:0] Serpens_inner_inst_read_A_54_A_write_addr_din,
    input wire          Serpens_inner_inst_read_A_54_A_write_addr_write,
    input wire  [256:0] Serpens_inner_inst_read_A_54_A_write_data_din,
    input wire          Serpens_inner_inst_read_A_54_A_write_data_write,
    output wire [ 63:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARADDR,
    output wire [  1:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARBURST,
    output wire [  3:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARCACHE,
    output wire [  0:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARID,
    output wire [  7:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARLEN,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARLOCK,
    output wire [  2:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARPROT,
    output wire [  3:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARQOS,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARREADY,
    output wire [  2:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARSIZE,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARVALID,
    output wire [ 63:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWADDR,
    output wire [  1:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWBURST,
    output wire [  3:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWCACHE,
    output wire [  0:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWID,
    output wire [  7:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWLEN,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWLOCK,
    output wire [  2:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWPROT,
    output wire [  3:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWQOS,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWREADY,
    output wire [  2:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWSIZE,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWVALID,
    input wire  [  0:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_BID,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_BREADY,
    input wire  [  1:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_BRESP,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_BVALID,
    input wire  [255:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_RDATA,
    input wire  [  0:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_RID,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_RLAST,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_RREADY,
    input wire  [  1:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_RRESP,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_RVALID,
    output wire [255:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_WDATA,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_WLAST,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_WREADY,
    output wire [ 31:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_WSTRB,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_54_WVALID,
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
) edge_list_ch_54__m_axi (
    .clk                (ap_clk),
    .m_axi_ARADDR       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARADDR),
    .m_axi_ARBURST      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARBURST),
    .m_axi_ARCACHE      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARCACHE),
    .m_axi_ARID         (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARID),
    .m_axi_ARLEN        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARLEN),
    .m_axi_ARLOCK       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARLOCK),
    .m_axi_ARPROT       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARPROT),
    .m_axi_ARQOS        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARQOS),
    .m_axi_ARREADY      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARREADY),
    .m_axi_ARSIZE       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARSIZE),
    .m_axi_ARVALID      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_ARVALID),
    .m_axi_AWADDR       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWADDR),
    .m_axi_AWBURST      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWBURST),
    .m_axi_AWCACHE      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWCACHE),
    .m_axi_AWID         (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWID),
    .m_axi_AWLEN        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWLEN),
    .m_axi_AWLOCK       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWLOCK),
    .m_axi_AWPROT       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWPROT),
    .m_axi_AWQOS        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWQOS),
    .m_axi_AWREADY      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWREADY),
    .m_axi_AWSIZE       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWSIZE),
    .m_axi_AWVALID      (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_AWVALID),
    .m_axi_BID          (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_BID),
    .m_axi_BREADY       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_BREADY),
    .m_axi_BRESP        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_BRESP),
    .m_axi_BVALID       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_BVALID),
    .m_axi_RDATA        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_RDATA),
    .m_axi_RID          (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_RID),
    .m_axi_RLAST        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_RLAST),
    .m_axi_RREADY       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_RREADY),
    .m_axi_RRESP        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_RRESP),
    .m_axi_RVALID       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_RVALID),
    .m_axi_WDATA        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_WDATA),
    .m_axi_WLAST        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_WLAST),
    .m_axi_WREADY       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_WREADY),
    .m_axi_WSTRB        (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_WSTRB),
    .m_axi_WVALID       (__rs_pt_Serpens_inner_m_axi_edge_list_ch_54_WVALID),
    .offset             (Serpens_inner_inst_edge_list_ch_54__m_axi_offset),
    .read_addr_din      (Serpens_inner_inst_read_A_54_A_read_addr_din),
    .read_addr_full_n   (Serpens_inner_inst_edge_list_ch_54__m_axi_read_addr_full_n),
    .read_addr_write    (Serpens_inner_inst_read_A_54_A_read_addr_write),
    .read_data_dout     (Serpens_inner_inst_edge_list_ch_54__m_axi_read_data_dout),
    .read_data_empty_n  (Serpens_inner_inst_edge_list_ch_54__m_axi_read_data_empty_n),
    .read_data_read     (Serpens_inner_inst_edge_list_ch_54__m_axi_read_data_read),
    .rst                (Serpens_inner_inst_edge_list_ch_54__m_axi_rst),
    .write_addr_din     (Serpens_inner_inst_read_A_54_A_write_addr_din),
    .write_addr_full_n  (Serpens_inner_inst_edge_list_ch_54__m_axi_write_addr_full_n),
    .write_addr_write   (Serpens_inner_inst_read_A_54_A_write_addr_write),
    .write_data_din     (Serpens_inner_inst_read_A_54_A_write_data_din),
    .write_data_full_n  (Serpens_inner_inst_edge_list_ch_54__m_axi_write_data_full_n),
    .write_data_write   (Serpens_inner_inst_read_A_54_A_write_data_write),
    .write_resp_dout    (Serpens_inner_inst_edge_list_ch_54__m_axi_write_resp_dout),
    .write_resp_empty_n (Serpens_inner_inst_edge_list_ch_54__m_axi_write_resp_empty_n),
    .write_resp_read    (Serpens_inner_inst_edge_list_ch_54__m_axi_write_resp_read)
);

endmodule  // edge_list_ch_54__m_axi