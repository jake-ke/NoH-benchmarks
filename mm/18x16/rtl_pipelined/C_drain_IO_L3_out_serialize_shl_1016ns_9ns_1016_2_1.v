`timescale 1 ns / 1 ps
// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================
// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
// 
// 
// 
module C_drain_IO_L3_out_serialize_shl_1016ns_9ns_1016_2_1
#(parameter
    ID         = 1,                       // core ID, unused in RTL
    din0_WIDTH = 1016,            // data bitwidth
    din1_WIDTH = 1016,            // shift control bitwidth
    dout_WIDTH = 1016,            // output bitwidth
    OP         = 0,   // opcode: 0-shl, 1-lshr, 2-ashr
    NUM_STAGE  = 2          // stage number
)(
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  ce,
    input  wire [din0_WIDTH-1:0] din0,
    input  wire [din0_WIDTH-1:0] din1,
    output reg  [dout_WIDTH-1:0] dout
);
//------------------------Parameter----------------------
localparam K       = 1+((din1_WIDTH - 1)/NUM_STAGE);
localparam LATENCY = NUM_STAGE -1;
//------------------------Local signal-------------------
reg  [dout_WIDTH-1:0] dout_array[LATENCY-1:0];
reg  [din1_WIDTH-1:0] din1_cast_array[LATENCY-1:0];
wire [din1_WIDTH-1:0] din1_cast;
wire [din1_WIDTH-1:0] din1_mask;
//------------------------Body---------------------------
always @(posedge clk ) begin
    if (reset == 1'b1) begin
        dout_array[0] <= {din0_WIDTH{1'b0}};
        din1_cast_array[0] <= {din1_WIDTH{1'b0}};
    end else if (ce) begin
        case (OP)
            0: dout_array[0] <= din0<<(din1_cast&(din1_mask<<(LATENCY*K)));
            1: dout_array[0] <= din0>>(din1_cast&(din1_mask<<(LATENCY*K)));
            2: dout_array[0] <= $signed(din0)>>>(din1_cast&(din1_mask<<(LATENCY*K)));
            default: dout_array[0] <= dout_array[0];
        endcase
        din1_cast_array[0] <= din1_cast;
    end
end
genvar i;
generate for (i=1; i<LATENCY; i=i+1) begin:pipeshift
    always @(posedge clk ) begin
        if (reset == 1'b1) begin
            dout_array     [i] <= {din0_WIDTH{1'b0}};
            din1_cast_array[i] <= {din1_WIDTH{1'b0}};
        end else if (ce) begin
            case (OP)
                0: dout_array[i] <= dout_array[i-1]<<(din1_cast_array[i-1]&(din1_mask<<((LATENCY-i)*K)));
                1: dout_array[i] <= dout_array[i-1]>>(din1_cast_array[i-1]&(din1_mask<<((LATENCY-i)*K)));
                2: dout_array[i] <= $signed(dout_array[i-1])>>>(din1_cast_array[i-1]&(din1_mask<<((LATENCY-i)*K)));
                default: dout_array[i] <= dout_array[i];
            endcase
            din1_cast_array[i] <= din1_cast_array[i-1];
        end
    end
end endgenerate
always @(*) begin
    case (OP)
        0: dout = dout_array[LATENCY-1]<<(din1_cast_array[LATENCY-1]&din1_mask);
        1: dout = dout_array[LATENCY-1]>>(din1_cast_array[LATENCY-1]&din1_mask);
        2: dout = $signed(dout_array[LATENCY-1])>>>(din1_cast_array[LATENCY-1]&din1_mask);
        default: dout = {dout_WIDTH{1'b0}};
    endcase
end
assign din1_mask = { {(din1_WIDTH-K){1'b0}}, {K{1'b1}} };
assign din1_cast = $unsigned(din1[din1_WIDTH-1:0]);
endmodule