`timescale 1 ns / 1 ps
// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================
 
module krnl_partialKnn_wrapper_3_compare_with_register (
        ap_clk,
        ap_rst,
        in_1,
        in_2,
        ap_return,
        ap_ce
);
input   ap_clk;
input   ap_rst;
input  [31:0] in_1;
input  [31:0] in_2;
output  [0:0] ap_return;
input   ap_ce;
reg[0:0] ap_return;
wire   [0:0] and_ln46_1_fu_136_p2;
reg   [0:0] and_ln46_1_reg_142;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] and_ln46_1_reg_142_pp0_iter1_reg;
wire    ap_block_pp0_stage0;
wire   [31:0] bitcast_ln46_fu_50_p1;
wire   [31:0] bitcast_ln46_1_fu_68_p1;
wire   [7:0] tmp_fu_54_p4;
wire   [22:0] trunc_ln46_fu_64_p1;
wire   [0:0] icmp_ln46_1_fu_92_p2;
wire   [0:0] icmp_ln46_fu_86_p2;
wire   [7:0] tmp_s_fu_72_p4;
wire   [22:0] trunc_ln46_1_fu_82_p1;
wire   [0:0] icmp_ln46_3_fu_110_p2;
wire   [0:0] icmp_ln46_2_fu_104_p2;
wire   [0:0] or_ln46_fu_98_p2;
wire   [0:0] or_ln46_1_fu_116_p2;
wire   [0:0] and_ln46_fu_122_p2;
wire   [0:0] tmp_23_fu_40_p2;
wire    ap_block_pp0_stage0_00001;
reg    ap_ce_reg;
reg   [31:0] in_1_int_reg;
reg   [31:0] in_2_int_reg;
reg   [0:0] ap_return_int_reg;
krnl_partialKnn_wrapper_3_fcmp_32ns_32ns_1_1_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 1 ))
fcmp_32ns_32ns_1_1_no_dsp_1_U355(
    .din0(in_1_int_reg),
    .din1(in_2_int_reg),
    .opcode(5'd4),
    .dout(tmp_23_fu_40_p2)
);
always @ (posedge ap_clk) begin
    ap_ce_reg <= ap_ce;
end
always @ (posedge ap_clk) begin
    if (((1'b1 == ap_ce_reg) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        and_ln46_1_reg_142 <= and_ln46_1_fu_136_p2;
        and_ln46_1_reg_142_pp0_iter1_reg <= and_ln46_1_reg_142;
    end
end
always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce_reg)) begin
        ap_return_int_reg <= and_ln46_1_reg_142_pp0_iter1_reg;
    end
end
always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce)) begin
        in_1_int_reg <= in_1;
        in_2_int_reg <= in_2;
    end
end
always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return = ap_return_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return = and_ln46_1_reg_142_pp0_iter1_reg;
    end else begin
        ap_return = 'bx;
    end
end
assign and_ln46_1_fu_136_p2 = (tmp_23_fu_40_p2 & and_ln46_fu_122_p2);
assign and_ln46_fu_122_p2 = (or_ln46_fu_98_p2 & or_ln46_1_fu_116_p2);
assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);
assign ap_block_pp0_stage0_00001 = ~(1'b1 == 1'b1);
assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);
assign bitcast_ln46_1_fu_68_p1 = in_2_int_reg;
assign bitcast_ln46_fu_50_p1 = in_1_int_reg;
assign icmp_ln46_1_fu_92_p2 = ((trunc_ln46_fu_64_p1 == 23'd0) ? 1'b1 : 1'b0);
assign icmp_ln46_2_fu_104_p2 = ((tmp_s_fu_72_p4 != 8'd255) ? 1'b1 : 1'b0);
assign icmp_ln46_3_fu_110_p2 = ((trunc_ln46_1_fu_82_p1 == 23'd0) ? 1'b1 : 1'b0);
assign icmp_ln46_fu_86_p2 = ((tmp_fu_54_p4 != 8'd255) ? 1'b1 : 1'b0);
assign or_ln46_1_fu_116_p2 = (icmp_ln46_3_fu_110_p2 | icmp_ln46_2_fu_104_p2);
assign or_ln46_fu_98_p2 = (icmp_ln46_fu_86_p2 | icmp_ln46_1_fu_92_p2);
assign tmp_fu_54_p4 = {{bitcast_ln46_fu_50_p1[30:23]}};
assign tmp_s_fu_72_p4 = {{bitcast_ln46_1_fu_68_p1[30:23]}};
assign trunc_ln46_1_fu_82_p1 = bitcast_ln46_1_fu_68_p1[22:0];
assign trunc_ln46_fu_64_p1 = bitcast_ln46_fu_50_p1[22:0];
endmodule