`timescale 1 ns / 1 ps

// first-word fall-through (FWFT) FIFO that is friendly for floorplanning
module relay_station #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 5,
    parameter DEPTH      = 2,
    parameter LEVEL      = 2,
    parameter CONNECT    = 1   // add api to disconnect the relay station
) (
  input wire clk,
  input wire reset,
  // write
  output wire                  if_full_n,
  input  wire                  if_write_ce,
  input  wire                  if_write,
  input  wire [DATA_WIDTH-1:0] if_din,
  // read
  output wire                  if_empty_n,
  input  wire                  if_read_ce,
  input  wire                  if_read,
  output wire [DATA_WIDTH-1:0] if_dout
);
  wire                  full_n  [LEVEL:0];
  wire                  empty_n [LEVEL:0];
  wire [DATA_WIDTH-1:0] data    [LEVEL:0];
  // both full_n and write are registered, thus one level of relay_station cause
  // two additional latency for the almost full fifo
  parameter GRACE_PERIOD = LEVEL * 2;
  parameter REAL_DEPTH = GRACE_PERIOD + DEPTH + 4;
  parameter REAL_ADDR_WIDTH  = $clog2(REAL_DEPTH);
  genvar i;
  generate
  if (CONNECT > 0) begin
    if (LEVEL > 0) begin
      for (i = 0; i < LEVEL; i = i + 1) begin : inst
        if (i < LEVEL - 1) begin
          fifo_reg #(
            .DATA_WIDTH(DATA_WIDTH)
          ) unit (
            .clk(clk),
            .reset(reset),
            // connect to fifo[i+1]
            .if_empty_n(empty_n[i+1]),
            .if_read_ce(if_read_ce),
            .if_read   (full_n[i+1]),
            .if_dout   (data[i+1]),
            // connect to fifo[i-1]
            .if_full_n  (full_n[i]),
            .if_write_ce(if_write_ce),
            .if_write   (empty_n[i]),
            .if_din     (data[i])
          );
        end else begin
          (* keep = "true" *) fifo_almost_full #(
            .DATA_WIDTH(DATA_WIDTH),
            .ADDR_WIDTH(REAL_ADDR_WIDTH),
            .DEPTH(REAL_DEPTH),
            .GRACE_PERIOD(GRACE_PERIOD)
          ) unit (
            .clk(clk),
            .reset(reset),
            // connect to fifo[i+1]
            .if_empty_n(empty_n[i+1]),
            .if_read_ce(if_read_ce),
            .if_read   (full_n[i+1]),
            .if_dout   (data[i+1]),
            // connect to fifo[i-1]
            .if_full_n  (full_n[i]),
            .if_write_ce(if_write_ce),
            .if_write   (empty_n[i]),
            .if_din     (data[i])
          );
        end
      end
      // write
      assign if_full_n  = full_n[0];  // output
      assign empty_n[0] = if_write & full_n[0];   // input
      assign data[0]    = if_din;     // input
      // read
      assign if_empty_n    = empty_n[LEVEL];  // output
      assign full_n[LEVEL] = if_read;         // input
      assign if_dout       = data[LEVEL];     // output
    end
    // LEVEL == 0
    else begin
      assign if_full_n  = if_read;  // output
      assign if_empty_n    = if_write;  // output
      assign if_dout       = if_din;     // output
    end
  end
  // disconnect the relay station
  else begin
    assign if_full_n  = 0;  // output
    assign if_empty_n = 0;  // output
    // leave the dout port dangling to facilitate pruning
    // assign if_dout    = 0;     // output
  end
  endgenerate
endmodule