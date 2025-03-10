`timescale 1 ns / 1 ps
// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================
 
(* CORE_GENERATION_INFO="Module3Func_Module3Func,hls_ip_2023_2_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcvp1802-lsvc4072-2MP-e-S,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.918000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=521,HLS_SYN_LUT=20,HLS_VERSION=2023_2_2}" *)
module Module3Func (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        dram_t0_bank_1_fifo_din,
        dram_t0_bank_1_fifo_full_n,
        dram_t0_bank_1_fifo_write,
        fifo_ld_0_s_dout,
        fifo_ld_0_s_empty_n,
        fifo_ld_0_s_read,
        fifo_ld_0_peek_dout,
        fifo_ld_0_peek_empty_n,
        fifo_ld_0_peek_read
);
parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;
input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [512:0] dram_t0_bank_1_fifo_din;
input   dram_t0_bank_1_fifo_full_n;
output   dram_t0_bank_1_fifo_write;
input  [512:0] fifo_ld_0_s_dout;
input   fifo_ld_0_s_empty_n;
output   fifo_ld_0_s_read;
input  [512:0] fifo_ld_0_peek_dout;
input   fifo_ld_0_peek_empty_n;
output   fifo_ld_0_peek_read;
reg ap_done;
reg ap_idle;
reg ap_ready;
reg dram_t0_bank_1_fifo_write;
reg fifo_ld_0_s_read;
 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    grp_Module3Func_Pipeline_module_3_fu_56_ap_start;
wire    grp_Module3Func_Pipeline_module_3_fu_56_ap_done;
wire    grp_Module3Func_Pipeline_module_3_fu_56_ap_idle;
wire    grp_Module3Func_Pipeline_module_3_fu_56_ap_ready;
wire    grp_Module3Func_Pipeline_module_3_fu_56_fifo_ld_0_s_read;
wire   [512:0] grp_Module3Func_Pipeline_module_3_fu_56_dram_t0_bank_1_fifo_din;
wire    grp_Module3Func_Pipeline_module_3_fu_56_dram_t0_bank_1_fifo_write;
reg    grp_Module3Func_Pipeline_module_3_fu_56_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
reg   [2:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ce_reg;
// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 grp_Module3Func_Pipeline_module_3_fu_56_ap_start_reg = 1'b0;
end
Module3Func_Module3Func_Pipeline_module_3 grp_Module3Func_Pipeline_module_3_fu_56(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_Module3Func_Pipeline_module_3_fu_56_ap_start),
    .ap_done(grp_Module3Func_Pipeline_module_3_fu_56_ap_done),
    .ap_idle(grp_Module3Func_Pipeline_module_3_fu_56_ap_idle),
    .ap_ready(grp_Module3Func_Pipeline_module_3_fu_56_ap_ready),
    .fifo_ld_0_s_dout(fifo_ld_0_s_dout),
    .fifo_ld_0_s_empty_n(fifo_ld_0_s_empty_n),
    .fifo_ld_0_s_read(grp_Module3Func_Pipeline_module_3_fu_56_fifo_ld_0_s_read),
    .dram_t0_bank_1_fifo_din(grp_Module3Func_Pipeline_module_3_fu_56_dram_t0_bank_1_fifo_din),
    .dram_t0_bank_1_fifo_full_n(dram_t0_bank_1_fifo_full_n),
    .dram_t0_bank_1_fifo_write(grp_Module3Func_Pipeline_module_3_fu_56_dram_t0_bank_1_fifo_write)
);
always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end
always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_Module3Func_Pipeline_module_3_fu_56_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_Module3Func_Pipeline_module_3_fu_56_ap_start_reg <= 1'b1;
        end else if ((grp_Module3Func_Pipeline_module_3_fu_56_ap_ready == 1'b1)) begin
            grp_Module3Func_Pipeline_module_3_fu_56_ap_start_reg <= 1'b0;
        end
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
    if ((grp_Module3Func_Pipeline_module_3_fu_56_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end
always @ (*) begin
    if (((grp_Module3Func_Pipeline_module_3_fu_56_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end
always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end
always @ (*) begin
    if (((grp_Module3Func_Pipeline_module_3_fu_56_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end
always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        dram_t0_bank_1_fifo_write = grp_Module3Func_Pipeline_module_3_fu_56_dram_t0_bank_1_fifo_write;
    end else begin
        dram_t0_bank_1_fifo_write = 1'b0;
    end
end
always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        fifo_ld_0_s_read = grp_Module3Func_Pipeline_module_3_fu_56_fifo_ld_0_s_read;
    end else begin
        fifo_ld_0_s_read = 1'b0;
    end
end
always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_Module3Func_Pipeline_module_3_fu_56_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end
assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end
assign dram_t0_bank_1_fifo_din = grp_Module3Func_Pipeline_module_3_fu_56_dram_t0_bank_1_fifo_din;
assign fifo_ld_0_peek_read = 1'b0;
assign grp_Module3Func_Pipeline_module_3_fu_56_ap_start = grp_Module3Func_Pipeline_module_3_fu_56_ap_start_reg;
endmodule