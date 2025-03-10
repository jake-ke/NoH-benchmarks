// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pipelined_kernel0_control_s_axi_control_s_axi_U #(
    parameter C_S_AXI_ADDR_WIDTH = 6,
    parameter C_S_AXI_DATA_WIDTH = 32,
    parameter ADDR_AP_CTRL       = 6'h00,
    parameter ADDR_GIE           = 6'h04,
    parameter ADDR_IER           = 6'h08,
    parameter ADDR_ISR           = 6'h0c,
    parameter ADDR_A_DATA_0      = 6'h10,
    parameter ADDR_A_DATA_1      = 6'h14,
    parameter ADDR_A_CTRL        = 6'h18,
    parameter ADDR_B_DATA_0      = 6'h1c,
    parameter ADDR_B_DATA_1      = 6'h20,
    parameter ADDR_B_CTRL        = 6'h24,
    parameter ADDR_C_DATA_0      = 6'h28,
    parameter ADDR_C_DATA_1      = 6'h2c,
    parameter ADDR_C_CTRL        = 6'h30,
    parameter WRIDLE             = 2'd0,
    parameter WRDATA             = 2'd1,
    parameter WRRESP             = 2'd2,
    parameter WRRESET            = 2'd3,
    parameter RDIDLE             = 2'd0,
    parameter RDDATA             = 2'd1,
    parameter RDRESET            = 2'd2,
    parameter ADDR_BITS          = 6
) (
    output wire [                          63:0] A,
    input wire                                   ACLK,
    input wire                                   ACLK_EN,
    input wire  [    (C_S_AXI_ADDR_WIDTH - 1):0] ARADDR,
    input wire                                   ARESET,
    output wire                                  ARREADY,
    input wire                                   ARVALID,
    input wire  [    (C_S_AXI_ADDR_WIDTH - 1):0] AWADDR,
    output wire                                  AWREADY,
    input wire                                   AWVALID,
    output wire [                          63:0] B,
    input wire                                   BREADY,
    output wire [                           1:0] BRESP,
    output wire                                  BVALID,
    output wire [                          63:0] C,
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
    output wire                                  interrupt
);

wire [    (C_S_AXI_ADDR_WIDTH - 1):0] __rs_pipelined_ARADDR;
wire                                  __rs_pipelined_ARESET;
wire                                  __rs_pipelined_ARREADY;
wire                                  __rs_pipelined_ARVALID;
wire [    (C_S_AXI_ADDR_WIDTH - 1):0] __rs_pipelined_AWADDR;
wire                                  __rs_pipelined_AWREADY;
wire                                  __rs_pipelined_AWVALID;
wire [    (C_S_AXI_DATA_WIDTH - 1):0] __rs_pipelined_WDATA;
wire                                  __rs_pipelined_WREADY;
wire [(C_S_AXI_DATA_WIDTH / 8 - 1):0] __rs_pipelined_WSTRB;
wire                                  __rs_pipelined_WVALID;



kernel0_control_s_axi #(
    .C_S_AXI_ADDR_WIDTH (C_S_AXI_ADDR_WIDTH),
    .C_S_AXI_DATA_WIDTH (C_S_AXI_DATA_WIDTH)
) _ /**   control_s_axi_U   **/ (
    .A         (A),
    .ACLK      (ACLK),
    .ACLK_EN   ( 1'b1),
    .ARADDR    (__rs_pipelined_ARADDR),
    .ARESET    (__rs_pipelined_ARESET),
    .ARREADY   (__rs_pipelined_ARREADY),
    .ARVALID   (__rs_pipelined_ARVALID),
    .AWADDR    (__rs_pipelined_AWADDR),
    .AWREADY   (__rs_pipelined_AWREADY),
    .AWVALID   (__rs_pipelined_AWVALID),
    .B         (B),
    .BREADY    (BREADY),
    .BRESP     (BRESP),
    .BVALID    (BVALID),
    .C         (C),
    .RDATA     (RDATA),
    .RREADY    (RREADY),
    .RRESP     (RRESP),
    .RVALID    (RVALID),
    .WDATA     (__rs_pipelined_WDATA),
    .WREADY    (__rs_pipelined_WREADY),
    .WSTRB     (__rs_pipelined_WSTRB),
    .WVALID    (__rs_pipelined_WVALID),
    .ap_done   (ap_done),
    .ap_idle   (ap_idle),
    .ap_ready  (ap_ready),
    .ap_start  (ap_start),
    .interrupt (interrupt)
);

(* RS_ROUTE="SLOT_X0Y0_TO_SLOT_X0Y0,SLOT_X0Y1_TO_SLOT_X0Y1" *)
__rs_ff_pipeline_2 #(
    .BODY_LEVEL      (2),
    .DATA_WIDTH      (1),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__BODY_1_REGION ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__HEAD_REGION   ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__TAIL_REGION   ("SLOT_X0Y1_TO_SLOT_X0Y1")
) ff_0 /**   Generated by RapidStream   **/ (
    .clk     (ACLK),
    .if_din  ({ ARESET }),
    .if_dout ({ __rs_pipelined_ARESET })
);

