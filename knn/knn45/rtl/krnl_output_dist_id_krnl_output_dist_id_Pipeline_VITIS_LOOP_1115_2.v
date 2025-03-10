// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module krnl_output_dist_id_krnl_output_dist_id_Pipeline_VITIS_LOOP_1115_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        in_id_s_dout,
        in_id_s_empty_n,
        in_id_s_read,
        output_id_9_out,
        output_id_9_out_ap_vld,
        output_id_8_out,
        output_id_8_out_ap_vld,
        output_id_7_out,
        output_id_7_out_ap_vld,
        output_id_6_out,
        output_id_6_out_ap_vld,
        output_id_5_out,
        output_id_5_out_ap_vld,
        output_id_4_out,
        output_id_4_out_ap_vld,
        output_id_3_out,
        output_id_3_out_ap_vld,
        output_id_2_out,
        output_id_2_out_ap_vld,
        output_id_1_out,
        output_id_1_out_ap_vld,
        output_id_out,
        output_id_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [65:0] in_id_s_dout;
input   in_id_s_empty_n;
output   in_id_s_read;
output  [31:0] output_id_9_out;
output   output_id_9_out_ap_vld;
output  [31:0] output_id_8_out;
output   output_id_8_out_ap_vld;
output  [31:0] output_id_7_out;
output   output_id_7_out_ap_vld;
output  [31:0] output_id_6_out;
output   output_id_6_out_ap_vld;
output  [31:0] output_id_5_out;
output   output_id_5_out_ap_vld;
output  [31:0] output_id_4_out;
output   output_id_4_out_ap_vld;
output  [31:0] output_id_3_out;
output   output_id_3_out_ap_vld;
output  [31:0] output_id_2_out;
output   output_id_2_out_ap_vld;
output  [31:0] output_id_1_out;
output   output_id_1_out_ap_vld;
output  [31:0] output_id_out;
output   output_id_out_ap_vld;

reg ap_idle;
reg in_id_s_read;
reg output_id_9_out_ap_vld;
reg output_id_8_out_ap_vld;
reg output_id_7_out_ap_vld;
reg output_id_6_out_ap_vld;
reg output_id_5_out_ap_vld;
reg output_id_4_out_ap_vld;
reg output_id_3_out_ap_vld;
reg output_id_2_out_ap_vld;
reg output_id_1_out_ap_vld;
reg output_id_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln1115_fu_215_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    in_id_s_blk_n;
wire    ap_block_pp0_stage0;
reg   [3:0] i_1_reg_520;
reg    ap_block_pp0_stage0_11001;
reg   [3:0] i_fu_68;
wire   [3:0] add_ln1115_fu_209_p2;
wire    ap_loop_init;
reg   [3:0] ap_sig_allocacmp_i_1;
reg   [31:0] output_id_fu_72;
wire   [31:0] output_id_11_fu_235_p1;
reg   [31:0] output_id_1_fu_76;
reg   [31:0] output_id_2_fu_80;
reg   [31:0] output_id_3_fu_84;
reg   [31:0] output_id_4_fu_88;
reg   [31:0] output_id_5_fu_92;
reg   [31:0] output_id_6_fu_96;
reg   [31:0] output_id_7_fu_100;
reg   [31:0] output_id_8_fu_104;
reg   [31:0] output_id_9_fu_108;
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
#0 i_fu_68 = 4'd0;
#0 output_id_fu_72 = 32'd0;
#0 output_id_1_fu_76 = 32'd0;
#0 output_id_2_fu_80 = 32'd0;
#0 output_id_3_fu_84 = 32'd0;
#0 output_id_4_fu_88 = 32'd0;
#0 output_id_5_fu_92 = 32'd0;
#0 output_id_6_fu_96 = 32'd0;
#0 output_id_7_fu_100 = 32'd0;
#0 output_id_8_fu_104 = 32'd0;
#0 output_id_9_fu_108 = 32'd0;
#0 ap_done_reg = 1'b0;
end

