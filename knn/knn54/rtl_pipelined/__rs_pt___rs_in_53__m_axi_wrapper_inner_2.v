// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt___rs_in_53__m_axi_wrapper_inner_2 (
    input wire         Knn_inner_inst_in_53__m_axi_rst,
    output wire [63:0] __rs_pt_Knn_inner_m_axi_in_53_ARADDR,
    output wire [ 1:0] __rs_pt_Knn_inner_m_axi_in_53_ARBURST,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_53_ARCACHE,
    output wire [ 0:0] __rs_pt_Knn_inner_m_axi_in_53_ARID,
    output wire [ 7:0] __rs_pt_Knn_inner_m_axi_in_53_ARLEN,
    output wire        __rs_pt_Knn_inner_m_axi_in_53_ARLOCK,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_53_ARPROT,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_53_ARQOS,
    input wire         __rs_pt_Knn_inner_m_axi_in_53_ARREADY,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_53_ARSIZE,
    output wire        __rs_pt_Knn_inner_m_axi_in_53_ARVALID,
    input wire  [63:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARADDR,
    input wire  [ 1:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARBURST,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARCACHE,
    input wire  [ 0:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARID,
    input wire  [ 7:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARLEN,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARLOCK,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARPROT,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARQOS,
    output wire        __rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARREADY,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARSIZE,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARVALID,
    input wire         ap_clk
);




__rs_pass_through #(
    .WIDTH (64)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_ARADDR_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARADDR),
    .dout (__rs_pt_Knn_inner_m_axi_in_53_ARADDR)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_ARBURST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARBURST),
    .dout (__rs_pt_Knn_inner_m_axi_in_53_ARBURST)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_ARCACHE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARCACHE),
    .dout (__rs_pt_Knn_inner_m_axi_in_53_ARCACHE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_ARID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARID),
    .dout (__rs_pt_Knn_inner_m_axi_in_53_ARID)
);


__rs_pass_through #(
    .WIDTH (8)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_ARLEN_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARLEN),
    .dout (__rs_pt_Knn_inner_m_axi_in_53_ARLEN)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_ARLOCK_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARLOCK),
    .dout (__rs_pt_Knn_inner_m_axi_in_53_ARLOCK)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_ARPROT_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARPROT),
    .dout (__rs_pt_Knn_inner_m_axi_in_53_ARPROT)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_ARQOS_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARQOS),
    .dout (__rs_pt_Knn_inner_m_axi_in_53_ARQOS)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_ARREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_53_ARREADY),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARREADY)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_ARSIZE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARSIZE),
    .dout (__rs_pt_Knn_inner_m_axi_in_53_ARSIZE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_ARVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_ARVALID),
    .dout (__rs_pt_Knn_inner_m_axi_in_53_ARVALID)
);

endmodule  // __rs_pt___rs_in_53__m_axi_wrapper_inner_2