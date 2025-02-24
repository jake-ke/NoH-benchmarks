`timescale 1 ns / 1 ps
  // fifo
/////////////////////////////////////////////////////////////////
module fifo_srl_almost_full #(
  parameter MEM_STYLE    = "shiftreg",
  parameter DATA_WIDTH   = 32,
  parameter ADDR_WIDTH   = 4,
  parameter DEPTH        = 16,
  parameter GRACE_PERIOD = 2
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
parameter REAL_DEPTH = DEPTH < 4 ? 4 : DEPTH;
parameter REAL_ADDR_WIDTH = $clog2(REAL_DEPTH)+1;
wire[REAL_ADDR_WIDTH - 1:0] shiftReg_addr ;
wire[DATA_WIDTH - 1:0] shiftReg_data, shiftReg_q;
wire                     shiftReg_ce;
reg[REAL_ADDR_WIDTH:0] mOutPtr = ~{(REAL_ADDR_WIDTH+1){1'b0}};
reg internal_empty_n = 0, internal_full_n = 1;
assign if_empty_n = internal_empty_n;
/*******************************************/
// assign if_full_n = internal_full_n;
reg almost_full_q;
wire almost_full = mOutPtr >= REAL_DEPTH - 1 - GRACE_PERIOD - 1 && mOutPtr != ~{REAL_ADDR_WIDTH+1{1'b0}};
always @ (posedge clk) almost_full_q <= almost_full;
assign if_full_n = ~almost_full_q;
/*******************************************/
assign shiftReg_data = if_din;
assign if_dout = shiftReg_q;
always @ (posedge clk) begin
    if (reset == 1'b1)
    begin
        mOutPtr <= ~{REAL_ADDR_WIDTH+1{1'b0}};
        internal_empty_n <= 1'b0;
        internal_full_n <= 1'b1;
    end
    else begin
        if (((if_read & if_read_ce) == 1 & internal_empty_n == 1) &&
            ((if_write & if_write_ce) == 0 | internal_full_n == 0))
        begin
            mOutPtr <= mOutPtr - 5'd1;
            if (mOutPtr == 0)
                internal_empty_n <= 1'b0;
            internal_full_n <= 1'b1;
        end
        else if (((if_read & if_read_ce) == 0 | internal_empty_n == 0) &&
            ((if_write & if_write_ce) == 1 & internal_full_n == 1))
        begin
            mOutPtr <= mOutPtr + 5'd1;
            internal_empty_n <= 1'b1;
            if (mOutPtr == REAL_DEPTH - 5'd2)
                internal_full_n <= 1'b0;
        end
    end
end
assign shiftReg_addr = mOutPtr[REAL_ADDR_WIDTH] == 1'b0 ? mOutPtr[REAL_ADDR_WIDTH-1:0]:{REAL_ADDR_WIDTH{1'b0}};
assign shiftReg_ce = (if_write & if_write_ce) & internal_full_n;
fifo_srl_almost_full_internal
#(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(REAL_ADDR_WIDTH),
    .DEPTH(REAL_DEPTH))
U_fifo_w32_d16_A_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q));
endmodule