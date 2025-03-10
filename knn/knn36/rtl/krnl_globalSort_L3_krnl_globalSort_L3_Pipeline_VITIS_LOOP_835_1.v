// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module krnl_globalSort_L3_krnl_globalSort_L3_Pipeline_VITIS_LOOP_835_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        in_dist0_s_dout,
        in_dist0_s_empty_n,
        in_dist0_s_read,
        in_dist1_s_dout,
        in_dist1_s_empty_n,
        in_dist1_s_read,
        p_out,
        p_out_ap_vld,
        p_out1,
        p_out1_ap_vld,
        p_out2,
        p_out2_ap_vld,
        p_out3,
        p_out3_ap_vld,
        p_out4,
        p_out4_ap_vld,
        p_out5,
        p_out5_ap_vld,
        p_out6,
        p_out6_ap_vld,
        p_out7,
        p_out7_ap_vld,
        p_out8,
        p_out8_ap_vld,
        p_out9,
        p_out9_ap_vld,
        p_out10,
        p_out10_ap_vld,
        p_out11,
        p_out11_ap_vld,
        p_out12,
        p_out12_ap_vld,
        p_out13,
        p_out13_ap_vld,
        p_out14,
        p_out14_ap_vld,
        p_out15,
        p_out15_ap_vld,
        p_out16,
        p_out16_ap_vld,
        p_out17,
        p_out17_ap_vld,
        p_out18,
        p_out18_ap_vld,
        p_out19,
        p_out19_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [65:0] in_dist0_s_dout;
input   in_dist0_s_empty_n;
output   in_dist0_s_read;
input  [65:0] in_dist1_s_dout;
input   in_dist1_s_empty_n;
output   in_dist1_s_read;
output  [31:0] p_out;
output   p_out_ap_vld;
output  [31:0] p_out1;
output   p_out1_ap_vld;
output  [31:0] p_out2;
output   p_out2_ap_vld;
output  [31:0] p_out3;
output   p_out3_ap_vld;
output  [31:0] p_out4;
output   p_out4_ap_vld;
output  [31:0] p_out5;
output   p_out5_ap_vld;
output  [31:0] p_out6;
output   p_out6_ap_vld;
output  [31:0] p_out7;
output   p_out7_ap_vld;
output  [31:0] p_out8;
output   p_out8_ap_vld;
output  [31:0] p_out9;
output   p_out9_ap_vld;
output  [31:0] p_out10;
output   p_out10_ap_vld;
output  [31:0] p_out11;
output   p_out11_ap_vld;
output  [31:0] p_out12;
output   p_out12_ap_vld;
output  [31:0] p_out13;
output   p_out13_ap_vld;
output  [31:0] p_out14;
output   p_out14_ap_vld;
output  [31:0] p_out15;
output   p_out15_ap_vld;
output  [31:0] p_out16;
output   p_out16_ap_vld;
output  [31:0] p_out17;
output   p_out17_ap_vld;
output  [31:0] p_out18;
output   p_out18_ap_vld;
output  [31:0] p_out19;
output   p_out19_ap_vld;