krnl_output_dist_id_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        if (((icmp_ln1115_fu_215_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_68 <= add_ln1115_fu_209_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_68 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_1_reg_520 <= ap_sig_allocacmp_i_1;
    end
end

always @ (posedge ap_clk) begin
    if (((i_1_reg_520 == 4'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_1_fu_76 <= output_id_11_fu_235_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((i_1_reg_520 == 4'd2) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_2_fu_80 <= output_id_11_fu_235_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((i_1_reg_520 == 4'd3) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_3_fu_84 <= output_id_11_fu_235_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((i_1_reg_520 == 4'd4) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_4_fu_88 <= output_id_11_fu_235_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((i_1_reg_520 == 4'd5) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_5_fu_92 <= output_id_11_fu_235_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((i_1_reg_520 == 4'd6) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_6_fu_96 <= output_id_11_fu_235_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((i_1_reg_520 == 4'd7) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_7_fu_100 <= output_id_11_fu_235_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((i_1_reg_520 == 4'd8) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_8_fu_104 <= output_id_11_fu_235_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((~(i_1_reg_520 == 4'd8) & ~(i_1_reg_520 == 4'd7) & ~(i_1_reg_520 == 4'd6) & ~(i_1_reg_520 == 4'd5) & ~(i_1_reg_520 == 4'd4) & ~(i_1_reg_520 == 4'd3) & ~(i_1_reg_520 == 4'd2) & ~(i_1_reg_520 == 4'd1) & ~(i_1_reg_520 == 4'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_9_fu_108 <= output_id_11_fu_235_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((i_1_reg_520 == 4'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_fu_72 <= output_id_11_fu_235_p1;
    end
end

always @ (*) begin
    if (((icmp_ln1115_fu_215_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i_1 = 4'd0;
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_68;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        in_id_s_blk_n = in_id_s_empty_n;
    end else begin
        in_id_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        in_id_s_read = 1'b1;
    end else begin
        in_id_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1115_fu_215_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_1_out_ap_vld = 1'b1;
    end else begin
        output_id_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1115_fu_215_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_2_out_ap_vld = 1'b1;
    end else begin
        output_id_2_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1115_fu_215_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_3_out_ap_vld = 1'b1;
    end else begin
        output_id_3_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1115_fu_215_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_4_out_ap_vld = 1'b1;
    end else begin
        output_id_4_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1115_fu_215_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_5_out_ap_vld = 1'b1;
    end else begin
        output_id_5_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1115_fu_215_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_6_out_ap_vld = 1'b1;
    end else begin
        output_id_6_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1115_fu_215_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_7_out_ap_vld = 1'b1;
    end else begin
        output_id_7_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1115_fu_215_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_8_out_ap_vld = 1'b1;
    end else begin
        output_id_8_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1115_fu_215_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_9_out_ap_vld = 1'b1;
    end else begin
        output_id_9_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1115_fu_215_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        output_id_out_ap_vld = 1'b1;
    end else begin
        output_id_out_ap_vld = 1'b0;
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

assign add_ln1115_fu_209_p2 = (ap_sig_allocacmp_i_1 + 4'd1);

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
    ap_block_state2_pp0_stage0_iter1 = (in_id_s_empty_n == 1'b0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln1115_fu_215_p2 = ((ap_sig_allocacmp_i_1 == 4'd10) ? 1'b1 : 1'b0);

assign output_id_11_fu_235_p1 = in_id_s_dout[31:0];

assign output_id_1_out = output_id_1_fu_76;

assign output_id_2_out = output_id_2_fu_80;

assign output_id_3_out = output_id_3_fu_84;

assign output_id_4_out = output_id_4_fu_88;

assign output_id_5_out = output_id_5_fu_92;

assign output_id_6_out = output_id_6_fu_96;

assign output_id_7_out = output_id_7_fu_100;

assign output_id_8_out = output_id_8_fu_104;

assign output_id_9_out = output_id_9_fu_108;

assign output_id_out = output_id_fu_72;

endmodule //krnl_output_dist_id_krnl_output_dist_id_Pipeline_VITIS_LOOP_1115_2
