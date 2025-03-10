// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module krnl_globalSort_L3_krnl_globalSort_L3_Pipeline_VITIS_LOOP_952_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        in_id0_s_dout,
        in_id0_s_empty_n,
        in_id0_s_read,
        in_id1_s_dout,
        in_id1_s_empty_n,
        in_id1_s_read,
        p_0_0_0_0_044_out,
        p_0_0_0_0_044_out_ap_vld,
        p_0_0_0_0_018542_out,
        p_0_0_0_0_018542_out_ap_vld,
        p_0_0_0_0_040_out,
        p_0_0_0_0_040_out_ap_vld,
        p_0_0_0_0_018538_out,
        p_0_0_0_0_018538_out_ap_vld,
        p_0_0_0_0_036_out,
        p_0_0_0_0_036_out_ap_vld,
        p_0_0_0_0_018534_out,
        p_0_0_0_0_018534_out_ap_vld,
        p_0_0_0_0_032_out,
        p_0_0_0_0_032_out_ap_vld,
        p_0_0_0_0_018530_out,
        p_0_0_0_0_018530_out_ap_vld,
        p_0_0_0_0_028_out,
        p_0_0_0_0_028_out_ap_vld,
        p_0_0_0_0_018526_out,
        p_0_0_0_0_018526_out_ap_vld,
        p_0_0_0_0_024_out,
        p_0_0_0_0_024_out_ap_vld,
        p_0_0_0_0_018522_out,
        p_0_0_0_0_018522_out_ap_vld,
        p_0_0_0_0_020_out,
        p_0_0_0_0_020_out_ap_vld,
        p_0_0_0_0_018518_out,
        p_0_0_0_0_018518_out_ap_vld,
        p_0_0_0_0_016_out,
        p_0_0_0_0_016_out_ap_vld,
        p_0_0_0_0_018514_out,
        p_0_0_0_0_018514_out_ap_vld,
        p_0_0_0_0_012_out,
        p_0_0_0_0_012_out_ap_vld,
        p_0_0_0_0_018510_out,
        p_0_0_0_0_018510_out_ap_vld,
        p_0_0_0_0_08_out,
        p_0_0_0_0_08_out_ap_vld,
        p_0_0_0_0_01856_out,
        p_0_0_0_0_01856_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [65:0] in_id0_s_dout;
input   in_id0_s_empty_n;
output   in_id0_s_read;
input  [65:0] in_id1_s_dout;
input   in_id1_s_empty_n;
output   in_id1_s_read;
output  [31:0] p_0_0_0_0_044_out;
output   p_0_0_0_0_044_out_ap_vld;
output  [31:0] p_0_0_0_0_018542_out;
output   p_0_0_0_0_018542_out_ap_vld;
output  [31:0] p_0_0_0_0_040_out;
output   p_0_0_0_0_040_out_ap_vld;
output  [31:0] p_0_0_0_0_018538_out;
output   p_0_0_0_0_018538_out_ap_vld;
output  [31:0] p_0_0_0_0_036_out;
output   p_0_0_0_0_036_out_ap_vld;
output  [31:0] p_0_0_0_0_018534_out;
output   p_0_0_0_0_018534_out_ap_vld;
output  [31:0] p_0_0_0_0_032_out;
output   p_0_0_0_0_032_out_ap_vld;
output  [31:0] p_0_0_0_0_018530_out;
output   p_0_0_0_0_018530_out_ap_vld;
output  [31:0] p_0_0_0_0_028_out;
output   p_0_0_0_0_028_out_ap_vld;
output  [31:0] p_0_0_0_0_018526_out;
output   p_0_0_0_0_018526_out_ap_vld;
output  [31:0] p_0_0_0_0_024_out;
output   p_0_0_0_0_024_out_ap_vld;
output  [31:0] p_0_0_0_0_018522_out;
output   p_0_0_0_0_018522_out_ap_vld;
output  [31:0] p_0_0_0_0_020_out;
output   p_0_0_0_0_020_out_ap_vld;
output  [31:0] p_0_0_0_0_018518_out;
output   p_0_0_0_0_018518_out_ap_vld;
output  [31:0] p_0_0_0_0_016_out;
output   p_0_0_0_0_016_out_ap_vld;
output  [31:0] p_0_0_0_0_018514_out;
output   p_0_0_0_0_018514_out_ap_vld;
output  [31:0] p_0_0_0_0_012_out;
output   p_0_0_0_0_012_out_ap_vld;
output  [31:0] p_0_0_0_0_018510_out;
output   p_0_0_0_0_018510_out_ap_vld;
output  [31:0] p_0_0_0_0_08_out;
output   p_0_0_0_0_08_out_ap_vld;
output  [31:0] p_0_0_0_0_01856_out;
output   p_0_0_0_0_01856_out_ap_vld;

