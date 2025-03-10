// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt___rs_in_8__m_axi_wrapper_inner_2 (
    input wire         Knn_inner_inst_in_8__m_axi_rst,
    output wire [63:0] __rs_pt_Knn_inner_m_axi_in_8_ARADDR,
    output wire [ 1:0] __rs_pt_Knn_inner_m_axi_in_8_ARBURST,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_8_ARCACHE,
    output wire [ 0:0] __rs_pt_Knn_inner_m_axi_in_8_ARID,
    output wire [ 7:0] __rs_pt_Knn_inner_m_axi_in_8_ARLEN,
    output wire        __rs_pt_Knn_inner_m_axi_in_8_ARLOCK,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_8_ARPROT,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_8_ARQOS,
    input wire         __rs_pt_Knn_inner_m_axi_in_8_ARREADY,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_8_ARSIZE,
    output wire        __rs_pt_Knn_inner_m_axi_in_8_ARVALID,
    input wire  [63:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARADDR,
    input wire  [ 1:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARBURST,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARCACHE,
    input wire  [ 0:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARID,
    input wire  [ 7:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARLEN,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARLOCK,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARPROT,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARQOS,
    output wire        __rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARREADY,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARSIZE,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARVALID,
    input wire         ap_clk
);




__rs_pass_through #(
    .WIDTH (64)
) __rs_pt___rs_in_8__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_8_ARADDR_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARADDR),
    .dout (__rs_pt_Knn_inner_m_axi_in_8_ARADDR)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt___rs_in_8__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_8_ARBURST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARBURST),
    .dout (__rs_pt_Knn_inner_m_axi_in_8_ARBURST)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_8__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_8_ARCACHE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARCACHE),
    .dout (__rs_pt_Knn_inner_m_axi_in_8_ARCACHE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_8__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_8_ARID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARID),
    .dout (__rs_pt_Knn_inner_m_axi_in_8_ARID)
);


__rs_pass_through #(
    .WIDTH (8)
) __rs_pt___rs_in_8__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_8_ARLEN_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARLEN),
    .dout (__rs_pt_Knn_inner_m_axi_in_8_ARLEN)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_8__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_8_ARLOCK_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARLOCK),
    .dout (__rs_pt_Knn_inner_m_axi_in_8_ARLOCK)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_8__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_8_ARPROT_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARPROT),
    .dout (__rs_pt_Knn_inner_m_axi_in_8_ARPROT)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_8__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_8_ARQOS_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARQOS),
    .dout (__rs_pt_Knn_inner_m_axi_in_8_ARQOS)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_8__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_8_ARREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_8_ARREADY),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARREADY)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_8__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_8_ARSIZE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARSIZE),
    .dout (__rs_pt_Knn_inner_m_axi_in_8_ARSIZE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_8__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_8_ARVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_8_ARVALID),
    .dout (__rs_pt_Knn_inner_m_axi_in_8_ARVALID)
);

endmodule  // __rs_pt___rs_in_8__m_axi_wrapper_inner_2