// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pipelined_jacobi3d_kernel_control_s_axi_control_s_axi_U #(
    parameter C_S_AXI_ADDR_WIDTH             = 6,
    parameter C_S_AXI_DATA_WIDTH             = 32,
    parameter ADDR_AP_CTRL                   = 6'h00,
    parameter ADDR_GIE                       = 6'h04,
    parameter ADDR_IER                       = 6'h08,
    parameter ADDR_ISR                       = 6'h0c,
    parameter ADDR_BANK_1_T0_DATA_0          = 6'h10,
    parameter ADDR_BANK_1_T0_DATA_1          = 6'h14,
    parameter ADDR_BANK_1_T0_CTRL            = 6'h18,
    parameter ADDR_BANK_0_T1_DATA_0          = 6'h1c,
    parameter ADDR_BANK_0_T1_DATA_1          = 6'h20,
    parameter ADDR_BANK_0_T1_CTRL            = 6'h24,
    parameter ADDR_COALESCED_DATA_NUM_DATA_0 = 6'h28,
    parameter ADDR_COALESCED_DATA_NUM_DATA_1 = 6'h2c,
    parameter ADDR_COALESCED_DATA_NUM_CTRL   = 6'h30,
    parameter WRIDLE                         = 2'd0,
    parameter WRDATA                         = 2'd1,
    parameter WRRESP                         = 2'd2,
    parameter WRRESET                        = 2'd3,
    parameter RDIDLE                         = 2'd0,
    parameter RDDATA                         = 2'd1,
    parameter RDRESET                        = 2'd2,
    parameter ADDR_BITS                      = 6
) (
    input wire                                   ACLK,
    input wire                                   ACLK_EN,
    input wire  [    (C_S_AXI_ADDR_WIDTH - 1):0] ARADDR,
    input wire                                   ARESET,
    output wire                                  ARREADY,
    input wire                                   ARVALID,
    input wire  [    (C_S_AXI_ADDR_WIDTH - 1):0] AWADDR,
    output wire                                  AWREADY,
    input wire                                   AWVALID,
    input wire                                   BREADY,
    output wire [                           1:0] BRESP,
    output wire                                  BVALID,
    output wire [    (C_S_AXI_DATA_WIDTH - 1):0] RDATA,
    input wire                                   RREADY,
    output wire [                           1:0] RRESP,
    output wire                                  RVALID,
    input wire  [    (C_S_AXI_DATA_WIDTH - 1):0] WDATA,
    output wire                                  WREADY,
    input wire  [(C_S_AXI_DATA_WIDTH / 8 - 1):0] WSTRB,
    input wire                                   WVALID,
    input wire                                   ap_done,
    input wire                                   ap_idle,
    input wire                                   ap_ready,
    output wire                                  ap_start,
    output wire [                          63:0] bank_0_t1,
    output wire [                          63:0] bank_1_t0,
    output wire [                          63:0] coalesced_data_num,
    output wire                                  interrupt
);

wire        __rs_pipelined_ARESET;



jacobi3d_kernel_control_s_axi #(
    .C_S_AXI_ADDR_WIDTH (C_S_AXI_ADDR_WIDTH),
    .C_S_AXI_DATA_WIDTH (C_S_AXI_DATA_WIDTH)
) _ /**   control_s_axi_U   **/ (
    .ACLK               (ACLK),
    .ACLK_EN            ( 1'b1),
    .ARADDR             (ARADDR),
    .ARESET             (__rs_pipelined_ARESET),
    .ARREADY            (ARREADY),
    .ARVALID            (ARVALID),
    .AWADDR             (AWADDR),
    .AWREADY            (AWREADY),
    .AWVALID            (AWVALID),
    .BREADY             (BREADY),
    .BRESP              (BRESP),
    .BVALID             (BVALID),
    .RDATA              (RDATA),
    .RREADY             (RREADY),
    .RRESP              (RRESP),
    .RVALID             (RVALID),
    .WDATA              (WDATA),
    .WREADY             (WREADY),
    .WSTRB              (WSTRB),
    .WVALID             (WVALID),
    .ap_done            (ap_done),
    .ap_idle            (ap_idle),
    .ap_ready           (ap_ready),
    .ap_start           (ap_start),
    .bank_0_t1          (bank_0_t1),
    .bank_1_t0          (bank_1_t0),
    .coalesced_data_num (coalesced_data_num),
    .interrupt          (interrupt)
);

(* RS_ROUTE="SLOT_X1Y2_TO_SLOT_X1Y2,SLOT_X1Y1_TO_SLOT_X1Y1,SLOT_X0Y1_TO_SLOT_X0Y1,SLOT_X0Y0_TO_SLOT_X0Y0" *)
__rs_ff_pipeline_6 #(
    .BODY_LEVEL      (6),
    .DATA_WIDTH      (1),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__BODY_1_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_2_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_3_REGION ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_4_REGION ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_5_REGION ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__HEAD_REGION   ("SLOT_X1Y2_TO_SLOT_X1Y2"),
    .__TAIL_REGION   ("SLOT_X0Y0_TO_SLOT_X0Y0")
) ff_0 /**   Generated by RapidStream   **/ (
    .clk     (ACLK),
    .if_din  ({ ARESET }),
    .if_dout ({ __rs_pipelined_ARESET })
);

endmodule  // __rs_pipelined_jacobi3d_kernel_control_s_axi_control_s_axi_U