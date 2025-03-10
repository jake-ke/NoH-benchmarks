// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pt_control_s_axi_U_4 #(
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
    input wire                                   ARESET,
    input wire  [    (C_S_AXI_DATA_WIDTH - 1):0] WDATA,
    output wire                                  WREADY,
    input wire  [(C_S_AXI_DATA_WIDTH / 8 - 1):0] WSTRB,
    input wire                                   WVALID,
    output wire [    (C_S_AXI_DATA_WIDTH - 1):0] __rs_pt_WDATA,
    input wire                                   __rs_pt_WREADY,
    output wire [(C_S_AXI_DATA_WIDTH / 8 - 1):0] __rs_pt_WSTRB,
    output wire                                  __rs_pt_WVALID
);




__rs_pass_through #(
    .WIDTH (( ( C_S_AXI_DATA_WIDTH - 1 ) - ( 0 ) + 1 ))
) __rs_pt_jacobi3d_kernel_control_s_axi_WDATA_inst /**   Generated by RapidStream   **/ (
    .din  (WDATA),
    .dout (__rs_pt_WDATA)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_jacobi3d_kernel_control_s_axi_WREADY_inst /**   Generated by RapidStream   **/ (
    .din  (__rs_pt_WREADY),
    .dout (WREADY)
);


__rs_pass_through #(
    .WIDTH (( ( C_S_AXI_DATA_WIDTH / 8 - 1 ) - ( 0 ) + 1 ))
) __rs_pt_jacobi3d_kernel_control_s_axi_WSTRB_inst /**   Generated by RapidStream   **/ (
    .din  (WSTRB),
    .dout (__rs_pt_WSTRB)
);


__rs_pass_through #(
    .WIDTH (1)
) __rs_pt_jacobi3d_kernel_control_s_axi_WVALID_inst /**   Generated by RapidStream   **/ (
    .din  (WVALID),
    .dout (__rs_pt_WVALID)
);

endmodule  // __rs_pt_control_s_axi_U_4