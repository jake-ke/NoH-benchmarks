`timescale 1 ns / 1 ps
// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================
 
(* CORE_GENERATION_INFO="B_IO_L3_in_serialize_B_IO_L3_in_serialize,hls_ip_2023_2_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcvp1802-lsvc4072-2MP-e-S,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.430900,HLS_SYN_LAT=623,HLS_SYN_TPT=none,HLS_SYN_MEM=30,HLS_SYN_DSP=0,HLS_SYN_FF=7940,HLS_SYN_LUT=5984,HLS_VERSION=2023_2_2}" *)
module B_IO_L3_in_serialize (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        m_axi_B_AWVALID,
        m_axi_B_AWREADY,
        m_axi_B_AWADDR,
        m_axi_B_AWID,
        m_axi_B_AWLEN,
        m_axi_B_AWSIZE,
        m_axi_B_AWBURST,
        m_axi_B_AWLOCK,
        m_axi_B_AWCACHE,
        m_axi_B_AWPROT,
        m_axi_B_AWQOS,
        m_axi_B_AWREGION,
        m_axi_B_AWUSER,
        m_axi_B_WVALID,
        m_axi_B_WREADY,
        m_axi_B_WDATA,
        m_axi_B_WSTRB,
        m_axi_B_WLAST,
        m_axi_B_WID,
        m_axi_B_WUSER,
        m_axi_B_ARVALID,
        m_axi_B_ARREADY,
        m_axi_B_ARADDR,
        m_axi_B_ARID,
        m_axi_B_ARLEN,
        m_axi_B_ARSIZE,
        m_axi_B_ARBURST,
        m_axi_B_ARLOCK,
        m_axi_B_ARCACHE,
        m_axi_B_ARPROT,
        m_axi_B_ARQOS,
        m_axi_B_ARREGION,
        m_axi_B_ARUSER,
        m_axi_B_RVALID,
        m_axi_B_RREADY,
        m_axi_B_RDATA,
        m_axi_B_RLAST,
        m_axi_B_RID,
        m_axi_B_RUSER,
        m_axi_B_RRESP,
        m_axi_B_BVALID,
        m_axi_B_BREADY,
        m_axi_B_BRESP,
        m_axi_B_BID,
        m_axi_B_BUSER,
        B_offset,
        fifo_B_local_out_din,
        fifo_B_local_out_full_n,
        fifo_B_local_out_write
);
parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;
parameter    C_M_AXI_B_ID_WIDTH = 1;
parameter    C_M_AXI_B_ADDR_WIDTH = 64;
parameter    C_M_AXI_B_DATA_WIDTH = 512;
parameter    C_M_AXI_B_AWUSER_WIDTH = 1;
parameter    C_M_AXI_B_ARUSER_WIDTH = 1;
parameter    C_M_AXI_B_WUSER_WIDTH = 1;
parameter    C_M_AXI_B_RUSER_WIDTH = 1;
parameter    C_M_AXI_B_BUSER_WIDTH = 1;
parameter    C_M_AXI_B_USER_VALUE = 0;
parameter    C_M_AXI_B_PROT_VALUE = 0;
parameter    C_M_AXI_B_CACHE_VALUE = 3;
parameter    C_M_AXI_DATA_WIDTH = 32;
parameter C_M_AXI_B_WSTRB_WIDTH = (512 / 8);
parameter C_M_AXI_WSTRB_WIDTH = (32 / 8);
input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   m_axi_B_AWVALID;
input   m_axi_B_AWREADY;
output  [C_M_AXI_B_ADDR_WIDTH - 1:0] m_axi_B_AWADDR;
output  [C_M_AXI_B_ID_WIDTH - 1:0] m_axi_B_AWID;
output  [7:0] m_axi_B_AWLEN;
output  [2:0] m_axi_B_AWSIZE;
output  [1:0] m_axi_B_AWBURST;
output  [1:0] m_axi_B_AWLOCK;
output  [3:0] m_axi_B_AWCACHE;
output  [2:0] m_axi_B_AWPROT;
output  [3:0] m_axi_B_AWQOS;
output  [3:0] m_axi_B_AWREGION;
output  [C_M_AXI_B_AWUSER_WIDTH - 1:0] m_axi_B_AWUSER;
output   m_axi_B_WVALID;
input   m_axi_B_WREADY;
output  [C_M_AXI_B_DATA_WIDTH - 1:0] m_axi_B_WDATA;
output  [C_M_AXI_B_WSTRB_WIDTH - 1:0] m_axi_B_WSTRB;
output   m_axi_B_WLAST;
output  [C_M_AXI_B_ID_WIDTH - 1:0] m_axi_B_WID;
output  [C_M_AXI_B_WUSER_WIDTH - 1:0] m_axi_B_WUSER;
output   m_axi_B_ARVALID;
input   m_axi_B_ARREADY;
output  [C_M_AXI_B_ADDR_WIDTH - 1:0] m_axi_B_ARADDR;
output  [C_M_AXI_B_ID_WIDTH - 1:0] m_axi_B_ARID;
output  [7:0] m_axi_B_ARLEN;
output  [2:0] m_axi_B_ARSIZE;
output  [1:0] m_axi_B_ARBURST;
output  [1:0] m_axi_B_ARLOCK;
output  [3:0] m_axi_B_ARCACHE;
output  [2:0] m_axi_B_ARPROT;
output  [3:0] m_axi_B_ARQOS;
output  [3:0] m_axi_B_ARREGION;
output  [C_M_AXI_B_ARUSER_WIDTH - 1:0] m_axi_B_ARUSER;
input   m_axi_B_RVALID;
output   m_axi_B_RREADY;
input  [C_M_AXI_B_DATA_WIDTH - 1:0] m_axi_B_RDATA;
input   m_axi_B_RLAST;
input  [C_M_AXI_B_ID_WIDTH - 1:0] m_axi_B_RID;
input  [C_M_AXI_B_RUSER_WIDTH - 1:0] m_axi_B_RUSER;
input  [1:0] m_axi_B_RRESP;
input   m_axi_B_BVALID;
output   m_axi_B_BREADY;
input  [1:0] m_axi_B_BRESP;
input  [C_M_AXI_B_ID_WIDTH - 1:0] m_axi_B_BID;
input  [C_M_AXI_B_BUSER_WIDTH - 1:0] m_axi_B_BUSER;
input  [63:0] B_offset;
output  [512:0] fifo_B_local_out_din;
input   fifo_B_local_out_full_n;
output   fifo_B_local_out_write;
reg ap_done;
reg ap_idle;
reg ap_ready;
reg fifo_B_local_out_write;
 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [5:0] trunc_ln155_fu_70_p1;
reg   [5:0] trunc_ln155_reg_79;
wire    grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_start;
wire    grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_done;
wire    grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_idle;
wire    grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_ready;
wire    grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWVALID;
wire   [63:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWADDR;
wire   [0:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWID;
wire   [31:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWLEN;
wire   [2:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWSIZE;
wire   [1:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWBURST;
wire   [1:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWLOCK;
wire   [3:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWCACHE;
wire   [2:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWPROT;
wire   [3:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWQOS;
wire   [3:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWREGION;
wire   [0:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWUSER;
wire    grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_WVALID;
wire   [511:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_WDATA;
wire   [63:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_WSTRB;
wire    grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_WLAST;
wire   [0:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_WID;
wire   [0:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_WUSER;
wire    grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARVALID;
wire   [63:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARADDR;
wire   [0:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARID;
wire   [31:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARLEN;
wire   [2:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARSIZE;
wire   [1:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARBURST;
wire   [1:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARLOCK;
wire   [3:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARCACHE;
wire   [2:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARPROT;
wire   [3:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARQOS;
wire   [3:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARREGION;
wire   [0:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARUSER;
wire    grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_RREADY;
wire    grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_BREADY;
wire   [512:0] grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_fifo_B_local_out_din;
wire    grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_fifo_B_local_out_write;
wire    B_AWREADY;
wire    B_WREADY;
reg    B_ARVALID;
wire    B_ARREADY;
wire    B_RVALID;
reg    B_RREADY;
wire   [511:0] B_RDATA;
wire   [8:0] B_RFIFONUM;
wire    B_BVALID;
reg    grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_start_reg;
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
#0 grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_start_reg = 1'b0;
end
B_IO_L3_in_serialize_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1 grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_start),
    .ap_done(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_done),
    .ap_idle(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_idle),
    .ap_ready(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_ready),
    .m_axi_B_AWVALID(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWVALID),
    .m_axi_B_AWREADY(1'b0),
    .m_axi_B_AWADDR(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWADDR),
    .m_axi_B_AWID(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWID),
    .m_axi_B_AWLEN(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWLEN),
    .m_axi_B_AWSIZE(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWSIZE),
    .m_axi_B_AWBURST(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWBURST),
    .m_axi_B_AWLOCK(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWLOCK),
    .m_axi_B_AWCACHE(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWCACHE),
    .m_axi_B_AWPROT(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWPROT),
    .m_axi_B_AWQOS(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWQOS),
    .m_axi_B_AWREGION(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWREGION),
    .m_axi_B_AWUSER(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_AWUSER),
    .m_axi_B_WVALID(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_WVALID),
    .m_axi_B_WREADY(1'b0),
    .m_axi_B_WDATA(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_WDATA),
    .m_axi_B_WSTRB(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_WSTRB),
    .m_axi_B_WLAST(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_WLAST),
    .m_axi_B_WID(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_WID),
    .m_axi_B_WUSER(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_WUSER),
    .m_axi_B_ARVALID(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARVALID),
    .m_axi_B_ARREADY(B_ARREADY),
    .m_axi_B_ARADDR(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARADDR),
    .m_axi_B_ARID(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARID),
    .m_axi_B_ARLEN(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARLEN),
    .m_axi_B_ARSIZE(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARSIZE),
    .m_axi_B_ARBURST(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARBURST),
    .m_axi_B_ARLOCK(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARLOCK),
    .m_axi_B_ARCACHE(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARCACHE),
    .m_axi_B_ARPROT(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARPROT),
    .m_axi_B_ARQOS(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARQOS),
    .m_axi_B_ARREGION(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARREGION),
    .m_axi_B_ARUSER(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARUSER),
    .m_axi_B_RVALID(B_RVALID),
    .m_axi_B_RREADY(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_RREADY),
    .m_axi_B_RDATA(B_RDATA),
    .m_axi_B_RLAST(1'b0),
    .m_axi_B_RID(1'd0),
    .m_axi_B_RFIFONUM(B_RFIFONUM),
    .m_axi_B_RUSER(1'd0),
    .m_axi_B_RRESP(2'd0),
    .m_axi_B_BVALID(1'b0),
    .m_axi_B_BREADY(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_BREADY),
    .m_axi_B_BRESP(2'd0),
    .m_axi_B_BID(1'd0),
    .m_axi_B_BUSER(1'd0),
    .fifo_B_local_out_din(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_fifo_B_local_out_din),
    .fifo_B_local_out_full_n(fifo_B_local_out_full_n),
    .fifo_B_local_out_write(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_fifo_B_local_out_write),
    .empty(trunc_ln155_reg_79),
    .B_offset(B_offset)
);
B_IO_L3_in_serialize_B_m_axi #(
    .CONSERVATIVE( 1 ),
    .USER_MAXREQS( 7 ),
    .MAX_READ_BURST_LENGTH( 16 ),
    .MAX_WRITE_BURST_LENGTH( 16 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_B_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_B_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_B_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_B_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_B_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_B_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_B_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_B_BUSER_WIDTH ),
    .C_USER_VALUE( C_M_AXI_B_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_B_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_B_CACHE_VALUE ),
    .USER_RFIFONUM_WIDTH( 9 ),
    .USER_DW( 512 ),
    .USER_AW( 64 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ))
B_m_axi_U(
    .AWVALID(m_axi_B_AWVALID),
    .AWREADY(m_axi_B_AWREADY),
    .AWADDR(m_axi_B_AWADDR),
    .AWID(m_axi_B_AWID),
    .AWLEN(m_axi_B_AWLEN),
    .AWSIZE(m_axi_B_AWSIZE),
    .AWBURST(m_axi_B_AWBURST),
    .AWLOCK(m_axi_B_AWLOCK),
    .AWCACHE(m_axi_B_AWCACHE),
    .AWPROT(m_axi_B_AWPROT),
    .AWQOS(m_axi_B_AWQOS),
    .AWREGION(m_axi_B_AWREGION),
    .AWUSER(m_axi_B_AWUSER),
    .WVALID(m_axi_B_WVALID),
    .WREADY(m_axi_B_WREADY),
    .WDATA(m_axi_B_WDATA),
    .WSTRB(m_axi_B_WSTRB),
    .WLAST(m_axi_B_WLAST),
    .WID(m_axi_B_WID),
    .WUSER(m_axi_B_WUSER),
    .ARVALID(m_axi_B_ARVALID),
    .ARREADY(m_axi_B_ARREADY),
    .ARADDR(m_axi_B_ARADDR),
    .ARID(m_axi_B_ARID),
    .ARLEN(m_axi_B_ARLEN),
    .ARSIZE(m_axi_B_ARSIZE),
    .ARBURST(m_axi_B_ARBURST),
    .ARLOCK(m_axi_B_ARLOCK),
    .ARCACHE(m_axi_B_ARCACHE),
    .ARPROT(m_axi_B_ARPROT),
    .ARQOS(m_axi_B_ARQOS),
    .ARREGION(m_axi_B_ARREGION),
    .ARUSER(m_axi_B_ARUSER),
    .RVALID(m_axi_B_RVALID),
    .RREADY(m_axi_B_RREADY),
    .RDATA(m_axi_B_RDATA),
    .RLAST(m_axi_B_RLAST),
    .RID(m_axi_B_RID),
    .RUSER(m_axi_B_RUSER),
    .RRESP(m_axi_B_RRESP),
    .BVALID(m_axi_B_BVALID),
    .BREADY(m_axi_B_BREADY),
    .BRESP(m_axi_B_BRESP),
    .BID(m_axi_B_BID),
    .BUSER(m_axi_B_BUSER),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .I_ARVALID(B_ARVALID),
    .I_ARREADY(B_ARREADY),
    .I_ARADDR(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARADDR),
    .I_ARLEN(grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARLEN),
    .I_RVALID(B_RVALID),
    .I_RREADY(B_RREADY),
    .I_RDATA(B_RDATA),
    .I_RFIFONUM(B_RFIFONUM),
    .I_AWVALID(1'b0),
    .I_AWREADY(B_AWREADY),
    .I_AWADDR(64'd0),
    .I_AWLEN(32'd0),
    .I_WVALID(1'b0),
    .I_WREADY(B_WREADY),
    .I_WDATA(512'd0),
    .I_WSTRB(64'd0),
    .I_BVALID(B_BVALID),
    .I_BREADY(1'b0)
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
        grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_start_reg <= 1'b1;
        end else if ((grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_ready == 1'b1)) begin
            grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_start_reg <= 1'b0;
        end
    end
end
always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        trunc_ln155_reg_79 <= trunc_ln155_fu_70_p1;
    end
end
always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        B_ARVALID = grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_ARVALID;
    end else begin
        B_ARVALID = 1'b0;
    end
end
always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        B_RREADY = grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_m_axi_B_RREADY;
    end else begin
        B_RREADY = 1'b0;
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
    if ((grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end
always @ (*) begin
    if (((grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
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
    if (((grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end
always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        fifo_B_local_out_write = grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_fifo_B_local_out_write;
    end else begin
        fifo_B_local_out_write = 1'b0;
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
            if (((grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
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
assign fifo_B_local_out_din = grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_fifo_B_local_out_din;
assign grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_start = grp_B_IO_L3_in_serialize_Pipeline_VITIS_LOOP_155_1_fu_58_ap_start_reg;
assign trunc_ln155_fu_70_p1 = B_offset[5:0];
endmodule