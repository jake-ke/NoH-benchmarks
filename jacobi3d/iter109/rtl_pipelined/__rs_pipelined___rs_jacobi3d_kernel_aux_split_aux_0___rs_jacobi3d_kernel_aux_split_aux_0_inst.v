// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pipelined___rs_jacobi3d_kernel_aux_split_aux_0___rs_jacobi3d_kernel_aux_split_aux_0_inst #(
    parameter C_S_AXI_CONTROL_DATA_WIDTH  = 32,
    parameter C_S_AXI_CONTROL_ADDR_WIDTH  = 6,
    parameter C_S_AXI_DATA_WIDTH          = 32,
    parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 4,
    parameter C_S_AXI_WSTRB_WIDTH         = 4
) (
    output wire        BurstRead_floatx16_0_ap_clk,
    input wire         BurstRead_floatx16_0_ap_done,
    input wire         BurstRead_floatx16_0_ap_idle,
    input wire         BurstRead_floatx16_0_ap_ready,
    output wire        BurstRead_floatx16_0_ap_rst_n,
    output wire        BurstRead_floatx16_0_ap_start,
    output wire [63:0] BurstRead_floatx16_0_n,
    output wire [63:0] BurstRead_floatx16_0_src_read_addr_offset,
    output wire [63:0] BurstRead_floatx16_0_src_write_addr_offset,
    input wire  [63:0] __tapa_fsm_unit_BurstRead_floatx16_0___bank_0_t1__q0,
    input wire  [63:0] __tapa_fsm_unit_BurstRead_floatx16_0___coalesced_data_num__q0,
    output wire        __tapa_fsm_unit_BurstRead_floatx16_0__ap_done,
    output wire        __tapa_fsm_unit_BurstRead_floatx16_0__ap_idle,
    output wire        __tapa_fsm_unit_BurstRead_floatx16_0__ap_ready,
    input wire         __tapa_fsm_unit_BurstRead_floatx16_0__ap_start,
    output wire        __tapa_fsm_unit_ap_clk,
    output wire        __tapa_fsm_unit_ap_rst_n,
    input wire         ap_clk,
    input wire         ap_rst_n
);

wire        __rs_pipelined_ap_rst_n;



__rs_jacobi3d_kernel_aux_split_aux_0 #(
    .C_S_AXI_CONTROL_ADDR_WIDTH  (C_S_AXI_CONTROL_ADDR_WIDTH),
    .C_S_AXI_CONTROL_DATA_WIDTH  (C_S_AXI_CONTROL_DATA_WIDTH),
    .C_S_AXI_CONTROL_WSTRB_WIDTH (C_S_AXI_CONTROL_WSTRB_WIDTH),
    .C_S_AXI_DATA_WIDTH          (C_S_AXI_DATA_WIDTH),
    .C_S_AXI_WSTRB_WIDTH         (C_S_AXI_WSTRB_WIDTH)
) _ (
    .BurstRead_floatx16_0_ap_clk                                   (BurstRead_floatx16_0_ap_clk),
    .BurstRead_floatx16_0_ap_done                                  (BurstRead_floatx16_0_ap_done),
    .BurstRead_floatx16_0_ap_idle                                  (BurstRead_floatx16_0_ap_idle),
    .BurstRead_floatx16_0_ap_ready                                 (BurstRead_floatx16_0_ap_ready),
    .BurstRead_floatx16_0_ap_rst_n                                 (BurstRead_floatx16_0_ap_rst_n),
    .BurstRead_floatx16_0_ap_start                                 (BurstRead_floatx16_0_ap_start),
    .BurstRead_floatx16_0_n                                        (BurstRead_floatx16_0_n),
    .BurstRead_floatx16_0_src_read_addr_offset                     (BurstRead_floatx16_0_src_read_addr_offset),
    .BurstRead_floatx16_0_src_write_addr_offset                    (BurstRead_floatx16_0_src_write_addr_offset),
    .__tapa_fsm_unit_BurstRead_floatx16_0___bank_0_t1__q0          (__tapa_fsm_unit_BurstRead_floatx16_0___bank_0_t1__q0),
    .__tapa_fsm_unit_BurstRead_floatx16_0___coalesced_data_num__q0 (__tapa_fsm_unit_BurstRead_floatx16_0___coalesced_data_num__q0),
    .__tapa_fsm_unit_BurstRead_floatx16_0__ap_done                 (__tapa_fsm_unit_BurstRead_floatx16_0__ap_done),
    .__tapa_fsm_unit_BurstRead_floatx16_0__ap_idle                 (__tapa_fsm_unit_BurstRead_floatx16_0__ap_idle),
    .__tapa_fsm_unit_BurstRead_floatx16_0__ap_ready                (__tapa_fsm_unit_BurstRead_floatx16_0__ap_ready),
    .__tapa_fsm_unit_BurstRead_floatx16_0__ap_start                (__tapa_fsm_unit_BurstRead_floatx16_0__ap_start),
    .__tapa_fsm_unit_ap_clk                                        (__tapa_fsm_unit_ap_clk),
    .__tapa_fsm_unit_ap_rst_n                                      (__tapa_fsm_unit_ap_rst_n),
    .ap_clk                                                        (ap_clk),
    .ap_rst_n                                                      (__rs_pipelined_ap_rst_n)
);

(* RS_ROUTE="SLOT_X1Y2_TO_SLOT_X1Y2,SLOT_X1Y1_TO_SLOT_X1Y1,SLOT_X1Y0_TO_SLOT_X1Y0,SLOT_X0Y0_TO_SLOT_X0Y0" *)
__rs_ff_pipeline_6 #(
    .BODY_LEVEL      (6),
    .DATA_WIDTH      (1),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_1_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_2_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_3_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_4_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_5_REGION ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__HEAD_REGION   ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__TAIL_REGION   ("SLOT_X0Y0_TO_SLOT_X0Y0")
) ff_0 /**   Generated by RapidStream   **/ (
    .clk     (ap_clk),
    .if_din  ({ ap_rst_n }),
    .if_dout ({ __rs_pipelined_ap_rst_n })
);

endmodule  // __rs_pipelined___rs_jacobi3d_kernel_aux_split_aux_0___rs_jacobi3d_kernel_aux_split_aux_0_inst