reg ap_idle;
reg in_id0_s_read;
reg in_id1_s_read;
reg p_0_0_0_0_044_out_ap_vld;
reg p_0_0_0_0_018542_out_ap_vld;
reg p_0_0_0_0_040_out_ap_vld;
reg p_0_0_0_0_018538_out_ap_vld;
reg p_0_0_0_0_036_out_ap_vld;
reg p_0_0_0_0_018534_out_ap_vld;
reg p_0_0_0_0_032_out_ap_vld;
reg p_0_0_0_0_018530_out_ap_vld;
reg p_0_0_0_0_028_out_ap_vld;
reg p_0_0_0_0_018526_out_ap_vld;
reg p_0_0_0_0_024_out_ap_vld;
reg p_0_0_0_0_018522_out_ap_vld;
reg p_0_0_0_0_020_out_ap_vld;
reg p_0_0_0_0_018518_out_ap_vld;
reg p_0_0_0_0_016_out_ap_vld;
reg p_0_0_0_0_018514_out_ap_vld;
reg p_0_0_0_0_012_out_ap_vld;
reg p_0_0_0_0_018510_out_ap_vld;
reg p_0_0_0_0_08_out_ap_vld;
reg p_0_0_0_0_01856_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln952_fu_356_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    in_id0_s_blk_n;
wire    ap_block_pp0_stage0;
reg    in_id1_s_blk_n;
reg   [3:0] i_reg_938;
reg    ap_block_pp0_stage0_11001;
reg   [3:0] i_1_fu_90;
wire   [3:0] add_ln952_fu_350_p2;
wire    ap_loop_init;
reg   [3:0] ap_sig_allocacmp_i;
reg   [31:0] p_0_0_0_0_01856_fu_94;
wire   [31:0] v0_id_data_fu_376_p1;
reg   [31:0] p_0_0_0_0_08_fu_98;
wire   [31:0] v1_id_data_fu_383_p1;
reg   [31:0] p_0_0_0_0_018510_fu_102;
reg   [31:0] p_0_0_0_0_012_fu_106;
reg   [31:0] p_0_0_0_0_018514_fu_110;
reg   [31:0] p_0_0_0_0_016_fu_114;
reg   [31:0] p_0_0_0_0_018518_fu_118;
reg   [31:0] p_0_0_0_0_020_fu_122;
reg   [31:0] p_0_0_0_0_018522_fu_126;
reg   [31:0] p_0_0_0_0_024_fu_130;
reg   [31:0] p_0_0_0_0_018526_fu_134;
reg   [31:0] p_0_0_0_0_028_fu_138;
reg   [31:0] p_0_0_0_0_018530_fu_142;
reg   [31:0] p_0_0_0_0_032_fu_146;
reg   [31:0] p_0_0_0_0_018534_fu_150;
reg   [31:0] p_0_0_0_0_036_fu_154;
reg   [31:0] p_0_0_0_0_018538_fu_158;
reg   [31:0] p_0_0_0_0_040_fu_162;
reg   [31:0] p_0_0_0_0_018542_fu_166;
reg   [31:0] p_0_0_0_0_044_fu_170;
reg    ap_block_pp0_stage0_01001;
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
#0 i_1_fu_90 = 4'd0;
#0 p_0_0_0_0_01856_fu_94 = 32'd0;
#0 p_0_0_0_0_08_fu_98 = 32'd0;
#0 p_0_0_0_0_018510_fu_102 = 32'd0;
#0 p_0_0_0_0_012_fu_106 = 32'd0;
#0 p_0_0_0_0_018514_fu_110 = 32'd0;
#0 p_0_0_0_0_016_fu_114 = 32'd0;
#0 p_0_0_0_0_018518_fu_118 = 32'd0;
#0 p_0_0_0_0_020_fu_122 = 32'd0;
#0 p_0_0_0_0_018522_fu_126 = 32'd0;
#0 p_0_0_0_0_024_fu_130 = 32'd0;
#0 p_0_0_0_0_018526_fu_134 = 32'd0;
#0 p_0_0_0_0_028_fu_138 = 32'd0;
#0 p_0_0_0_0_018530_fu_142 = 32'd0;
#0 p_0_0_0_0_032_fu_146 = 32'd0;
#0 p_0_0_0_0_018534_fu_150 = 32'd0;
#0 p_0_0_0_0_036_fu_154 = 32'd0;
#0 p_0_0_0_0_018538_fu_158 = 32'd0;
#0 p_0_0_0_0_040_fu_162 = 32'd0;
#0 p_0_0_0_0_018542_fu_166 = 32'd0;
#0 p_0_0_0_0_044_fu_170 = 32'd0;
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
        if (((icmp_ln952_fu_356_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_1_fu_90 <= add_ln952_fu_350_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_1_fu_90 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_reg_938 <= ap_sig_allocacmp_i;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_reg_938 == 4'd7))) begin
        p_0_0_0_0_012_fu_106 <= v1_id_data_fu_383_p1;
        p_0_0_0_0_018510_fu_102 <= v0_id_data_fu_376_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_reg_938 == 4'd6))) begin
        p_0_0_0_0_016_fu_114 <= v1_id_data_fu_383_p1;
        p_0_0_0_0_018514_fu_110 <= v0_id_data_fu_376_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_reg_938 == 4'd5))) begin
        p_0_0_0_0_018518_fu_118 <= v0_id_data_fu_376_p1;
        p_0_0_0_0_020_fu_122 <= v1_id_data_fu_383_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_reg_938 == 4'd4))) begin
        p_0_0_0_0_018522_fu_126 <= v0_id_data_fu_376_p1;
        p_0_0_0_0_024_fu_130 <= v1_id_data_fu_383_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_reg_938 == 4'd3))) begin
        p_0_0_0_0_018526_fu_134 <= v0_id_data_fu_376_p1;
        p_0_0_0_0_028_fu_138 <= v1_id_data_fu_383_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_reg_938 == 4'd2))) begin
        p_0_0_0_0_018530_fu_142 <= v0_id_data_fu_376_p1;
        p_0_0_0_0_032_fu_146 <= v1_id_data_fu_383_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_reg_938 == 4'd1))) begin
        p_0_0_0_0_018534_fu_150 <= v0_id_data_fu_376_p1;
        p_0_0_0_0_036_fu_154 <= v1_id_data_fu_383_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_reg_938 == 4'd0))) begin
        p_0_0_0_0_018538_fu_158 <= v0_id_data_fu_376_p1;
        p_0_0_0_0_040_fu_162 <= v1_id_data_fu_383_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((~(i_reg_938 == 4'd0) & ~(i_reg_938 == 4'd1) & ~(i_reg_938 == 4'd2) & ~(i_reg_938 == 4'd3) & ~(i_reg_938 == 4'd4) & ~(i_reg_938 == 4'd5) & ~(i_reg_938 == 4'd6) & ~(i_reg_938 == 4'd7) & ~(i_reg_938 == 4'd8) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_018542_fu_166 <= v0_id_data_fu_376_p1;
        p_0_0_0_0_044_fu_170 <= v1_id_data_fu_383_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (i_reg_938 == 4'd8))) begin
        p_0_0_0_0_01856_fu_94 <= v0_id_data_fu_376_p1;
        p_0_0_0_0_08_fu_98 <= v1_id_data_fu_383_p1;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
        ap_sig_allocacmp_i = 4'd0;
    end else begin
        ap_sig_allocacmp_i = i_1_fu_90;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        in_id0_s_blk_n = in_id0_s_empty_n;
    end else begin
        in_id0_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        in_id0_s_read = 1'b1;
    end else begin
        in_id0_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        in_id1_s_blk_n = in_id1_s_empty_n;
    end else begin
        in_id1_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        in_id1_s_read = 1'b1;
    end else begin
        in_id1_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_012_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_012_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_016_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_016_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_018510_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_018510_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_018514_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_018514_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_018518_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_018518_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_018522_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_018522_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_018526_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_018526_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_018530_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_018530_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_018534_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_018534_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_018538_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_018538_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_018542_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_018542_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_01856_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_01856_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_020_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_020_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_024_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_024_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_028_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_028_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_032_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_032_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_036_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_036_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_040_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_040_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_044_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_044_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln952_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0_0_0_0_08_out_ap_vld = 1'b1;
    end else begin
        p_0_0_0_0_08_out_ap_vld = 1'b0;
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

assign add_ln952_fu_350_p2 = (ap_sig_allocacmp_i + 4'd1);

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
    ap_block_state2_pp0_stage0_iter1 = ((in_id1_s_empty_n == 1'b0) | (in_id0_s_empty_n == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln952_fu_356_p2 = ((ap_sig_allocacmp_i == 4'd10) ? 1'b1 : 1'b0);

assign p_0_0_0_0_012_out = p_0_0_0_0_012_fu_106;

assign p_0_0_0_0_016_out = p_0_0_0_0_016_fu_114;

assign p_0_0_0_0_018510_out = p_0_0_0_0_018510_fu_102;

assign p_0_0_0_0_018514_out = p_0_0_0_0_018514_fu_110;

assign p_0_0_0_0_018518_out = p_0_0_0_0_018518_fu_118;

assign p_0_0_0_0_018522_out = p_0_0_0_0_018522_fu_126;

assign p_0_0_0_0_018526_out = p_0_0_0_0_018526_fu_134;

assign p_0_0_0_0_018530_out = p_0_0_0_0_018530_fu_142;

assign p_0_0_0_0_018534_out = p_0_0_0_0_018534_fu_150;

assign p_0_0_0_0_018538_out = p_0_0_0_0_018538_fu_158;

assign p_0_0_0_0_018542_out = p_0_0_0_0_018542_fu_166;

assign p_0_0_0_0_01856_out = p_0_0_0_0_01856_fu_94;

assign p_0_0_0_0_020_out = p_0_0_0_0_020_fu_122;

assign p_0_0_0_0_024_out = p_0_0_0_0_024_fu_130;

assign p_0_0_0_0_028_out = p_0_0_0_0_028_fu_138;

assign p_0_0_0_0_032_out = p_0_0_0_0_032_fu_146;

assign p_0_0_0_0_036_out = p_0_0_0_0_036_fu_154;

assign p_0_0_0_0_040_out = p_0_0_0_0_040_fu_162;

assign p_0_0_0_0_044_out = p_0_0_0_0_044_fu_170;

assign p_0_0_0_0_08_out = p_0_0_0_0_08_fu_98;

assign v0_id_data_fu_376_p1 = in_id0_s_dout[31:0];

assign v1_id_data_fu_383_p1 = in_id1_s_dout[31:0];

endmodule //krnl_globalSort_L3_krnl_globalSort_L3_Pipeline_VITIS_LOOP_952_2
