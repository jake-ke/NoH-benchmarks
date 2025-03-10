// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt_kernel0_inner_14 #(
    parameter C_S_AXI_CONTROL_DATA_WIDTH  = 32,
    parameter C_S_AXI_CONTROL_ADDR_WIDTH  = 6,
    parameter C_S_AXI_DATA_WIDTH          = 32,
    parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 4,
    parameter C_S_AXI_WSTRB_WIDTH         = 4
) (
    input wire  [63:0] __rs_pt_m_axi_C_AWADDR,
    input wire  [ 1:0] __rs_pt_m_axi_C_AWBURST,
    input wire  [ 3:0] __rs_pt_m_axi_C_AWCACHE,
    input wire  [ 0:0] __rs_pt_m_axi_C_AWID,
    input wire  [ 7:0] __rs_pt_m_axi_C_AWLEN,
    input wire         __rs_pt_m_axi_C_AWLOCK,
    input wire  [ 2:0] __rs_pt_m_axi_C_AWPROT,
    input wire  [ 3:0] __rs_pt_m_axi_C_AWQOS,
    output wire        __rs_pt_m_axi_C_AWREADY,
    input wire  [ 2:0] __rs_pt_m_axi_C_AWSIZE,
    input wire         __rs_pt_m_axi_C_AWVALID,
    input wire         ap_clk,
    input wire         ap_rst_n,
    output wire [63:0] m_axi_C_AWADDR,
    output wire [ 1:0] m_axi_C_AWBURST,
    output wire [ 3:0] m_axi_C_AWCACHE,
    output wire [ 0:0] m_axi_C_AWID,
    output wire [ 7:0] m_axi_C_AWLEN,
    output wire        m_axi_C_AWLOCK,
    output wire [ 2:0] m_axi_C_AWPROT,
    output wire [ 3:0] m_axi_C_AWQOS,
    input wire         m_axi_C_AWREADY,
    output wire [ 2:0] m_axi_C_AWSIZE,
    output wire        m_axi_C_AWVALID
);




__rs_pass_through #(
    .WIDTH (64)
) __rs_pt_kernel0_inner_m_axi_C_AWADDR_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_C_AWADDR),
    .dout (m_axi_C_AWADDR)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt_kernel0_inner_m_axi_C_AWBURST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_C_AWBURST),
    .dout (m_axi_C_AWBURST)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt_kernel0_inner_m_axi_C_AWCACHE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_C_AWCACHE),
    .dout (m_axi_C_AWCACHE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_kernel0_inner_m_axi_C_AWID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_C_AWID),
    .dout (m_axi_C_AWID)
);


__rs_pass_through #(
    .WIDTH (8)
) __rs_pt_kernel0_inner_m_axi_C_AWLEN_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_C_AWLEN),
    .dout (m_axi_C_AWLEN)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_kernel0_inner_m_axi_C_AWLOCK_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_C_AWLOCK),
    .dout (m_axi_C_AWLOCK)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt_kernel0_inner_m_axi_C_AWPROT_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_C_AWPROT),
    .dout (m_axi_C_AWPROT)
);


__rs_pass_through #(
    .WIDTH (4)
) __rs_pt_kernel0_inner_m_axi_C_AWQOS_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_C_AWQOS),
    .dout (m_axi_C_AWQOS)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_kernel0_inner_m_axi_C_AWREADY_inst /**   Generated by RapidStream   **/ (
    .din  (m_axi_C_AWREADY),
    .dout (__rs_pt_m_axi_C_AWREADY)
);


__rs_pass_through #(
    .WIDTH (3)
) __rs_pt_kernel0_inner_m_axi_C_AWSIZE_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_C_AWSIZE),
    .dout (m_axi_C_AWSIZE)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_kernel0_inner_m_axi_C_AWVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_C_AWVALID),
    .dout (m_axi_C_AWVALID)
);

endmodule  // __rs_pt_kernel0_inner_14