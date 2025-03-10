// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_pipelined___rs_pt_bank_1_t0__m_axi_9___rs_pt_bank_1_t0__m_axi_9_bank_1_t0__m_axi_inst #(
    parameter BufferSize         = 32,
    parameter BufferSizeLog      = 5,
    parameter AddrWidth          = 64,
    parameter AxiSideAddrWidth   = 64,
    parameter DataWidth          = 512,
    parameter DataWidthBytesLog  = 6,
    parameter WaitTimeWidth      = 4,
    parameter BurstLenWidth      = 8,
    parameter EnableReadChannel  = 1,
    parameter EnableWriteChannel = 1,
    parameter MaxWaitTime        = 3,
    parameter MaxBurstLen        = 15
) (
    output wire [(AddrWidth - 1):0] __rs_pt_write_addr_din,
    input wire                      __rs_pt_write_addr_full_n,
    output wire                     __rs_pt_write_addr_write,
    input wire                      clk,
    input wire                      rst,
    input wire  [(AddrWidth - 1):0] write_addr_din,
    output wire                     write_addr_full_n,
    input wire                      write_addr_write
);

wire        __rs_pipelined_rst;



__rs_pt_bank_1_t0__m_axi_9 #(
    .AddrWidth         (AddrWidth),
    .BurstLenWidth     (BurstLenWidth),
    .DataWidth         (DataWidth),
    .DataWidthBytesLog (DataWidthBytesLog),
    .MaxBurstLen       (MaxBurstLen),
    .MaxWaitTime       (MaxWaitTime),
    .WaitTimeWidth     (WaitTimeWidth)
) _ /**   Generated by RapidStream   **/ (
    .__rs_pt_write_addr_din    (__rs_pt_write_addr_din),
    .__rs_pt_write_addr_full_n (__rs_pt_write_addr_full_n),
    .__rs_pt_write_addr_write  (__rs_pt_write_addr_write),
    .clk                       (clk),
    .rst                       (__rs_pipelined_rst),
    .write_addr_din            (write_addr_din),
    .write_addr_full_n         (write_addr_full_n),
    .write_addr_write          (write_addr_write)
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
    .clk     (clk),
    .if_din  ({ rst }),
    .if_dout ({ __rs_pipelined_rst })
);

endmodule  // __rs_pipelined___rs_pt_bank_1_t0__m_axi_9___rs_pt_bank_1_t0__m_axi_9_bank_1_t0__m_axi_inst