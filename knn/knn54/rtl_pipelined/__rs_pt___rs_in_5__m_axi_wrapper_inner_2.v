// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt___rs_in_5__m_axi_wrapper_inner_2 (
    input wire         Knn_inner_inst_in_5__m_axi_rst,
    output wire [63:0] __rs_pt_Knn_inner_m_axi_in_5_ARADDR,
    output wire [ 1:0] __rs_pt_Knn_inner_m_axi_in_5_ARBURST,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_5_ARCACHE,
    output wire [ 0:0] __rs_pt_Knn_inner_m_axi_in_5_ARID,
    output wire [ 7:0] __rs_pt_Knn_inner_m_axi_in_5_ARLEN,
    output wire        __rs_pt_Knn_inner_m_axi_in_5_ARLOCK,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_5_ARPROT,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_5_ARQOS,
    input wire         __rs_pt_Knn_inner_m_axi_in_5_ARREADY,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_5_ARSIZE,
    output wire        __rs_pt_Knn_inner_m_axi_in_5_ARVALID,
    input wire  [63:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARADDR,
    input wire  [ 1:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARBURST,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARCACHE,
    input wire  [ 0:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARID,
    input wire  [ 7:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARLEN,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARLOCK,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARPROT,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARQOS,
    output wire        __rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARREADY,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARSIZE,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARVALID,
    input wire         ap_clk
);




__rs_pass_through #(
    .WIDTH (64)
) __rs_pt___rs_in_5__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_5_ARADDR_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARADDR),
    .dout (__rs_pt_Knn_inner_m_axi_in_5_ARADDR)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt___rs_in_5__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_5_ARBURST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARBURST),
    .dout (__rs_pt_Knn_inner_m_axi_in_5_ARBURST)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_5__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_5_ARCACHE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARCACHE),
    .dout (__rs_pt_Knn_inner_m_axi_in_5_ARCACHE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_5__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_5_ARID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARID),
    .dout (__rs_pt_Knn_inner_m_axi_in_5_ARID)
);


__rs_pass_through #(
    .WIDTH (8)
) __rs_pt___rs_in_5__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_5_ARLEN_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARLEN),
    .dout (__rs_pt_Knn_inner_m_axi_in_5_ARLEN)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_5__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_5_ARLOCK_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARLOCK),
    .dout (__rs_pt_Knn_inner_m_axi_in_5_ARLOCK)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_5__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_5_ARPROT_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARPROT),
    .dout (__rs_pt_Knn_inner_m_axi_in_5_ARPROT)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_5__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_5_ARQOS_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARQOS),
    .dout (__rs_pt_Knn_inner_m_axi_in_5_ARQOS)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_5__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_5_ARREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_5_ARREADY),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARREADY)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_5__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_5_ARSIZE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARSIZE),
    .dout (__rs_pt_Knn_inner_m_axi_in_5_ARSIZE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_5__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_5_ARVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_5_ARVALID),
    .dout (__rs_pt_Knn_inner_m_axi_in_5_ARVALID)
);

endmodule  // __rs_pt___rs_in_5__m_axi_wrapper_inner_2