// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt___rs_in_34__m_axi_wrapper_inner_2 (
    input wire         Knn_inner_inst_in_34__m_axi_rst,
    output wire [63:0] __rs_pt_Knn_inner_m_axi_in_34_ARADDR,
    output wire [ 1:0] __rs_pt_Knn_inner_m_axi_in_34_ARBURST,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_34_ARCACHE,
    output wire [ 0:0] __rs_pt_Knn_inner_m_axi_in_34_ARID,
    output wire [ 7:0] __rs_pt_Knn_inner_m_axi_in_34_ARLEN,
    output wire        __rs_pt_Knn_inner_m_axi_in_34_ARLOCK,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_34_ARPROT,
    output wire [ 3:0] __rs_pt_Knn_inner_m_axi_in_34_ARQOS,
    input wire         __rs_pt_Knn_inner_m_axi_in_34_ARREADY,
    output wire [ 2:0] __rs_pt_Knn_inner_m_axi_in_34_ARSIZE,
    output wire        __rs_pt_Knn_inner_m_axi_in_34_ARVALID,
    input wire  [63:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARADDR,
    input wire  [ 1:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARBURST,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARCACHE,
    input wire  [ 0:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARID,
    input wire  [ 7:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARLEN,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARLOCK,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARPROT,
    input wire  [ 3:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARQOS,
    output wire        __rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARREADY,
    input wire  [ 2:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARSIZE,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARVALID,
    input wire         ap_clk
);




__rs_pass_through #(
    .WIDTH (64)
) __rs_pt___rs_in_34__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_34_ARADDR_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARADDR),
    .dout (__rs_pt_Knn_inner_m_axi_in_34_ARADDR)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt___rs_in_34__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_34_ARBURST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARBURST),
    .dout (__rs_pt_Knn_inner_m_axi_in_34_ARBURST)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_34__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_34_ARCACHE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARCACHE),
    .dout (__rs_pt_Knn_inner_m_axi_in_34_ARCACHE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_34__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_34_ARID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARID),
    .dout (__rs_pt_Knn_inner_m_axi_in_34_ARID)
);


__rs_pass_through #(
    .WIDTH (8)
) __rs_pt___rs_in_34__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_34_ARLEN_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARLEN),
    .dout (__rs_pt_Knn_inner_m_axi_in_34_ARLEN)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_34__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_34_ARLOCK_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARLOCK),
    .dout (__rs_pt_Knn_inner_m_axi_in_34_ARLOCK)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_34__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_34_ARPROT_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARPROT),
    .dout (__rs_pt_Knn_inner_m_axi_in_34_ARPROT)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt___rs_in_34__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_34_ARQOS_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARQOS),
    .dout (__rs_pt_Knn_inner_m_axi_in_34_ARQOS)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_34__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_34_ARREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_34_ARREADY),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARREADY)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt___rs_in_34__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_34_ARSIZE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARSIZE),
    .dout (__rs_pt_Knn_inner_m_axi_in_34_ARSIZE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_34__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_34_ARVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_34_ARVALID),
    .dout (__rs_pt_Knn_inner_m_axi_in_34_ARVALID)
);

endmodule  // __rs_pt___rs_in_34__m_axi_wrapper_inner_2