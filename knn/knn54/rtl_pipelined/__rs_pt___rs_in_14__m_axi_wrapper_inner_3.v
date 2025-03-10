// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt___rs_in_14__m_axi_wrapper_inner_3 (
    input wire         Knn_inner_inst_in_14__m_axi_rst,
    output wire [63:0] __rs_pt_Knn_inner_m_axi_in_14_AWADDR,
    output wire [ 1:0] __rs_pt_Knn_inner_m_axi_in_14_AWBURST,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_14_AWCACHE,
    output wire [ 0:0] __rs_pt_Knn_inner_m_axi_in_14_AWID,
    output wire [ 7:0] __rs_pt_Knn_inner_m_axi_in_14_AWLEN,
    output wire        __rs_pt_Knn_inner_m_axi_in_14_AWLOCK,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_14_AWPROT,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_14_AWQOS,
    input wire         __rs_pt_Knn_inner_m_axi_in_14_AWREADY,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_14_AWSIZE,
    output wire        __rs_pt_Knn_inner_m_axi_in_14_AWVALID,
    input wire  [63:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWADDR,
    input wire  [ 1:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWBURST,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWCACHE,
    input wire  [ 0:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWID,
    input wire  [ 7:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWLEN,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWLOCK,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWPROT,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWQOS,
    output wire        __rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWREADY,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWSIZE,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWVALID,
    input wire         ap_clk
);




__rs_pass_through #(
    .WIDTH (64)
) __rs_pt___rs_in_14__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_14_AWADDR_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWADDR),
    .dout (__rs_pt_Knn_inner_m_axi_in_14_AWADDR)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt___rs_in_14__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_14_AWBURST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWBURST),
    .dout (__rs_pt_Knn_inner_m_axi_in_14_AWBURST)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_14__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_14_AWCACHE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWCACHE),
    .dout (__rs_pt_Knn_inner_m_axi_in_14_AWCACHE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_14__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_14_AWID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWID),
    .dout (__rs_pt_Knn_inner_m_axi_in_14_AWID)
);


__rs_pass_through #(
    .WIDTH (8)
) __rs_pt___rs_in_14__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_14_AWLEN_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWLEN),
    .dout (__rs_pt_Knn_inner_m_axi_in_14_AWLEN)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_14__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_14_AWLOCK_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWLOCK),
    .dout (__rs_pt_Knn_inner_m_axi_in_14_AWLOCK)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_14__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_14_AWPROT_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWPROT),
    .dout (__rs_pt_Knn_inner_m_axi_in_14_AWPROT)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_14__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_14_AWQOS_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWQOS),
    .dout (__rs_pt_Knn_inner_m_axi_in_14_AWQOS)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_14__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_14_AWREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_14_AWREADY),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWREADY)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_14__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_14_AWSIZE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWSIZE),
    .dout (__rs_pt_Knn_inner_m_axi_in_14_AWSIZE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_14__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_14_AWVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_14_AWVALID),
    .dout (__rs_pt_Knn_inner_m_axi_in_14_AWVALID)
);

endmodule  // __rs_pt___rs_in_14__m_axi_wrapper_inner_3