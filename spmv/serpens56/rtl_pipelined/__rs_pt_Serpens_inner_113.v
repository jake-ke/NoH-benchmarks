// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt_Serpens_inner_113 #(
    parameter C_S_AXI_CONTROL_DATA_WIDTH  = 32,
    parameter C_S_AXI_CONTROL_ADDR_WIDTH  = 10,
    parameter C_S_AXI_DATA_WIDTH          = 32,
    parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 4,
    parameter C_S_AXI_WSTRB_WIDTH         = 4
) (
    input wire  [63:0] __rs_pt_m_axi_edge_list_ch_2_ARADDR,
    input wire  [ 1:0] __rs_pt_m_axi_edge_list_ch_2_ARBURST,
    input wire  [ 3:0] __rs_pt_m_axi_edge_list_ch_2_ARCACHE,
    input wire  [ 0:0] __rs_pt_m_axi_edge_list_ch_2_ARID,
    input wire  [ 7:0] __rs_pt_m_axi_edge_list_ch_2_ARLEN,
    input wire         __rs_pt_m_axi_edge_list_ch_2_ARLOCK,
    input wire  [ 2:0] __rs_pt_m_axi_edge_list_ch_2_ARPROT,
    input wire  [ 3:0] __rs_pt_m_axi_edge_list_ch_2_ARQOS,
    output wire        __rs_pt_m_axi_edge_list_ch_2_ARREADY,
    input wire  [ 2:0] __rs_pt_m_axi_edge_list_ch_2_ARSIZE,
    input wire         __rs_pt_m_axi_edge_list_ch_2_ARVALID,
    input wire         ap_clk,
    input wire         ap_rst_n,
    output wire [63:0] m_axi_edge_list_ch_2_ARADDR,
    output wire [ 1:0] m_axi_edge_list_ch_2_ARBURST,
    output wire [ 3:0] m_axi_edge_list_ch_2_ARCACHE,
    output wire [ 0:0] m_axi_edge_list_ch_2_ARID,
    output wire [ 7:0] m_axi_edge_list_ch_2_ARLEN,
    output wire        m_axi_edge_list_ch_2_ARLOCK,
    output wire [ 2:0] m_axi_edge_list_ch_2_ARPROT,
    output wire [ 3:0] m_axi_edge_list_ch_2_ARQOS,
    input wire         m_axi_edge_list_ch_2_ARREADY,
    output wire [ 2:0] m_axi_edge_list_ch_2_ARSIZE,
    output wire        m_axi_edge_list_ch_2_ARVALID
);




__rs_pass_through #(
    .WIDTH (64)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_2_ARADDR_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_2_ARADDR),
    .dout (m_axi_edge_list_ch_2_ARADDR)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_2_ARBURST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_2_ARBURST),
    .dout (m_axi_edge_list_ch_2_ARBURST)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_2_ARCACHE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_2_ARCACHE),
    .dout (m_axi_edge_list_ch_2_ARCACHE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_2_ARID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_2_ARID),
    .dout (m_axi_edge_list_ch_2_ARID)
);


__rs_pass_through #(
    .WIDTH (8)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_2_ARLEN_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_2_ARLEN),
    .dout (m_axi_edge_list_ch_2_ARLEN)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_2_ARLOCK_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_2_ARLOCK),
    .dout (m_axi_edge_list_ch_2_ARLOCK)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_2_ARPROT_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_2_ARPROT),
    .dout (m_axi_edge_list_ch_2_ARPROT)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_2_ARQOS_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_2_ARQOS),
    .dout (m_axi_edge_list_ch_2_ARQOS)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_2_ARREADY_inst /**   Generated by RapidStream   **/ (
    .din  (m_axi_edge_list_ch_2_ARREADY),
    .dout (__rs_pt_m_axi_edge_list_ch_2_ARREADY)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_2_ARSIZE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_2_ARSIZE),
    .dout (m_axi_edge_list_ch_2_ARSIZE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_2_ARVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_2_ARVALID),
    .dout (m_axi_edge_list_ch_2_ARVALID)
);

endmodule  // __rs_pt_Serpens_inner_113