// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt___rs_in_16__m_axi_wrapper_inner_5 (
    input wire          Knn_inner_inst_in_16__m_axi_rst,
    input wire  [255:0] __rs_pt_Knn_inner_m_axi_in_16_RDATA,
    input wire  [  0:0] __rs_pt_Knn_inner_m_axi_in_16_RID,
    input wire          __rs_pt_Knn_inner_m_axi_in_16_RLAST,
    output wire         __rs_pt_Knn_inner_m_axi_in_16_RREADY,
    input wire  [  1:0] __rs_pt_Knn_inner_m_axi_in_16_RRESP,
    input wire          __rs_pt_Knn_inner_m_axi_in_16_RVALID,
    output wire [255:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_16_RDATA,
    output wire [  0:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_16_RID,
    output wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_16_RLAST,
    input wire          __rs_pt___rs_pt_Knn_inner_m_axi_in_16_RREADY,
    output wire [  1:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_16_RRESP,
    output wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_16_RVALID,
    input wire          ap_clk
);




__rs_pass_through #(
    .WIDTH (256)
) __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RDATA_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_16_RDATA),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_16_RDATA)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_16_RID),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_16_RID)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RLAST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_16_RLAST),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_16_RLAST)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_16_RREADY),
    .dout (__rs_pt_Knn_inner_m_axi_in_16_RREADY)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RRESP_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_16_RRESP),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_16_RRESP)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_16__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_16_RVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_16_RVALID),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_16_RVALID)
);

endmodule  // __rs_pt___rs_in_16__m_axi_wrapper_inner_5