reg ap_idle;
reg in_dist0_s_read;
reg in_dist1_s_read;
reg p_out_ap_vld;
reg p_out1_ap_vld;
reg p_out2_ap_vld;
reg p_out3_ap_vld;
reg p_out4_ap_vld;
reg p_out5_ap_vld;
reg p_out6_ap_vld;
reg p_out7_ap_vld;
reg p_out8_ap_vld;
reg p_out9_ap_vld;
reg p_out10_ap_vld;
reg p_out11_ap_vld;
reg p_out12_ap_vld;
reg p_out13_ap_vld;
reg p_out14_ap_vld;
reg p_out15_ap_vld;
reg p_out16_ap_vld;
reg p_out17_ap_vld;
reg p_out18_ap_vld;
reg p_out19_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln835_fu_356_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    in_dist0_s_blk_n;
wire    ap_block_pp0_stage0;
reg    in_dist1_s_blk_n;
reg   [3:0] i_2_reg_946;
reg    ap_block_pp0_stage0_11001;
reg   [3:0] i_fu_90;
wire   [3:0] add_ln835_fu_350_p2;
wire    ap_loop_init;
reg   [3:0] ap_sig_allocacmp_i_2;
reg   [31:0] empty_fu_94;
wire   [31:0] bitcast_ln839_fu_380_p1;
reg   [31:0] empty_19_fu_98;
wire   [31:0] bitcast_ln842_fu_391_p1;
reg   [31:0] empty_20_fu_102;
reg   [31:0] empty_21_fu_106;
reg   [31:0] empty_22_fu_110;
reg   [31:0] empty_23_fu_114;
reg   [31:0] empty_24_fu_118;
reg   [31:0] empty_25_fu_122;
reg   [31:0] empty_26_fu_126;
reg   [31:0] empty_27_fu_130;
reg   [31:0] empty_28_fu_134;
reg   [31:0] empty_29_fu_138;
reg   [31:0] empty_30_fu_142;
reg   [31:0] empty_31_fu_146;
reg   [31:0] empty_32_fu_150;
reg   [31:0] empty_33_fu_154;
reg   [31:0] empty_34_fu_158;
reg   [31:0] empty_35_fu_162;
reg   [31:0] empty_36_fu_166;
reg   [31:0] empty_37_fu_170;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] v0_data_fu_376_p1;
wire   [31:0] v1_data_fu_387_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 i_fu_90 = 4'd0;
#0 empty_fu_94 = 32'd0;
#0 empty_19_fu_98 = 32'd0;
#0 empty_20_fu_102 = 32'd0;
#0 empty_21_fu_106 = 32'd0;
#0 empty_22_fu_110 = 32'd0;
#0 empty_23_fu_114 = 32'd0;
#0 empty_24_fu_118 = 32'd0;
#0 empty_25_fu_122 = 32'd0;
#0 empty_26_fu_126 = 32'd0;
#0 empty_27_fu_130 = 32'd0;
#0 empty_28_fu_134 = 32'd0;
#0 empty_29_fu_138 = 32'd0;
#0 empty_30_fu_142 = 32'd0;
#0 empty_31_fu_146 = 32'd0;
#0 empty_32_fu_150 = 32'd0;
#0 empty_33_fu_154 = 32'd0;
#0 empty_34_fu_158 = 32'd0;
#0 empty_35_fu_162 = 32'd0;
#0 empty_36_fu_166 = 32'd0;
#0 empty_37_fu_170 = 32'd0;
#0 ap_done_reg = 1'b0;
end

