// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt___rs_in_1__m_axi_wrapper_inner_3 (
    input wire         Knn_inner_inst_in_1__m_axi_rst,
    output wire [63:0] __rs_pt_Knn_inner_m_axi_in_1_AWADDR,
    output wire [ 1:0] __rs_pt_Knn_inner_m_axi_in_1_AWBURST,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_1_AWCACHE,
    output wire [ 0:0] __rs_pt_Knn_inner_m_axi_in_1_AWID,
    output wire [ 7:0] __rs_pt_Knn_inner_m_axi_in_1_AWLEN,
    output wire        __rs_pt_Knn_inner_m_axi_in_1_AWLOCK,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_1_AWPROT,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_1_AWQOS,
    input wire         __rs_pt_Knn_inner_m_axi_in_1_AWREADY,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_1_AWSIZE,
    output wire        __rs_pt_Knn_inner_m_axi_in_1_AWVALID,
    input wire  [63:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWADDR,
    input wire  [ 1:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWBURST,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWCACHE,
    input wire  [ 0:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWID,
    input wire  [ 7:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWLEN,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWLOCK,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWPROT,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWQOS,
    output wire        __rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWREADY,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWSIZE,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWVALID,
    input wire         ap_clk
);




__rs_pass_through #(
    .WIDTH (64)
) __rs_pt___rs_in_1__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_1_AWADDR_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWADDR),
    .dout (__rs_pt_Knn_inner_m_axi_in_1_AWADDR)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt___rs_in_1__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_1_AWBURST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWBURST),
    .dout (__rs_pt_Knn_inner_m_axi_in_1_AWBURST)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_1__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_1_AWCACHE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWCACHE),
    .dout (__rs_pt_Knn_inner_m_axi_in_1_AWCACHE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_1__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_1_AWID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWID),
    .dout (__rs_pt_Knn_inner_m_axi_in_1_AWID)
);


__rs_pass_through #(
    .WIDTH (8)
) __rs_pt___rs_in_1__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_1_AWLEN_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWLEN),
    .dout (__rs_pt_Knn_inner_m_axi_in_1_AWLEN)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_1__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_1_AWLOCK_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWLOCK),
    .dout (__rs_pt_Knn_inner_m_axi_in_1_AWLOCK)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_1__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_1_AWPROT_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWPROT),
    .dout (__rs_pt_Knn_inner_m_axi_in_1_AWPROT)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_1__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_1_AWQOS_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWQOS),
    .dout (__rs_pt_Knn_inner_m_axi_in_1_AWQOS)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_1__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_1_AWREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_1_AWREADY),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWREADY)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_1__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_1_AWSIZE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWSIZE),
    .dout (__rs_pt_Knn_inner_m_axi_in_1_AWSIZE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_1__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_1_AWVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_1_AWVALID),
    .dout (__rs_pt_Knn_inner_m_axi_in_1_AWVALID)
);

endmodule  // __rs_pt___rs_in_1__m_axi_wrapper_inner_3