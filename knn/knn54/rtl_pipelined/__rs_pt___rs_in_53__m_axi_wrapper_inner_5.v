// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt___rs_in_53__m_axi_wrapper_inner_5 (
    input wire          Knn_inner_inst_in_53__m_axi_rst,
    input wire  [255:0] __rs_pt_Knn_inner_m_axi_in_53_RDATA,
    input wire  [  0:0] __rs_pt_Knn_inner_m_axi_in_53_RID,
    input wire          __rs_pt_Knn_inner_m_axi_in_53_RLAST,
    output wire         __rs_pt_Knn_inner_m_axi_in_53_RREADY,
    input wire  [  1:0] __rs_pt_Knn_inner_m_axi_in_53_RRESP,
    input wire          __rs_pt_Knn_inner_m_axi_in_53_RVALID,
    output wire [255:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_53_RDATA,
    output wire [  0:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_53_RID,
    output wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_53_RLAST,
    input wire          __rs_pt___rs_pt_Knn_inner_m_axi_in_53_RREADY,
    output wire [  1:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_53_RRESP,
    output wire         __rs_pt___rs_pt_Knn_inner_m_axi_in_53_RVALID,
    input wire          ap_clk
);




__rs_pass_through #(
    .WIDTH (256)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_RDATA_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_53_RDATA),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_RDATA)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_RID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_53_RID),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_RID)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_RLAST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_53_RLAST),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_RLAST)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_RREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_RREADY),
    .dout (__rs_pt_Knn_inner_m_axi_in_53_RREADY)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_RRESP_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_53_RRESP),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_RRESP)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_53__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_53_RVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_53_RVALID),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_53_RVALID)
);

endmodule  // __rs_pt___rs_in_53__m_axi_wrapper_inner_5