krnl_globalSort_L3_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln835_fu_356_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_90 <= add_ln835_fu_350_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_90 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_2_reg_946 == 4'd8))) begin
        empty_19_fu_98 <= bitcast_ln842_fu_391_p1;
        empty_fu_94 <= bitcast_ln839_fu_380_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_2_reg_946 == 4'd7))) begin
        empty_20_fu_102 <= bitcast_ln839_fu_380_p1;
        empty_21_fu_106 <= bitcast_ln842_fu_391_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_2_reg_946 == 4'd6))) begin
        empty_22_fu_110 <= bitcast_ln839_fu_380_p1;
        empty_23_fu_114 <= bitcast_ln842_fu_391_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_2_reg_946 == 4'd5))) begin
        empty_24_fu_118 <= bitcast_ln839_fu_380_p1;
        empty_25_fu_122 <= bitcast_ln842_fu_391_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_2_reg_946 == 4'd4))) begin
        empty_26_fu_126 <= bitcast_ln839_fu_380_p1;
        empty_27_fu_130 <= bitcast_ln842_fu_391_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_2_reg_946 == 4'd3))) begin
        empty_28_fu_134 <= bitcast_ln839_fu_380_p1;
        empty_29_fu_138 <= bitcast_ln842_fu_391_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_2_reg_946 == 4'd2))) begin
        empty_30_fu_142 <= bitcast_ln839_fu_380_p1;
        empty_31_fu_146 <= bitcast_ln842_fu_391_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_2_reg_946 == 4'd1))) begin
        empty_32_fu_150 <= bitcast_ln839_fu_380_p1;
        empty_33_fu_154 <= bitcast_ln842_fu_391_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_2_reg_946 == 4'd0))) begin
        empty_34_fu_158 <= bitcast_ln839_fu_380_p1;
        empty_35_fu_162 <= bitcast_ln842_fu_391_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((~(i_2_reg_946 == 4'd0) & ~(i_2_reg_946 == 4'd1) & ~(i_2_reg_946 == 4'd2) & ~(i_2_reg_946 == 4'd3) & ~(i_2_reg_946 == 4'd4) & ~(i_2_reg_946 == 4'd5) & ~(i_2_reg_946 == 4'd6) & ~(i_2_reg_946 == 4'd7) & ~(i_2_reg_946 == 4'd8) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        empty_36_fu_166 <= bitcast_ln839_fu_380_p1;
        empty_37_fu_170 <= bitcast_ln842_fu_391_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_2_reg_946 <= ap_sig_allocacmp_i_2;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_2 = 4'd0;
    end else begin
        ap_sig_allocacmp_i_2 = i_fu_90;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        in_dist0_s_blk_n = in_dist0_s_empty_n;
    end else begin
        in_dist0_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        in_dist0_s_read = 1'b1;
    end else begin
        in_dist0_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        in_dist1_s_blk_n = in_dist1_s_empty_n;
    end else begin
        in_dist1_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        in_dist1_s_read = 1'b1;
    end else begin
        in_dist1_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out10_ap_vld = 1'b1;
    end else begin
        p_out10_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out11_ap_vld = 1'b1;
    end else begin
        p_out11_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out12_ap_vld = 1'b1;
    end else begin
        p_out12_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out13_ap_vld = 1'b1;
    end else begin
        p_out13_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out14_ap_vld = 1'b1;
    end else begin
        p_out14_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out15_ap_vld = 1'b1;
    end else begin
        p_out15_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out16_ap_vld = 1'b1;
    end else begin
        p_out16_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out17_ap_vld = 1'b1;
    end else begin
        p_out17_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out18_ap_vld = 1'b1;
    end else begin
        p_out18_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out19_ap_vld = 1'b1;
    end else begin
        p_out19_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out1_ap_vld = 1'b1;
    end else begin
        p_out1_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out2_ap_vld = 1'b1;
    end else begin
        p_out2_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out3_ap_vld = 1'b1;
    end else begin
        p_out3_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out4_ap_vld = 1'b1;
    end else begin
        p_out4_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out5_ap_vld = 1'b1;
    end else begin
        p_out5_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out6_ap_vld = 1'b1;
    end else begin
        p_out6_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out7_ap_vld = 1'b1;
    end else begin
        p_out7_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out8_ap_vld = 1'b1;
    end else begin
        p_out8_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out9_ap_vld = 1'b1;
    end else begin
        p_out9_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln835_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_out_ap_vld = 1'b1;
    end else begin
        p_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln835_fu_350_p2 = (ap_sig_allocacmp_i_2 + 4'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state2_pp0_stage0_iter1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state2_pp0_stage0_iter1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state2_pp0_stage0_iter1));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((in_dist1_s_empty_n == 1'b0) | (in_dist0_s_empty_n == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign bitcast_ln839_fu_380_p1 = v0_data_fu_376_p1;

assign bitcast_ln842_fu_391_p1 = v1_data_fu_387_p1;

assign icmp_ln835_fu_356_p2 = ((ap_sig_allocacmp_i_2 == 4'd10) ? 1'b1 : 1'b0);

assign p_out = empty_37_fu_170;

assign p_out1 = empty_36_fu_166;

assign p_out10 = empty_27_fu_130;

assign p_out11 = empty_26_fu_126;

assign p_out12 = empty_25_fu_122;

assign p_out13 = empty_24_fu_118;

assign p_out14 = empty_23_fu_114;

assign p_out15 = empty_22_fu_110;

assign p_out16 = empty_21_fu_106;

assign p_out17 = empty_20_fu_102;

assign p_out18 = empty_19_fu_98;

assign p_out19 = empty_fu_94;

assign p_out2 = empty_35_fu_162;

assign p_out3 = empty_34_fu_158;

assign p_out4 = empty_33_fu_154;

assign p_out5 = empty_32_fu_150;

assign p_out6 = empty_31_fu_146;

assign p_out7 = empty_30_fu_142;

assign p_out8 = empty_29_fu_138;

assign p_out9 = empty_28_fu_134;

assign v0_data_fu_376_p1 = in_dist0_s_dout[31:0];

assign v1_data_fu_387_p1 = in_dist1_s_dout[31:0];

endmodule //krnl_globalSort_L3_krnl_globalSort_L3_Pipeline_VITIS_LOOP_835_1
