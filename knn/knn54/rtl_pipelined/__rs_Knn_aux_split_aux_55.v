// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
module __rs_Knn_aux_split_aux_55 #(
    parameter C_S_AXI_CONTROL_DATA_WIDTH  = 32,
    parameter C_S_AXI_CONTROL_ADDR_WIDTH  = 10,
    parameter C_S_AXI_DATA_WIDTH          = 32,
    parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 4,
    parameter C_S_AXI_WSTRB_WIDTH         = 4
) (
    input wire  [7:0] L4_out_id__m_axi_write_resp_dout,
    input wire        L4_out_id__m_axi_write_resp_empty_n,
    output wire       L4_out_id__m_axi_write_resp_read,
    output wire [8:0] krnl_globalSort_L3_0_output_knnId_write_resp_peek_dout,
    output wire       krnl_globalSort_L3_0_output_knnId_write_resp_peek_empty_n,
    input wire        krnl_globalSort_L3_0_output_knnId_write_resp_peek_read,
    output wire [8:0] krnl_globalSort_L3_0_output_knnId_write_resp_s_dout,
    output wire       krnl_globalSort_L3_0_output_knnId_write_resp_s_empty_n,
    input wire        krnl_globalSort_L3_0_output_knnId_write_resp_s_read
);




__rs_Knn_aux #(
    .C_S_AXI_CONTROL_ADDR_WIDTH  (C_S_AXI_CONTROL_ADDR_WIDTH),
    .C_S_AXI_CONTROL_DATA_WIDTH  (C_S_AXI_CONTROL_DATA_WIDTH),
    .C_S_AXI_CONTROL_WSTRB_WIDTH (C_S_AXI_CONTROL_WSTRB_WIDTH),
    .C_S_AXI_DATA_WIDTH          (C_S_AXI_DATA_WIDTH),
    .C_S_AXI_WSTRB_WIDTH         (C_S_AXI_WSTRB_WIDTH)
) __rs_Knn_aux_0 (
    .L4_out_id__m_axi_write_resp_dout                          (L4_out_id__m_axi_write_resp_dout),
    .L4_out_id__m_axi_write_resp_empty_n                       (L4_out_id__m_axi_write_resp_empty_n),
    .L4_out_id__m_axi_write_resp_read                          (L4_out_id__m_axi_write_resp_read),
    .krnl_globalSort_L3_0_output_knnId_write_resp_peek_dout    (krnl_globalSort_L3_0_output_knnId_write_resp_peek_dout),
    .krnl_globalSort_L3_0_output_knnId_write_resp_peek_empty_n (krnl_globalSort_L3_0_output_knnId_write_resp_peek_empty_n),
    .krnl_globalSort_L3_0_output_knnId_write_resp_peek_read    (krnl_globalSort_L3_0_output_knnId_write_resp_peek_read),
    .krnl_globalSort_L3_0_output_knnId_write_resp_s_dout       (krnl_globalSort_L3_0_output_knnId_write_resp_s_dout),
    .krnl_globalSort_L3_0_output_knnId_write_resp_s_empty_n    (krnl_globalSort_L3_0_output_knnId_write_resp_s_empty_n),
    .krnl_globalSort_L3_0_output_knnId_write_resp_s_read       (krnl_globalSort_L3_0_output_knnId_write_resp_s_read)
);

endmodule  // __rs_Knn_aux_split_aux_55