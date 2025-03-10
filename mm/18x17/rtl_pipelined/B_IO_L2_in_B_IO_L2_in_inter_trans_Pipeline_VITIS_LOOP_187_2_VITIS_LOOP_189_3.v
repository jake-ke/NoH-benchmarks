`timescale 1 ns / 1 ps
// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================
 
module B_IO_L2_in_B_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_187_2_VITIS_LOOP_189_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        fifo_B_in_s_dout,
        fifo_B_in_s_empty_n,
        fifo_B_in_s_read,
        local_B_0_address0,
        local_B_0_ce0,
        local_B_0_we0,
        local_B_0_d0,
        local_B_1_address0,
        local_B_1_ce0,
        local_B_1_we0,
        local_B_1_d0,
        local_B_2_address0,
        local_B_2_ce0,
        local_B_2_we0,
        local_B_2_d0,
        local_B_3_address0,
        local_B_3_ce0,
        local_B_3_we0,
        local_B_3_d0,
        local_B_4_address0,
        local_B_4_ce0,
        local_B_4_we0,
        local_B_4_d0,
        local_B_5_address0,
        local_B_5_ce0,
        local_B_5_we0,
        local_B_5_d0,
        local_B_6_address0,
        local_B_6_ce0,
        local_B_6_we0,
        local_B_6_d0,
        local_B_7_address0,
        local_B_7_ce0,
        local_B_7_we0,
        local_B_7_d0,
        local_B_8_address0,
        local_B_8_ce0,
        local_B_8_we0,
        local_B_8_d0,
        local_B_9_address0,
        local_B_9_ce0,
        local_B_9_we0,
        local_B_9_d0,
        local_B_10_address0,
        local_B_10_ce0,
        local_B_10_we0,
        local_B_10_d0,
        local_B_11_address0,
        local_B_11_ce0,
        local_B_11_we0,
        local_B_11_d0,
        local_B_12_address0,
        local_B_12_ce0,
        local_B_12_we0,
        local_B_12_d0,
        local_B_13_address0,
        local_B_13_ce0,
        local_B_13_we0,
        local_B_13_d0,
        local_B_14_address0,
        local_B_14_ce0,
        local_B_14_we0,
        local_B_14_d0,
        local_B_15_address0,
        local_B_15_ce0,
        local_B_15_we0,
        local_B_15_d0,
        local_B_16_address0,
        local_B_16_ce0,
        local_B_16_we0,
        local_B_16_d0,
        local_B_17_address0,
        local_B_17_ce0,
        local_B_17_we0,
        local_B_17_d0,
        local_B_18_address0,
        local_B_18_ce0,
        local_B_18_we0,
        local_B_18_d0,
        local_B_19_address0,
        local_B_19_ce0,
        local_B_19_we0,
        local_B_19_d0,
        local_B_20_address0,
        local_B_20_ce0,
        local_B_20_we0,
        local_B_20_d0,
        local_B_21_address0,
        local_B_21_ce0,
        local_B_21_we0,
        local_B_21_d0,
        local_B_22_address0,
        local_B_22_ce0,
        local_B_22_we0,
        local_B_22_d0,
        local_B_23_address0,
        local_B_23_ce0,
        local_B_23_we0,
        local_B_23_d0,
        local_B_24_address0,
        local_B_24_ce0,
        local_B_24_we0,
        local_B_24_d0,
        local_B_25_address0,
        local_B_25_ce0,
        local_B_25_we0,
        local_B_25_d0,
        local_B_26_address0,
        local_B_26_ce0,
        local_B_26_we0,
        local_B_26_d0,
        local_B_27_address0,
        local_B_27_ce0,
        local_B_27_we0,
        local_B_27_d0,
        local_B_28_address0,
        local_B_28_ce0,
        local_B_28_we0,
        local_B_28_d0,
        local_B_29_address0,
        local_B_29_ce0,
        local_B_29_we0,
        local_B_29_d0,
        local_B_30_address0,
        local_B_30_ce0,
        local_B_30_we0,
        local_B_30_d0,
        local_B_31_address0,
        local_B_31_ce0,
        local_B_31_we0,
        local_B_31_d0
);
parameter    ap_ST_fsm_pp0_stage0 = 1'd1;
input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [512:0] fifo_B_in_s_dout;
input   fifo_B_in_s_empty_n;
output   fifo_B_in_s_read;
output  [3:0] local_B_0_address0;
output   local_B_0_ce0;
output   local_B_0_we0;
output  [15:0] local_B_0_d0;
output  [3:0] local_B_1_address0;
output   local_B_1_ce0;
output   local_B_1_we0;
output  [15:0] local_B_1_d0;
output  [3:0] local_B_2_address0;
output   local_B_2_ce0;
output   local_B_2_we0;
output  [15:0] local_B_2_d0;
output  [3:0] local_B_3_address0;
output   local_B_3_ce0;
output   local_B_3_we0;
output  [15:0] local_B_3_d0;
output  [3:0] local_B_4_address0;
output   local_B_4_ce0;
output   local_B_4_we0;
output  [15:0] local_B_4_d0;
output  [3:0] local_B_5_address0;
output   local_B_5_ce0;
output   local_B_5_we0;
output  [15:0] local_B_5_d0;
output  [3:0] local_B_6_address0;
output   local_B_6_ce0;
output   local_B_6_we0;
output  [15:0] local_B_6_d0;
output  [3:0] local_B_7_address0;
output   local_B_7_ce0;
output   local_B_7_we0;
output  [15:0] local_B_7_d0;
output  [3:0] local_B_8_address0;
output   local_B_8_ce0;
output   local_B_8_we0;
output  [15:0] local_B_8_d0;
output  [3:0] local_B_9_address0;
output   local_B_9_ce0;
output   local_B_9_we0;
output  [15:0] local_B_9_d0;
output  [3:0] local_B_10_address0;
output   local_B_10_ce0;
output   local_B_10_we0;
output  [15:0] local_B_10_d0;
output  [3:0] local_B_11_address0;
output   local_B_11_ce0;
output   local_B_11_we0;
output  [15:0] local_B_11_d0;
output  [3:0] local_B_12_address0;
output   local_B_12_ce0;
output   local_B_12_we0;
output  [15:0] local_B_12_d0;
output  [3:0] local_B_13_address0;
output   local_B_13_ce0;
output   local_B_13_we0;
output  [15:0] local_B_13_d0;
output  [3:0] local_B_14_address0;
output   local_B_14_ce0;
output   local_B_14_we0;
output  [15:0] local_B_14_d0;
output  [3:0] local_B_15_address0;
output   local_B_15_ce0;
output   local_B_15_we0;
output  [15:0] local_B_15_d0;
output  [3:0] local_B_16_address0;
output   local_B_16_ce0;
output   local_B_16_we0;
output  [15:0] local_B_16_d0;
output  [3:0] local_B_17_address0;
output   local_B_17_ce0;
output   local_B_17_we0;
output  [15:0] local_B_17_d0;
output  [3:0] local_B_18_address0;
output   local_B_18_ce0;
output   local_B_18_we0;
output  [15:0] local_B_18_d0;
output  [3:0] local_B_19_address0;
output   local_B_19_ce0;
output   local_B_19_we0;
output  [15:0] local_B_19_d0;
output  [3:0] local_B_20_address0;
output   local_B_20_ce0;
output   local_B_20_we0;
output  [15:0] local_B_20_d0;
output  [3:0] local_B_21_address0;
output   local_B_21_ce0;
output   local_B_21_we0;
output  [15:0] local_B_21_d0;
output  [3:0] local_B_22_address0;
output   local_B_22_ce0;
output   local_B_22_we0;
output  [15:0] local_B_22_d0;
output  [3:0] local_B_23_address0;
output   local_B_23_ce0;
output   local_B_23_we0;
output  [15:0] local_B_23_d0;
output  [3:0] local_B_24_address0;
output   local_B_24_ce0;
output   local_B_24_we0;
output  [15:0] local_B_24_d0;
output  [3:0] local_B_25_address0;
output   local_B_25_ce0;
output   local_B_25_we0;
output  [15:0] local_B_25_d0;
output  [3:0] local_B_26_address0;
output   local_B_26_ce0;
output   local_B_26_we0;
output  [15:0] local_B_26_d0;
output  [3:0] local_B_27_address0;
output   local_B_27_ce0;
output   local_B_27_we0;
output  [15:0] local_B_27_d0;
output  [3:0] local_B_28_address0;
output   local_B_28_ce0;
output   local_B_28_we0;
output  [15:0] local_B_28_d0;
output  [3:0] local_B_29_address0;
output   local_B_29_ce0;
output   local_B_29_we0;
output  [15:0] local_B_29_d0;
output  [3:0] local_B_30_address0;
output   local_B_30_ce0;
output   local_B_30_we0;
output  [15:0] local_B_30_d0;
output  [3:0] local_B_31_address0;
output   local_B_31_ce0;
output   local_B_31_we0;
output  [15:0] local_B_31_d0;
reg ap_idle;
reg fifo_B_in_s_read;
reg local_B_0_ce0;
reg local_B_0_we0;
reg local_B_1_ce0;
reg local_B_1_we0;
reg local_B_2_ce0;
reg local_B_2_we0;
reg local_B_3_ce0;
reg local_B_3_we0;
reg local_B_4_ce0;
reg local_B_4_we0;
reg local_B_5_ce0;
reg local_B_5_we0;
reg local_B_6_ce0;
reg local_B_6_we0;
reg local_B_7_ce0;
reg local_B_7_we0;
reg local_B_8_ce0;
reg local_B_8_we0;
reg local_B_9_ce0;
reg local_B_9_we0;
reg local_B_10_ce0;
reg local_B_10_we0;
reg local_B_11_ce0;
reg local_B_11_we0;
reg local_B_12_ce0;
reg local_B_12_we0;
reg local_B_13_ce0;
reg local_B_13_we0;
reg local_B_14_ce0;
reg local_B_14_we0;
reg local_B_15_ce0;
reg local_B_15_we0;
reg local_B_16_ce0;
reg local_B_16_we0;
reg local_B_17_ce0;
reg local_B_17_we0;
reg local_B_18_ce0;
reg local_B_18_we0;
reg local_B_19_ce0;
reg local_B_19_we0;
reg local_B_20_ce0;
reg local_B_20_we0;
reg local_B_21_ce0;
reg local_B_21_we0;
reg local_B_22_ce0;
reg local_B_22_we0;
reg local_B_23_ce0;
reg local_B_23_we0;
reg local_B_24_ce0;
reg local_B_24_we0;
reg local_B_25_ce0;
reg local_B_25_we0;
reg local_B_26_ce0;
reg local_B_26_we0;
reg local_B_27_ce0;
reg local_B_27_we0;
reg local_B_28_ce0;
reg local_B_28_we0;
reg local_B_29_ce0;
reg local_B_29_we0;
reg local_B_30_ce0;
reg local_B_30_we0;
reg local_B_31_ce0;
reg local_B_31_we0;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln187_fu_724_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    fifo_B_in_s_blk_n;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln196_1_fu_798_p1;
reg   [1:0] c5_fu_242;
wire   [1:0] add_ln189_fu_1438_p2;
reg    ap_block_pp0_stage0_11001;
wire    ap_loop_init;
reg   [3:0] c4_fu_246;
wire   [3:0] select_ln187_1_fu_774_p3;
reg   [4:0] indvar_flatten_fu_250;
wire   [4:0] add_ln187_1_fu_718_p2;
reg   [4:0] ap_sig_allocacmp_indvar_flatten_load;
wire   [0:0] icmp_ln189_fu_760_p2;
wire   [3:0] add_ln187_fu_754_p2;
wire   [1:0] select_ln187_fu_766_p3;
wire   [3:0] shl_ln196_fu_782_p2;
wire   [3:0] zext_ln196_fu_788_p1;
wire   [3:0] add_ln196_fu_792_p2;
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
#0 c5_fu_242 = 2'd0;
#0 c4_fu_246 = 4'd0;
#0 indvar_flatten_fu_250 = 5'd0;
#0 ap_done_reg = 1'b0;
end
B_IO_L2_in_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        if ((ap_loop_init == 1'b1)) begin
            c4_fu_246 <= 4'd0;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            c4_fu_246 <= select_ln187_1_fu_774_p3;
        end
    end
end
always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            c5_fu_242 <= 2'd0;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            c5_fu_242 <= add_ln189_fu_1438_p2;
        end
    end
end
always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln187_fu_724_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            indvar_flatten_fu_250 <= add_ln187_1_fu_718_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_250 <= 5'd0;
        end
    end
end
always @ (*) begin
    if (((icmp_ln187_fu_724_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_indvar_flatten_load = 5'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_250;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fifo_B_in_s_blk_n = fifo_B_in_s_empty_n;
    end else begin
        fifo_B_in_s_blk_n = 1'b1;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fifo_B_in_s_read = 1'b1;
    end else begin
        fifo_B_in_s_read = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_0_ce0 = 1'b1;
    end else begin
        local_B_0_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_0_we0 = 1'b1;
    end else begin
        local_B_0_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_10_ce0 = 1'b1;
    end else begin
        local_B_10_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_10_we0 = 1'b1;
    end else begin
        local_B_10_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_11_ce0 = 1'b1;
    end else begin
        local_B_11_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_11_we0 = 1'b1;
    end else begin
        local_B_11_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_12_ce0 = 1'b1;
    end else begin
        local_B_12_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_12_we0 = 1'b1;
    end else begin
        local_B_12_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_13_ce0 = 1'b1;
    end else begin
        local_B_13_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_13_we0 = 1'b1;
    end else begin
        local_B_13_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_14_ce0 = 1'b1;
    end else begin
        local_B_14_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_14_we0 = 1'b1;
    end else begin
        local_B_14_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_15_ce0 = 1'b1;
    end else begin
        local_B_15_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_15_we0 = 1'b1;
    end else begin
        local_B_15_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_16_ce0 = 1'b1;
    end else begin
        local_B_16_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_16_we0 = 1'b1;
    end else begin
        local_B_16_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_17_ce0 = 1'b1;
    end else begin
        local_B_17_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_17_we0 = 1'b1;
    end else begin
        local_B_17_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_18_ce0 = 1'b1;
    end else begin
        local_B_18_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_18_we0 = 1'b1;
    end else begin
        local_B_18_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_19_ce0 = 1'b1;
    end else begin
        local_B_19_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_19_we0 = 1'b1;
    end else begin
        local_B_19_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_1_ce0 = 1'b1;
    end else begin
        local_B_1_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_1_we0 = 1'b1;
    end else begin
        local_B_1_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_20_ce0 = 1'b1;
    end else begin
        local_B_20_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_20_we0 = 1'b1;
    end else begin
        local_B_20_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_21_ce0 = 1'b1;
    end else begin
        local_B_21_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_21_we0 = 1'b1;
    end else begin
        local_B_21_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_22_ce0 = 1'b1;
    end else begin
        local_B_22_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_22_we0 = 1'b1;
    end else begin
        local_B_22_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_23_ce0 = 1'b1;
    end else begin
        local_B_23_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_23_we0 = 1'b1;
    end else begin
        local_B_23_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_24_ce0 = 1'b1;
    end else begin
        local_B_24_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_24_we0 = 1'b1;
    end else begin
        local_B_24_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_25_ce0 = 1'b1;
    end else begin
        local_B_25_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_25_we0 = 1'b1;
    end else begin
        local_B_25_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_26_ce0 = 1'b1;
    end else begin
        local_B_26_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_26_we0 = 1'b1;
    end else begin
        local_B_26_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_27_ce0 = 1'b1;
    end else begin
        local_B_27_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_27_we0 = 1'b1;
    end else begin
        local_B_27_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_28_ce0 = 1'b1;
    end else begin
        local_B_28_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_28_we0 = 1'b1;
    end else begin
        local_B_28_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_29_ce0 = 1'b1;
    end else begin
        local_B_29_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_29_we0 = 1'b1;
    end else begin
        local_B_29_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_2_ce0 = 1'b1;
    end else begin
        local_B_2_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_2_we0 = 1'b1;
    end else begin
        local_B_2_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_30_ce0 = 1'b1;
    end else begin
        local_B_30_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_30_we0 = 1'b1;
    end else begin
        local_B_30_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_31_ce0 = 1'b1;
    end else begin
        local_B_31_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_31_we0 = 1'b1;
    end else begin
        local_B_31_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_3_ce0 = 1'b1;
    end else begin
        local_B_3_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_3_we0 = 1'b1;
    end else begin
        local_B_3_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_4_ce0 = 1'b1;
    end else begin
        local_B_4_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_4_we0 = 1'b1;
    end else begin
        local_B_4_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_5_ce0 = 1'b1;
    end else begin
        local_B_5_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_5_we0 = 1'b1;
    end else begin
        local_B_5_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_6_ce0 = 1'b1;
    end else begin
        local_B_6_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_6_we0 = 1'b1;
    end else begin
        local_B_6_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_7_ce0 = 1'b1;
    end else begin
        local_B_7_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_7_we0 = 1'b1;
    end else begin
        local_B_7_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_8_ce0 = 1'b1;
    end else begin
        local_B_8_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_8_we0 = 1'b1;
    end else begin
        local_B_8_we0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_9_ce0 = 1'b1;
    end else begin
        local_B_9_ce0 = 1'b0;
    end
end
always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        local_B_9_we0 = 1'b1;
    end else begin
        local_B_9_we0 = 1'b0;
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
assign add_ln187_1_fu_718_p2 = (ap_sig_allocacmp_indvar_flatten_load + 5'd1);
assign add_ln187_fu_754_p2 = (c4_fu_246 + 4'd1);
assign add_ln189_fu_1438_p2 = (select_ln187_fu_766_p3 + 2'd1);
assign add_ln196_fu_792_p2 = (shl_ln196_fu_782_p2 + zext_ln196_fu_788_p1);
assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);
always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state2_pp0_stage0_iter1));
end
always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state2_pp0_stage0_iter1));
end
always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (fifo_B_in_s_empty_n == 1'b0);
end
assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);
assign ap_enable_reg_pp0_iter0 = ap_start_int;
assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
assign icmp_ln187_fu_724_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 5'd16) ? 1'b1 : 1'b0);
assign icmp_ln189_fu_760_p2 = ((c5_fu_242 == 2'd2) ? 1'b1 : 1'b0);
assign local_B_0_address0 = zext_ln196_1_fu_798_p1;
assign local_B_0_d0 = fifo_B_in_s_dout[15:0];
assign local_B_10_address0 = zext_ln196_1_fu_798_p1;
assign local_B_10_d0 = {{fifo_B_in_s_dout[175:160]}};
assign local_B_11_address0 = zext_ln196_1_fu_798_p1;
assign local_B_11_d0 = {{fifo_B_in_s_dout[191:176]}};
assign local_B_12_address0 = zext_ln196_1_fu_798_p1;
assign local_B_12_d0 = {{fifo_B_in_s_dout[207:192]}};
assign local_B_13_address0 = zext_ln196_1_fu_798_p1;
assign local_B_13_d0 = {{fifo_B_in_s_dout[223:208]}};
assign local_B_14_address0 = zext_ln196_1_fu_798_p1;
assign local_B_14_d0 = {{fifo_B_in_s_dout[239:224]}};
assign local_B_15_address0 = zext_ln196_1_fu_798_p1;
assign local_B_15_d0 = {{fifo_B_in_s_dout[255:240]}};
assign local_B_16_address0 = zext_ln196_1_fu_798_p1;
assign local_B_16_d0 = {{fifo_B_in_s_dout[271:256]}};
assign local_B_17_address0 = zext_ln196_1_fu_798_p1;
assign local_B_17_d0 = {{fifo_B_in_s_dout[287:272]}};
assign local_B_18_address0 = zext_ln196_1_fu_798_p1;
assign local_B_18_d0 = {{fifo_B_in_s_dout[303:288]}};
assign local_B_19_address0 = zext_ln196_1_fu_798_p1;
assign local_B_19_d0 = {{fifo_B_in_s_dout[319:304]}};
assign local_B_1_address0 = zext_ln196_1_fu_798_p1;
assign local_B_1_d0 = {{fifo_B_in_s_dout[31:16]}};
assign local_B_20_address0 = zext_ln196_1_fu_798_p1;
assign local_B_20_d0 = {{fifo_B_in_s_dout[335:320]}};
assign local_B_21_address0 = zext_ln196_1_fu_798_p1;
assign local_B_21_d0 = {{fifo_B_in_s_dout[351:336]}};
assign local_B_22_address0 = zext_ln196_1_fu_798_p1;
assign local_B_22_d0 = {{fifo_B_in_s_dout[367:352]}};
assign local_B_23_address0 = zext_ln196_1_fu_798_p1;
assign local_B_23_d0 = {{fifo_B_in_s_dout[383:368]}};
assign local_B_24_address0 = zext_ln196_1_fu_798_p1;
assign local_B_24_d0 = {{fifo_B_in_s_dout[399:384]}};
assign local_B_25_address0 = zext_ln196_1_fu_798_p1;
assign local_B_25_d0 = {{fifo_B_in_s_dout[415:400]}};
assign local_B_26_address0 = zext_ln196_1_fu_798_p1;
assign local_B_26_d0 = {{fifo_B_in_s_dout[431:416]}};
assign local_B_27_address0 = zext_ln196_1_fu_798_p1;
assign local_B_27_d0 = {{fifo_B_in_s_dout[447:432]}};
assign local_B_28_address0 = zext_ln196_1_fu_798_p1;
assign local_B_28_d0 = {{fifo_B_in_s_dout[463:448]}};
assign local_B_29_address0 = zext_ln196_1_fu_798_p1;
assign local_B_29_d0 = {{fifo_B_in_s_dout[479:464]}};
assign local_B_2_address0 = zext_ln196_1_fu_798_p1;
assign local_B_2_d0 = {{fifo_B_in_s_dout[47:32]}};
assign local_B_30_address0 = zext_ln196_1_fu_798_p1;
assign local_B_30_d0 = {{fifo_B_in_s_dout[495:480]}};
assign local_B_31_address0 = zext_ln196_1_fu_798_p1;
assign local_B_31_d0 = {{fifo_B_in_s_dout[511:496]}};
assign local_B_3_address0 = zext_ln196_1_fu_798_p1;
assign local_B_3_d0 = {{fifo_B_in_s_dout[63:48]}};
assign local_B_4_address0 = zext_ln196_1_fu_798_p1;
assign local_B_4_d0 = {{fifo_B_in_s_dout[79:64]}};
assign local_B_5_address0 = zext_ln196_1_fu_798_p1;
assign local_B_5_d0 = {{fifo_B_in_s_dout[95:80]}};
assign local_B_6_address0 = zext_ln196_1_fu_798_p1;
assign local_B_6_d0 = {{fifo_B_in_s_dout[111:96]}};
assign local_B_7_address0 = zext_ln196_1_fu_798_p1;
assign local_B_7_d0 = {{fifo_B_in_s_dout[127:112]}};
assign local_B_8_address0 = zext_ln196_1_fu_798_p1;
assign local_B_8_d0 = {{fifo_B_in_s_dout[143:128]}};
assign local_B_9_address0 = zext_ln196_1_fu_798_p1;
assign local_B_9_d0 = {{fifo_B_in_s_dout[159:144]}};
assign select_ln187_1_fu_774_p3 = ((icmp_ln189_fu_760_p2[0:0] == 1'b1) ? add_ln187_fu_754_p2 : c4_fu_246);
assign select_ln187_fu_766_p3 = ((icmp_ln189_fu_760_p2[0:0] == 1'b1) ? 2'd0 : c5_fu_242);
assign shl_ln196_fu_782_p2 = select_ln187_1_fu_774_p3 << 4'd1;
assign zext_ln196_1_fu_798_p1 = add_ln196_fu_792_p2;
assign zext_ln196_fu_788_p1 = select_ln187_fu_766_p3;
endmodule