(* RS_ROUTE="SLOT_X0Y0_TO_SLOT_X0Y0,SLOT_X0Y1_TO_SLOT_X0Y1" *)
__rs_hs_pipeline_2 #(
    .BODY_LEVEL                      (2),
    .DATA_WIDTH                      (( ( ( ( C_S_AXI_ADDR_WIDTH - 1 ) - ( 0 ) + 1 ) ) + 0 )),
    .DEPTH                           (8),
    .EXTRA_PIPELINE_BEFORE_TAIL      (0),
    .PIPELINE_READY_IN_HEAD          (1),
    .PIPELINE_VALID_AND_DATA_IN_HEAD (1),
    .__BODY_0_REGION                 ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__BODY_1_REGION                 ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__HEAD_REGION                   ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__TAIL_REGION                   ("SLOT_X0Y1_TO_SLOT_X0Y1")
) hs_1 /**   Generated by RapidStream   **/ (
    .clk        (ACLK),
    .if_din     ({ ARADDR }),
    .if_dout    ({ __rs_pipelined_ARADDR }),
    .if_empty_n (__rs_pipelined_ARVALID),
    .if_full_n  (ARREADY),
    .if_read    (__rs_pipelined_ARREADY),
    .if_write   (ARVALID),
    .reset      (1'b0)
);

(* RS_ROUTE="SLOT_X0Y0_TO_SLOT_X0Y0,SLOT_X1Y0_TO_SLOT_X1Y0,SLOT_X1Y1_TO_SLOT_X1Y1,SLOT_X0Y1_TO_SLOT_X0Y1" *)
__rs_hs_pipeline_6 #(
    .BODY_LEVEL                      (6),
    .DATA_WIDTH                      (( ( ( ( C_S_AXI_DATA_WIDTH - 1 ) - ( 0 ) + 1 ) ) + ( ( ( C_S_AXI_DATA_WIDTH / 8 - 1 ) - ( 0 ) + 1 ) ) + 0 )),
    .DEPTH                           (8),
    .EXTRA_PIPELINE_BEFORE_TAIL      (0),
    .PIPELINE_READY_IN_HEAD          (1),
    .PIPELINE_VALID_AND_DATA_IN_HEAD (1),
    .__BODY_0_REGION                 ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__BODY_1_REGION                 ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_2_REGION                 ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_3_REGION                 ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_4_REGION                 ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_5_REGION                 ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__HEAD_REGION                   ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__TAIL_REGION                   ("SLOT_X0Y1_TO_SLOT_X0Y1")
) hs_2 /**   Generated by RapidStream   **/ (
    .clk        (ACLK),
    .if_din     ({ WDATA , WSTRB }),
    .if_dout    ({ __rs_pipelined_WDATA , __rs_pipelined_WSTRB }),
    .if_empty_n (__rs_pipelined_WVALID),
    .if_full_n  (WREADY),
    .if_read    (__rs_pipelined_WREADY),
    .if_write   (WVALID),
    .reset      (1'b0)
);

(* RS_ROUTE="SLOT_X0Y0_TO_SLOT_X0Y0,SLOT_X0Y1_TO_SLOT_X0Y1" *)
__rs_hs_pipeline_2 #(
    .BODY_LEVEL                      (2),
    .DATA_WIDTH                      (( ( ( ( C_S_AXI_ADDR_WIDTH - 1 ) - ( 0 ) + 1 ) ) + 0 )),
    .DEPTH                           (8),
    .EXTRA_PIPELINE_BEFORE_TAIL      (0),
    .PIPELINE_READY_IN_HEAD          (1),
    .PIPELINE_VALID_AND_DATA_IN_HEAD (1),
    .__BODY_0_REGION                 ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__BODY_1_REGION                 ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__HEAD_REGION                   ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__TAIL_REGION                   ("SLOT_X0Y1_TO_SLOT_X0Y1")
) hs_3 /**   Generated by RapidStream   **/ (
    .clk        (ACLK),
    .if_din     ({ AWADDR }),
    .if_dout    ({ __rs_pipelined_AWADDR }),
    .if_empty_n (__rs_pipelined_AWVALID),
    .if_full_n  (AWREADY),
    .if_read    (__rs_pipelined_AWREADY),
    .if_write   (AWVALID),
    .reset      (1'b0)
);

endmodule  // __rs_pipelined_kernel0_control_s_axi_control_s_axi_U