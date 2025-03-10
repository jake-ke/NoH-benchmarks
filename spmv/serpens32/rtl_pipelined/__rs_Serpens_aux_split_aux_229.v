// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
module __rs_Serpens_aux_split_aux_229 #(
    parameter C_S_AXI_CONTROL_DATA_WIDTH  = 32,
    parameter C_S_AXI_CONTROL_ADDR_WIDTH  = 9,
    parameter C_S_AXI_DATA_WIDTH          = 32,
    parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 4,
    parameter C_S_AXI_WSTRB_WIDTH         = 4
) (
    output wire        __tapa_fsm_unit_ap_clk,
    output wire        __tapa_fsm_unit_ap_rst_n,
    input wire  [31:0] __tapa_fsm_unit_read_A_31___NUM_A_LEN__q0,
    input wire  [31:0] __tapa_fsm_unit_read_A_31___P_N__q0,
    input wire  [63:0] __tapa_fsm_unit_read_A_31___edge_list_ch_31__q0,
    output wire        __tapa_fsm_unit_read_A_31__ap_done,
    output wire        __tapa_fsm_unit_read_A_31__ap_idle,
    output wire        __tapa_fsm_unit_read_A_31__ap_ready,
    input wire         __tapa_fsm_unit_read_A_31__ap_start,
    input wire         ap_clk,
    input wire         ap_rst_n,
    output wire [31:0] read_A_31_A_len,
    output wire [63:0] read_A_31_A_read_addr_offset,
    output wire [63:0] read_A_31_A_write_addr_offset,
    output wire [31:0] read_A_31_P_N,
    output wire        read_A_31_ap_clk,
    input wire         read_A_31_ap_done,
    input wire         read_A_31_ap_idle,
    input wire         read_A_31_ap_ready,
    output wire        read_A_31_ap_rst_n,
    output wire        read_A_31_ap_start
);




__rs_Serpens_aux #(
    .C_S_AXI_CONTROL_ADDR_WIDTH  (C_S_AXI_CONTROL_ADDR_WIDTH),
    .C_S_AXI_CONTROL_DATA_WIDTH  (C_S_AXI_CONTROL_DATA_WIDTH),
    .C_S_AXI_CONTROL_WSTRB_WIDTH (C_S_AXI_CONTROL_WSTRB_WIDTH),
    .C_S_AXI_DATA_WIDTH          (C_S_AXI_DATA_WIDTH),
    .C_S_AXI_WSTRB_WIDTH         (C_S_AXI_WSTRB_WIDTH)
) __rs_Serpens_aux_0 (
    .__tapa_fsm_unit_ap_clk                          (__tapa_fsm_unit_ap_clk),
    .__tapa_fsm_unit_ap_rst_n                        (__tapa_fsm_unit_ap_rst_n),
    .__tapa_fsm_unit_read_A_31___NUM_A_LEN__q0       (__tapa_fsm_unit_read_A_31___NUM_A_LEN__q0),
    .__tapa_fsm_unit_read_A_31___P_N__q0             (__tapa_fsm_unit_read_A_31___P_N__q0),
    .__tapa_fsm_unit_read_A_31___edge_list_ch_31__q0 (__tapa_fsm_unit_read_A_31___edge_list_ch_31__q0),
    .__tapa_fsm_unit_read_A_31__ap_done              (__tapa_fsm_unit_read_A_31__ap_done),
    .__tapa_fsm_unit_read_A_31__ap_idle              (__tapa_fsm_unit_read_A_31__ap_idle),
    .__tapa_fsm_unit_read_A_31__ap_ready             (__tapa_fsm_unit_read_A_31__ap_ready),
    .__tapa_fsm_unit_read_A_31__ap_start             (__tapa_fsm_unit_read_A_31__ap_start),
    .ap_clk                                          (ap_clk),
    .ap_rst_n                                        (ap_rst_n),
    .read_A_31_A_len                                 (read_A_31_A_len),
    .read_A_31_A_read_addr_offset                    (read_A_31_A_read_addr_offset),
    .read_A_31_A_write_addr_offset                   (read_A_31_A_write_addr_offset),
    .read_A_31_P_N                                   (read_A_31_P_N),
    .read_A_31_ap_clk                                (read_A_31_ap_clk),
    .read_A_31_ap_done                               (read_A_31_ap_done),
    .read_A_31_ap_idle                               (read_A_31_ap_idle),
    .read_A_31_ap_ready                              (read_A_31_ap_ready),
    .read_A_31_ap_rst_n                              (read_A_31_ap_rst_n),
    .read_A_31_ap_start                              (read_A_31_ap_start)
);

endmodule  // __rs_Serpens_aux_split_aux_229