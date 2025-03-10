// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module L4_out_dist__m_axi (
    input wire         Knn_inner_inst_L4_out_dist__m_axi_rst,
    output wire [ 1:0] _L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARBURSTcfe,
    output wire [ 3:0] _L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARCACHE590,
    input wire         _L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARREADY0e4,
    output wire        _L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARVALID0ff,
    output wire [ 1:0] _L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWBURSTa86,
    output wire [ 3:0] _L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWCACHEb58,
    input wire         _L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWREADYd3c,
    output wire        _L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWVALIDfd7,
    output wire [63:0] __L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARADDR26e,
    output wire        __L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARLOCK3be,
    output wire [ 2:0] __L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARPROT314,
    output wire [ 2:0] __L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARSIZEc28,
    output wire [63:0] __L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWADDRfe0,
    output wire        __L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWLOCK31e,
    output wire [ 2:0] __L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWPROTbe2,
    output wire [ 2:0] __L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWSIZEb3c,
    output wire        __L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BREADYd89,
    input wire         __L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BVALID3c9,
    output wire        __L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RREADYaed,
    input wire         __L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RVALID519,
    input wire         __L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WREADY53f,
    output wire        __L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WVALIDa1e,
    output wire [ 7:0] __dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_resp_dout49f,
    input wire         __dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_resp_read1a1,
    input wire         __inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_writef56,
    input wire  [ 0:0] __rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BID0e8,
    input wire  [ 0:0] __rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RID0bd,
    input wire  [63:0] _er_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_dinc88,
    input wire         _er_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_write9a8,
    output wire        _ist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_addr_full_n81f,
    output wire        _ist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_data_full_n9c5,
    input wire  [32:0] _pper_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_dinaab,
    output wire [ 0:0] _rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARID436,
    output wire [ 0:0] _rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWID92f,
    output wire [ 7:0] _s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARLEN1a4,
    output wire [ 3:0] _s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARQOSc2c,
    output wire [ 7:0] _s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWLENa00,
    output wire [ 3:0] _s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWQOS3f7,
    input wire  [ 1:0] _s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BRESP329,
    input wire  [31:0] _s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RDATAccf,
    input wire         _s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RLAST293,
    input wire  [ 1:0] _s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RRESP2a3,
    output wire [31:0] _s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WDATA6e2,
    output wire        _s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WLAST345,
    output wire [ 3:0] _s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WSTRBb44,
    output wire        _st__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_resp_empty_nc10,
    input wire         ap_clk
);




async_mmap #(
    .AddrWidth         (64),
    .BurstLenWidth     (9),
    .DataWidth         (32),
    .DataWidthBytesLog (2),
    .MaxBurstLen       (255),
    .MaxWaitTime       (3),
    .WaitTimeWidth     (2)
) L4_out_dist__m_axi (
    .clk                (ap_clk),
    .m_axi_ARADDR       (__L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARADDR26e),
    .m_axi_ARBURST      (_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARBURSTcfe),
    .m_axi_ARCACHE      (_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARCACHE590),
    .m_axi_ARID         (_rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARID436),
    .m_axi_ARLEN        (_s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARLEN1a4),
    .m_axi_ARLOCK       (__L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARLOCK3be),
    .m_axi_ARPROT       (__L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARPROT314),
    .m_axi_ARQOS        (_s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARQOSc2c),
    .m_axi_ARREADY      (_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARREADY0e4),
    .m_axi_ARSIZE       (__L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARSIZEc28),
    .m_axi_ARVALID      (_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_ARVALID0ff),
    .m_axi_AWADDR       (__L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWADDRfe0),
    .m_axi_AWBURST      (_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWBURSTa86),
    .m_axi_AWCACHE      (_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWCACHEb58),
    .m_axi_AWID         (_rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWID92f),
    .m_axi_AWLEN        (_s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWLENa00),
    .m_axi_AWLOCK       (__L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWLOCK31e),
    .m_axi_AWPROT       (__L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWPROTbe2),
    .m_axi_AWQOS        (_s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWQOS3f7),
    .m_axi_AWREADY      (_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWREADYd3c),
    .m_axi_AWSIZE       (__L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWSIZEb3c),
    .m_axi_AWVALID      (_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_AWVALIDfd7),
    .m_axi_BID          (__rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BID0e8),
    .m_axi_BREADY       (__L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BREADYd89),
    .m_axi_BRESP        (_s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BRESP329),
    .m_axi_BVALID       (__L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_BVALID3c9),
    .m_axi_RDATA        (_s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RDATAccf),
    .m_axi_RID          (__rs_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RID0bd),
    .m_axi_RLAST        (_s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RLAST293),
    .m_axi_RREADY       (__L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RREADYaed),
    .m_axi_RRESP        (_s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RRESP2a3),
    .m_axi_RVALID       (__L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_RVALID519),
    .m_axi_WDATA        (_s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WDATA6e2),
    .m_axi_WLAST        (_s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WLAST345),
    .m_axi_WREADY       (__L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WREADY53f),
    .m_axi_WSTRB        (_s_L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WSTRBb44),
    .m_axi_WVALID       (__L4_out_dist__m_axi_wrapper_inner___rs_pt_Knn_inner_m_axi_L4_out_dist_WVALIDa1e),
    .read_addr_write    (1'b0),
    .read_data_read     (1'b0),
    .rst                (Knn_inner_inst_L4_out_dist__m_axi_rst),
    .write_addr_din     (_er_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_dinc88),
    .write_addr_full_n  (_ist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_addr_full_n81f),
    .write_addr_write   (__inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_addr_s_writef56),
    .write_data_din     (_pper_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_dinaab),
    .write_data_full_n  (_ist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_data_full_n9c5),
    .write_data_write   (_er_inner_Knn_inner_inst_krnl_globalSort_L3_0_output_knnDist_write_data_write9a8),
    .write_resp_dout    (__dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_resp_dout49f),
    .write_resp_empty_n (_st__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_resp_empty_nc10),
    .write_resp_read    (__dist__m_axi_wrapper_inner_Knn_inner_inst_L4_out_dist__m_axi_write_resp_read1a1)
);

endmodule  // L4_out_dist__m_axi