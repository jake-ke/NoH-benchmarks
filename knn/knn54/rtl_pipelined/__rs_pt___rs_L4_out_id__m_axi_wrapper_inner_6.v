// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt___rs_L4_out_id__m_axi_wrapper_inner_6 (
    input wire         Knn_inner_inst_L4_out_id__m_axi_rst,
    input wire  [31:0] __rs_pt_Knn_inner_m_axi_L4_out_id_RDATA,
    input wire  [ 0:0] __rs_pt_Knn_inner_m_axi_L4_out_id_RID,
    input wire         __rs_pt_Knn_inner_m_axi_L4_out_id_RLAST,
    output wire        __rs_pt_Knn_inner_m_axi_L4_out_id_RREADY,
    input wire  [ 1:0] __rs_pt_Knn_inner_m_axi_L4_out_id_RRESP,
    input wire         __rs_pt_Knn_inner_m_axi_L4_out_id_RVALID,
    output wire [31:0] __rs_pt___rs_pt_Knn_inner_m_axi_L4_out_id_RDATA,
    output wire [ 0:0] __rs_pt___rs_pt_Knn_inner_m_axi_L4_out_id_RID,
    output wire        __rs_pt___rs_pt_Knn_inner_m_axi_L4_out_id_RLAST,
    input wire         __rs_pt___rs_pt_Knn_inner_m_axi_L4_out_id_RREADY,
    output wire [ 1:0] __rs_pt___rs_pt_Knn_inner_m_axi_L4_out_id_RRESP,
    output wire        __rs_pt___rs_pt_Knn_inner_m_axi_L4_out_id_RVALID,
    input wire         ap_clk
);




__rs_pass_through #(
    .WIDTH (32)
) __rs_pt___rs_L4_out_id__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_id_RDATA_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_L4_out_id_RDATA),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_id_RDATA)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_L4_out_id__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_id_RID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_L4_out_id_RID),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_id_RID)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_L4_out_id__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_id_RLAST_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_L4_out_id_RLAST),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_id_RLAST)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_L4_out_id__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_id_RREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_id_RREADY),
    .dout (__rs_pt_Knn_inner_m_axi_L4_out_id_RREADY)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt___rs_L4_out_id__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_id_RRESP_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_L4_out_id_RRESP),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_id_RRESP)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_L4_out_id__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_id_RVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_L4_out_id_RVALID),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_L4_out_id_RVALID)
);

endmodule  // __rs_pt___rs_L4_out_id__m_axi_wrapper_inner_6