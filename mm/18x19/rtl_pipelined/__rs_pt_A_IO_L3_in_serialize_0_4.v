// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt_A_IO_L3_in_serialize_0_4 #(
    parameter ap_ST_fsm_state1       = 3'd1,
    parameter ap_ST_fsm_state2       = 3'd2,
    parameter ap_ST_fsm_state3       = 3'd4,
    parameter C_M_AXI_A_ID_WIDTH     = 1,
    parameter C_M_AXI_A_ADDR_WIDTH   = 64,
    parameter C_M_AXI_A_DATA_WIDTH   = 512,
    parameter C_M_AXI_A_AWUSER_WIDTH = 1,
    parameter C_M_AXI_A_ARUSER_WIDTH = 1,
    parameter C_M_AXI_A_WUSER_WIDTH  = 1,
    parameter C_M_AXI_A_RUSER_WIDTH  = 1,
    parameter C_M_AXI_A_BUSER_WIDTH  = 1,
    parameter C_M_AXI_A_USER_VALUE   = 0,
    parameter C_M_AXI_A_PROT_VALUE   = 0,
    parameter C_M_AXI_A_CACHE_VALUE  = 3,
    parameter C_M_AXI_DATA_WIDTH     = 32,
    parameter C_M_AXI_A_WSTRB_WIDTH  = 64,
    parameter C_M_AXI_WSTRB_WIDTH    = 4
) (
    input wire  [ (C_M_AXI_A_DATA_WIDTH - 1):0] __rs_pt_m_axi_A_WDATA,
    input wire  [   (C_M_AXI_A_ID_WIDTH - 1):0] __rs_pt_m_axi_A_WID,
    input wire                                  __rs_pt_m_axi_A_WLAST,
    output wire                                 __rs_pt_m_axi_A_WREADY,
    input wire  [(C_M_AXI_A_WSTRB_WIDTH - 1):0] __rs_pt_m_axi_A_WSTRB,
    input wire  [(C_M_AXI_A_WUSER_WIDTH - 1):0] __rs_pt_m_axi_A_WUSER,
    input wire                                  __rs_pt_m_axi_A_WVALID,
    input wire                                  ap_clk,
    input wire                                  ap_rst_n,
    output wire [ (C_M_AXI_A_DATA_WIDTH - 1):0] m_axi_A_WDATA,
    output wire [   (C_M_AXI_A_ID_WIDTH - 1):0] m_axi_A_WID,
    output wire                                 m_axi_A_WLAST,
    input wire                                  m_axi_A_WREADY,
    output wire [(C_M_AXI_A_WSTRB_WIDTH - 1):0] m_axi_A_WSTRB,
    output wire [(C_M_AXI_A_WUSER_WIDTH - 1):0] m_axi_A_WUSER,
    output wire                                 m_axi_A_WVALID
);




__rs_pass_through #(
    .WIDTH (( ( C_M_AXI_A_DATA_WIDTH - 1 ) - ( 0 ) + 1 ))
) __rs_pt_A_IO_L3_in_serialize_m_axi_A_WDATA_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_A_WDATA),
    .dout (m_axi_A_WDATA)
);


__rs_pass_through #(
    .WIDTH (( ( C_M_AXI_A_ID_WIDTH - 1 ) - ( 0 ) + 1 ))
) __rs_pt_A_IO_L3_in_serialize_m_axi_A_WID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_A_WID),
    .dout (m_axi_A_WID)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_A_IO_L3_in_serialize_m_axi_A_WLAST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_A_WLAST),
    .dout (m_axi_A_WLAST)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_A_IO_L3_in_serialize_m_axi_A_WREADY_inst /**   Generated by RapidStream   **/ (
    .din  (m_axi_A_WREADY),
    .dout (__rs_pt_m_axi_A_WREADY)
);


__rs_pass_through #(
    .WIDTH (( ( C_M_AXI_A_WSTRB_WIDTH - 1 ) - ( 0 ) + 1 ))
) __rs_pt_A_IO_L3_in_serialize_m_axi_A_WSTRB_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_A_WSTRB),
    .dout (m_axi_A_WSTRB)
);


__rs_pass_through #(
    .WIDTH (( ( C_M_AXI_A_WUSER_WIDTH - 1 ) - ( 0 ) + 1 ))
) __rs_pt_A_IO_L3_in_serialize_m_axi_A_WUSER_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_A_WUSER),
    .dout (m_axi_A_WUSER)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_A_IO_L3_in_serialize_m_axi_A_WVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_A_WVALID),
    .dout (m_axi_A_WVALID)
);

endmodule  // __rs_pt_A_IO_L3_in_serialize_0_4