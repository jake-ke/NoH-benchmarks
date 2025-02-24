`timescale 1 ns / 1 ps
   // relay_station
/////////////////////////////////////////////////////////////
module fifo_reg #(
  parameter DATA_WIDTH = 32
) (
  input wire clk,
  input wire reset,
  // write
  (* keep = "true" *)
  output reg                   if_full_n,
  input  wire                  if_write_ce,
  input  wire                  if_write,
  input  wire [DATA_WIDTH-1:0] if_din,
  // read
  (* keep = "true" *)
  output reg                   if_empty_n,
  input  wire                  if_read_ce,
  input  wire                  if_read,
  (* keep = "true" *)
  output reg  [DATA_WIDTH-1:0] if_dout
);
  always @ (posedge clk) begin
    if_dout <= if_din;
    if_empty_n <= if_write;
    if_full_n <= if_read;
  end
endmodule