// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt___rs_in_6__m_axi_wrapper_inner_2 (
    input wire         Knn_inner_inst_in_6__m_axi_rst,
    output wire [63:0] __rs_pt_Knn_inner_m_axi_in_6_ARADDR,
    output wire [ 1:0] __rs_pt_Knn_inner_m_axi_in_6_ARBURST,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_6_ARCACHE,
    output wire [ 0:0] __rs_pt_Knn_inner_m_axi_in_6_ARID,
    output wire [ 7:0] __rs_pt_Knn_inner_m_axi_in_6_ARLEN,
    output wire        __rs_pt_Knn_inner_m_axi_in_6_ARLOCK,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_6_ARPROT,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_6_ARQOS,
    input wire         __rs_pt_Knn_inner_m_axi_in_6_ARREADY,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_6_ARSIZE,
    output wire        __rs_pt_Knn_inner_m_axi_in_6_ARVALID,
    input wire  [63:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARADDR,
    input wire  [ 1:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARBURST,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARCACHE,
    input wire  [ 0:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARID,
    input wire  [ 7:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARLEN,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARLOCK,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARPROT,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARQOS,
    output wire        __rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARREADY,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARSIZE,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARVALID,
    input wire         ap_clk
);




__rs_pass_through #(
    .WIDTH (64)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_ARADDR_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARADDR),
    .dout (__rs_pt_Knn_inner_m_axi_in_6_ARADDR)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_ARBURST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARBURST),
    .dout (__rs_pt_Knn_inner_m_axi_in_6_ARBURST)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_ARCACHE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARCACHE),
    .dout (__rs_pt_Knn_inner_m_axi_in_6_ARCACHE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_ARID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARID),
    .dout (__rs_pt_Knn_inner_m_axi_in_6_ARID)
);


__rs_pass_through #(
    .WIDTH (8)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_ARLEN_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARLEN),
    .dout (__rs_pt_Knn_inner_m_axi_in_6_ARLEN)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_ARLOCK_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARLOCK),
    .dout (__rs_pt_Knn_inner_m_axi_in_6_ARLOCK)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_ARPROT_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARPROT),
    .dout (__rs_pt_Knn_inner_m_axi_in_6_ARPROT)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_ARQOS_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARQOS),
    .dout (__rs_pt_Knn_inner_m_axi_in_6_ARQOS)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_ARREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_6_ARREADY),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARREADY)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_ARSIZE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARSIZE),
    .dout (__rs_pt_Knn_inner_m_axi_in_6_ARSIZE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_ARVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_ARVALID),
    .dout (__rs_pt_Knn_inner_m_axi_in_6_ARVALID)
);

endmodule  // __rs_pt___rs_in_6__m_axi_wrapper_inner_2