// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt_Knn_inner_239 #(
    parameter C_S_AXI_CONTROL_DATA_WIDTH  = 32,
    parameter C_S_AXI_CONTROL_ADDR_WIDTH  = 10,
    parameter C_S_AXI_DATA_WIDTH          = 32,
    parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 4,
    parameter C_S_AXI_WSTRB_WIDTH         = 4
) (
    input wire  [63:0] __rs_pt_m_axi_in_50_AWADDR,
    input wire  [ 1:0] __rs_pt_m_axi_in_50_AWBURST,
    input wire  [ 3:0] __rs_pt_m_axi_in_50_AWCACHE,
    input wire  [ 0:0] __rs_pt_m_axi_in_50_AWID,
    input wire  [ 7:0] __rs_pt_m_axi_in_50_AWLEN,
    input wire         __rs_pt_m_axi_in_50_AWLOCK,
    input wire  [ 2:0] __rs_pt_m_axi_in_50_AWPROT,
    input wire  [ 3:0] __rs_pt_m_axi_in_50_AWQOS,
    output wire        __rs_pt_m_axi_in_50_AWREADY,
    input wire  [ 2:0] __rs_pt_m_axi_in_50_AWSIZE,
    input wire         __rs_pt_m_axi_in_50_AWVALID,
    input wire         ap_clk,
    input wire         ap_rst_n,
    output wire [63:0] m_axi_in_50_AWADDR,
    output wire [ 1:0] m_axi_in_50_AWBURST,
    output wire [ 3:0] m_axi_in_50_AWCACHE,
    output wire [ 0:0] m_axi_in_50_AWID,
    output wire [ 7:0] m_axi_in_50_AWLEN,
    output wire        m_axi_in_50_AWLOCK,
    output wire [ 2:0] m_axi_in_50_AWPROT,
    output wire [ 3:0] m_axi_in_50_AWQOS,
    input wire         m_axi_in_50_AWREADY,
    output wire [ 2:0] m_axi_in_50_AWSIZE,
    output wire        m_axi_in_50_AWVALID
);




__rs_pass_through #(
    .WIDTH (64)
) __rs_pt_Knn_inner_m_axi_in_50_AWADDR_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_50_AWADDR),
    .dout (m_axi_in_50_AWADDR)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt_Knn_inner_m_axi_in_50_AWBURST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_50_AWBURST),
    .dout (m_axi_in_50_AWBURST)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt_Knn_inner_m_axi_in_50_AWCACHE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_50_AWCACHE),
    .dout (m_axi_in_50_AWCACHE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Knn_inner_m_axi_in_50_AWID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_50_AWID),
    .dout (m_axi_in_50_AWID)
);


__rs_pass_through #(
    .WIDTH (8)
) __rs_pt_Knn_inner_m_axi_in_50_AWLEN_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_50_AWLEN),
    .dout (m_axi_in_50_AWLEN)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Knn_inner_m_axi_in_50_AWLOCK_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_50_AWLOCK),
    .dout (m_axi_in_50_AWLOCK)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt_Knn_inner_m_axi_in_50_AWPROT_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_50_AWPROT),
    .dout (m_axi_in_50_AWPROT)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt_Knn_inner_m_axi_in_50_AWQOS_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_50_AWQOS),
    .dout (m_axi_in_50_AWQOS)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Knn_inner_m_axi_in_50_AWREADY_inst /**   Generated by RapidStream   **/ (
    .din  (m_axi_in_50_AWREADY),
    .dout (__rs_pt_m_axi_in_50_AWREADY)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt_Knn_inner_m_axi_in_50_AWSIZE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_50_AWSIZE),
    .dout (m_axi_in_50_AWSIZE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Knn_inner_m_axi_in_50_AWVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_50_AWVALID),
    .dout (m_axi_in_50_AWVALID)
);

endmodule  // __rs_pt_Knn_inner_239