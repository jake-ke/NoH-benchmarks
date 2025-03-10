// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt___rs_in_51__m_axi_wrapper_inner_3 (
    input wire         Knn_inner_inst_in_51__m_axi_rst,
    output wire [63:0] __rs_pt_Knn_inner_m_axi_in_51_AWADDR,
    output wire [ 1:0] __rs_pt_Knn_inner_m_axi_in_51_AWBURST,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_51_AWCACHE,
    output wire [ 0:0] __rs_pt_Knn_inner_m_axi_in_51_AWID,
    output wire [ 7:0] __rs_pt_Knn_inner_m_axi_in_51_AWLEN,
    output wire        __rs_pt_Knn_inner_m_axi_in_51_AWLOCK,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_51_AWPROT,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_51_AWQOS,
    input wire         __rs_pt_Knn_inner_m_axi_in_51_AWREADY,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_51_AWSIZE,
    output wire        __rs_pt_Knn_inner_m_axi_in_51_AWVALID,
    input wire  [63:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWADDR,
    input wire  [ 1:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWBURST,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWCACHE,
    input wire  [ 0:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWID,
    input wire  [ 7:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWLEN,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWLOCK,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWPROT,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWQOS,
    output wire        __rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWREADY,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWSIZE,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWVALID,
    input wire         ap_clk
);




__rs_pass_through #(
    .WIDTH (64)
) __rs_pt___rs_in_51__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_51_AWADDR_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWADDR),
    .dout (__rs_pt_Knn_inner_m_axi_in_51_AWADDR)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt___rs_in_51__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_51_AWBURST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWBURST),
    .dout (__rs_pt_Knn_inner_m_axi_in_51_AWBURST)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_51__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_51_AWCACHE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWCACHE),
    .dout (__rs_pt_Knn_inner_m_axi_in_51_AWCACHE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_51__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_51_AWID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWID),
    .dout (__rs_pt_Knn_inner_m_axi_in_51_AWID)
);


__rs_pass_through #(
    .WIDTH (8)
) __rs_pt___rs_in_51__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_51_AWLEN_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWLEN),
    .dout (__rs_pt_Knn_inner_m_axi_in_51_AWLEN)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_51__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_51_AWLOCK_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWLOCK),
    .dout (__rs_pt_Knn_inner_m_axi_in_51_AWLOCK)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_51__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_51_AWPROT_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWPROT),
    .dout (__rs_pt_Knn_inner_m_axi_in_51_AWPROT)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_51__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_51_AWQOS_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWQOS),
    .dout (__rs_pt_Knn_inner_m_axi_in_51_AWQOS)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_51__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_51_AWREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_51_AWREADY),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWREADY)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_51__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_51_AWSIZE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWSIZE),
    .dout (__rs_pt_Knn_inner_m_axi_in_51_AWSIZE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_51__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_51_AWVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_51_AWVALID),
    .dout (__rs_pt_Knn_inner_m_axi_in_51_AWVALID)
);

endmodule  // __rs_pt___rs_in_51__m_axi_wrapper_inner_3