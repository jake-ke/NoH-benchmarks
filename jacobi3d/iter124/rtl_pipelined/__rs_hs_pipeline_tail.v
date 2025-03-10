`timescale 1 ns / 1 ps
// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
module __rs_hs_pipeline_tail #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 5,
    parameter DEPTH      = 32,
    parameter GRACE_PERIOD = 2,
    parameter MEM_STYLE = 0,   // 0: SRL, 1: ULTRA, 2: BLOCK
    parameter __REGION = ""
) (
    // pragma RS clk port=clk
    input wire clk,
    // pragma RS rst port=reset active=high
    input wire reset,
    // inbound
    // pragma RS handshake valid=if_write ready=if_full_n data=if_din
    output wire                  if_full_n,
    input  wire                  if_write,
    input  wire [DATA_WIDTH-1:0] if_din,
    // outbound
    // pragma RS handshake valid=if_empty_n ready=if_read data=if_dout
    output wire                  if_empty_n,
    input  wire                  if_read,
    output wire [DATA_WIDTH-1:0] if_dout
);
generate
    if (MEM_STYLE == 2) begin
        __rs_fifo_bram_almost_full #(
            .MEM_STYLE   ("block"),
            .DATA_WIDTH  (DATA_WIDTH),
            .ADDR_WIDTH  (ADDR_WIDTH),
            .DEPTH       (DEPTH),
            .GRACE_PERIOD(GRACE_PERIOD)
        ) fifo (
            .clk  (clk),
            .reset(reset),
            .if_full_n  (if_full_n),
            .if_write   (if_write),
            .if_din     (if_din),
            .if_empty_n(if_empty_n),
            .if_read   (if_read),
            .if_dout   (if_dout),
            .if_read_ce(1'b1),
            .if_write_ce(1'b1)
        );
    end
    else if (MEM_STYLE == 1) begin
        __rs_fifo_bram_almost_full #(
            .MEM_STYLE   ("ultra"),
            .DATA_WIDTH  (DATA_WIDTH),
            .ADDR_WIDTH  (ADDR_WIDTH),
            .DEPTH       (DEPTH),
            .GRACE_PERIOD(GRACE_PERIOD)
        ) fifo (
            .clk  (clk),
            .reset(reset),
            .if_full_n  (if_full_n),
            .if_write   (if_write),
            .if_din     (if_din),
            .if_empty_n(if_empty_n),
            .if_read   (if_read),
            .if_dout   (if_dout),
            .if_read_ce(1'b1),
            .if_write_ce(1'b1)
        );
    end
    else if (MEM_STYLE == 0) begin
        __rs_fifo_srl_almost_full #(
            .DATA_WIDTH(DATA_WIDTH),
            .ADDR_WIDTH(ADDR_WIDTH),
            .DEPTH     (DEPTH),
            .GRACE_PERIOD(GRACE_PERIOD)
        ) fifo (
            .clk  (clk),
            .reset(reset),
            .if_full_n  (if_full_n),
            .if_write   (if_write),
            .if_din     (if_din),
            .if_empty_n(if_empty_n),
            .if_read   (if_read),
            .if_dout   (if_dout),
            .if_read_ce(1'b1),
            .if_write_ce(1'b1)
        );
    end
endgenerate
    initial begin
        if (MEM_STYLE != 0 && MEM_STYLE != 1 && MEM_STYLE != 2) begin
            $display("Error: MEM_STYLE %d is not supported.", MEM_STYLE);
            $finish;
        end
    end
endmodule