// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt___rs_in_6__m_axi_wrapper_inner_5 (
    input wire          Knn_inner_inst_in_6__m_axi_rst,
    input wire  [255:0] __rs_pt_Knn_inner_m_axi_in_6_RDATA,
    input wire  [  0:0] __rs_pt_Knn_inner_m_axi_in_6_RID,
    input wire          __rs_pt_Knn_inner_m_axi_in_6_RLAST,
    output wire         __rs_pt_Knn_inner_m_axi_in_6_RREADY,
    input wire  [  1:0] __rs_pt_Knn_inner_m_axi_in_6_RRESP,
    input wire          __rs_pt_Knn_inner_m_axi_in_6_RVALID,
    output wire [255:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_6_RDATA,
    output wire [  0:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_6_RID,
    output wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_6_RLAST,
    input wire          __rs_pt___rs_pt_Knn_inner_m_axi_in_6_RREADY,
    output wire [  1:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_6_RRESP,
    output wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_6_RVALID,
    input wire          ap_clk
);




__rs_pass_through #(
    .WIDTH (256)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_RDATA_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_6_RDATA),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_RDATA)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_RID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_6_RID),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_RID)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_RLAST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_6_RLAST),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_RLAST)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_RREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_RREADY),
    .dout (__rs_pt_Knn_inner_m_axi_in_6_RREADY)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_RRESP_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_6_RRESP),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_RRESP)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_6__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_6_RVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_6_RVALID),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_6_RVALID)
);

endmodule  // __rs_pt___rs_in_6__m_axi_wrapper_inner_5