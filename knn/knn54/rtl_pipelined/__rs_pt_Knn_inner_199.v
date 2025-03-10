// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt_Knn_inner_199 #(
    parameter C_S_AXI_CONTROL_DATA_WIDTH  = 32,
    parameter C_S_AXI_CONTROL_ADDR_WIDTH  = 10,
    parameter C_S_AXI_DATA_WIDTH          = 32,
    parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 4,
    parameter C_S_AXI_WSTRB_WIDTH         = 4
) (
    input wire  [63:0] __rs_pt_m_axi_in_43_AWADDR,
    input wire  [ 1:0] __rs_pt_m_axi_in_43_AWBURST,
    input wire  [ 3:0] __rs_pt_m_axi_in_43_AWCACHE,
    input wire  [ 0:0] __rs_pt_m_axi_in_43_AWID,
    input wire  [ 7:0] __rs_pt_m_axi_in_43_AWLEN,
    input wire         __rs_pt_m_axi_in_43_AWLOCK,
    input wire  [ 2:0] __rs_pt_m_axi_in_43_AWPROT,
    input wire  [ 3:0] __rs_pt_m_axi_in_43_AWQOS,
    output wire        __rs_pt_m_axi_in_43_AWREADY,
    input wire  [ 2:0] __rs_pt_m_axi_in_43_AWSIZE,
    input wire         __rs_pt_m_axi_in_43_AWVALID,
    input wire         ap_clk,
    input wire         ap_rst_n,
    output wire [63:0] m_axi_in_43_AWADDR,
    output wire [ 1:0] m_axi_in_43_AWBURST,
    output wire [ 3:0] m_axi_in_43_AWCACHE,
    output wire [ 0:0] m_axi_in_43_AWID,
    output wire [ 7:0] m_axi_in_43_AWLEN,
    output wire        m_axi_in_43_AWLOCK,
    output wire [ 2:0] m_axi_in_43_AWPROT,
    output wire [ 3:0] m_axi_in_43_AWQOS,
    input wire         m_axi_in_43_AWREADY,
    output wire [ 2:0] m_axi_in_43_AWSIZE,
    output wire        m_axi_in_43_AWVALID
);




__rs_pass_through #(
    .WIDTH (64)
) __rs_pt_Knn_inner_m_axi_in_43_AWADDR_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_43_AWADDR),
    .dout (m_axi_in_43_AWADDR)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt_Knn_inner_m_axi_in_43_AWBURST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_43_AWBURST),
    .dout (m_axi_in_43_AWBURST)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt_Knn_inner_m_axi_in_43_AWCACHE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_43_AWCACHE),
    .dout (m_axi_in_43_AWCACHE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Knn_inner_m_axi_in_43_AWID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_43_AWID),
    .dout (m_axi_in_43_AWID)
);


__rs_pass_through #(
    .WIDTH (8)
) __rs_pt_Knn_inner_m_axi_in_43_AWLEN_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_43_AWLEN),
    .dout (m_axi_in_43_AWLEN)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Knn_inner_m_axi_in_43_AWLOCK_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_43_AWLOCK),
    .dout (m_axi_in_43_AWLOCK)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt_Knn_inner_m_axi_in_43_AWPROT_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_43_AWPROT),
    .dout (m_axi_in_43_AWPROT)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt_Knn_inner_m_axi_in_43_AWQOS_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_43_AWQOS),
    .dout (m_axi_in_43_AWQOS)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Knn_inner_m_axi_in_43_AWREADY_inst /**   Generated by RapidStream   **/ (
    .din  (m_axi_in_43_AWREADY),
    .dout (__rs_pt_m_axi_in_43_AWREADY)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt_Knn_inner_m_axi_in_43_AWSIZE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_43_AWSIZE),
    .dout (m_axi_in_43_AWSIZE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Knn_inner_m_axi_in_43_AWVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_in_43_AWVALID),
    .dout (m_axi_in_43_AWVALID)
);

endmodule  // __rs_pt_Knn_inner_199