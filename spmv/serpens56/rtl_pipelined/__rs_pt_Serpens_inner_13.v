// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt_Serpens_inner_13 #(
    parameter C_S_AXI_CONTROL_DATA_WIDTH  = 32,
    parameter C_S_AXI_CONTROL_ADDR_WIDTH  = 10,
    parameter C_S_AXI_DATA_WIDTH          = 32,
    parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 4,
    parameter C_S_AXI_WSTRB_WIDTH         = 4
) (
    input wire  [63:0] __rs_pt_m_axi_edge_list_ch_11_ARADDR,
    input wire  [ 1:0] __rs_pt_m_axi_edge_list_ch_11_ARBURST,
    input wire  [ 3:0] __rs_pt_m_axi_edge_list_ch_11_ARCACHE,
    input wire  [ 0:0] __rs_pt_m_axi_edge_list_ch_11_ARID,
    input wire  [ 7:0] __rs_pt_m_axi_edge_list_ch_11_ARLEN,
    input wire         __rs_pt_m_axi_edge_list_ch_11_ARLOCK,
    input wire  [ 2:0] __rs_pt_m_axi_edge_list_ch_11_ARPROT,
    input wire  [ 3:0] __rs_pt_m_axi_edge_list_ch_11_ARQOS,
    output wire        __rs_pt_m_axi_edge_list_ch_11_ARREADY,
    input wire  [ 2:0] __rs_pt_m_axi_edge_list_ch_11_ARSIZE,
    input wire         __rs_pt_m_axi_edge_list_ch_11_ARVALID,
    input wire         ap_clk,
    input wire         ap_rst_n,
    output wire [63:0] m_axi_edge_list_ch_11_ARADDR,
    output wire [ 1:0] m_axi_edge_list_ch_11_ARBURST,
    output wire [ 3:0] m_axi_edge_list_ch_11_ARCACHE,
    output wire [ 0:0] m_axi_edge_list_ch_11_ARID,
    output wire [ 7:0] m_axi_edge_list_ch_11_ARLEN,
    output wire        m_axi_edge_list_ch_11_ARLOCK,
    output wire [ 2:0] m_axi_edge_list_ch_11_ARPROT,
    output wire [ 3:0] m_axi_edge_list_ch_11_ARQOS,
    input wire         m_axi_edge_list_ch_11_ARREADY,
    output wire [ 2:0] m_axi_edge_list_ch_11_ARSIZE,
    output wire        m_axi_edge_list_ch_11_ARVALID
);




__rs_pass_through #(
    .WIDTH (64)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_11_ARADDR_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_11_ARADDR),
    .dout (m_axi_edge_list_ch_11_ARADDR)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_11_ARBURST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_11_ARBURST),
    .dout (m_axi_edge_list_ch_11_ARBURST)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_11_ARCACHE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_11_ARCACHE),
    .dout (m_axi_edge_list_ch_11_ARCACHE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_11_ARID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_11_ARID),
    .dout (m_axi_edge_list_ch_11_ARID)
);


__rs_pass_through #(
    .WIDTH (8)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_11_ARLEN_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_11_ARLEN),
    .dout (m_axi_edge_list_ch_11_ARLEN)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_11_ARLOCK_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_11_ARLOCK),
    .dout (m_axi_edge_list_ch_11_ARLOCK)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_11_ARPROT_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_11_ARPROT),
    .dout (m_axi_edge_list_ch_11_ARPROT)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_11_ARQOS_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_11_ARQOS),
    .dout (m_axi_edge_list_ch_11_ARQOS)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_11_ARREADY_inst /**   Generated by RapidStream   **/ (
    .din  (m_axi_edge_list_ch_11_ARREADY),
    .dout (__rs_pt_m_axi_edge_list_ch_11_ARREADY)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_11_ARSIZE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_11_ARSIZE),
    .dout (m_axi_edge_list_ch_11_ARSIZE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_11_ARVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_11_ARVALID),
    .dout (m_axi_edge_list_ch_11_ARVALID)
);

endmodule  // __rs_pt_Serpens_inner_13