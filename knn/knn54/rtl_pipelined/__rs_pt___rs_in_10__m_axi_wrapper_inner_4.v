// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt___rs_in_10__m_axi_wrapper_inner_4 (
    input wire        Knn_inner_inst_in_10__m_axi_rst,
    input wire  [0:0] __rs_pt_Knn_inner_m_axi_in_10_BID,
    output wire       __rs_pt_Knn_inner_m_axi_in_10_BREADY,
    input wire  [1:0] __rs_pt_Knn_inner_m_axi_in_10_BRESP,
    input wire        __rs_pt_Knn_inner_m_axi_in_10_BVALID,
    output wire [0:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_10_BID,
    input wire        __rs_pt___rs_pt_Knn_inner_m_axi_in_10_BREADY,
    output wire [1:0] __rs_pt___rs_pt_Knn_inner_m_axi_in_10_BRESP,
    output wire       __rs_pt___rs_pt_Knn_inner_m_axi_in_10_BVALID,
    input wire        ap_clk
);




__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_10__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_10_BID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_10_BID),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_10_BID)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_10__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_10_BREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt___rs_pt_Knn_inner_m_axi_in_10_BREADY),
    .dout (__rs_pt_Knn_inner_m_axi_in_10_BREADY)
);


__rs_pass_through #(
    .WIDTH (2)
) __rs_pt___rs_in_10__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_10_BRESP_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_10_BRESP),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_10_BRESP)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt___rs_in_10__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_in_10_BVALID_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_Knn_inner_m_axi_in_10_BVALID),
    .dout (__rs_pt___rs_pt_Knn_inner_m_axi_in_10_BVALID)
);

endmodule  // __rs_pt___rs_in_10__m_axi_wrapper_inner_4