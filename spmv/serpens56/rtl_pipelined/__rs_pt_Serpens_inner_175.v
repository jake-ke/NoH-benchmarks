// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt_Serpens_inner_175 #(
    parameter C_S_AXI_CONTROL_DATA_WIDTH  = 32,
    parameter C_S_AXI_CONTROL_ADDR_WIDTH  = 10,
    parameter C_S_AXI_DATA_WIDTH          = 32,
    parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 4,
    parameter C_S_AXI_WSTRB_WIDTH         = 4
) (
    output wire [0:0] __rs_pt_m_axi_edge_list_ch_40_BID,
    input wire        __rs_pt_m_axi_edge_list_ch_40_BREADY,
    output wire [1:0] __rs_pt_m_axi_edge_list_ch_40_BRESP,
    output wire       __rs_pt_m_axi_edge_list_ch_40_BVALID,
    input wire        ap_clk,
    input wire        ap_rst_n,
    input wire  [0:0] m_axi_edge_list_ch_40_BID,
    output wire       m_axi_edge_list_ch_40_BREADY,
    input wire  [1:0] m_axi_edge_list_ch_40_BRESP,
    input wire        m_axi_edge_list_ch_40_BVALID
);




__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_40_BID_inst /**   Generated by RapidStream   **/ (
    .din  (m_axi_edge_list_ch_40_BID),
    .dout (__rs_pt_m_axi_edge_list_ch_40_BID)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_40_BREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_edge_list_ch_40_BREADY),
    .dout (m_axi_edge_list_ch_40_BREADY)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_40_BRESP_inst /**   Generated by RapidStream   **/ (
    .din  (m_axi_edge_list_ch_40_BRESP),
    .dout (__rs_pt_m_axi_edge_list_ch_40_BRESP)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_Serpens_inner_m_axi_edge_list_ch_40_BVALID_inst /**   Generated by RapidStream   **/ (
    .din  (m_axi_edge_list_ch_40_BVALID),
    .dout (__rs_pt_m_axi_edge_list_ch_40_BVALID)
);

endmodule  // __rs_pt_Serpens_inner_175