// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt_C_drain_IO_L3_out_serialize_0_2 #(
    parameter ap_ST_fsm_state1       = 3'd1,
    parameter ap_ST_fsm_state2       = 3'd2,
    parameter ap_ST_fsm_state3       = 3'd4,
    parameter C_M_AXI_C_ID_WIDTH     = 1,
    parameter C_M_AXI_C_ADDR_WIDTH   = 64,
    parameter C_M_AXI_C_DATA_WIDTH   = 512,
    parameter C_M_AXI_C_AWUSER_WIDTH = 1,
    parameter C_M_AXI_C_ARUSER_WIDTH = 1,
    parameter C_M_AXI_C_WUSER_WIDTH  = 1,
    parameter C_M_AXI_C_RUSER_WIDTH  = 1,
    parameter C_M_AXI_C_BUSER_WIDTH  = 1,
    parameter C_M_AXI_C_USER_VALUE   = 0,
    parameter C_M_AXI_C_PROT_VALUE   = 0,
    parameter C_M_AXI_C_CACHE_VALUE  = 3,
    parameter C_M_AXI_DATA_WIDTH     = 32,
    parameter C_M_AXI_C_WSTRB_WIDTH  = 64,
    parameter C_M_AXI_WSTRB_WIDTH    = 4
) (
    output wire [   (C_M_AXI_C_ID_WIDTH - 1):0] __rs_pt_m_axi_C_BID,
    input wire                                  __rs_pt_m_axi_C_BREADY,
    output wire [                          1:0] __rs_pt_m_axi_C_BRESP,
    output wire [(C_M_AXI_C_BUSER_WIDTH - 1):0] __rs_pt_m_axi_C_BUSER,
    output wire                                 __rs_pt_m_axi_C_BVALID,
    input wire                                  ap_clk,
    input wire                                  ap_rst_n,
    input wire  [   (C_M_AXI_C_ID_WIDTH - 1):0] m_axi_C_BID,
    output wire                                 m_axi_C_BREADY,
    input wire  [                          1:0] m_axi_C_BRESP,
    input wire  [(C_M_AXI_C_BUSER_WIDTH - 1):0] m_axi_C_BUSER,
    input wire                                  m_axi_C_BVALID
);




__rs_pass_through #(
    .WIDTH (( ( C_M_AXI_C_ID_WIDTH - 1 ) - ( 0 ) + 1 ))
) __rs_pt_C_drain_IO_L3_out_serialize_m_axi_C_BID_inst /**   Generated by RapidStream   **/ (
    .din  (m_axi_C_BID),
    .dout (__rs_pt_m_axi_C_BID)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_C_drain_IO_L3_out_serialize_m_axi_C_BREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_m_axi_C_BREADY),
    .dout (m_axi_C_BREADY)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt_C_drain_IO_L3_out_serialize_m_axi_C_BRESP_inst /**   Generated by RapidStream   **/ (
    .din  (m_axi_C_BRESP),
    .dout (__rs_pt_m_axi_C_BRESP)
);


__rs_pass_through #(
    .WIDTH (( ( C_M_AXI_C_BUSER_WIDTH - 1 ) - ( 0 ) + 1 ))
) __rs_pt_C_drain_IO_L3_out_serialize_m_axi_C_BUSER_inst /**   Generated by RapidStream   **/ (
    .din  (m_axi_C_BUSER),
    .dout (__rs_pt_m_axi_C_BUSER)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_C_drain_IO_L3_out_serialize_m_axi_C_BVALID_inst /**   Generated by RapidStream   **/ (
    .din  (m_axi_C_BVALID),
    .dout (__rs_pt_m_axi_C_BVALID)
);

endmodule  // __rs_pt_C_drain_IO_L3_out_serialize_0_2