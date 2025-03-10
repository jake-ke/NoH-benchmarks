// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module krnl_globalSort_L1_L2_seq_global_merge_L1_L2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        local_kNearstDist_partial_0_0_val,
        local_kNearstDist_partial_0_1_val,
        local_kNearstDist_partial_0_2_val,
        local_kNearstDist_partial_0_3_val,
        local_kNearstDist_partial_0_4_val,
        local_kNearstDist_partial_0_5_val,
        local_kNearstDist_partial_0_6_val,
        local_kNearstDist_partial_0_7_val,
        local_kNearstDist_partial_0_8_val,
        local_kNearstDist_partial_0_9_val,
        local_kNearstDist_partial_1_0_val,
        local_kNearstDist_partial_1_1_val,
        local_kNearstDist_partial_1_2_val,
        local_kNearstDist_partial_1_3_val,
        local_kNearstDist_partial_1_4_val,
        local_kNearstDist_partial_1_5_val,
        local_kNearstDist_partial_1_6_val,
        local_kNearstDist_partial_1_7_val,
        local_kNearstDist_partial_1_8_val,
        local_kNearstDist_partial_1_9_val,
        local_kNearstDist_partial_2_0_val,
        local_kNearstDist_partial_2_1_val,
        local_kNearstDist_partial_2_2_val,
        local_kNearstDist_partial_2_3_val,
        local_kNearstDist_partial_2_4_val,
        local_kNearstDist_partial_2_5_val,
        local_kNearstDist_partial_2_6_val,
        local_kNearstDist_partial_2_7_val,
        local_kNearstDist_partial_2_8_val,
        local_kNearstDist_partial_2_9_val,
        local_kNearstId_partial_0_0_val,
        local_kNearstId_partial_0_1_val,
        local_kNearstId_partial_0_2_val,
        local_kNearstId_partial_0_3_val,
        local_kNearstId_partial_0_4_val,
        local_kNearstId_partial_0_5_val,
        local_kNearstId_partial_0_6_val,
        local_kNearstId_partial_0_7_val,
        local_kNearstId_partial_0_8_val,
        local_kNearstId_partial_0_9_val,
        local_kNearstId_partial_1_0_val,
        local_kNearstId_partial_1_1_val,
        local_kNearstId_partial_1_2_val,
        local_kNearstId_partial_1_3_val,
        local_kNearstId_partial_1_4_val,
        local_kNearstId_partial_1_5_val,
        local_kNearstId_partial_1_6_val,
        local_kNearstId_partial_1_7_val,
        local_kNearstId_partial_1_8_val,
        local_kNearstId_partial_1_9_val,
        local_kNearstId_partial_2_0_val,
        local_kNearstId_partial_2_1_val,
        local_kNearstId_partial_2_2_val,
        local_kNearstId_partial_2_3_val,
        local_kNearstId_partial_2_4_val,
        local_kNearstId_partial_2_5_val,
        local_kNearstId_partial_2_6_val,
        local_kNearstId_partial_2_7_val,
        local_kNearstId_partial_2_8_val,
        local_kNearstId_partial_2_9_val,
        dist_0,
        dist_0_ap_vld,
        dist_1,
        dist_1_ap_vld,
        dist_2,
        dist_2_ap_vld,
        dist_3,
        dist_3_ap_vld,
        dist_4,
        dist_4_ap_vld,
        dist_5,
        dist_5_ap_vld,
        dist_6,
        dist_6_ap_vld,
        dist_7,
        dist_7_ap_vld,
        dist_8,
        dist_8_ap_vld,
        dist_9,
        dist_9_ap_vld,
        id_0,
        id_0_ap_vld,
        id_1,
        id_1_ap_vld,
        id_2,
        id_2_ap_vld,
        id_3,
        id_3_ap_vld,
        id_4,
        id_4_ap_vld,
        id_5,
        id_5_ap_vld,
        id_6,
        id_6_ap_vld,
        id_7,
        id_7_ap_vld,
        id_8,
        id_8_ap_vld,
        id_9,
        id_9_ap_vld
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] local_kNearstDist_partial_0_0_val;
input  [31:0] local_kNearstDist_partial_0_1_val;
input  [31:0] local_kNearstDist_partial_0_2_val;
input  [31:0] local_kNearstDist_partial_0_3_val;
input  [31:0] local_kNearstDist_partial_0_4_val;
input  [31:0] local_kNearstDist_partial_0_5_val;
input  [31:0] local_kNearstDist_partial_0_6_val;
input  [31:0] local_kNearstDist_partial_0_7_val;
input  [31:0] local_kNearstDist_partial_0_8_val;
input  [31:0] local_kNearstDist_partial_0_9_val;
input  [31:0] local_kNearstDist_partial_1_0_val;
input  [31:0] local_kNearstDist_partial_1_1_val;
input  [31:0] local_kNearstDist_partial_1_2_val;
input  [31:0] local_kNearstDist_partial_1_3_val;
input  [31:0] local_kNearstDist_partial_1_4_val;
input  [31:0] local_kNearstDist_partial_1_5_val;
input  [31:0] local_kNearstDist_partial_1_6_val;
input  [31:0] local_kNearstDist_partial_1_7_val;
input  [31:0] local_kNearstDist_partial_1_8_val;
input  [31:0] local_kNearstDist_partial_1_9_val;
input  [31:0] local_kNearstDist_partial_2_0_val;
input  [31:0] local_kNearstDist_partial_2_1_val;
input  [31:0] local_kNearstDist_partial_2_2_val;
input  [31:0] local_kNearstDist_partial_2_3_val;
input  [31:0] local_kNearstDist_partial_2_4_val;
input  [31:0] local_kNearstDist_partial_2_5_val;
input  [31:0] local_kNearstDist_partial_2_6_val;
input  [31:0] local_kNearstDist_partial_2_7_val;
input  [31:0] local_kNearstDist_partial_2_8_val;
input  [31:0] local_kNearstDist_partial_2_9_val;
input  [31:0] local_kNearstId_partial_0_0_val;
input  [31:0] local_kNearstId_partial_0_1_val;
input  [31:0] local_kNearstId_partial_0_2_val;
input  [31:0] local_kNearstId_partial_0_3_val;
input  [31:0] local_kNearstId_partial_0_4_val;
input  [31:0] local_kNearstId_partial_0_5_val;
input  [31:0] local_kNearstId_partial_0_6_val;
input  [31:0] local_kNearstId_partial_0_7_val;
input  [31:0] local_kNearstId_partial_0_8_val;
input  [31:0] local_kNearstId_partial_0_9_val;
input  [31:0] local_kNearstId_partial_1_0_val;
input  [31:0] local_kNearstId_partial_1_1_val;
input  [31:0] local_kNearstId_partial_1_2_val;
input  [31:0] local_kNearstId_partial_1_3_val;
input  [31:0] local_kNearstId_partial_1_4_val;
input  [31:0] local_kNearstId_partial_1_5_val;
input  [31:0] local_kNearstId_partial_1_6_val;
input  [31:0] local_kNearstId_partial_1_7_val;
input  [31:0] local_kNearstId_partial_1_8_val;
input  [31:0] local_kNearstId_partial_1_9_val;
input  [31:0] local_kNearstId_partial_2_0_val;
input  [31:0] local_kNearstId_partial_2_1_val;
input  [31:0] local_kNearstId_partial_2_2_val;
input  [31:0] local_kNearstId_partial_2_3_val;
input  [31:0] local_kNearstId_partial_2_4_val;
input  [31:0] local_kNearstId_partial_2_5_val;
input  [31:0] local_kNearstId_partial_2_6_val;
input  [31:0] local_kNearstId_partial_2_7_val;
input  [31:0] local_kNearstId_partial_2_8_val;
input  [31:0] local_kNearstId_partial_2_9_val;
output  [31:0] dist_0;
output   dist_0_ap_vld;
output  [31:0] dist_1;
output   dist_1_ap_vld;
output  [31:0] dist_2;
output   dist_2_ap_vld;
output  [31:0] dist_3;
output   dist_3_ap_vld;
output  [31:0] dist_4;
output   dist_4_ap_vld;
output  [31:0] dist_5;
output   dist_5_ap_vld;
output  [31:0] dist_6;
output   dist_6_ap_vld;
output  [31:0] dist_7;
output   dist_7_ap_vld;
output  [31:0] dist_8;
output   dist_8_ap_vld;
output  [31:0] dist_9;
output   dist_9_ap_vld;
output  [31:0] id_0;
output   id_0_ap_vld;
output  [31:0] id_1;
output   id_1_ap_vld;
output  [31:0] id_2;
output   id_2_ap_vld;
output  [31:0] id_3;
output   id_3_ap_vld;
output  [31:0] id_4;
output   id_4_ap_vld;
output  [31:0] id_5;
output   id_5_ap_vld;
output  [31:0] id_6;
output   id_6_ap_vld;
output  [31:0] id_7;
output   id_7_ap_vld;
output  [31:0] id_8;
output   id_8_ap_vld;
output  [31:0] id_9;
output   id_9_ap_vld;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg dist_0_ap_vld;
reg dist_1_ap_vld;
reg dist_2_ap_vld;
reg dist_3_ap_vld;
reg dist_4_ap_vld;
reg dist_5_ap_vld;
reg dist_6_ap_vld;
reg dist_7_ap_vld;
reg dist_8_ap_vld;
reg dist_9_ap_vld;
reg id_0_ap_vld;
reg id_1_ap_vld;
reg id_2_ap_vld;
reg id_3_ap_vld;
reg id_4_ap_vld;
reg id_5_ap_vld;
reg id_6_ap_vld;
reg id_7_ap_vld;
reg id_8_ap_vld;
reg id_9_ap_vld;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] trunc_ln788_fu_998_p1;
reg   [3:0] trunc_ln788_reg_1606;
wire    ap_CS_fsm_state2;
wire   [3:0] trunc_ln788_1_fu_1003_p1;
reg   [3:0] trunc_ln788_1_reg_1611;
wire   [3:0] trunc_ln788_2_fu_1008_p1;
reg   [3:0] trunc_ln788_2_reg_1616;
wire    grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_start;
wire    grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_done;
wire    grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_idle;
wire    grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_ready;
wire   [1:0] grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_idx_out;
wire    grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_idx_out_ap_vld;
wire   [31:0] grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_value_out;
wire    grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_value_out_ap_vld;
reg    grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_start_reg;
wire   [0:0] tmp_5_fu_981_p3;
wire    ap_CS_fsm_state3;
reg   [1:0] min_idx_loc_fu_246;
reg   [4:0] i_fu_226;
wire   [4:0] add_ln788_fu_1227_p2;
wire    ap_CS_fsm_state4;
reg   [31:0] idx_fu_230;
wire   [31:0] idx_3_fu_1205_p2;
wire   [1:0] min_idx_loc_load_load_fu_1016_p1;
reg   [31:0] idx_1_fu_234;
reg   [31:0] idx_2_fu_238;
wire   [3:0] trunc_ln788_3_fu_1036_p1;
wire   [31:0] tmp_4_fu_1174_p9;
wire   [31:0] tmp_fu_1039_p7;
wire   [31:0] tmp_fu_1039_p9;
wire   [31:0] tmp_1_fu_1060_p21;
wire   [3:0] trunc_ln801_fu_1056_p1;
wire   [31:0] tmp_2_fu_1098_p21;
wire   [31:0] tmp_3_fu_1136_p21;
wire   [31:0] tmp_1_fu_1060_p23;
wire   [31:0] tmp_2_fu_1098_p23;
wire   [31:0] tmp_3_fu_1136_p23;
wire   [31:0] tmp_4_fu_1174_p7;
reg   [3:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire   [1:0] tmp_fu_1039_p1;
wire   [1:0] tmp_fu_1039_p3;
wire  signed [1:0] tmp_fu_1039_p5;
wire   [3:0] tmp_1_fu_1060_p1;
wire   [3:0] tmp_1_fu_1060_p3;
wire   [3:0] tmp_1_fu_1060_p5;
wire   [3:0] tmp_1_fu_1060_p7;
wire   [3:0] tmp_1_fu_1060_p9;
wire   [3:0] tmp_1_fu_1060_p11;
wire   [3:0] tmp_1_fu_1060_p13;
wire   [3:0] tmp_1_fu_1060_p15;
wire  signed [3:0] tmp_1_fu_1060_p17;
wire  signed [3:0] tmp_1_fu_1060_p19;
wire   [3:0] tmp_2_fu_1098_p1;
wire   [3:0] tmp_2_fu_1098_p3;
wire   [3:0] tmp_2_fu_1098_p5;
wire   [3:0] tmp_2_fu_1098_p7;
wire   [3:0] tmp_2_fu_1098_p9;
wire   [3:0] tmp_2_fu_1098_p11;
wire   [3:0] tmp_2_fu_1098_p13;
wire   [3:0] tmp_2_fu_1098_p15;
wire  signed [3:0] tmp_2_fu_1098_p17;
wire  signed [3:0] tmp_2_fu_1098_p19;
wire   [3:0] tmp_3_fu_1136_p1;
wire   [3:0] tmp_3_fu_1136_p3;
wire   [3:0] tmp_3_fu_1136_p5;
wire   [3:0] tmp_3_fu_1136_p7;
wire   [3:0] tmp_3_fu_1136_p9;
wire   [3:0] tmp_3_fu_1136_p11;
wire   [3:0] tmp_3_fu_1136_p13;
wire   [3:0] tmp_3_fu_1136_p15;
wire  signed [3:0] tmp_3_fu_1136_p17;
wire  signed [3:0] tmp_3_fu_1136_p19;
wire   [1:0] tmp_4_fu_1174_p1;
wire   [1:0] tmp_4_fu_1174_p3;
wire  signed [1:0] tmp_4_fu_1174_p5;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_start_reg = 1'b0;
#0 i_fu_226 = 5'd0;
#0 idx_fu_230 = 32'd0;
#0 idx_1_fu_234 = 32'd0;
#0 idx_2_fu_238 = 32'd0;
end

krnl_globalSort_L1_L2_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3 grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_start),
    .ap_done(grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_done),
    .ap_idle(grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_idle),
    .ap_ready(grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_ready),
    .empty_8(trunc_ln788_2_reg_1616),
    .empty_9(trunc_ln788_1_reg_1611),
    .empty(trunc_ln788_reg_1606),
    .local_kNearstDist_partial_0_0_val(local_kNearstDist_partial_0_0_val),
    .local_kNearstDist_partial_0_1_val(local_kNearstDist_partial_0_1_val),
    .local_kNearstDist_partial_0_2_val(local_kNearstDist_partial_0_2_val),
    .local_kNearstDist_partial_0_3_val(local_kNearstDist_partial_0_3_val),
    .local_kNearstDist_partial_0_4_val(local_kNearstDist_partial_0_4_val),
    .local_kNearstDist_partial_0_5_val(local_kNearstDist_partial_0_5_val),
    .local_kNearstDist_partial_0_6_val(local_kNearstDist_partial_0_6_val),
    .local_kNearstDist_partial_0_7_val(local_kNearstDist_partial_0_7_val),
    .local_kNearstDist_partial_0_8_val(local_kNearstDist_partial_0_8_val),
    .local_kNearstDist_partial_0_9_val(local_kNearstDist_partial_0_9_val),
    .local_kNearstDist_partial_1_0_val(local_kNearstDist_partial_1_0_val),
    .local_kNearstDist_partial_1_1_val(local_kNearstDist_partial_1_1_val),
    .local_kNearstDist_partial_1_2_val(local_kNearstDist_partial_1_2_val),
    .local_kNearstDist_partial_1_3_val(local_kNearstDist_partial_1_3_val),
    .local_kNearstDist_partial_1_4_val(local_kNearstDist_partial_1_4_val),
    .local_kNearstDist_partial_1_5_val(local_kNearstDist_partial_1_5_val),
    .local_kNearstDist_partial_1_6_val(local_kNearstDist_partial_1_6_val),
    .local_kNearstDist_partial_1_7_val(local_kNearstDist_partial_1_7_val),
    .local_kNearstDist_partial_1_8_val(local_kNearstDist_partial_1_8_val),
    .local_kNearstDist_partial_1_9_val(local_kNearstDist_partial_1_9_val),
    .local_kNearstDist_partial_2_0_val(local_kNearstDist_partial_2_0_val),
    .local_kNearstDist_partial_2_1_val(local_kNearstDist_partial_2_1_val),
    .local_kNearstDist_partial_2_2_val(local_kNearstDist_partial_2_2_val),
    .local_kNearstDist_partial_2_3_val(local_kNearstDist_partial_2_3_val),
    .local_kNearstDist_partial_2_4_val(local_kNearstDist_partial_2_4_val),
    .local_kNearstDist_partial_2_5_val(local_kNearstDist_partial_2_5_val),
    .local_kNearstDist_partial_2_6_val(local_kNearstDist_partial_2_6_val),
    .local_kNearstDist_partial_2_7_val(local_kNearstDist_partial_2_7_val),
    .local_kNearstDist_partial_2_8_val(local_kNearstDist_partial_2_8_val),
    .local_kNearstDist_partial_2_9_val(local_kNearstDist_partial_2_9_val),
    .min_idx_out(grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_idx_out),
    .min_idx_out_ap_vld(grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_idx_out_ap_vld),
    .min_value_out(grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_value_out),
    .min_value_out_ap_vld(grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_value_out_ap_vld)
);

