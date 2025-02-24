`timescale 1 ns / 1 ps

module jacobi3d_kernel_fsm
(
  ap_clk,
  ap_rst_n,
  ap_start,
  ap_ready,
  ap_done,
  ap_idle,
  bank_0_t1,
  coalesced_data_num,
  bank_1_t0,
  BurstRead_floatx16_0___bank_0_t1__q0,
  BurstRead_floatx16_0___coalesced_data_num__q0,
  BurstRead_floatx16_0__ap_start,
  BurstRead_floatx16_0__ap_ready,
  BurstRead_floatx16_0__ap_done,
  BurstRead_floatx16_0__ap_idle,
  BurstWrite_floatx16_0___bank_1_t0__q0,
  BurstWrite_floatx16_0___coalesced_data_num__q0,
  BurstWrite_floatx16_0__ap_start,
  BurstWrite_floatx16_0__ap_ready,
  BurstWrite_floatx16_0__ap_done,
  BurstWrite_floatx16_0__ap_idle,
  Module0Func_0__ap_start,
  Module1Func_0__ap_start,
  Module2Func_0__ap_start,
  Module2Func_1__ap_start,
  Module2Func_2__ap_start,
  Module2Func_3__ap_start,
  Module2Func_4__ap_start,
  Module2Func_5__ap_start,
  Module2Func_6__ap_start,
  Module2Func_7__ap_start,
  Module2Func_8__ap_start,
  Module2Func_9__ap_start,
  Module2Func_10__ap_start,
  Module2Func_11__ap_start,
  Module2Func_12__ap_start,
  Module2Func_13__ap_start,
  Module2Func_14__ap_start,
  Module2Func_15__ap_start,
  Module2Func_16__ap_start,
  Module2Func_17__ap_start,
  Module2Func_18__ap_start,
  Module2Func_19__ap_start,
  Module2Func_20__ap_start,
  Module2Func_21__ap_start,
  Module2Func_22__ap_start,
  Module2Func_23__ap_start,
  Module2Func_24__ap_start,
  Module2Func_25__ap_start,
  Module2Func_26__ap_start,
  Module2Func_27__ap_start,
  Module2Func_28__ap_start,
  Module2Func_29__ap_start,
  Module2Func_30__ap_start,
  Module2Func_31__ap_start,
  Module2Func_32__ap_start,
  Module2Func_33__ap_start,
  Module2Func_34__ap_start,
  Module2Func_35__ap_start,
  Module2Func_36__ap_start,
  Module2Func_37__ap_start,
  Module2Func_38__ap_start,
  Module2Func_39__ap_start,
  Module2Func_40__ap_start,
  Module2Func_41__ap_start,
  Module2Func_42__ap_start,
  Module2Func_43__ap_start,
  Module2Func_44__ap_start,
  Module2Func_45__ap_start,
  Module2Func_46__ap_start,
  Module2Func_47__ap_start,
  Module2Func_48__ap_start,
  Module2Func_49__ap_start,
  Module2Func_50__ap_start,
  Module2Func_51__ap_start,
  Module2Func_52__ap_start,
  Module2Func_53__ap_start,
  Module2Func_54__ap_start,
  Module2Func_55__ap_start,
  Module2Func_56__ap_start,
  Module2Func_57__ap_start,
  Module2Func_58__ap_start,
  Module2Func_59__ap_start,
  Module2Func_60__ap_start,
  Module2Func_61__ap_start,
  Module2Func_62__ap_start,
  Module2Func_63__ap_start,
  Module2Func_64__ap_start,
  Module2Func_65__ap_start,
  Module2Func_66__ap_start,
  Module2Func_67__ap_start,
  Module2Func_68__ap_start,
  Module2Func_69__ap_start,
  Module2Func_70__ap_start,
  Module2Func_71__ap_start,
  Module2Func_72__ap_start,
  Module2Func_73__ap_start,
  Module2Func_74__ap_start,
  Module2Func_75__ap_start,
  Module2Func_76__ap_start,
  Module2Func_77__ap_start,
  Module2Func_78__ap_start,
  Module2Func_79__ap_start,
  Module2Func_80__ap_start,
  Module2Func_81__ap_start,
  Module2Func_82__ap_start,
  Module2Func_83__ap_start,
  Module2Func_84__ap_start,
  Module2Func_85__ap_start,
  Module2Func_86__ap_start,
  Module2Func_87__ap_start,
  Module2Func_88__ap_start,
  Module2Func_89__ap_start,
  Module2Func_90__ap_start,
  Module2Func_91__ap_start,
  Module2Func_92__ap_start,
  Module2Func_93__ap_start,
  Module2Func_94__ap_start,
  Module2Func_95__ap_start,
  Module2Func_96__ap_start,
  Module2Func_97__ap_start,
  Module2Func_98__ap_start,
  Module2Func_99__ap_start,
  Module2Func_100__ap_start,
  Module2Func_101__ap_start,
  Module2Func_102__ap_start,
  Module2Func_103__ap_start,
  Module2Func_104__ap_start,
  Module2Func_105__ap_start,
  Module2Func_106__ap_start,
  Module2Func_107__ap_start,
  Module3Func_0__ap_start
);
  // pragma RS clk port=ap_clk
  // pragma RS rst port=ap_rst_n active=low
  // pragma RS ap-ctrl ap_start=ap_start ap_done=ap_done ap_idle=ap_idle ap_ready=ap_ready scalar=(bank_1_t0|bank_0_t1|coalesced_data_num)
  // pragma RS ap-ctrl ap_start=BurstRead_floatx16_0__ap_start ap_done=BurstRead_floatx16_0__ap_done ap_idle=BurstRead_floatx16_0__ap_idle ap_ready=BurstRead_floatx16_0__ap_ready scalar=BurstRead_floatx16_0___.*
  // pragma RS ap-ctrl ap_start=BurstWrite_floatx16_0__ap_start ap_done=BurstWrite_floatx16_0__ap_done ap_idle=BurstWrite_floatx16_0__ap_idle ap_ready=BurstWrite_floatx16_0__ap_ready scalar=BurstWrite_floatx16_0___.*
  // pragma RS ap-ctrl ap_start=Module0Func_0__ap_start
  // pragma RS ap-ctrl ap_start=Module1Func_0__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_0__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_1__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_2__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_3__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_4__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_5__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_6__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_7__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_8__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_9__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_10__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_11__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_12__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_13__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_14__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_15__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_16__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_17__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_18__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_19__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_20__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_21__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_22__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_23__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_24__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_25__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_26__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_27__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_28__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_29__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_30__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_31__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_32__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_33__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_34__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_35__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_36__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_37__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_38__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_39__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_40__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_41__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_42__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_43__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_44__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_45__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_46__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_47__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_48__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_49__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_50__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_51__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_52__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_53__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_54__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_55__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_56__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_57__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_58__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_59__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_60__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_61__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_62__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_63__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_64__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_65__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_66__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_67__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_68__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_69__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_70__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_71__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_72__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_73__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_74__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_75__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_76__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_77__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_78__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_79__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_80__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_81__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_82__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_83__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_84__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_85__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_86__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_87__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_88__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_89__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_90__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_91__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_92__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_93__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_94__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_95__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_96__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_97__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_98__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_99__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_100__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_101__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_102__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_103__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_104__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_105__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_106__ap_start
  // pragma RS ap-ctrl ap_start=Module2Func_107__ap_start
  // pragma RS ap-ctrl ap_start=Module3Func_0__ap_start
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_ready;
  output ap_done;
  output ap_idle;
  input [63:0] bank_0_t1;
  input [63:0] coalesced_data_num;
  input [63:0] bank_1_t0;
  output [63:0] BurstRead_floatx16_0___bank_0_t1__q0;
  output [63:0] BurstRead_floatx16_0___coalesced_data_num__q0;
  output BurstRead_floatx16_0__ap_start;
  input BurstRead_floatx16_0__ap_ready;
  input BurstRead_floatx16_0__ap_done;
  input BurstRead_floatx16_0__ap_idle;
  output [63:0] BurstWrite_floatx16_0___bank_1_t0__q0;
  output [63:0] BurstWrite_floatx16_0___coalesced_data_num__q0;
  output BurstWrite_floatx16_0__ap_start;
  input BurstWrite_floatx16_0__ap_ready;
  input BurstWrite_floatx16_0__ap_done;
  input BurstWrite_floatx16_0__ap_idle;
  output Module0Func_0__ap_start;
  output Module1Func_0__ap_start;
  output Module2Func_0__ap_start;
  output Module2Func_1__ap_start;
  output Module2Func_2__ap_start;
  output Module2Func_3__ap_start;
  output Module2Func_4__ap_start;
  output Module2Func_5__ap_start;
  output Module2Func_6__ap_start;
  output Module2Func_7__ap_start;
  output Module2Func_8__ap_start;
  output Module2Func_9__ap_start;
  output Module2Func_10__ap_start;
  output Module2Func_11__ap_start;
  output Module2Func_12__ap_start;
  output Module2Func_13__ap_start;
  output Module2Func_14__ap_start;
  output Module2Func_15__ap_start;
  output Module2Func_16__ap_start;
  output Module2Func_17__ap_start;
  output Module2Func_18__ap_start;
  output Module2Func_19__ap_start;
  output Module2Func_20__ap_start;
  output Module2Func_21__ap_start;
  output Module2Func_22__ap_start;
  output Module2Func_23__ap_start;
  output Module2Func_24__ap_start;
  output Module2Func_25__ap_start;
  output Module2Func_26__ap_start;
  output Module2Func_27__ap_start;
  output Module2Func_28__ap_start;
  output Module2Func_29__ap_start;
  output Module2Func_30__ap_start;
  output Module2Func_31__ap_start;
  output Module2Func_32__ap_start;
  output Module2Func_33__ap_start;
  output Module2Func_34__ap_start;
  output Module2Func_35__ap_start;
  output Module2Func_36__ap_start;
  output Module2Func_37__ap_start;
  output Module2Func_38__ap_start;
  output Module2Func_39__ap_start;
  output Module2Func_40__ap_start;
  output Module2Func_41__ap_start;
  output Module2Func_42__ap_start;
  output Module2Func_43__ap_start;
  output Module2Func_44__ap_start;
  output Module2Func_45__ap_start;
  output Module2Func_46__ap_start;
  output Module2Func_47__ap_start;
  output Module2Func_48__ap_start;
  output Module2Func_49__ap_start;
  output Module2Func_50__ap_start;
  output Module2Func_51__ap_start;
  output Module2Func_52__ap_start;
  output Module2Func_53__ap_start;
  output Module2Func_54__ap_start;
  output Module2Func_55__ap_start;
  output Module2Func_56__ap_start;
  output Module2Func_57__ap_start;
  output Module2Func_58__ap_start;
  output Module2Func_59__ap_start;
  output Module2Func_60__ap_start;
  output Module2Func_61__ap_start;
  output Module2Func_62__ap_start;
  output Module2Func_63__ap_start;
  output Module2Func_64__ap_start;
  output Module2Func_65__ap_start;
  output Module2Func_66__ap_start;
  output Module2Func_67__ap_start;
  output Module2Func_68__ap_start;
  output Module2Func_69__ap_start;
  output Module2Func_70__ap_start;
  output Module2Func_71__ap_start;
  output Module2Func_72__ap_start;
  output Module2Func_73__ap_start;
  output Module2Func_74__ap_start;
  output Module2Func_75__ap_start;
  output Module2Func_76__ap_start;
  output Module2Func_77__ap_start;
  output Module2Func_78__ap_start;
  output Module2Func_79__ap_start;
  output Module2Func_80__ap_start;
  output Module2Func_81__ap_start;
  output Module2Func_82__ap_start;
  output Module2Func_83__ap_start;
  output Module2Func_84__ap_start;
  output Module2Func_85__ap_start;
  output Module2Func_86__ap_start;
  output Module2Func_87__ap_start;
  output Module2Func_88__ap_start;
  output Module2Func_89__ap_start;
  output Module2Func_90__ap_start;
  output Module2Func_91__ap_start;
  output Module2Func_92__ap_start;
  output Module2Func_93__ap_start;
  output Module2Func_94__ap_start;
  output Module2Func_95__ap_start;
  output Module2Func_96__ap_start;
  output Module2Func_97__ap_start;
  output Module2Func_98__ap_start;
  output Module2Func_99__ap_start;
  output Module2Func_100__ap_start;
  output Module2Func_101__ap_start;
  output Module2Func_102__ap_start;
  output Module2Func_103__ap_start;
  output Module2Func_104__ap_start;
  output Module2Func_105__ap_start;
  output Module2Func_106__ap_start;
  output Module2Func_107__ap_start;
  output Module3Func_0__ap_start;
  wire [63:0] BurstRead_floatx16_0___bank_0_t1__q0;
  wire [63:0] BurstRead_floatx16_0___coalesced_data_num__q0;
  wire BurstRead_floatx16_0__ap_start_global__q0;
  wire BurstRead_floatx16_0__is_done__q0;
  wire BurstRead_floatx16_0__ap_done_global__q0;
  wire BurstRead_floatx16_0__ap_start;
  wire BurstRead_floatx16_0__ap_ready;
  wire BurstRead_floatx16_0__ap_done;
  wire BurstRead_floatx16_0__ap_idle;
  reg [1:0] BurstRead_floatx16_0__state;
  wire [63:0] BurstWrite_floatx16_0___bank_1_t0__q0;
  wire [63:0] BurstWrite_floatx16_0___coalesced_data_num__q0;
  wire BurstWrite_floatx16_0__ap_start_global__q0;
  wire BurstWrite_floatx16_0__is_done__q0;
  wire BurstWrite_floatx16_0__ap_done_global__q0;
  wire BurstWrite_floatx16_0__ap_start;
  wire BurstWrite_floatx16_0__ap_ready;
  wire BurstWrite_floatx16_0__ap_done;
  wire BurstWrite_floatx16_0__ap_idle;
  reg [1:0] BurstWrite_floatx16_0__state;
  wire Module0Func_0__ap_start_global__q0;
  reg Module0Func_0__ap_start;
  wire Module1Func_0__ap_start_global__q0;
  reg Module1Func_0__ap_start;
  wire Module2Func_0__ap_start_global__q0;
  reg Module2Func_0__ap_start;
  wire Module2Func_1__ap_start_global__q0;
  reg Module2Func_1__ap_start;
  wire Module2Func_2__ap_start_global__q0;
  reg Module2Func_2__ap_start;
  wire Module2Func_3__ap_start_global__q0;
  reg Module2Func_3__ap_start;
  wire Module2Func_4__ap_start_global__q0;
  reg Module2Func_4__ap_start;
  wire Module2Func_5__ap_start_global__q0;
  reg Module2Func_5__ap_start;
  wire Module2Func_6__ap_start_global__q0;
  reg Module2Func_6__ap_start;
  wire Module2Func_7__ap_start_global__q0;
  reg Module2Func_7__ap_start;
  wire Module2Func_8__ap_start_global__q0;
  reg Module2Func_8__ap_start;
  wire Module2Func_9__ap_start_global__q0;
  reg Module2Func_9__ap_start;
  wire Module2Func_10__ap_start_global__q0;
  reg Module2Func_10__ap_start;
  wire Module2Func_11__ap_start_global__q0;
  reg Module2Func_11__ap_start;
  wire Module2Func_12__ap_start_global__q0;
  reg Module2Func_12__ap_start;
  wire Module2Func_13__ap_start_global__q0;
  reg Module2Func_13__ap_start;
  wire Module2Func_14__ap_start_global__q0;
  reg Module2Func_14__ap_start;
  wire Module2Func_15__ap_start_global__q0;
  reg Module2Func_15__ap_start;
  wire Module2Func_16__ap_start_global__q0;
  reg Module2Func_16__ap_start;
  wire Module2Func_17__ap_start_global__q0;
  reg Module2Func_17__ap_start;
  wire Module2Func_18__ap_start_global__q0;
  reg Module2Func_18__ap_start;
  wire Module2Func_19__ap_start_global__q0;
  reg Module2Func_19__ap_start;
  wire Module2Func_20__ap_start_global__q0;
  reg Module2Func_20__ap_start;
  wire Module2Func_21__ap_start_global__q0;
  reg Module2Func_21__ap_start;
  wire Module2Func_22__ap_start_global__q0;
  reg Module2Func_22__ap_start;
  wire Module2Func_23__ap_start_global__q0;
  reg Module2Func_23__ap_start;
  wire Module2Func_24__ap_start_global__q0;
  reg Module2Func_24__ap_start;
  wire Module2Func_25__ap_start_global__q0;
  reg Module2Func_25__ap_start;
  wire Module2Func_26__ap_start_global__q0;
  reg Module2Func_26__ap_start;
  wire Module2Func_27__ap_start_global__q0;
  reg Module2Func_27__ap_start;
  wire Module2Func_28__ap_start_global__q0;
  reg Module2Func_28__ap_start;
  wire Module2Func_29__ap_start_global__q0;
  reg Module2Func_29__ap_start;
  wire Module2Func_30__ap_start_global__q0;
  reg Module2Func_30__ap_start;
  wire Module2Func_31__ap_start_global__q0;
  reg Module2Func_31__ap_start;
  wire Module2Func_32__ap_start_global__q0;
  reg Module2Func_32__ap_start;
  wire Module2Func_33__ap_start_global__q0;
  reg Module2Func_33__ap_start;
  wire Module2Func_34__ap_start_global__q0;
  reg Module2Func_34__ap_start;
  wire Module2Func_35__ap_start_global__q0;
  reg Module2Func_35__ap_start;
  wire Module2Func_36__ap_start_global__q0;
  reg Module2Func_36__ap_start;
  wire Module2Func_37__ap_start_global__q0;
  reg Module2Func_37__ap_start;
  wire Module2Func_38__ap_start_global__q0;
  reg Module2Func_38__ap_start;
  wire Module2Func_39__ap_start_global__q0;
  reg Module2Func_39__ap_start;
  wire Module2Func_40__ap_start_global__q0;
  reg Module2Func_40__ap_start;
  wire Module2Func_41__ap_start_global__q0;
  reg Module2Func_41__ap_start;
  wire Module2Func_42__ap_start_global__q0;
  reg Module2Func_42__ap_start;
  wire Module2Func_43__ap_start_global__q0;
  reg Module2Func_43__ap_start;
  wire Module2Func_44__ap_start_global__q0;
  reg Module2Func_44__ap_start;
  wire Module2Func_45__ap_start_global__q0;
  reg Module2Func_45__ap_start;
  wire Module2Func_46__ap_start_global__q0;
  reg Module2Func_46__ap_start;
  wire Module2Func_47__ap_start_global__q0;
  reg Module2Func_47__ap_start;
  wire Module2Func_48__ap_start_global__q0;
  reg Module2Func_48__ap_start;
  wire Module2Func_49__ap_start_global__q0;
  reg Module2Func_49__ap_start;
  wire Module2Func_50__ap_start_global__q0;
  reg Module2Func_50__ap_start;
  wire Module2Func_51__ap_start_global__q0;
  reg Module2Func_51__ap_start;
  wire Module2Func_52__ap_start_global__q0;
  reg Module2Func_52__ap_start;
  wire Module2Func_53__ap_start_global__q0;
  reg Module2Func_53__ap_start;
  wire Module2Func_54__ap_start_global__q0;
  reg Module2Func_54__ap_start;
  wire Module2Func_55__ap_start_global__q0;
  reg Module2Func_55__ap_start;
  wire Module2Func_56__ap_start_global__q0;
  reg Module2Func_56__ap_start;
  wire Module2Func_57__ap_start_global__q0;
  reg Module2Func_57__ap_start;
  wire Module2Func_58__ap_start_global__q0;
  reg Module2Func_58__ap_start;
  wire Module2Func_59__ap_start_global__q0;
  reg Module2Func_59__ap_start;
  wire Module2Func_60__ap_start_global__q0;
  reg Module2Func_60__ap_start;
  wire Module2Func_61__ap_start_global__q0;
  reg Module2Func_61__ap_start;
  wire Module2Func_62__ap_start_global__q0;
  reg Module2Func_62__ap_start;
  wire Module2Func_63__ap_start_global__q0;
  reg Module2Func_63__ap_start;
  wire Module2Func_64__ap_start_global__q0;
  reg Module2Func_64__ap_start;
  wire Module2Func_65__ap_start_global__q0;
  reg Module2Func_65__ap_start;
  wire Module2Func_66__ap_start_global__q0;
  reg Module2Func_66__ap_start;
  wire Module2Func_67__ap_start_global__q0;
  reg Module2Func_67__ap_start;
  wire Module2Func_68__ap_start_global__q0;
  reg Module2Func_68__ap_start;
  wire Module2Func_69__ap_start_global__q0;
  reg Module2Func_69__ap_start;
  wire Module2Func_70__ap_start_global__q0;
  reg Module2Func_70__ap_start;
  wire Module2Func_71__ap_start_global__q0;
  reg Module2Func_71__ap_start;
  wire Module2Func_72__ap_start_global__q0;
  reg Module2Func_72__ap_start;
  wire Module2Func_73__ap_start_global__q0;
  reg Module2Func_73__ap_start;
  wire Module2Func_74__ap_start_global__q0;
  reg Module2Func_74__ap_start;
  wire Module2Func_75__ap_start_global__q0;
  reg Module2Func_75__ap_start;
  wire Module2Func_76__ap_start_global__q0;
  reg Module2Func_76__ap_start;
  wire Module2Func_77__ap_start_global__q0;
  reg Module2Func_77__ap_start;
  wire Module2Func_78__ap_start_global__q0;
  reg Module2Func_78__ap_start;
  wire Module2Func_79__ap_start_global__q0;
  reg Module2Func_79__ap_start;
  wire Module2Func_80__ap_start_global__q0;
  reg Module2Func_80__ap_start;
  wire Module2Func_81__ap_start_global__q0;
  reg Module2Func_81__ap_start;
  wire Module2Func_82__ap_start_global__q0;
  reg Module2Func_82__ap_start;
  wire Module2Func_83__ap_start_global__q0;
  reg Module2Func_83__ap_start;
  wire Module2Func_84__ap_start_global__q0;
  reg Module2Func_84__ap_start;
  wire Module2Func_85__ap_start_global__q0;
  reg Module2Func_85__ap_start;
  wire Module2Func_86__ap_start_global__q0;
  reg Module2Func_86__ap_start;
  wire Module2Func_87__ap_start_global__q0;
  reg Module2Func_87__ap_start;
  wire Module2Func_88__ap_start_global__q0;
  reg Module2Func_88__ap_start;
  wire Module2Func_89__ap_start_global__q0;
  reg Module2Func_89__ap_start;
  wire Module2Func_90__ap_start_global__q0;
  reg Module2Func_90__ap_start;
  wire Module2Func_91__ap_start_global__q0;
  reg Module2Func_91__ap_start;
  wire Module2Func_92__ap_start_global__q0;
  reg Module2Func_92__ap_start;
  wire Module2Func_93__ap_start_global__q0;
  reg Module2Func_93__ap_start;
  wire Module2Func_94__ap_start_global__q0;
  reg Module2Func_94__ap_start;
  wire Module2Func_95__ap_start_global__q0;
  reg Module2Func_95__ap_start;
  wire Module2Func_96__ap_start_global__q0;
  reg Module2Func_96__ap_start;
  wire Module2Func_97__ap_start_global__q0;
  reg Module2Func_97__ap_start;
  wire Module2Func_98__ap_start_global__q0;
  reg Module2Func_98__ap_start;
  wire Module2Func_99__ap_start_global__q0;
  reg Module2Func_99__ap_start;
  wire Module2Func_100__ap_start_global__q0;
  reg Module2Func_100__ap_start;
  wire Module2Func_101__ap_start_global__q0;
  reg Module2Func_101__ap_start;
  wire Module2Func_102__ap_start_global__q0;
  reg Module2Func_102__ap_start;
  wire Module2Func_103__ap_start_global__q0;
  reg Module2Func_103__ap_start;
  wire Module2Func_104__ap_start_global__q0;
  reg Module2Func_104__ap_start;
  wire Module2Func_105__ap_start_global__q0;
  reg Module2Func_105__ap_start;
  wire Module2Func_106__ap_start_global__q0;
  reg Module2Func_106__ap_start;
  wire Module2Func_107__ap_start_global__q0;
  reg Module2Func_107__ap_start;
  wire Module3Func_0__ap_start_global__q0;
  reg Module3Func_0__ap_start;
  reg [1:0] tapa_state;
  reg [0:0] countdown;
  wire ap_start__q0;
  wire ap_done__q0;
  assign BurstRead_floatx16_0___bank_0_t1__q0 = bank_0_t1;
  assign BurstRead_floatx16_0___coalesced_data_num__q0 = coalesced_data_num;
  assign BurstRead_floatx16_0__ap_start_global__q0 = ap_start__q0;
  assign BurstRead_floatx16_0__is_done__q0 = (BurstRead_floatx16_0__state == 2'b10);
  assign BurstRead_floatx16_0__ap_done_global__q0 = ap_done__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      BurstRead_floatx16_0__state <= 2'b00;
    end else begin
      if(BurstRead_floatx16_0__state == 2'b00) begin
        if(BurstRead_floatx16_0__ap_start_global__q0) begin
          BurstRead_floatx16_0__state <= 2'b01;
        end 
      end 
      if(BurstRead_floatx16_0__state == 2'b01) begin
        if(BurstRead_floatx16_0__ap_ready) begin
          if(BurstRead_floatx16_0__ap_done) begin
            BurstRead_floatx16_0__state <= 2'b10;
          end else begin
            BurstRead_floatx16_0__state <= 2'b11;
          end
        end 
      end 
      if(BurstRead_floatx16_0__state == 2'b11) begin
        if(BurstRead_floatx16_0__ap_done) begin
          BurstRead_floatx16_0__state <= 2'b10;
        end 
      end 
      if(BurstRead_floatx16_0__state == 2'b10) begin
        if(BurstRead_floatx16_0__ap_done_global__q0) begin
          BurstRead_floatx16_0__state <= 2'b00;
        end 
      end 
    end
  end
  assign BurstRead_floatx16_0__ap_start = (BurstRead_floatx16_0__state == 2'b01);
  assign BurstWrite_floatx16_0___bank_1_t0__q0 = bank_1_t0;
  assign BurstWrite_floatx16_0___coalesced_data_num__q0 = coalesced_data_num;
  assign BurstWrite_floatx16_0__ap_start_global__q0 = ap_start__q0;
  assign BurstWrite_floatx16_0__is_done__q0 = (BurstWrite_floatx16_0__state == 2'b10);
  assign BurstWrite_floatx16_0__ap_done_global__q0 = ap_done__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      BurstWrite_floatx16_0__state <= 2'b00;
    end else begin
      if(BurstWrite_floatx16_0__state == 2'b00) begin
        if(BurstWrite_floatx16_0__ap_start_global__q0) begin
          BurstWrite_floatx16_0__state <= 2'b01;
        end 
      end 
      if(BurstWrite_floatx16_0__state == 2'b01) begin
        if(BurstWrite_floatx16_0__ap_ready) begin
          if(BurstWrite_floatx16_0__ap_done) begin
            BurstWrite_floatx16_0__state <= 2'b10;
          end else begin
            BurstWrite_floatx16_0__state <= 2'b11;
          end
        end 
      end 
      if(BurstWrite_floatx16_0__state == 2'b11) begin
        if(BurstWrite_floatx16_0__ap_done) begin
          BurstWrite_floatx16_0__state <= 2'b10;
        end 
      end 
      if(BurstWrite_floatx16_0__state == 2'b10) begin
        if(BurstWrite_floatx16_0__ap_done_global__q0) begin
          BurstWrite_floatx16_0__state <= 2'b00;
        end 
      end 
    end
  end
  assign BurstWrite_floatx16_0__ap_start = (BurstWrite_floatx16_0__state == 2'b01);
  assign Module0Func_0__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module0Func_0__ap_start <= 1'b0;
    end else if(Module0Func_0__ap_start_global__q0) begin
      Module0Func_0__ap_start <= 1'b1;
    end 
  end
  assign Module1Func_0__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module1Func_0__ap_start <= 1'b0;
    end else if(Module1Func_0__ap_start_global__q0) begin
      Module1Func_0__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_0__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_0__ap_start <= 1'b0;
    end else if(Module2Func_0__ap_start_global__q0) begin
      Module2Func_0__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_1__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_1__ap_start <= 1'b0;
    end else if(Module2Func_1__ap_start_global__q0) begin
      Module2Func_1__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_2__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_2__ap_start <= 1'b0;
    end else if(Module2Func_2__ap_start_global__q0) begin
      Module2Func_2__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_3__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_3__ap_start <= 1'b0;
    end else if(Module2Func_3__ap_start_global__q0) begin
      Module2Func_3__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_4__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_4__ap_start <= 1'b0;
    end else if(Module2Func_4__ap_start_global__q0) begin
      Module2Func_4__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_5__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_5__ap_start <= 1'b0;
    end else if(Module2Func_5__ap_start_global__q0) begin
      Module2Func_5__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_6__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_6__ap_start <= 1'b0;
    end else if(Module2Func_6__ap_start_global__q0) begin
      Module2Func_6__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_7__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_7__ap_start <= 1'b0;
    end else if(Module2Func_7__ap_start_global__q0) begin
      Module2Func_7__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_8__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_8__ap_start <= 1'b0;
    end else if(Module2Func_8__ap_start_global__q0) begin
      Module2Func_8__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_9__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_9__ap_start <= 1'b0;
    end else if(Module2Func_9__ap_start_global__q0) begin
      Module2Func_9__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_10__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_10__ap_start <= 1'b0;
    end else if(Module2Func_10__ap_start_global__q0) begin
      Module2Func_10__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_11__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_11__ap_start <= 1'b0;
    end else if(Module2Func_11__ap_start_global__q0) begin
      Module2Func_11__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_12__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_12__ap_start <= 1'b0;
    end else if(Module2Func_12__ap_start_global__q0) begin
      Module2Func_12__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_13__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_13__ap_start <= 1'b0;
    end else if(Module2Func_13__ap_start_global__q0) begin
      Module2Func_13__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_14__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_14__ap_start <= 1'b0;
    end else if(Module2Func_14__ap_start_global__q0) begin
      Module2Func_14__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_15__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_15__ap_start <= 1'b0;
    end else if(Module2Func_15__ap_start_global__q0) begin
      Module2Func_15__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_16__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_16__ap_start <= 1'b0;
    end else if(Module2Func_16__ap_start_global__q0) begin
      Module2Func_16__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_17__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_17__ap_start <= 1'b0;
    end else if(Module2Func_17__ap_start_global__q0) begin
      Module2Func_17__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_18__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_18__ap_start <= 1'b0;
    end else if(Module2Func_18__ap_start_global__q0) begin
      Module2Func_18__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_19__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_19__ap_start <= 1'b0;
    end else if(Module2Func_19__ap_start_global__q0) begin
      Module2Func_19__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_20__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_20__ap_start <= 1'b0;
    end else if(Module2Func_20__ap_start_global__q0) begin
      Module2Func_20__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_21__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_21__ap_start <= 1'b0;
    end else if(Module2Func_21__ap_start_global__q0) begin
      Module2Func_21__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_22__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_22__ap_start <= 1'b0;
    end else if(Module2Func_22__ap_start_global__q0) begin
      Module2Func_22__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_23__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_23__ap_start <= 1'b0;
    end else if(Module2Func_23__ap_start_global__q0) begin
      Module2Func_23__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_24__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_24__ap_start <= 1'b0;
    end else if(Module2Func_24__ap_start_global__q0) begin
      Module2Func_24__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_25__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_25__ap_start <= 1'b0;
    end else if(Module2Func_25__ap_start_global__q0) begin
      Module2Func_25__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_26__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_26__ap_start <= 1'b0;
    end else if(Module2Func_26__ap_start_global__q0) begin
      Module2Func_26__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_27__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_27__ap_start <= 1'b0;
    end else if(Module2Func_27__ap_start_global__q0) begin
      Module2Func_27__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_28__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_28__ap_start <= 1'b0;
    end else if(Module2Func_28__ap_start_global__q0) begin
      Module2Func_28__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_29__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_29__ap_start <= 1'b0;
    end else if(Module2Func_29__ap_start_global__q0) begin
      Module2Func_29__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_30__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_30__ap_start <= 1'b0;
    end else if(Module2Func_30__ap_start_global__q0) begin
      Module2Func_30__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_31__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_31__ap_start <= 1'b0;
    end else if(Module2Func_31__ap_start_global__q0) begin
      Module2Func_31__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_32__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_32__ap_start <= 1'b0;
    end else if(Module2Func_32__ap_start_global__q0) begin
      Module2Func_32__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_33__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_33__ap_start <= 1'b0;
    end else if(Module2Func_33__ap_start_global__q0) begin
      Module2Func_33__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_34__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_34__ap_start <= 1'b0;
    end else if(Module2Func_34__ap_start_global__q0) begin
      Module2Func_34__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_35__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_35__ap_start <= 1'b0;
    end else if(Module2Func_35__ap_start_global__q0) begin
      Module2Func_35__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_36__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_36__ap_start <= 1'b0;
    end else if(Module2Func_36__ap_start_global__q0) begin
      Module2Func_36__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_37__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_37__ap_start <= 1'b0;
    end else if(Module2Func_37__ap_start_global__q0) begin
      Module2Func_37__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_38__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_38__ap_start <= 1'b0;
    end else if(Module2Func_38__ap_start_global__q0) begin
      Module2Func_38__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_39__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_39__ap_start <= 1'b0;
    end else if(Module2Func_39__ap_start_global__q0) begin
      Module2Func_39__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_40__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_40__ap_start <= 1'b0;
    end else if(Module2Func_40__ap_start_global__q0) begin
      Module2Func_40__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_41__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_41__ap_start <= 1'b0;
    end else if(Module2Func_41__ap_start_global__q0) begin
      Module2Func_41__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_42__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_42__ap_start <= 1'b0;
    end else if(Module2Func_42__ap_start_global__q0) begin
      Module2Func_42__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_43__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_43__ap_start <= 1'b0;
    end else if(Module2Func_43__ap_start_global__q0) begin
      Module2Func_43__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_44__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_44__ap_start <= 1'b0;
    end else if(Module2Func_44__ap_start_global__q0) begin
      Module2Func_44__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_45__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_45__ap_start <= 1'b0;
    end else if(Module2Func_45__ap_start_global__q0) begin
      Module2Func_45__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_46__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_46__ap_start <= 1'b0;
    end else if(Module2Func_46__ap_start_global__q0) begin
      Module2Func_46__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_47__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_47__ap_start <= 1'b0;
    end else if(Module2Func_47__ap_start_global__q0) begin
      Module2Func_47__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_48__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_48__ap_start <= 1'b0;
    end else if(Module2Func_48__ap_start_global__q0) begin
      Module2Func_48__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_49__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_49__ap_start <= 1'b0;
    end else if(Module2Func_49__ap_start_global__q0) begin
      Module2Func_49__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_50__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_50__ap_start <= 1'b0;
    end else if(Module2Func_50__ap_start_global__q0) begin
      Module2Func_50__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_51__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_51__ap_start <= 1'b0;
    end else if(Module2Func_51__ap_start_global__q0) begin
      Module2Func_51__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_52__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_52__ap_start <= 1'b0;
    end else if(Module2Func_52__ap_start_global__q0) begin
      Module2Func_52__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_53__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_53__ap_start <= 1'b0;
    end else if(Module2Func_53__ap_start_global__q0) begin
      Module2Func_53__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_54__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_54__ap_start <= 1'b0;
    end else if(Module2Func_54__ap_start_global__q0) begin
      Module2Func_54__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_55__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_55__ap_start <= 1'b0;
    end else if(Module2Func_55__ap_start_global__q0) begin
      Module2Func_55__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_56__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_56__ap_start <= 1'b0;
    end else if(Module2Func_56__ap_start_global__q0) begin
      Module2Func_56__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_57__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_57__ap_start <= 1'b0;
    end else if(Module2Func_57__ap_start_global__q0) begin
      Module2Func_57__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_58__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_58__ap_start <= 1'b0;
    end else if(Module2Func_58__ap_start_global__q0) begin
      Module2Func_58__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_59__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_59__ap_start <= 1'b0;
    end else if(Module2Func_59__ap_start_global__q0) begin
      Module2Func_59__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_60__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_60__ap_start <= 1'b0;
    end else if(Module2Func_60__ap_start_global__q0) begin
      Module2Func_60__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_61__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_61__ap_start <= 1'b0;
    end else if(Module2Func_61__ap_start_global__q0) begin
      Module2Func_61__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_62__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_62__ap_start <= 1'b0;
    end else if(Module2Func_62__ap_start_global__q0) begin
      Module2Func_62__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_63__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_63__ap_start <= 1'b0;
    end else if(Module2Func_63__ap_start_global__q0) begin
      Module2Func_63__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_64__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_64__ap_start <= 1'b0;
    end else if(Module2Func_64__ap_start_global__q0) begin
      Module2Func_64__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_65__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_65__ap_start <= 1'b0;
    end else if(Module2Func_65__ap_start_global__q0) begin
      Module2Func_65__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_66__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_66__ap_start <= 1'b0;
    end else if(Module2Func_66__ap_start_global__q0) begin
      Module2Func_66__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_67__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_67__ap_start <= 1'b0;
    end else if(Module2Func_67__ap_start_global__q0) begin
      Module2Func_67__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_68__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_68__ap_start <= 1'b0;
    end else if(Module2Func_68__ap_start_global__q0) begin
      Module2Func_68__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_69__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_69__ap_start <= 1'b0;
    end else if(Module2Func_69__ap_start_global__q0) begin
      Module2Func_69__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_70__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_70__ap_start <= 1'b0;
    end else if(Module2Func_70__ap_start_global__q0) begin
      Module2Func_70__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_71__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_71__ap_start <= 1'b0;
    end else if(Module2Func_71__ap_start_global__q0) begin
      Module2Func_71__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_72__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_72__ap_start <= 1'b0;
    end else if(Module2Func_72__ap_start_global__q0) begin
      Module2Func_72__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_73__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_73__ap_start <= 1'b0;
    end else if(Module2Func_73__ap_start_global__q0) begin
      Module2Func_73__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_74__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_74__ap_start <= 1'b0;
    end else if(Module2Func_74__ap_start_global__q0) begin
      Module2Func_74__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_75__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_75__ap_start <= 1'b0;
    end else if(Module2Func_75__ap_start_global__q0) begin
      Module2Func_75__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_76__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_76__ap_start <= 1'b0;
    end else if(Module2Func_76__ap_start_global__q0) begin
      Module2Func_76__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_77__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_77__ap_start <= 1'b0;
    end else if(Module2Func_77__ap_start_global__q0) begin
      Module2Func_77__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_78__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_78__ap_start <= 1'b0;
    end else if(Module2Func_78__ap_start_global__q0) begin
      Module2Func_78__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_79__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_79__ap_start <= 1'b0;
    end else if(Module2Func_79__ap_start_global__q0) begin
      Module2Func_79__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_80__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_80__ap_start <= 1'b0;
    end else if(Module2Func_80__ap_start_global__q0) begin
      Module2Func_80__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_81__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_81__ap_start <= 1'b0;
    end else if(Module2Func_81__ap_start_global__q0) begin
      Module2Func_81__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_82__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_82__ap_start <= 1'b0;
    end else if(Module2Func_82__ap_start_global__q0) begin
      Module2Func_82__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_83__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_83__ap_start <= 1'b0;
    end else if(Module2Func_83__ap_start_global__q0) begin
      Module2Func_83__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_84__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_84__ap_start <= 1'b0;
    end else if(Module2Func_84__ap_start_global__q0) begin
      Module2Func_84__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_85__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_85__ap_start <= 1'b0;
    end else if(Module2Func_85__ap_start_global__q0) begin
      Module2Func_85__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_86__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_86__ap_start <= 1'b0;
    end else if(Module2Func_86__ap_start_global__q0) begin
      Module2Func_86__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_87__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_87__ap_start <= 1'b0;
    end else if(Module2Func_87__ap_start_global__q0) begin
      Module2Func_87__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_88__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_88__ap_start <= 1'b0;
    end else if(Module2Func_88__ap_start_global__q0) begin
      Module2Func_88__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_89__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_89__ap_start <= 1'b0;
    end else if(Module2Func_89__ap_start_global__q0) begin
      Module2Func_89__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_90__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_90__ap_start <= 1'b0;
    end else if(Module2Func_90__ap_start_global__q0) begin
      Module2Func_90__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_91__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_91__ap_start <= 1'b0;
    end else if(Module2Func_91__ap_start_global__q0) begin
      Module2Func_91__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_92__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_92__ap_start <= 1'b0;
    end else if(Module2Func_92__ap_start_global__q0) begin
      Module2Func_92__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_93__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_93__ap_start <= 1'b0;
    end else if(Module2Func_93__ap_start_global__q0) begin
      Module2Func_93__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_94__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_94__ap_start <= 1'b0;
    end else if(Module2Func_94__ap_start_global__q0) begin
      Module2Func_94__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_95__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_95__ap_start <= 1'b0;
    end else if(Module2Func_95__ap_start_global__q0) begin
      Module2Func_95__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_96__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_96__ap_start <= 1'b0;
    end else if(Module2Func_96__ap_start_global__q0) begin
      Module2Func_96__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_97__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_97__ap_start <= 1'b0;
    end else if(Module2Func_97__ap_start_global__q0) begin
      Module2Func_97__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_98__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_98__ap_start <= 1'b0;
    end else if(Module2Func_98__ap_start_global__q0) begin
      Module2Func_98__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_99__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_99__ap_start <= 1'b0;
    end else if(Module2Func_99__ap_start_global__q0) begin
      Module2Func_99__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_100__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_100__ap_start <= 1'b0;
    end else if(Module2Func_100__ap_start_global__q0) begin
      Module2Func_100__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_101__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_101__ap_start <= 1'b0;
    end else if(Module2Func_101__ap_start_global__q0) begin
      Module2Func_101__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_102__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_102__ap_start <= 1'b0;
    end else if(Module2Func_102__ap_start_global__q0) begin
      Module2Func_102__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_103__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_103__ap_start <= 1'b0;
    end else if(Module2Func_103__ap_start_global__q0) begin
      Module2Func_103__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_104__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_104__ap_start <= 1'b0;
    end else if(Module2Func_104__ap_start_global__q0) begin
      Module2Func_104__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_105__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_105__ap_start <= 1'b0;
    end else if(Module2Func_105__ap_start_global__q0) begin
      Module2Func_105__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_106__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_106__ap_start <= 1'b0;
    end else if(Module2Func_106__ap_start_global__q0) begin
      Module2Func_106__ap_start <= 1'b1;
    end 
  end
  assign Module2Func_107__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module2Func_107__ap_start <= 1'b0;
    end else if(Module2Func_107__ap_start_global__q0) begin
      Module2Func_107__ap_start <= 1'b1;
    end 
  end
  assign Module3Func_0__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      Module3Func_0__ap_start <= 1'b0;
    end else if(Module3Func_0__ap_start_global__q0) begin
      Module3Func_0__ap_start <= 1'b1;
    end 
  end
  always @(posedge ap_clk) begin
    if(~ap_rst_n) begin
      tapa_state <= 2'b00;
    end else begin
      case(tapa_state)
        2'b00: begin
          if(ap_start__q0) begin
            tapa_state <= 2'b01;
          end 
        end
        2'b01: begin
          if(BurstRead_floatx16_0__is_done__q0 && BurstWrite_floatx16_0__is_done__q0) begin
            tapa_state <= 2'b10;
          end 
        end
        2'b10: begin
          tapa_state <= 2'b00;
          countdown <= 1'd0;
        end
        2'b11: begin
          if(countdown == 1'd0) begin
            tapa_state <= 2'b00;
          end else begin
            countdown <= (countdown - 1'd1);
          end
        end
      endcase
    end
  end
  assign ap_idle = (tapa_state == 2'b00);
  assign ap_done = ap_done__q0;
  assign ap_ready = ap_done__q0;
  assign ap_start__q0 = ap_start;
  assign ap_done__q0 = (tapa_state == 2'b10);
endmodule