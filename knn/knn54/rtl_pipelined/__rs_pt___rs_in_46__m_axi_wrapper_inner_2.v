// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt___rs_in_46__m_axi_wrapper_inner_2 (
    input wire         Knn_inner_inst_in_46__m_axi_rst,
    output wire [63:0] __rs_pt_Knn_inner_m_axi_in_46_ARADDR,
    output wire [ 1:0] __rs_pt_Knn_inner_m_axi_in_46_ARBURST,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_46_ARCACHE,
    output wire [ 0:0] __rs_pt_Knn_inner_m_axi_in_46_ARID,
    output wire [ 7:0] __rs_pt_Knn_inner_m_axi_in_46_ARLEN,
    output wire        __rs_pt_Knn_inner_m_axi_in_46_ARLOCK,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_46_ARPROT,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_46_ARQOS,
    input wire         __rs_pt_Knn_inner_m_axi_in_46_ARREADY,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_46_ARSIZE,
    output wire        __rs_pt_Knn_inner_m_axi_in_46_ARVALID,
    input wire  [63:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARADDR,
    input wire  [ 1:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARBURST,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARCACHE,
    input wire  [ 0:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARID,
    input wire  [ 7:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARLEN,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARLOCK,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARPROT,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARQOS,
    output wire        __rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARREADY,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARSIZE,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARVALID,
    input wire         ap_clk
);




__rs_pass_through #(
    .WIDTH (64)
) __rs_pt___rs_in_46__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_46_ARADDR_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARADDR),
    .dout (__rs_pt_Knn_inner_m_axi_in_46_ARADDR)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt___rs_in_46__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_46_ARBURST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARBURST),
    .dout (__rs_pt_Knn_inner_m_axi_in_46_ARBURST)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_46__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_46_ARCACHE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARCACHE),
    .dout (__rs_pt_Knn_inner_m_axi_in_46_ARCACHE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_46__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_46_ARID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARID),
    .dout (__rs_pt_Knn_inner_m_axi_in_46_ARID)
);


__rs_pass_through #(
    .WIDTH (8)
) __rs_pt___rs_in_46__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_46_ARLEN_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARLEN),
    .dout (__rs_pt_Knn_inner_m_axi_in_46_ARLEN)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_46__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_46_ARLOCK_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARLOCK),
    .dout (__rs_pt_Knn_inner_m_axi_in_46_ARLOCK)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_46__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_46_ARPROT_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARPROT),
    .dout (__rs_pt_Knn_inner_m_axi_in_46_ARPROT)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_46__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_46_ARQOS_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARQOS),
    .dout (__rs_pt_Knn_inner_m_axi_in_46_ARQOS)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_46__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_46_ARREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_46_ARREADY),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARREADY)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_46__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_46_ARSIZE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARSIZE),
    .dout (__rs_pt_Knn_inner_m_axi_in_46_ARSIZE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_46__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_46_ARVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_46_ARVALID),
    .dout (__rs_pt_Knn_inner_m_axi_in_46_ARVALID)
);

endmodule  // __rs_pt___rs_in_46__m_axi_wrapper_inner_2