krnl_globalSort_L1_L2_sparsemux_7_2_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 2'h2 ),
    .din2_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
sparsemux_7_2_32_1_1_U112(
    .din0(idx_fu_230),
    .din1(idx_1_fu_234),
    .din2(idx_2_fu_238),
    .def(tmp_fu_1039_p7),
    .sel(min_idx_loc_fu_246),
    .dout(tmp_fu_1039_p9)
);

krnl_globalSort_L1_L2_sparsemux_21_4_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 4'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 4'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 4'h2 ),
    .din2_WIDTH( 32 ),
    .CASE3( 4'h3 ),
    .din3_WIDTH( 32 ),
    .CASE4( 4'h4 ),
    .din4_WIDTH( 32 ),
    .CASE5( 4'h5 ),
    .din5_WIDTH( 32 ),
    .CASE6( 4'h6 ),
    .din6_WIDTH( 32 ),
    .CASE7( 4'h7 ),
    .din7_WIDTH( 32 ),
    .CASE8( 4'h8 ),
    .din8_WIDTH( 32 ),
    .CASE9( 4'h9 ),
    .din9_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 4 ),
    .dout_WIDTH( 32 ))
sparsemux_21_4_32_1_1_U113(
    .din0(local_kNearstId_partial_0_0_val),
    .din1(local_kNearstId_partial_0_1_val),
    .din2(local_kNearstId_partial_0_2_val),
    .din3(local_kNearstId_partial_0_3_val),
    .din4(local_kNearstId_partial_0_4_val),
    .din5(local_kNearstId_partial_0_5_val),
    .din6(local_kNearstId_partial_0_6_val),
    .din7(local_kNearstId_partial_0_7_val),
    .din8(local_kNearstId_partial_0_8_val),
    .din9(local_kNearstId_partial_0_9_val),
    .def(tmp_1_fu_1060_p21),
    .sel(trunc_ln801_fu_1056_p1),
    .dout(tmp_1_fu_1060_p23)
);

krnl_globalSort_L1_L2_sparsemux_21_4_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 4'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 4'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 4'h2 ),
    .din2_WIDTH( 32 ),
    .CASE3( 4'h3 ),
    .din3_WIDTH( 32 ),
    .CASE4( 4'h4 ),
    .din4_WIDTH( 32 ),
    .CASE5( 4'h5 ),
    .din5_WIDTH( 32 ),
    .CASE6( 4'h6 ),
    .din6_WIDTH( 32 ),
    .CASE7( 4'h7 ),
    .din7_WIDTH( 32 ),
    .CASE8( 4'h8 ),
    .din8_WIDTH( 32 ),
    .CASE9( 4'h9 ),
    .din9_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 4 ),
    .dout_WIDTH( 32 ))
sparsemux_21_4_32_1_1_U114(
    .din0(local_kNearstId_partial_1_0_val),
    .din1(local_kNearstId_partial_1_1_val),
    .din2(local_kNearstId_partial_1_2_val),
    .din3(local_kNearstId_partial_1_3_val),
    .din4(local_kNearstId_partial_1_4_val),
    .din5(local_kNearstId_partial_1_5_val),
    .din6(local_kNearstId_partial_1_6_val),
    .din7(local_kNearstId_partial_1_7_val),
    .din8(local_kNearstId_partial_1_8_val),
    .din9(local_kNearstId_partial_1_9_val),
    .def(tmp_2_fu_1098_p21),
    .sel(trunc_ln801_fu_1056_p1),
    .dout(tmp_2_fu_1098_p23)
);

krnl_globalSort_L1_L2_sparsemux_21_4_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 4'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 4'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 4'h2 ),
    .din2_WIDTH( 32 ),
    .CASE3( 4'h3 ),
    .din3_WIDTH( 32 ),
    .CASE4( 4'h4 ),
    .din4_WIDTH( 32 ),
    .CASE5( 4'h5 ),
    .din5_WIDTH( 32 ),
    .CASE6( 4'h6 ),
    .din6_WIDTH( 32 ),
    .CASE7( 4'h7 ),
    .din7_WIDTH( 32 ),
    .CASE8( 4'h8 ),
    .din8_WIDTH( 32 ),
    .CASE9( 4'h9 ),
    .din9_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 4 ),
    .dout_WIDTH( 32 ))
sparsemux_21_4_32_1_1_U115(
    .din0(local_kNearstId_partial_2_0_val),
    .din1(local_kNearstId_partial_2_1_val),
    .din2(local_kNearstId_partial_2_2_val),
    .din3(local_kNearstId_partial_2_3_val),
    .din4(local_kNearstId_partial_2_4_val),
    .din5(local_kNearstId_partial_2_5_val),
    .din6(local_kNearstId_partial_2_6_val),
    .din7(local_kNearstId_partial_2_7_val),
    .din8(local_kNearstId_partial_2_8_val),
    .din9(local_kNearstId_partial_2_9_val),
    .def(tmp_3_fu_1136_p21),
    .sel(trunc_ln801_fu_1056_p1),
    .dout(tmp_3_fu_1136_p23)
);

krnl_globalSort_L1_L2_sparsemux_7_2_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 2'h2 ),
    .din2_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
sparsemux_7_2_32_1_1_U116(
    .din0(tmp_1_fu_1060_p23),
    .din1(tmp_2_fu_1098_p23),
    .din2(tmp_3_fu_1136_p23),
    .def(tmp_4_fu_1174_p7),
    .sel(min_idx_loc_fu_246),
    .dout(tmp_4_fu_1174_p9)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_start_reg <= 1'b0;
    end else begin
        if (((tmp_5_fu_981_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_start_reg <= 1'b1;
        end else if ((grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_ready == 1'b1)) begin
            grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_fu_226 <= 5'd9;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        i_fu_226 <= add_ln788_fu_1227_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        idx_1_fu_234 <= 32'd9;
    end else if (((min_idx_loc_load_load_fu_1016_p1 == 2'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        idx_1_fu_234 <= idx_3_fu_1205_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        idx_2_fu_238 <= 32'd9;
    end else if ((~(min_idx_loc_load_load_fu_1016_p1 == 2'd1) & ~(min_idx_loc_load_load_fu_1016_p1 == 2'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        idx_2_fu_238 <= idx_3_fu_1205_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        idx_fu_230 <= 32'd9;
    end else if (((min_idx_loc_load_load_fu_1016_p1 == 2'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        idx_fu_230 <= idx_3_fu_1205_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_idx_out_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        min_idx_loc_fu_246 <= grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_idx_out;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        trunc_ln788_1_reg_1611 <= trunc_ln788_1_fu_1003_p1;
        trunc_ln788_2_reg_1616 <= trunc_ln788_2_fu_1008_p1;
        trunc_ln788_reg_1606 <= trunc_ln788_fu_998_p1;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((((tmp_5_fu_981_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_5_fu_981_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        dist_0_ap_vld = 1'b1;
    end else begin
        dist_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        dist_1_ap_vld = 1'b1;
    end else begin
        dist_1_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd2) & (1'b1 == ap_CS_fsm_state4))) begin
        dist_2_ap_vld = 1'b1;
    end else begin
        dist_2_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd3) & (1'b1 == ap_CS_fsm_state4))) begin
        dist_3_ap_vld = 1'b1;
    end else begin
        dist_3_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd4) & (1'b1 == ap_CS_fsm_state4))) begin
        dist_4_ap_vld = 1'b1;
    end else begin
        dist_4_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd5) & (1'b1 == ap_CS_fsm_state4))) begin
        dist_5_ap_vld = 1'b1;
    end else begin
        dist_5_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd6) & (1'b1 == ap_CS_fsm_state4))) begin
        dist_6_ap_vld = 1'b1;
    end else begin
        dist_6_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd7) & (1'b1 == ap_CS_fsm_state4))) begin
        dist_7_ap_vld = 1'b1;
    end else begin
        dist_7_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd8) & (1'b1 == ap_CS_fsm_state4))) begin
        dist_8_ap_vld = 1'b1;
    end else begin
        dist_8_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((~(trunc_ln788_3_fu_1036_p1 == 4'd0) & ~(trunc_ln788_3_fu_1036_p1 == 4'd1) & ~(trunc_ln788_3_fu_1036_p1 == 4'd2) & ~(trunc_ln788_3_fu_1036_p1 == 4'd3) & ~(trunc_ln788_3_fu_1036_p1 == 4'd4) & ~(trunc_ln788_3_fu_1036_p1 == 4'd5) & ~(trunc_ln788_3_fu_1036_p1 == 4'd6) & ~(trunc_ln788_3_fu_1036_p1 == 4'd7) & ~(trunc_ln788_3_fu_1036_p1 == 4'd8) & (1'b1 == ap_CS_fsm_state4))) begin
        dist_9_ap_vld = 1'b1;
    end else begin
        dist_9_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        id_0_ap_vld = 1'b1;
    end else begin
        id_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        id_1_ap_vld = 1'b1;
    end else begin
        id_1_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd2) & (1'b1 == ap_CS_fsm_state4))) begin
        id_2_ap_vld = 1'b1;
    end else begin
        id_2_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd3) & (1'b1 == ap_CS_fsm_state4))) begin
        id_3_ap_vld = 1'b1;
    end else begin
        id_3_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd4) & (1'b1 == ap_CS_fsm_state4))) begin
        id_4_ap_vld = 1'b1;
    end else begin
        id_4_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd5) & (1'b1 == ap_CS_fsm_state4))) begin
        id_5_ap_vld = 1'b1;
    end else begin
        id_5_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd6) & (1'b1 == ap_CS_fsm_state4))) begin
        id_6_ap_vld = 1'b1;
    end else begin
        id_6_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd7) & (1'b1 == ap_CS_fsm_state4))) begin
        id_7_ap_vld = 1'b1;
    end else begin
        id_7_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln788_3_fu_1036_p1 == 4'd8) & (1'b1 == ap_CS_fsm_state4))) begin
        id_8_ap_vld = 1'b1;
    end else begin
        id_8_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((~(trunc_ln788_3_fu_1036_p1 == 4'd0) & ~(trunc_ln788_3_fu_1036_p1 == 4'd1) & ~(trunc_ln788_3_fu_1036_p1 == 4'd2) & ~(trunc_ln788_3_fu_1036_p1 == 4'd3) & ~(trunc_ln788_3_fu_1036_p1 == 4'd4) & ~(trunc_ln788_3_fu_1036_p1 == 4'd5) & ~(trunc_ln788_3_fu_1036_p1 == 4'd6) & ~(trunc_ln788_3_fu_1036_p1 == 4'd7) & ~(trunc_ln788_3_fu_1036_p1 == 4'd8) & (1'b1 == ap_CS_fsm_state4))) begin
        id_9_ap_vld = 1'b1;
    end else begin
        id_9_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((tmp_5_fu_981_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln788_fu_1227_p2 = ($signed(i_fu_226) + $signed(5'd31));

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign dist_0 = grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_value_out;

assign dist_1 = grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_value_out;

assign dist_2 = grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_value_out;

assign dist_3 = grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_value_out;

assign dist_4 = grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_value_out;

assign dist_5 = grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_value_out;

assign dist_6 = grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_value_out;

assign dist_7 = grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_value_out;

assign dist_8 = grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_value_out;

assign dist_9 = grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_min_value_out;

assign grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_start = grp_seq_global_merge_L1_L2_Pipeline_VITIS_LOOP_792_3_fu_750_ap_start_reg;

assign id_0 = tmp_4_fu_1174_p9;

assign id_1 = tmp_4_fu_1174_p9;

assign id_2 = tmp_4_fu_1174_p9;

assign id_3 = tmp_4_fu_1174_p9;

assign id_4 = tmp_4_fu_1174_p9;

assign id_5 = tmp_4_fu_1174_p9;

assign id_6 = tmp_4_fu_1174_p9;

assign id_7 = tmp_4_fu_1174_p9;

assign id_8 = tmp_4_fu_1174_p9;

assign id_9 = tmp_4_fu_1174_p9;

assign idx_3_fu_1205_p2 = ($signed(tmp_fu_1039_p9) + $signed(32'd4294967295));

assign min_idx_loc_load_load_fu_1016_p1 = min_idx_loc_fu_246;

assign tmp_1_fu_1060_p21 = 'bx;

assign tmp_2_fu_1098_p21 = 'bx;

assign tmp_3_fu_1136_p21 = 'bx;

assign tmp_4_fu_1174_p7 = 'bx;

assign tmp_5_fu_981_p3 = i_fu_226[32'd4];

assign tmp_fu_1039_p7 = 'bx;

assign trunc_ln788_1_fu_1003_p1 = idx_1_fu_234[3:0];

assign trunc_ln788_2_fu_1008_p1 = idx_fu_230[3:0];

assign trunc_ln788_3_fu_1036_p1 = i_fu_226[3:0];

assign trunc_ln788_fu_998_p1 = idx_2_fu_238[3:0];

assign trunc_ln801_fu_1056_p1 = tmp_fu_1039_p9[3:0];

endmodule //krnl_globalSort_L1_L2_seq_global_merge_L1_L2
