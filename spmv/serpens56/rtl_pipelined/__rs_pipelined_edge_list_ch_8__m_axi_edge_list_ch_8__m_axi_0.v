// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pipelined_edge_list_ch_8__m_axi_edge_list_ch_8__m_axi_0 (
    input wire  [ 63:0] Serpens_inner_inst_edge_list_ch_8__m_axi_offset,
    output wire         Serpens_inner_inst_edge_list_ch_8__m_axi_read_addr_full_n,
    output wire [255:0] Serpens_inner_inst_edge_list_ch_8__m_axi_read_data_dout,
    output wire         Serpens_inner_inst_edge_list_ch_8__m_axi_read_data_empty_n,
    input wire          Serpens_inner_inst_edge_list_ch_8__m_axi_read_data_read,
    input wire          Serpens_inner_inst_edge_list_ch_8__m_axi_rst,
    output wire         Serpens_inner_inst_edge_list_ch_8__m_axi_write_addr_full_n,
    output wire         Serpens_inner_inst_edge_list_ch_8__m_axi_write_data_full_n,
    output wire [  7:0] Serpens_inner_inst_edge_list_ch_8__m_axi_write_resp_dout,
    output wire         Serpens_inner_inst_edge_list_ch_8__m_axi_write_resp_empty_n,
    input wire          Serpens_inner_inst_edge_list_ch_8__m_axi_write_resp_read,
    input wire  [ 64:0] Serpens_inner_inst_read_A_8_A_read_addr_din,
    input wire          Serpens_inner_inst_read_A_8_A_read_addr_write,
    input wire  [ 64:0] Serpens_inner_inst_read_A_8_A_write_addr_din,
    input wire          Serpens_inner_inst_read_A_8_A_write_addr_write,
    input wire  [256:0] Serpens_inner_inst_read_A_8_A_write_data_din,
    input wire          Serpens_inner_inst_read_A_8_A_write_data_write,
    output wire [ 63:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARADDR,
    output wire [  1:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARBURST,
    output wire [  3:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARCACHE,
    output wire [  0:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARID,
    output wire [  7:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARLEN,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARLOCK,
    output wire [  2:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARPROT,
    output wire [  3:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARQOS,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARREADY,
    output wire [  2:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARSIZE,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARVALID,
    output wire [ 63:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWADDR,
    output wire [  1:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWBURST,
    output wire [  3:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWCACHE,
    output wire [  0:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWID,
    output wire [  7:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWLEN,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWLOCK,
    output wire [  2:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWPROT,
    output wire [  3:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWQOS,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWREADY,
    output wire [  2:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWSIZE,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWVALID,
    input wire  [  0:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_BID,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_BREADY,
    input wire  [  1:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_BRESP,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_BVALID,
    input wire  [255:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RDATA,
    input wire  [  0:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RID,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RLAST,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RREADY,
    input wire  [  1:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RRESP,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RVALID,
    output wire [255:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_WDATA,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_WLAST,
    input wire          __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_WREADY,
    output wire [ 31:0] __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_WSTRB,
    output wire         __rs_pt_Serpens_inner_m_axi_edge_list_ch_8_WVALID,
    input wire          ap_clk
);

wire [63:0] __rs_pipelined_Serpens_inner_inst_edge_list_ch_8__m_axi_offset;



edge_list_ch_8__m_axi _ (
    .Serpens_inner_inst_edge_list_ch_8__m_axi_offset             (__rs_pipelined_Serpens_inner_inst_edge_list_ch_8__m_axi_offset),
    .Serpens_inner_inst_edge_list_ch_8__m_axi_read_addr_full_n   (Serpens_inner_inst_edge_list_ch_8__m_axi_read_addr_full_n),
    .Serpens_inner_inst_edge_list_ch_8__m_axi_read_data_dout     (Serpens_inner_inst_edge_list_ch_8__m_axi_read_data_dout),
    .Serpens_inner_inst_edge_list_ch_8__m_axi_read_data_empty_n  (Serpens_inner_inst_edge_list_ch_8__m_axi_read_data_empty_n),
    .Serpens_inner_inst_edge_list_ch_8__m_axi_read_data_read     (Serpens_inner_inst_edge_list_ch_8__m_axi_read_data_read),
    .Serpens_inner_inst_edge_list_ch_8__m_axi_rst                (Serpens_inner_inst_edge_list_ch_8__m_axi_rst),
    .Serpens_inner_inst_edge_list_ch_8__m_axi_write_addr_full_n  (Serpens_inner_inst_edge_list_ch_8__m_axi_write_addr_full_n),
    .Serpens_inner_inst_edge_list_ch_8__m_axi_write_data_full_n  (Serpens_inner_inst_edge_list_ch_8__m_axi_write_data_full_n),
    .Serpens_inner_inst_edge_list_ch_8__m_axi_write_resp_dout    (Serpens_inner_inst_edge_list_ch_8__m_axi_write_resp_dout),
    .Serpens_inner_inst_edge_list_ch_8__m_axi_write_resp_empty_n (Serpens_inner_inst_edge_list_ch_8__m_axi_write_resp_empty_n),
    .Serpens_inner_inst_edge_list_ch_8__m_axi_write_resp_read    (Serpens_inner_inst_edge_list_ch_8__m_axi_write_resp_read),
    .Serpens_inner_inst_read_A_8_A_read_addr_din                 (Serpens_inner_inst_read_A_8_A_read_addr_din),
    .Serpens_inner_inst_read_A_8_A_read_addr_write               (Serpens_inner_inst_read_A_8_A_read_addr_write),
    .Serpens_inner_inst_read_A_8_A_write_addr_din                (Serpens_inner_inst_read_A_8_A_write_addr_din),
    .Serpens_inner_inst_read_A_8_A_write_addr_write              (Serpens_inner_inst_read_A_8_A_write_addr_write),
    .Serpens_inner_inst_read_A_8_A_write_data_din                (Serpens_inner_inst_read_A_8_A_write_data_din),
    .Serpens_inner_inst_read_A_8_A_write_data_write              (Serpens_inner_inst_read_A_8_A_write_data_write),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARADDR           (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARADDR),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARBURST          (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARBURST),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARCACHE          (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARCACHE),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARID             (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARID),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARLEN            (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARLEN),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARLOCK           (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARLOCK),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARPROT           (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARPROT),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARQOS            (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARQOS),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARREADY          (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARREADY),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARSIZE           (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARSIZE),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARVALID          (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_ARVALID),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWADDR           (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWADDR),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWBURST          (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWBURST),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWCACHE          (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWCACHE),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWID             (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWID),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWLEN            (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWLEN),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWLOCK           (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWLOCK),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWPROT           (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWPROT),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWQOS            (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWQOS),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWREADY          (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWREADY),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWSIZE           (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWSIZE),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWVALID          (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_AWVALID),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_BID              (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_BID),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_BREADY           (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_BREADY),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_BRESP            (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_BRESP),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_BVALID           (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_BVALID),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RDATA            (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RDATA),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RID              (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RID),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RLAST            (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RLAST),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RREADY           (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RREADY),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RRESP            (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RRESP),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RVALID           (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_RVALID),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_WDATA            (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_WDATA),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_WLAST            (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_WLAST),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_WREADY           (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_WREADY),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_WSTRB            (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_WSTRB),
    .__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_WVALID           (__rs_pt_Serpens_inner_m_axi_edge_list_ch_8_WVALID),
    .ap_clk                                                      (ap_clk)
);

(* RS_ROUTE="SLOT_X1Y1_TO_SLOT_X1Y1,SLOT_X0Y1_TO_SLOT_X0Y1" *)
__rs_ff_pipeline_2 #(
    .BODY_LEVEL      (2),
    .DATA_WIDTH      (64),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_1_REGION ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__HEAD_REGION   ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__TAIL_REGION   ("SLOT_X0Y1_TO_SLOT_X0Y1")
) ff_0 /**   Generated by RapidStream   **/ (
    .clk     (ap_clk),
    .if_din  ({ Serpens_inner_inst_edge_list_ch_8__m_axi_offset }),
    .if_dout ({ __rs_pipelined_Serpens_inner_inst_edge_list_ch_8__m_axi_offset })
);

endmodule  // __rs_pipelined_edge_list_ch_8__m_axi_edge_list_ch_8__m_axi_0