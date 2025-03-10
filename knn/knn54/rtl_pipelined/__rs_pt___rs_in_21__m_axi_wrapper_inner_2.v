// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt___rs_in_21__m_axi_wrapper_inner_2 (
    input wire         Knn_inner_inst_in_21__m_axi_rst,
    output wire [63:0] __rs_pt_Knn_inner_m_axi_in_21_ARADDR,
    output wire [ 1:0] __rs_pt_Knn_inner_m_axi_in_21_ARBURST,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_21_ARCACHE,
    output wire [ 0:0] __rs_pt_Knn_inner_m_axi_in_21_ARID,
    output wire [ 7:0] __rs_pt_Knn_inner_m_axi_in_21_ARLEN,
    output wire        __rs_pt_Knn_inner_m_axi_in_21_ARLOCK,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_21_ARPROT,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_21_ARQOS,
    input wire         __rs_pt_Knn_inner_m_axi_in_21_ARREADY,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_21_ARSIZE,
    output wire        __rs_pt_Knn_inner_m_axi_in_21_ARVALID,
    input wire  [63:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARADDR,
    input wire  [ 1:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARBURST,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARCACHE,
    input wire  [ 0:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARID,
    input wire  [ 7:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARLEN,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARLOCK,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARPROT,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARQOS,
    output wire        __rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARREADY,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARSIZE,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARVALID,
    input wire         ap_clk
);




__rs_pass_through #(
    .WIDTH (64)
) __rs_pt___rs_in_21__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_21_ARADDR_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARADDR),
    .dout (__rs_pt_Knn_inner_m_axi_in_21_ARADDR)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt___rs_in_21__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_21_ARBURST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARBURST),
    .dout (__rs_pt_Knn_inner_m_axi_in_21_ARBURST)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_21__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_21_ARCACHE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARCACHE),
    .dout (__rs_pt_Knn_inner_m_axi_in_21_ARCACHE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_21__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_21_ARID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARID),
    .dout (__rs_pt_Knn_inner_m_axi_in_21_ARID)
);


__rs_pass_through #(
    .WIDTH (8)
) __rs_pt___rs_in_21__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_21_ARLEN_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARLEN),
    .dout (__rs_pt_Knn_inner_m_axi_in_21_ARLEN)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_21__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_21_ARLOCK_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARLOCK),
    .dout (__rs_pt_Knn_inner_m_axi_in_21_ARLOCK)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_21__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_21_ARPROT_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARPROT),
    .dout (__rs_pt_Knn_inner_m_axi_in_21_ARPROT)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_21__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_21_ARQOS_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARQOS),
    .dout (__rs_pt_Knn_inner_m_axi_in_21_ARQOS)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_21__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_21_ARREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_21_ARREADY),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARREADY)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_21__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_21_ARSIZE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARSIZE),
    .dout (__rs_pt_Knn_inner_m_axi_in_21_ARSIZE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_21__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_21_ARVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_21_ARVALID),
    .dout (__rs_pt_Knn_inner_m_axi_in_21_ARVALID)
);

endmodule  // __rs_pt___rs_in_21__m_axi_wrapper_inner_2