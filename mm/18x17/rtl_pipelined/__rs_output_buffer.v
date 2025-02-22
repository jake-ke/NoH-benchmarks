`timescale 1 ns / 1 ps

module __rs_output_buffer #(
    parameter LUT_COUNT = 2,
    parameter DATA_WIDTH = 32,
    parameter ADD_FF = 1
) (
    input ap_clk,
    output [DATA_WIDTH-1:0] data_out
);
    wire [DATA_WIDTH-1:0] data    [LUT_COUNT:0];
    genvar i, j;
    generate
        for (i = 0; i < LUT_COUNT; i = i + 1) begin
            for (j = 0; j < DATA_WIDTH; j = j + 1) begin
                (* DONT_TOUCH = "yes" *) LUT1 #(
                    .INIT(2'h1)
                ) LUT1_inst (
                    .O(data[i+1][j]), // LUT general output
                    .I0(data[i][j]) // LUT input
                );
            end
        end
    endgenerate
    generate
        if ( ADD_FF > 0 ) begin
            for (j = 0; j < DATA_WIDTH; j = j + 1) begin
                (* DONT_TOUCH = "yes" *) FDRE #(
                    .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
                ) FDRE_inst (
                    .Q(data[0][j]), // 1-bit Data output
                    .C(ap_clk), // 1-bit Clock input
                    .CE(1'b1), // 1-bit Clock enable input
                    .R(1'b0), // 1-bit Synchronous reset input
                    .D(1'b0) // 1-bit Data input
                );
            end
        end
        else begin
            assign data[0] = 0;
        end
    endgenerate
    assign data_out = data[LUT_COUNT];     // output
endmodule