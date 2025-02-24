`timescale 1 ns / 1 ps
// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2.2 (64-bit)
// Tool Version Limit: 2024.02
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
module Knn_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 10,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire [63:0]                   in_0,
    output wire [63:0]                   in_1,
    output wire [63:0]                   in_2,
    output wire [63:0]                   in_3,
    output wire [63:0]                   in_4,
    output wire [63:0]                   in_5,
    output wire [63:0]                   in_6,
    output wire [63:0]                   in_7,
    output wire [63:0]                   in_8,
    output wire [63:0]                   in_9,
    output wire [63:0]                   in_10,
    output wire [63:0]                   in_11,
    output wire [63:0]                   in_12,
    output wire [63:0]                   in_13,
    output wire [63:0]                   in_14,
    output wire [63:0]                   in_15,
    output wire [63:0]                   in_16,
    output wire [63:0]                   in_17,
    output wire [63:0]                   in_18,
    output wire [63:0]                   in_19,
    output wire [63:0]                   in_20,
    output wire [63:0]                   in_21,
    output wire [63:0]                   in_22,
    output wire [63:0]                   in_23,
    output wire [63:0]                   in_24,
    output wire [63:0]                   in_25,
    output wire [63:0]                   in_26,
    output wire [63:0]                   in_27,
    output wire [63:0]                   in_28,
    output wire [63:0]                   in_29,
    output wire [63:0]                   in_30,
    output wire [63:0]                   in_31,
    output wire [63:0]                   in_32,
    output wire [63:0]                   in_33,
    output wire [63:0]                   in_34,
    output wire [63:0]                   in_35,
    output wire [63:0]                   in_36,
    output wire [63:0]                   in_37,
    output wire [63:0]                   in_38,
    output wire [63:0]                   in_39,
    output wire [63:0]                   in_40,
    output wire [63:0]                   in_41,
    output wire [63:0]                   in_42,
    output wire [63:0]                   in_43,
    output wire [63:0]                   in_44,
    output wire [63:0]                   L3_out_dist,
    output wire [63:0]                   L3_out_id,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
);
//------------------------Address Info-------------------
// Protocol Used: ap_ctrl_hs
//
// 0x000 : Control signals
//         bit 0  - ap_start (Read/Write/SC)
//         bit 1  - ap_done (Read/COR)
//         bit 2  - ap_idle (Read)
//         bit 3  - ap_ready (Read/COR)
//         bit 7  - auto_restart (Read/Write)
//         bit 9  - interrupt (Read)
//         others - reserved
// 0x004 : Global Interrupt Enable Register
//         bit 0  - Global Interrupt Enable (Read/Write)
//         others - reserved
// 0x008 : IP Interrupt Enable Register (Read/Write)
//         bit 0 - enable ap_done interrupt (Read/Write)
//         others - reserved
// 0x00c : IP Interrupt Status Register (Read/TOW)
//         bit 0 - ap_done (Read/TOW)
//         others - reserved
// 0x010 : Data signal of in_0
//         bit 31~0 - in_0[31:0] (Read/Write)
// 0x014 : Data signal of in_0
//         bit 31~0 - in_0[63:32] (Read/Write)
// 0x018 : reserved
// 0x01c : Data signal of in_1
//         bit 31~0 - in_1[31:0] (Read/Write)
// 0x020 : Data signal of in_1
//         bit 31~0 - in_1[63:32] (Read/Write)
// 0x024 : reserved
// 0x028 : Data signal of in_2
//         bit 31~0 - in_2[31:0] (Read/Write)
// 0x02c : Data signal of in_2
//         bit 31~0 - in_2[63:32] (Read/Write)
// 0x030 : reserved
// 0x034 : Data signal of in_3
//         bit 31~0 - in_3[31:0] (Read/Write)
// 0x038 : Data signal of in_3
//         bit 31~0 - in_3[63:32] (Read/Write)
// 0x03c : reserved
// 0x040 : Data signal of in_4
//         bit 31~0 - in_4[31:0] (Read/Write)
// 0x044 : Data signal of in_4
//         bit 31~0 - in_4[63:32] (Read/Write)
// 0x048 : reserved
// 0x04c : Data signal of in_5
//         bit 31~0 - in_5[31:0] (Read/Write)
// 0x050 : Data signal of in_5
//         bit 31~0 - in_5[63:32] (Read/Write)
// 0x054 : reserved
// 0x058 : Data signal of in_6
//         bit 31~0 - in_6[31:0] (Read/Write)
// 0x05c : Data signal of in_6
//         bit 31~0 - in_6[63:32] (Read/Write)
// 0x060 : reserved
// 0x064 : Data signal of in_7
//         bit 31~0 - in_7[31:0] (Read/Write)
// 0x068 : Data signal of in_7
//         bit 31~0 - in_7[63:32] (Read/Write)
// 0x06c : reserved
// 0x070 : Data signal of in_8
//         bit 31~0 - in_8[31:0] (Read/Write)
// 0x074 : Data signal of in_8
//         bit 31~0 - in_8[63:32] (Read/Write)
// 0x078 : reserved
// 0x07c : Data signal of in_9
//         bit 31~0 - in_9[31:0] (Read/Write)
// 0x080 : Data signal of in_9
//         bit 31~0 - in_9[63:32] (Read/Write)
// 0x084 : reserved
// 0x088 : Data signal of in_10
//         bit 31~0 - in_10[31:0] (Read/Write)
// 0x08c : Data signal of in_10
//         bit 31~0 - in_10[63:32] (Read/Write)
// 0x090 : reserved
// 0x094 : Data signal of in_11
//         bit 31~0 - in_11[31:0] (Read/Write)
// 0x098 : Data signal of in_11
//         bit 31~0 - in_11[63:32] (Read/Write)
// 0x09c : reserved
// 0x0a0 : Data signal of in_12
//         bit 31~0 - in_12[31:0] (Read/Write)
// 0x0a4 : Data signal of in_12
//         bit 31~0 - in_12[63:32] (Read/Write)
// 0x0a8 : reserved
// 0x0ac : Data signal of in_13
//         bit 31~0 - in_13[31:0] (Read/Write)
// 0x0b0 : Data signal of in_13
//         bit 31~0 - in_13[63:32] (Read/Write)
// 0x0b4 : reserved
// 0x0b8 : Data signal of in_14
//         bit 31~0 - in_14[31:0] (Read/Write)
// 0x0bc : Data signal of in_14
//         bit 31~0 - in_14[63:32] (Read/Write)
// 0x0c0 : reserved
// 0x0c4 : Data signal of in_15
//         bit 31~0 - in_15[31:0] (Read/Write)
// 0x0c8 : Data signal of in_15
//         bit 31~0 - in_15[63:32] (Read/Write)
// 0x0cc : reserved
// 0x0d0 : Data signal of in_16
//         bit 31~0 - in_16[31:0] (Read/Write)
// 0x0d4 : Data signal of in_16
//         bit 31~0 - in_16[63:32] (Read/Write)
// 0x0d8 : reserved
// 0x0dc : Data signal of in_17
//         bit 31~0 - in_17[31:0] (Read/Write)
// 0x0e0 : Data signal of in_17
//         bit 31~0 - in_17[63:32] (Read/Write)
// 0x0e4 : reserved
// 0x0e8 : Data signal of in_18
//         bit 31~0 - in_18[31:0] (Read/Write)
// 0x0ec : Data signal of in_18
//         bit 31~0 - in_18[63:32] (Read/Write)
// 0x0f0 : reserved
// 0x0f4 : Data signal of in_19
//         bit 31~0 - in_19[31:0] (Read/Write)
// 0x0f8 : Data signal of in_19
//         bit 31~0 - in_19[63:32] (Read/Write)
// 0x0fc : reserved
// 0x100 : Data signal of in_20
//         bit 31~0 - in_20[31:0] (Read/Write)
// 0x104 : Data signal of in_20
//         bit 31~0 - in_20[63:32] (Read/Write)
// 0x108 : reserved
// 0x10c : Data signal of in_21
//         bit 31~0 - in_21[31:0] (Read/Write)
// 0x110 : Data signal of in_21
//         bit 31~0 - in_21[63:32] (Read/Write)
// 0x114 : reserved
// 0x118 : Data signal of in_22
//         bit 31~0 - in_22[31:0] (Read/Write)
// 0x11c : Data signal of in_22
//         bit 31~0 - in_22[63:32] (Read/Write)
// 0x120 : reserved
// 0x124 : Data signal of in_23
//         bit 31~0 - in_23[31:0] (Read/Write)
// 0x128 : Data signal of in_23
//         bit 31~0 - in_23[63:32] (Read/Write)
// 0x12c : reserved
// 0x130 : Data signal of in_24
//         bit 31~0 - in_24[31:0] (Read/Write)
// 0x134 : Data signal of in_24
//         bit 31~0 - in_24[63:32] (Read/Write)
// 0x138 : reserved
// 0x13c : Data signal of in_25
//         bit 31~0 - in_25[31:0] (Read/Write)
// 0x140 : Data signal of in_25
//         bit 31~0 - in_25[63:32] (Read/Write)
// 0x144 : reserved
// 0x148 : Data signal of in_26
//         bit 31~0 - in_26[31:0] (Read/Write)
// 0x14c : Data signal of in_26
//         bit 31~0 - in_26[63:32] (Read/Write)
// 0x150 : reserved
// 0x154 : Data signal of in_27
//         bit 31~0 - in_27[31:0] (Read/Write)
// 0x158 : Data signal of in_27
//         bit 31~0 - in_27[63:32] (Read/Write)
// 0x15c : reserved
// 0x160 : Data signal of in_28
//         bit 31~0 - in_28[31:0] (Read/Write)
// 0x164 : Data signal of in_28
//         bit 31~0 - in_28[63:32] (Read/Write)
// 0x168 : reserved
// 0x16c : Data signal of in_29
//         bit 31~0 - in_29[31:0] (Read/Write)
// 0x170 : Data signal of in_29
//         bit 31~0 - in_29[63:32] (Read/Write)
// 0x174 : reserved
// 0x178 : Data signal of in_30
//         bit 31~0 - in_30[31:0] (Read/Write)
// 0x17c : Data signal of in_30
//         bit 31~0 - in_30[63:32] (Read/Write)
// 0x180 : reserved
// 0x184 : Data signal of in_31
//         bit 31~0 - in_31[31:0] (Read/Write)
// 0x188 : Data signal of in_31
//         bit 31~0 - in_31[63:32] (Read/Write)
// 0x18c : reserved
// 0x190 : Data signal of in_32
//         bit 31~0 - in_32[31:0] (Read/Write)
// 0x194 : Data signal of in_32
//         bit 31~0 - in_32[63:32] (Read/Write)
// 0x198 : reserved
// 0x19c : Data signal of in_33
//         bit 31~0 - in_33[31:0] (Read/Write)
// 0x1a0 : Data signal of in_33
//         bit 31~0 - in_33[63:32] (Read/Write)
// 0x1a4 : reserved
// 0x1a8 : Data signal of in_34
//         bit 31~0 - in_34[31:0] (Read/Write)
// 0x1ac : Data signal of in_34
//         bit 31~0 - in_34[63:32] (Read/Write)
// 0x1b0 : reserved
// 0x1b4 : Data signal of in_35
//         bit 31~0 - in_35[31:0] (Read/Write)
// 0x1b8 : Data signal of in_35
//         bit 31~0 - in_35[63:32] (Read/Write)
// 0x1bc : reserved
// 0x1c0 : Data signal of in_36
//         bit 31~0 - in_36[31:0] (Read/Write)
// 0x1c4 : Data signal of in_36
//         bit 31~0 - in_36[63:32] (Read/Write)
// 0x1c8 : reserved
// 0x1cc : Data signal of in_37
//         bit 31~0 - in_37[31:0] (Read/Write)
// 0x1d0 : Data signal of in_37
//         bit 31~0 - in_37[63:32] (Read/Write)
// 0x1d4 : reserved
// 0x1d8 : Data signal of in_38
//         bit 31~0 - in_38[31:0] (Read/Write)
// 0x1dc : Data signal of in_38
//         bit 31~0 - in_38[63:32] (Read/Write)
// 0x1e0 : reserved
// 0x1e4 : Data signal of in_39
//         bit 31~0 - in_39[31:0] (Read/Write)
// 0x1e8 : Data signal of in_39
//         bit 31~0 - in_39[63:32] (Read/Write)
// 0x1ec : reserved
// 0x1f0 : Data signal of in_40
//         bit 31~0 - in_40[31:0] (Read/Write)
// 0x1f4 : Data signal of in_40
//         bit 31~0 - in_40[63:32] (Read/Write)
// 0x1f8 : reserved
// 0x1fc : Data signal of in_41
//         bit 31~0 - in_41[31:0] (Read/Write)
// 0x200 : Data signal of in_41
//         bit 31~0 - in_41[63:32] (Read/Write)
// 0x204 : reserved
// 0x208 : Data signal of in_42
//         bit 31~0 - in_42[31:0] (Read/Write)
// 0x20c : Data signal of in_42
//         bit 31~0 - in_42[63:32] (Read/Write)
// 0x210 : reserved
// 0x214 : Data signal of in_43
//         bit 31~0 - in_43[31:0] (Read/Write)
// 0x218 : Data signal of in_43
//         bit 31~0 - in_43[63:32] (Read/Write)
// 0x21c : reserved
// 0x220 : Data signal of in_44
//         bit 31~0 - in_44[31:0] (Read/Write)
// 0x224 : Data signal of in_44
//         bit 31~0 - in_44[63:32] (Read/Write)
// 0x228 : reserved
// 0x22c : Data signal of L3_out_dist
//         bit 31~0 - L3_out_dist[31:0] (Read/Write)
// 0x230 : Data signal of L3_out_dist
//         bit 31~0 - L3_out_dist[63:32] (Read/Write)
// 0x234 : reserved
// 0x238 : Data signal of L3_out_id
//         bit 31~0 - L3_out_id[31:0] (Read/Write)
// 0x23c : Data signal of L3_out_id
//         bit 31~0 - L3_out_id[63:32] (Read/Write)
// 0x240 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)
//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL            = 10'h000,
    ADDR_GIE                = 10'h004,
    ADDR_IER                = 10'h008,
    ADDR_ISR                = 10'h00c,
    ADDR_IN_0_DATA_0        = 10'h010,
    ADDR_IN_0_DATA_1        = 10'h014,
    ADDR_IN_0_CTRL          = 10'h018,
    ADDR_IN_1_DATA_0        = 10'h01c,
    ADDR_IN_1_DATA_1        = 10'h020,
    ADDR_IN_1_CTRL          = 10'h024,
    ADDR_IN_2_DATA_0        = 10'h028,
    ADDR_IN_2_DATA_1        = 10'h02c,
    ADDR_IN_2_CTRL          = 10'h030,
    ADDR_IN_3_DATA_0        = 10'h034,
    ADDR_IN_3_DATA_1        = 10'h038,
    ADDR_IN_3_CTRL          = 10'h03c,
    ADDR_IN_4_DATA_0        = 10'h040,
    ADDR_IN_4_DATA_1        = 10'h044,
    ADDR_IN_4_CTRL          = 10'h048,
    ADDR_IN_5_DATA_0        = 10'h04c,
    ADDR_IN_5_DATA_1        = 10'h050,
    ADDR_IN_5_CTRL          = 10'h054,
    ADDR_IN_6_DATA_0        = 10'h058,
    ADDR_IN_6_DATA_1        = 10'h05c,
    ADDR_IN_6_CTRL          = 10'h060,
    ADDR_IN_7_DATA_0        = 10'h064,
    ADDR_IN_7_DATA_1        = 10'h068,
    ADDR_IN_7_CTRL          = 10'h06c,
    ADDR_IN_8_DATA_0        = 10'h070,
    ADDR_IN_8_DATA_1        = 10'h074,
    ADDR_IN_8_CTRL          = 10'h078,
    ADDR_IN_9_DATA_0        = 10'h07c,
    ADDR_IN_9_DATA_1        = 10'h080,
    ADDR_IN_9_CTRL          = 10'h084,
    ADDR_IN_10_DATA_0       = 10'h088,
    ADDR_IN_10_DATA_1       = 10'h08c,
    ADDR_IN_10_CTRL         = 10'h090,
    ADDR_IN_11_DATA_0       = 10'h094,
    ADDR_IN_11_DATA_1       = 10'h098,
    ADDR_IN_11_CTRL         = 10'h09c,
    ADDR_IN_12_DATA_0       = 10'h0a0,
    ADDR_IN_12_DATA_1       = 10'h0a4,
    ADDR_IN_12_CTRL         = 10'h0a8,
    ADDR_IN_13_DATA_0       = 10'h0ac,
    ADDR_IN_13_DATA_1       = 10'h0b0,
    ADDR_IN_13_CTRL         = 10'h0b4,
    ADDR_IN_14_DATA_0       = 10'h0b8,
    ADDR_IN_14_DATA_1       = 10'h0bc,
    ADDR_IN_14_CTRL         = 10'h0c0,
    ADDR_IN_15_DATA_0       = 10'h0c4,
    ADDR_IN_15_DATA_1       = 10'h0c8,
    ADDR_IN_15_CTRL         = 10'h0cc,
    ADDR_IN_16_DATA_0       = 10'h0d0,
    ADDR_IN_16_DATA_1       = 10'h0d4,
    ADDR_IN_16_CTRL         = 10'h0d8,
    ADDR_IN_17_DATA_0       = 10'h0dc,
    ADDR_IN_17_DATA_1       = 10'h0e0,
    ADDR_IN_17_CTRL         = 10'h0e4,
    ADDR_IN_18_DATA_0       = 10'h0e8,
    ADDR_IN_18_DATA_1       = 10'h0ec,
    ADDR_IN_18_CTRL         = 10'h0f0,
    ADDR_IN_19_DATA_0       = 10'h0f4,
    ADDR_IN_19_DATA_1       = 10'h0f8,
    ADDR_IN_19_CTRL         = 10'h0fc,
    ADDR_IN_20_DATA_0       = 10'h100,
    ADDR_IN_20_DATA_1       = 10'h104,
    ADDR_IN_20_CTRL         = 10'h108,
    ADDR_IN_21_DATA_0       = 10'h10c,
    ADDR_IN_21_DATA_1       = 10'h110,
    ADDR_IN_21_CTRL         = 10'h114,
    ADDR_IN_22_DATA_0       = 10'h118,
    ADDR_IN_22_DATA_1       = 10'h11c,
    ADDR_IN_22_CTRL         = 10'h120,
    ADDR_IN_23_DATA_0       = 10'h124,
    ADDR_IN_23_DATA_1       = 10'h128,
    ADDR_IN_23_CTRL         = 10'h12c,
    ADDR_IN_24_DATA_0       = 10'h130,
    ADDR_IN_24_DATA_1       = 10'h134,
    ADDR_IN_24_CTRL         = 10'h138,
    ADDR_IN_25_DATA_0       = 10'h13c,
    ADDR_IN_25_DATA_1       = 10'h140,
    ADDR_IN_25_CTRL         = 10'h144,
    ADDR_IN_26_DATA_0       = 10'h148,
    ADDR_IN_26_DATA_1       = 10'h14c,
    ADDR_IN_26_CTRL         = 10'h150,
    ADDR_IN_27_DATA_0       = 10'h154,
    ADDR_IN_27_DATA_1       = 10'h158,
    ADDR_IN_27_CTRL         = 10'h15c,
    ADDR_IN_28_DATA_0       = 10'h160,
    ADDR_IN_28_DATA_1       = 10'h164,
    ADDR_IN_28_CTRL         = 10'h168,
    ADDR_IN_29_DATA_0       = 10'h16c,
    ADDR_IN_29_DATA_1       = 10'h170,
    ADDR_IN_29_CTRL         = 10'h174,
    ADDR_IN_30_DATA_0       = 10'h178,
    ADDR_IN_30_DATA_1       = 10'h17c,
    ADDR_IN_30_CTRL         = 10'h180,
    ADDR_IN_31_DATA_0       = 10'h184,
    ADDR_IN_31_DATA_1       = 10'h188,
    ADDR_IN_31_CTRL         = 10'h18c,
    ADDR_IN_32_DATA_0       = 10'h190,
    ADDR_IN_32_DATA_1       = 10'h194,
    ADDR_IN_32_CTRL         = 10'h198,
    ADDR_IN_33_DATA_0       = 10'h19c,
    ADDR_IN_33_DATA_1       = 10'h1a0,
    ADDR_IN_33_CTRL         = 10'h1a4,
    ADDR_IN_34_DATA_0       = 10'h1a8,
    ADDR_IN_34_DATA_1       = 10'h1ac,
    ADDR_IN_34_CTRL         = 10'h1b0,
    ADDR_IN_35_DATA_0       = 10'h1b4,
    ADDR_IN_35_DATA_1       = 10'h1b8,
    ADDR_IN_35_CTRL         = 10'h1bc,
    ADDR_IN_36_DATA_0       = 10'h1c0,
    ADDR_IN_36_DATA_1       = 10'h1c4,
    ADDR_IN_36_CTRL         = 10'h1c8,
    ADDR_IN_37_DATA_0       = 10'h1cc,
    ADDR_IN_37_DATA_1       = 10'h1d0,
    ADDR_IN_37_CTRL         = 10'h1d4,
    ADDR_IN_38_DATA_0       = 10'h1d8,
    ADDR_IN_38_DATA_1       = 10'h1dc,
    ADDR_IN_38_CTRL         = 10'h1e0,
    ADDR_IN_39_DATA_0       = 10'h1e4,
    ADDR_IN_39_DATA_1       = 10'h1e8,
    ADDR_IN_39_CTRL         = 10'h1ec,
    ADDR_IN_40_DATA_0       = 10'h1f0,
    ADDR_IN_40_DATA_1       = 10'h1f4,
    ADDR_IN_40_CTRL         = 10'h1f8,
    ADDR_IN_41_DATA_0       = 10'h1fc,
    ADDR_IN_41_DATA_1       = 10'h200,
    ADDR_IN_41_CTRL         = 10'h204,
    ADDR_IN_42_DATA_0       = 10'h208,
    ADDR_IN_42_DATA_1       = 10'h20c,
    ADDR_IN_42_CTRL         = 10'h210,
    ADDR_IN_43_DATA_0       = 10'h214,
    ADDR_IN_43_DATA_1       = 10'h218,
    ADDR_IN_43_CTRL         = 10'h21c,
    ADDR_IN_44_DATA_0       = 10'h220,
    ADDR_IN_44_DATA_1       = 10'h224,
    ADDR_IN_44_CTRL         = 10'h228,
    ADDR_L3_OUT_DIST_DATA_0 = 10'h22c,
    ADDR_L3_OUT_DIST_DATA_1 = 10'h230,
    ADDR_L3_OUT_DIST_CTRL   = 10'h234,
    ADDR_L3_OUT_ID_DATA_0   = 10'h238,
    ADDR_L3_OUT_ID_DATA_1   = 10'h23c,
    ADDR_L3_OUT_ID_CTRL     = 10'h240,
    WRIDLE                  = 2'd0,
    WRDATA                  = 2'd1,
    WRRESP                  = 2'd2,
    WRRESET                 = 2'd3,
    RDIDLE                  = 2'd0,
    RDDATA                  = 2'd1,
    RDRESET                 = 2'd2,
    ADDR_BITS                = 10;
//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_interrupt = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    wire                          auto_restart_done;
    reg                           int_gie = 1'b0;
    reg                           int_ier = 1'b0;
    reg                           int_isr = 1'b0;
    reg  [63:0]                   int_in_0 = 'b0;
    reg  [63:0]                   int_in_1 = 'b0;
    reg  [63:0]                   int_in_2 = 'b0;
    reg  [63:0]                   int_in_3 = 'b0;
    reg  [63:0]                   int_in_4 = 'b0;
    reg  [63:0]                   int_in_5 = 'b0;
    reg  [63:0]                   int_in_6 = 'b0;
    reg  [63:0]                   int_in_7 = 'b0;
    reg  [63:0]                   int_in_8 = 'b0;
    reg  [63:0]                   int_in_9 = 'b0;
    reg  [63:0]                   int_in_10 = 'b0;
    reg  [63:0]                   int_in_11 = 'b0;
    reg  [63:0]                   int_in_12 = 'b0;
    reg  [63:0]                   int_in_13 = 'b0;
    reg  [63:0]                   int_in_14 = 'b0;
    reg  [63:0]                   int_in_15 = 'b0;
    reg  [63:0]                   int_in_16 = 'b0;
    reg  [63:0]                   int_in_17 = 'b0;
    reg  [63:0]                   int_in_18 = 'b0;
    reg  [63:0]                   int_in_19 = 'b0;
    reg  [63:0]                   int_in_20 = 'b0;
    reg  [63:0]                   int_in_21 = 'b0;
    reg  [63:0]                   int_in_22 = 'b0;
    reg  [63:0]                   int_in_23 = 'b0;
    reg  [63:0]                   int_in_24 = 'b0;
    reg  [63:0]                   int_in_25 = 'b0;
    reg  [63:0]                   int_in_26 = 'b0;
    reg  [63:0]                   int_in_27 = 'b0;
    reg  [63:0]                   int_in_28 = 'b0;
    reg  [63:0]                   int_in_29 = 'b0;
    reg  [63:0]                   int_in_30 = 'b0;
    reg  [63:0]                   int_in_31 = 'b0;
    reg  [63:0]                   int_in_32 = 'b0;
    reg  [63:0]                   int_in_33 = 'b0;
    reg  [63:0]                   int_in_34 = 'b0;
    reg  [63:0]                   int_in_35 = 'b0;
    reg  [63:0]                   int_in_36 = 'b0;
    reg  [63:0]                   int_in_37 = 'b0;
    reg  [63:0]                   int_in_38 = 'b0;
    reg  [63:0]                   int_in_39 = 'b0;
    reg  [63:0]                   int_in_40 = 'b0;
    reg  [63:0]                   int_in_41 = 'b0;
    reg  [63:0]                   int_in_42 = 'b0;
    reg  [63:0]                   int_in_43 = 'b0;
    reg  [63:0]                   int_in_44 = 'b0;
    reg  [63:0]                   int_L3_out_dist = 'b0;
    reg  [63:0]                   int_L3_out_id = 'b0;
//------------------------Instantiation------------------
//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;
// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end
// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end
// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end
//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];
// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end
// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end
// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                    rdata[9] <= int_interrupt;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_IN_0_DATA_0: begin
                    rdata <= int_in_0[31:0];
                end
                ADDR_IN_0_DATA_1: begin
                    rdata <= int_in_0[63:32];
                end
                ADDR_IN_1_DATA_0: begin
                    rdata <= int_in_1[31:0];
                end
                ADDR_IN_1_DATA_1: begin
                    rdata <= int_in_1[63:32];
                end
                ADDR_IN_2_DATA_0: begin
                    rdata <= int_in_2[31:0];
                end
                ADDR_IN_2_DATA_1: begin
                    rdata <= int_in_2[63:32];
                end
                ADDR_IN_3_DATA_0: begin
                    rdata <= int_in_3[31:0];
                end
                ADDR_IN_3_DATA_1: begin
                    rdata <= int_in_3[63:32];
                end
                ADDR_IN_4_DATA_0: begin
                    rdata <= int_in_4[31:0];
                end
                ADDR_IN_4_DATA_1: begin
                    rdata <= int_in_4[63:32];
                end
                ADDR_IN_5_DATA_0: begin
                    rdata <= int_in_5[31:0];
                end
                ADDR_IN_5_DATA_1: begin
                    rdata <= int_in_5[63:32];
                end
                ADDR_IN_6_DATA_0: begin
                    rdata <= int_in_6[31:0];
                end
                ADDR_IN_6_DATA_1: begin
                    rdata <= int_in_6[63:32];
                end
                ADDR_IN_7_DATA_0: begin
                    rdata <= int_in_7[31:0];
                end
                ADDR_IN_7_DATA_1: begin
                    rdata <= int_in_7[63:32];
                end
                ADDR_IN_8_DATA_0: begin
                    rdata <= int_in_8[31:0];
                end
                ADDR_IN_8_DATA_1: begin
                    rdata <= int_in_8[63:32];
                end
                ADDR_IN_9_DATA_0: begin
                    rdata <= int_in_9[31:0];
                end
                ADDR_IN_9_DATA_1: begin
                    rdata <= int_in_9[63:32];
                end
                ADDR_IN_10_DATA_0: begin
                    rdata <= int_in_10[31:0];
                end
                ADDR_IN_10_DATA_1: begin
                    rdata <= int_in_10[63:32];
                end
                ADDR_IN_11_DATA_0: begin
                    rdata <= int_in_11[31:0];
                end
                ADDR_IN_11_DATA_1: begin
                    rdata <= int_in_11[63:32];
                end
                ADDR_IN_12_DATA_0: begin
                    rdata <= int_in_12[31:0];
                end
                ADDR_IN_12_DATA_1: begin
                    rdata <= int_in_12[63:32];
                end
                ADDR_IN_13_DATA_0: begin
                    rdata <= int_in_13[31:0];
                end
                ADDR_IN_13_DATA_1: begin
                    rdata <= int_in_13[63:32];
                end
                ADDR_IN_14_DATA_0: begin
                    rdata <= int_in_14[31:0];
                end
                ADDR_IN_14_DATA_1: begin
                    rdata <= int_in_14[63:32];
                end
                ADDR_IN_15_DATA_0: begin
                    rdata <= int_in_15[31:0];
                end
                ADDR_IN_15_DATA_1: begin
                    rdata <= int_in_15[63:32];
                end
                ADDR_IN_16_DATA_0: begin
                    rdata <= int_in_16[31:0];
                end
                ADDR_IN_16_DATA_1: begin
                    rdata <= int_in_16[63:32];
                end
                ADDR_IN_17_DATA_0: begin
                    rdata <= int_in_17[31:0];
                end
                ADDR_IN_17_DATA_1: begin
                    rdata <= int_in_17[63:32];
                end
                ADDR_IN_18_DATA_0: begin
                    rdata <= int_in_18[31:0];
                end
                ADDR_IN_18_DATA_1: begin
                    rdata <= int_in_18[63:32];
                end
                ADDR_IN_19_DATA_0: begin
                    rdata <= int_in_19[31:0];
                end
                ADDR_IN_19_DATA_1: begin
                    rdata <= int_in_19[63:32];
                end
                ADDR_IN_20_DATA_0: begin
                    rdata <= int_in_20[31:0];
                end
                ADDR_IN_20_DATA_1: begin
                    rdata <= int_in_20[63:32];
                end
                ADDR_IN_21_DATA_0: begin
                    rdata <= int_in_21[31:0];
                end
                ADDR_IN_21_DATA_1: begin
                    rdata <= int_in_21[63:32];
                end
                ADDR_IN_22_DATA_0: begin
                    rdata <= int_in_22[31:0];
                end
                ADDR_IN_22_DATA_1: begin
                    rdata <= int_in_22[63:32];
                end
                ADDR_IN_23_DATA_0: begin
                    rdata <= int_in_23[31:0];
                end
                ADDR_IN_23_DATA_1: begin
                    rdata <= int_in_23[63:32];
                end
                ADDR_IN_24_DATA_0: begin
                    rdata <= int_in_24[31:0];
                end
                ADDR_IN_24_DATA_1: begin
                    rdata <= int_in_24[63:32];
                end
                ADDR_IN_25_DATA_0: begin
                    rdata <= int_in_25[31:0];
                end
                ADDR_IN_25_DATA_1: begin
                    rdata <= int_in_25[63:32];
                end
                ADDR_IN_26_DATA_0: begin
                    rdata <= int_in_26[31:0];
                end
                ADDR_IN_26_DATA_1: begin
                    rdata <= int_in_26[63:32];
                end
                ADDR_IN_27_DATA_0: begin
                    rdata <= int_in_27[31:0];
                end
                ADDR_IN_27_DATA_1: begin
                    rdata <= int_in_27[63:32];
                end
                ADDR_IN_28_DATA_0: begin
                    rdata <= int_in_28[31:0];
                end
                ADDR_IN_28_DATA_1: begin
                    rdata <= int_in_28[63:32];
                end
                ADDR_IN_29_DATA_0: begin
                    rdata <= int_in_29[31:0];
                end
                ADDR_IN_29_DATA_1: begin
                    rdata <= int_in_29[63:32];
                end
                ADDR_IN_30_DATA_0: begin
                    rdata <= int_in_30[31:0];
                end
                ADDR_IN_30_DATA_1: begin
                    rdata <= int_in_30[63:32];
                end
                ADDR_IN_31_DATA_0: begin
                    rdata <= int_in_31[31:0];
                end
                ADDR_IN_31_DATA_1: begin
                    rdata <= int_in_31[63:32];
                end
                ADDR_IN_32_DATA_0: begin
                    rdata <= int_in_32[31:0];
                end
                ADDR_IN_32_DATA_1: begin
                    rdata <= int_in_32[63:32];
                end
                ADDR_IN_33_DATA_0: begin
                    rdata <= int_in_33[31:0];
                end
                ADDR_IN_33_DATA_1: begin
                    rdata <= int_in_33[63:32];
                end
                ADDR_IN_34_DATA_0: begin
                    rdata <= int_in_34[31:0];
                end
                ADDR_IN_34_DATA_1: begin
                    rdata <= int_in_34[63:32];
                end
                ADDR_IN_35_DATA_0: begin
                    rdata <= int_in_35[31:0];
                end
                ADDR_IN_35_DATA_1: begin
                    rdata <= int_in_35[63:32];
                end
                ADDR_IN_36_DATA_0: begin
                    rdata <= int_in_36[31:0];
                end
                ADDR_IN_36_DATA_1: begin
                    rdata <= int_in_36[63:32];
                end
                ADDR_IN_37_DATA_0: begin
                    rdata <= int_in_37[31:0];
                end
                ADDR_IN_37_DATA_1: begin
                    rdata <= int_in_37[63:32];
                end
                ADDR_IN_38_DATA_0: begin
                    rdata <= int_in_38[31:0];
                end
                ADDR_IN_38_DATA_1: begin
                    rdata <= int_in_38[63:32];
                end
                ADDR_IN_39_DATA_0: begin
                    rdata <= int_in_39[31:0];
                end
                ADDR_IN_39_DATA_1: begin
                    rdata <= int_in_39[63:32];
                end
                ADDR_IN_40_DATA_0: begin
                    rdata <= int_in_40[31:0];
                end
                ADDR_IN_40_DATA_1: begin
                    rdata <= int_in_40[63:32];
                end
                ADDR_IN_41_DATA_0: begin
                    rdata <= int_in_41[31:0];
                end
                ADDR_IN_41_DATA_1: begin
                    rdata <= int_in_41[63:32];
                end
                ADDR_IN_42_DATA_0: begin
                    rdata <= int_in_42[31:0];
                end
                ADDR_IN_42_DATA_1: begin
                    rdata <= int_in_42[63:32];
                end
                ADDR_IN_43_DATA_0: begin
                    rdata <= int_in_43[31:0];
                end
                ADDR_IN_43_DATA_1: begin
                    rdata <= int_in_43[63:32];
                end
                ADDR_IN_44_DATA_0: begin
                    rdata <= int_in_44[31:0];
                end
                ADDR_IN_44_DATA_1: begin
                    rdata <= int_in_44[63:32];
                end
                ADDR_L3_OUT_DIST_DATA_0: begin
                    rdata <= int_L3_out_dist[31:0];
                end
                ADDR_L3_OUT_DIST_DATA_1: begin
                    rdata <= int_L3_out_dist[63:32];
                end
                ADDR_L3_OUT_ID_DATA_0: begin
                    rdata <= int_L3_out_id[31:0];
                end
                ADDR_L3_OUT_ID_DATA_1: begin
                    rdata <= int_L3_out_id[63:32];
                end
            endcase
        end
    end
end
//------------------------Register logic-----------------
assign interrupt         = int_interrupt;
assign ap_start          = int_ap_start;
assign task_ap_done      = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready     = ap_ready && !int_auto_restart;
assign auto_restart_done = auto_restart_status && (ap_idle && !int_ap_idle);
assign in_0              = int_in_0;
assign in_1              = int_in_1;
assign in_2              = int_in_2;
assign in_3              = int_in_3;
assign in_4              = int_in_4;
assign in_5              = int_in_5;
assign in_6              = int_in_6;
assign in_7              = int_in_7;
assign in_8              = int_in_8;
assign in_9              = int_in_9;
assign in_10             = int_in_10;
assign in_11             = int_in_11;
assign in_12             = int_in_12;
assign in_13             = int_in_13;
assign in_14             = int_in_14;
assign in_15             = int_in_15;
assign in_16             = int_in_16;
assign in_17             = int_in_17;
assign in_18             = int_in_18;
assign in_19             = int_in_19;
assign in_20             = int_in_20;
assign in_21             = int_in_21;
assign in_22             = int_in_22;
assign in_23             = int_in_23;
assign in_24             = int_in_24;
assign in_25             = int_in_25;
assign in_26             = int_in_26;
assign in_27             = int_in_27;
assign in_28             = int_in_28;
assign in_29             = int_in_29;
assign in_30             = int_in_30;
assign in_31             = int_in_31;
assign in_32             = int_in_32;
assign in_33             = int_in_33;
assign in_34             = int_in_34;
assign in_35             = int_in_35;
assign in_36             = int_in_36;
assign in_37             = int_in_37;
assign in_38             = int_in_38;
assign in_39             = int_in_39;
assign in_40             = int_in_40;
assign in_41             = int_in_41;
assign in_42             = int_in_42;
assign in_43             = int_in_43;
assign in_44             = int_in_44;
assign L3_out_dist       = int_L3_out_dist;
assign L3_out_id         = int_L3_out_id;
// int_interrupt
always @(posedge ACLK) begin
    if (ARESET)
        int_interrupt <= 1'b0;
    else if (ACLK_EN) begin
        if (int_gie && (|int_isr))
            int_interrupt <= 1'b1;
        else
            int_interrupt <= 1'b0;
    end
end
// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_done & int_auto_restart)
            int_ap_start <= 1'b1; // auto restart
        else
            int_ap_start <= 1'b0; // self clear
    end
end
// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end
// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_done)
            int_task_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_task_ap_done <= 1'b0; // clear on read
    end
end
// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end
// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end
// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end
// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end
// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end
// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[0];
    end
end
// int_isr
always @(posedge ACLK) begin
    if (ARESET)
        int_isr <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier & ap_done)
            int_isr <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr <= int_isr ^ WDATA[0]; // toggle on write
    end
end
// int_in_0[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_0[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_0_DATA_0)
            int_in_0[31:0] <= (WDATA[31:0] & wmask) | (int_in_0[31:0] & ~wmask);
    end
end
// int_in_0[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_0[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_0_DATA_1)
            int_in_0[63:32] <= (WDATA[31:0] & wmask) | (int_in_0[63:32] & ~wmask);
    end
end
// int_in_1[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_1[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_1_DATA_0)
            int_in_1[31:0] <= (WDATA[31:0] & wmask) | (int_in_1[31:0] & ~wmask);
    end
end
// int_in_1[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_1[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_1_DATA_1)
            int_in_1[63:32] <= (WDATA[31:0] & wmask) | (int_in_1[63:32] & ~wmask);
    end
end
// int_in_2[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_2[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_2_DATA_0)
            int_in_2[31:0] <= (WDATA[31:0] & wmask) | (int_in_2[31:0] & ~wmask);
    end
end
// int_in_2[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_2[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_2_DATA_1)
            int_in_2[63:32] <= (WDATA[31:0] & wmask) | (int_in_2[63:32] & ~wmask);
    end
end
// int_in_3[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_3[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_3_DATA_0)
            int_in_3[31:0] <= (WDATA[31:0] & wmask) | (int_in_3[31:0] & ~wmask);
    end
end
// int_in_3[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_3[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_3_DATA_1)
            int_in_3[63:32] <= (WDATA[31:0] & wmask) | (int_in_3[63:32] & ~wmask);
    end
end
// int_in_4[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_4[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_4_DATA_0)
            int_in_4[31:0] <= (WDATA[31:0] & wmask) | (int_in_4[31:0] & ~wmask);
    end
end
// int_in_4[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_4[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_4_DATA_1)
            int_in_4[63:32] <= (WDATA[31:0] & wmask) | (int_in_4[63:32] & ~wmask);
    end
end
// int_in_5[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_5[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_5_DATA_0)
            int_in_5[31:0] <= (WDATA[31:0] & wmask) | (int_in_5[31:0] & ~wmask);
    end
end
// int_in_5[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_5[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_5_DATA_1)
            int_in_5[63:32] <= (WDATA[31:0] & wmask) | (int_in_5[63:32] & ~wmask);
    end
end
// int_in_6[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_6[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_6_DATA_0)
            int_in_6[31:0] <= (WDATA[31:0] & wmask) | (int_in_6[31:0] & ~wmask);
    end
end
// int_in_6[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_6[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_6_DATA_1)
            int_in_6[63:32] <= (WDATA[31:0] & wmask) | (int_in_6[63:32] & ~wmask);
    end
end
// int_in_7[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_7[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_7_DATA_0)
            int_in_7[31:0] <= (WDATA[31:0] & wmask) | (int_in_7[31:0] & ~wmask);
    end
end
// int_in_7[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_7[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_7_DATA_1)
            int_in_7[63:32] <= (WDATA[31:0] & wmask) | (int_in_7[63:32] & ~wmask);
    end
end
// int_in_8[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_8[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_8_DATA_0)
            int_in_8[31:0] <= (WDATA[31:0] & wmask) | (int_in_8[31:0] & ~wmask);
    end
end
// int_in_8[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_8[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_8_DATA_1)
            int_in_8[63:32] <= (WDATA[31:0] & wmask) | (int_in_8[63:32] & ~wmask);
    end
end
// int_in_9[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_9[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_9_DATA_0)
            int_in_9[31:0] <= (WDATA[31:0] & wmask) | (int_in_9[31:0] & ~wmask);
    end
end
// int_in_9[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_9[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_9_DATA_1)
            int_in_9[63:32] <= (WDATA[31:0] & wmask) | (int_in_9[63:32] & ~wmask);
    end
end
// int_in_10[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_10[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_10_DATA_0)
            int_in_10[31:0] <= (WDATA[31:0] & wmask) | (int_in_10[31:0] & ~wmask);
    end
end
// int_in_10[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_10[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_10_DATA_1)
            int_in_10[63:32] <= (WDATA[31:0] & wmask) | (int_in_10[63:32] & ~wmask);
    end
end
// int_in_11[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_11[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_11_DATA_0)
            int_in_11[31:0] <= (WDATA[31:0] & wmask) | (int_in_11[31:0] & ~wmask);
    end
end
// int_in_11[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_11[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_11_DATA_1)
            int_in_11[63:32] <= (WDATA[31:0] & wmask) | (int_in_11[63:32] & ~wmask);
    end
end
// int_in_12[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_12[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_12_DATA_0)
            int_in_12[31:0] <= (WDATA[31:0] & wmask) | (int_in_12[31:0] & ~wmask);
    end
end
// int_in_12[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_12[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_12_DATA_1)
            int_in_12[63:32] <= (WDATA[31:0] & wmask) | (int_in_12[63:32] & ~wmask);
    end
end
// int_in_13[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_13[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_13_DATA_0)
            int_in_13[31:0] <= (WDATA[31:0] & wmask) | (int_in_13[31:0] & ~wmask);
    end
end
// int_in_13[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_13[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_13_DATA_1)
            int_in_13[63:32] <= (WDATA[31:0] & wmask) | (int_in_13[63:32] & ~wmask);
    end
end
// int_in_14[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_14[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_14_DATA_0)
            int_in_14[31:0] <= (WDATA[31:0] & wmask) | (int_in_14[31:0] & ~wmask);
    end
end
// int_in_14[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_14[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_14_DATA_1)
            int_in_14[63:32] <= (WDATA[31:0] & wmask) | (int_in_14[63:32] & ~wmask);
    end
end
// int_in_15[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_15[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_15_DATA_0)
            int_in_15[31:0] <= (WDATA[31:0] & wmask) | (int_in_15[31:0] & ~wmask);
    end
end
// int_in_15[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_15[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_15_DATA_1)
            int_in_15[63:32] <= (WDATA[31:0] & wmask) | (int_in_15[63:32] & ~wmask);
    end
end
// int_in_16[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_16[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_16_DATA_0)
            int_in_16[31:0] <= (WDATA[31:0] & wmask) | (int_in_16[31:0] & ~wmask);
    end
end
// int_in_16[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_16[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_16_DATA_1)
            int_in_16[63:32] <= (WDATA[31:0] & wmask) | (int_in_16[63:32] & ~wmask);
    end
end
// int_in_17[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_17[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_17_DATA_0)
            int_in_17[31:0] <= (WDATA[31:0] & wmask) | (int_in_17[31:0] & ~wmask);
    end
end
// int_in_17[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_17[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_17_DATA_1)
            int_in_17[63:32] <= (WDATA[31:0] & wmask) | (int_in_17[63:32] & ~wmask);
    end
end
// int_in_18[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_18[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_18_DATA_0)
            int_in_18[31:0] <= (WDATA[31:0] & wmask) | (int_in_18[31:0] & ~wmask);
    end
end
// int_in_18[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_18[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_18_DATA_1)
            int_in_18[63:32] <= (WDATA[31:0] & wmask) | (int_in_18[63:32] & ~wmask);
    end
end
// int_in_19[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_19[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_19_DATA_0)
            int_in_19[31:0] <= (WDATA[31:0] & wmask) | (int_in_19[31:0] & ~wmask);
    end
end
// int_in_19[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_19[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_19_DATA_1)
            int_in_19[63:32] <= (WDATA[31:0] & wmask) | (int_in_19[63:32] & ~wmask);
    end
end
// int_in_20[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_20[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_20_DATA_0)
            int_in_20[31:0] <= (WDATA[31:0] & wmask) | (int_in_20[31:0] & ~wmask);
    end
end
// int_in_20[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_20[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_20_DATA_1)
            int_in_20[63:32] <= (WDATA[31:0] & wmask) | (int_in_20[63:32] & ~wmask);
    end
end
// int_in_21[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_21[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_21_DATA_0)
            int_in_21[31:0] <= (WDATA[31:0] & wmask) | (int_in_21[31:0] & ~wmask);
    end
end
// int_in_21[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_21[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_21_DATA_1)
            int_in_21[63:32] <= (WDATA[31:0] & wmask) | (int_in_21[63:32] & ~wmask);
    end
end
// int_in_22[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_22[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_22_DATA_0)
            int_in_22[31:0] <= (WDATA[31:0] & wmask) | (int_in_22[31:0] & ~wmask);
    end
end
// int_in_22[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_22[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_22_DATA_1)
            int_in_22[63:32] <= (WDATA[31:0] & wmask) | (int_in_22[63:32] & ~wmask);
    end
end
// int_in_23[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_23[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_23_DATA_0)
            int_in_23[31:0] <= (WDATA[31:0] & wmask) | (int_in_23[31:0] & ~wmask);
    end
end
// int_in_23[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_23[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_23_DATA_1)
            int_in_23[63:32] <= (WDATA[31:0] & wmask) | (int_in_23[63:32] & ~wmask);
    end
end
// int_in_24[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_24[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_24_DATA_0)
            int_in_24[31:0] <= (WDATA[31:0] & wmask) | (int_in_24[31:0] & ~wmask);
    end
end
// int_in_24[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_24[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_24_DATA_1)
            int_in_24[63:32] <= (WDATA[31:0] & wmask) | (int_in_24[63:32] & ~wmask);
    end
end
// int_in_25[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_25[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_25_DATA_0)
            int_in_25[31:0] <= (WDATA[31:0] & wmask) | (int_in_25[31:0] & ~wmask);
    end
end
// int_in_25[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_25[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_25_DATA_1)
            int_in_25[63:32] <= (WDATA[31:0] & wmask) | (int_in_25[63:32] & ~wmask);
    end
end
// int_in_26[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_26[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_26_DATA_0)
            int_in_26[31:0] <= (WDATA[31:0] & wmask) | (int_in_26[31:0] & ~wmask);
    end
end
// int_in_26[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_26[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_26_DATA_1)
            int_in_26[63:32] <= (WDATA[31:0] & wmask) | (int_in_26[63:32] & ~wmask);
    end
end
// int_in_27[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_27[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_27_DATA_0)
            int_in_27[31:0] <= (WDATA[31:0] & wmask) | (int_in_27[31:0] & ~wmask);
    end
end
// int_in_27[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_27[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_27_DATA_1)
            int_in_27[63:32] <= (WDATA[31:0] & wmask) | (int_in_27[63:32] & ~wmask);
    end
end
// int_in_28[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_28[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_28_DATA_0)
            int_in_28[31:0] <= (WDATA[31:0] & wmask) | (int_in_28[31:0] & ~wmask);
    end
end
// int_in_28[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_28[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_28_DATA_1)
            int_in_28[63:32] <= (WDATA[31:0] & wmask) | (int_in_28[63:32] & ~wmask);
    end
end
// int_in_29[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_29[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_29_DATA_0)
            int_in_29[31:0] <= (WDATA[31:0] & wmask) | (int_in_29[31:0] & ~wmask);
    end
end
// int_in_29[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_29[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_29_DATA_1)
            int_in_29[63:32] <= (WDATA[31:0] & wmask) | (int_in_29[63:32] & ~wmask);
    end
end
// int_in_30[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_30[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_30_DATA_0)
            int_in_30[31:0] <= (WDATA[31:0] & wmask) | (int_in_30[31:0] & ~wmask);
    end
end
// int_in_30[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_30[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_30_DATA_1)
            int_in_30[63:32] <= (WDATA[31:0] & wmask) | (int_in_30[63:32] & ~wmask);
    end
end
// int_in_31[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_31[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_31_DATA_0)
            int_in_31[31:0] <= (WDATA[31:0] & wmask) | (int_in_31[31:0] & ~wmask);
    end
end
// int_in_31[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_31[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_31_DATA_1)
            int_in_31[63:32] <= (WDATA[31:0] & wmask) | (int_in_31[63:32] & ~wmask);
    end
end
// int_in_32[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_32[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_32_DATA_0)
            int_in_32[31:0] <= (WDATA[31:0] & wmask) | (int_in_32[31:0] & ~wmask);
    end
end
// int_in_32[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_32[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_32_DATA_1)
            int_in_32[63:32] <= (WDATA[31:0] & wmask) | (int_in_32[63:32] & ~wmask);
    end
end
// int_in_33[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_33[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_33_DATA_0)
            int_in_33[31:0] <= (WDATA[31:0] & wmask) | (int_in_33[31:0] & ~wmask);
    end
end
// int_in_33[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_33[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_33_DATA_1)
            int_in_33[63:32] <= (WDATA[31:0] & wmask) | (int_in_33[63:32] & ~wmask);
    end
end
// int_in_34[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_34[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_34_DATA_0)
            int_in_34[31:0] <= (WDATA[31:0] & wmask) | (int_in_34[31:0] & ~wmask);
    end
end
// int_in_34[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_34[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_34_DATA_1)
            int_in_34[63:32] <= (WDATA[31:0] & wmask) | (int_in_34[63:32] & ~wmask);
    end
end
// int_in_35[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_35[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_35_DATA_0)
            int_in_35[31:0] <= (WDATA[31:0] & wmask) | (int_in_35[31:0] & ~wmask);
    end
end
// int_in_35[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_35[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_35_DATA_1)
            int_in_35[63:32] <= (WDATA[31:0] & wmask) | (int_in_35[63:32] & ~wmask);
    end
end
// int_in_36[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_36[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_36_DATA_0)
            int_in_36[31:0] <= (WDATA[31:0] & wmask) | (int_in_36[31:0] & ~wmask);
    end
end
// int_in_36[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_36[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_36_DATA_1)
            int_in_36[63:32] <= (WDATA[31:0] & wmask) | (int_in_36[63:32] & ~wmask);
    end
end
// int_in_37[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_37[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_37_DATA_0)
            int_in_37[31:0] <= (WDATA[31:0] & wmask) | (int_in_37[31:0] & ~wmask);
    end
end
// int_in_37[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_37[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_37_DATA_1)
            int_in_37[63:32] <= (WDATA[31:0] & wmask) | (int_in_37[63:32] & ~wmask);
    end
end
// int_in_38[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_38[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_38_DATA_0)
            int_in_38[31:0] <= (WDATA[31:0] & wmask) | (int_in_38[31:0] & ~wmask);
    end
end
// int_in_38[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_38[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_38_DATA_1)
            int_in_38[63:32] <= (WDATA[31:0] & wmask) | (int_in_38[63:32] & ~wmask);
    end
end
// int_in_39[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_39[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_39_DATA_0)
            int_in_39[31:0] <= (WDATA[31:0] & wmask) | (int_in_39[31:0] & ~wmask);
    end
end
// int_in_39[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_39[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_39_DATA_1)
            int_in_39[63:32] <= (WDATA[31:0] & wmask) | (int_in_39[63:32] & ~wmask);
    end
end
// int_in_40[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_40[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_40_DATA_0)
            int_in_40[31:0] <= (WDATA[31:0] & wmask) | (int_in_40[31:0] & ~wmask);
    end
end
// int_in_40[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_40[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_40_DATA_1)
            int_in_40[63:32] <= (WDATA[31:0] & wmask) | (int_in_40[63:32] & ~wmask);
    end
end
// int_in_41[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_41[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_41_DATA_0)
            int_in_41[31:0] <= (WDATA[31:0] & wmask) | (int_in_41[31:0] & ~wmask);
    end
end
// int_in_41[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_41[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_41_DATA_1)
            int_in_41[63:32] <= (WDATA[31:0] & wmask) | (int_in_41[63:32] & ~wmask);
    end
end
// int_in_42[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_42[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_42_DATA_0)
            int_in_42[31:0] <= (WDATA[31:0] & wmask) | (int_in_42[31:0] & ~wmask);
    end
end
// int_in_42[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_42[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_42_DATA_1)
            int_in_42[63:32] <= (WDATA[31:0] & wmask) | (int_in_42[63:32] & ~wmask);
    end
end
// int_in_43[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_43[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_43_DATA_0)
            int_in_43[31:0] <= (WDATA[31:0] & wmask) | (int_in_43[31:0] & ~wmask);
    end
end
// int_in_43[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_43[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_43_DATA_1)
            int_in_43[63:32] <= (WDATA[31:0] & wmask) | (int_in_43[63:32] & ~wmask);
    end
end
// int_in_44[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_44[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_44_DATA_0)
            int_in_44[31:0] <= (WDATA[31:0] & wmask) | (int_in_44[31:0] & ~wmask);
    end
end
// int_in_44[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_44[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_44_DATA_1)
            int_in_44[63:32] <= (WDATA[31:0] & wmask) | (int_in_44[63:32] & ~wmask);
    end
end
// int_L3_out_dist[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_L3_out_dist[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_L3_OUT_DIST_DATA_0)
            int_L3_out_dist[31:0] <= (WDATA[31:0] & wmask) | (int_L3_out_dist[31:0] & ~wmask);
    end
end
// int_L3_out_dist[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_L3_out_dist[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_L3_OUT_DIST_DATA_1)
            int_L3_out_dist[63:32] <= (WDATA[31:0] & wmask) | (int_L3_out_dist[63:32] & ~wmask);
    end
end
// int_L3_out_id[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_L3_out_id[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_L3_OUT_ID_DATA_0)
            int_L3_out_id[31:0] <= (WDATA[31:0] & wmask) | (int_L3_out_id[31:0] & ~wmask);
    end
end
// int_L3_out_id[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_L3_out_id[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_L3_OUT_ID_DATA_1)
            int_L3_out_id[63:32] <= (WDATA[31:0] & wmask) | (int_L3_out_id[63:32] & ~wmask);
    end
end
//synthesis translate_off
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (int_gie & ~int_isr & int_ier & ap_done)
            $display ("// Interrupt Monitor : interrupt for ap_done detected @ \"%0t\"", $time);
    end
end
//synthesis translate_on
//------------------------Memory logic-------------------
endmodule