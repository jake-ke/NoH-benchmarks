// this file can be generated from the following SODA DSL
/*
kernel: jacobi3d
burst width: 512
iterate: 109
unroll factor: 16
input dram 0 float: t1(32, 32, *)
output dram 1 float: t0(0, 0, 0) = (t1(0, 0, 0) + t1(1, 0, 0) + t1(-1, 0, 0) + t1(0, 1, 0) + t1(0, -1, 0) + t1(0, 0, 1) + t1(0, 0, -1)) * 0.142857142f
border: ignore
cluster: coarse
*/

// stencil window size: (219, 219, 219)
// stencil distace: 226829
// data layout is documented at
// https://github.com/Blaok/soda/blob/master/docs/data-layout.md

#include <cfloat>
#include <cmath>
#include <cstdbool>
#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <cstring>

#include <algorithm>
#include <tuple>

#include <ap_int.h>
#include <tapa.h>

struct __attribute__((packed)) haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float {
  float val_0;
  float val_1;
  float val_2;
  float val_3;
  float val_4;
  float val_5;
  float val_6;
  float val_7;
  float val_8;
  float val_9;
  float val_10;
  float val_11;
  float val_12;
  float val_13;
  float val_14;
  float val_15;
};
void BurstRead_floatx16(
  tapa::ostream<tapa::vec_t<float, 16>>& dest,
  tapa::async_mmap<tapa::vec_t<float, 16>>& src,
  uint64_t n)
{
load:
  for (uint64_t i_req = 0, i_resp = 0; i_resp < n; ) {
#pragma HLS pipeline II = 1
    if (i_req < n && src.read_addr.try_write(i_req)) {
      ++i_req;
    }
    if (!dest.full() && !src.read_data.empty()) {
      dest.try_write(src.read_data.read(nullptr));
      ++i_resp;
    }
  }
}

void BurstWrite_floatx16(
  tapa::async_mmap<tapa::vec_t<float, 16>>& dest,
  tapa::istream<tapa::vec_t<float, 16>>& src,
  uint64_t n)
{
store:
  for (uint64_t i_req = 0, i_resp = 0; i_resp < n; ) {
#pragma HLS pipeline II = 1
    if (i_req < n && !src.empty() && !dest.write_addr.full() && !dest.write_data.full()) {
      dest.write_addr.try_write(i_req);
      dest.write_data.try_write(src.read(nullptr));
      ++i_req;
    }
    if (!dest.write_resp.empty()) {
      ap_uint<9> resp = dest.write_resp.read(nullptr);
      i_resp += ++resp;
    }
  }
}

void Module0Func(
  tapa::ostream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float>& fifo_st_0, 
  tapa::istream<tapa::vec_t<float, 16>>& dram_t1_bank_0_fifo)
{
#ifdef __VITIS_HLS__
#endif  // __VITIS_HLS__
module_0:
  for (;;)
  {
#pragma HLS pipeline II = 1
    if (!dram_t1_bank_0_fifo.empty())
    {
      tapa::vec_t<float, 16> dram_t1_bank_0_buf;
      dram_t1_bank_0_buf = dram_t1_bank_0_fifo.read(nullptr);
      fifo_st_0.write({dram_t1_bank_0_buf[15], dram_t1_bank_0_buf[14], dram_t1_bank_0_buf[13], dram_t1_bank_0_buf[12], dram_t1_bank_0_buf[11], dram_t1_bank_0_buf[10], dram_t1_bank_0_buf[9], dram_t1_bank_0_buf[8], dram_t1_bank_0_buf[7], dram_t1_bank_0_buf[6], dram_t1_bank_0_buf[5], dram_t1_bank_0_buf[4], dram_t1_bank_0_buf[3], dram_t1_bank_0_buf[2], dram_t1_bank_0_buf[1], dram_t1_bank_0_buf[0]});
    } // if not empty
  } // for module_0
} // Module0Func

void Module1Func(
  tapa::ostream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float>& fifo_st_0, 
  tapa::istream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float>& fifo_ld_0)
{
  ap_uint<6> ptr_delay_62 = 0;
  ap_uint<1> ptr_delay_2 = 0;
  ap_uint<1> ptr_delay_1 = 0;
  float let_0_delayed_62_buf[62];
  float let_2_delayed_62_buf[62];
  float let_4_delayed_62_buf[62];
  float let_6_delayed_62_buf[62];
  float let_8_delayed_62_buf[62];
  float let_10_delayed_62_buf[62];
  float let_12_delayed_62_buf[62];
  float let_14_delayed_62_buf[62];
  float let_16_delayed_62_buf[62];
  float let_18_delayed_62_buf[62];
  float let_20_delayed_62_buf[62];
  float let_22_delayed_62_buf[62];
  float let_24_delayed_62_buf[62];
  float let_26_delayed_62_buf[62];
  float let_28_delayed_62_buf[62];
  float let_30_delayed_62_buf[62];
  float let_33_delayed_2_buf[2];
  float let_36_delayed_2_buf[2];
  float let_39_delayed_2_buf[2];
  float let_42_delayed_2_buf[2];
  float let_45_delayed_2_buf[2];
  float let_48_delayed_2_buf[2];
  float let_51_delayed_2_buf[2];
  float let_54_delayed_2_buf[2];
  float let_57_delayed_2_buf[2];
  float let_60_delayed_2_buf[2];
  float let_63_delayed_2_buf[2];
  float let_66_delayed_2_buf[2];
  float let_69_delayed_2_buf[2];
  float let_72_delayed_2_buf[2];
  float let_75_delayed_2_buf[2];
  float let_78_delayed_1_buf[1];
  float let_81_delayed_1_buf[1];
  float let_85_delayed_2_buf[2];
  float let_90_delayed_2_buf[2];
  float let_95_delayed_2_buf[2];
  float let_100_delayed_2_buf[2];
  float let_105_delayed_2_buf[2];
  float let_110_delayed_2_buf[2];
  float let_115_delayed_2_buf[2];
  float let_120_delayed_2_buf[2];
  float let_125_delayed_2_buf[2];
  float let_130_delayed_2_buf[2];
  float let_135_delayed_2_buf[2];
  float let_140_delayed_2_buf[2];
  float let_145_delayed_2_buf[2];
  float let_150_delayed_2_buf[2];
  float let_155_delayed_1_buf[1];
  float let_158_delayed_1_buf[1];
  float let_161_delayed_62_buf[62];
  float let_164_delayed_62_buf[62];
  float let_167_delayed_62_buf[62];
  float let_170_delayed_62_buf[62];
  float let_173_delayed_62_buf[62];
  float let_176_delayed_62_buf[62];
  float let_179_delayed_62_buf[62];
  float let_182_delayed_62_buf[62];
  float let_185_delayed_62_buf[62];
  float let_188_delayed_62_buf[62];
  float let_191_delayed_62_buf[62];
  float let_194_delayed_62_buf[62];
  float let_197_delayed_62_buf[62];
  float let_200_delayed_62_buf[62];
  float let_203_delayed_2_buf[2];
  float let_207_delayed_62_buf[62];
  float let_238_delayed_62_buf[62];
#ifdef __VITIS_HLS__
#pragma HLS bind_storage variable = let_0_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_2_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_4_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_6_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_8_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_10_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_12_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_14_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_16_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_18_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_20_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_22_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_24_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_26_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_28_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_30_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_33_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_36_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_39_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_42_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_45_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_48_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_51_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_54_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_57_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_60_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_63_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_66_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_69_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_72_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_75_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_78_delayed_1_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_81_delayed_1_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_85_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_90_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_95_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_100_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_105_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_110_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_115_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_120_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_125_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_130_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_135_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_140_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_145_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_150_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_155_delayed_1_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_158_delayed_1_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_161_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_164_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_167_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_170_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_173_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_176_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_179_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_182_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_185_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_188_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_191_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_194_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_197_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_200_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_203_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_207_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_238_delayed_62_buf type = ram_s2p latency = 3
#endif  // __VITIS_HLS__
module_1:
  for (;;)
  {
#pragma HLS pipeline II = 1
#pragma HLS dependence inter true variable = let_0_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_2_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_4_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_6_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_8_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_10_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_12_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_14_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_16_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_18_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_20_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_22_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_24_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_26_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_28_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_30_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_33_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_36_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_39_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_42_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_45_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_48_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_51_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_54_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_57_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_60_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_63_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_66_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_69_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_72_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_75_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_78_delayed_1_buf distance = 1
#pragma HLS dependence inter true variable = let_81_delayed_1_buf distance = 1
#pragma HLS dependence inter true variable = let_85_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_90_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_95_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_100_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_105_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_110_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_115_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_120_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_125_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_130_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_135_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_140_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_145_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_150_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_155_delayed_1_buf distance = 1
#pragma HLS dependence inter true variable = let_158_delayed_1_buf distance = 1
#pragma HLS dependence inter true variable = let_161_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_164_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_167_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_170_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_173_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_176_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_179_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_182_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_185_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_188_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_191_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_194_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_197_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_200_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_203_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_207_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_238_delayed_62_buf distance = 62
    if (!fifo_ld_0.empty())
    {
      haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float fifo_ref_0;
      fifo_ref_0 = fifo_ld_0.read(nullptr);
      const float let_0_delayed_62 = let_0_delayed_62_buf[ptr_delay_62];;
      const float let_2_delayed_62 = let_2_delayed_62_buf[ptr_delay_62];;
      const float let_4_delayed_62 = let_4_delayed_62_buf[ptr_delay_62];;
      const float let_6_delayed_62 = let_6_delayed_62_buf[ptr_delay_62];;
      const float let_8_delayed_62 = let_8_delayed_62_buf[ptr_delay_62];;
      const float let_10_delayed_62 = let_10_delayed_62_buf[ptr_delay_62];;
      const float let_12_delayed_62 = let_12_delayed_62_buf[ptr_delay_62];;
      const float let_14_delayed_62 = let_14_delayed_62_buf[ptr_delay_62];;
      const float let_16_delayed_62 = let_16_delayed_62_buf[ptr_delay_62];;
      const float let_18_delayed_62 = let_18_delayed_62_buf[ptr_delay_62];;
      const float let_20_delayed_62 = let_20_delayed_62_buf[ptr_delay_62];;
      const float let_22_delayed_62 = let_22_delayed_62_buf[ptr_delay_62];;
      const float let_24_delayed_62 = let_24_delayed_62_buf[ptr_delay_62];;
      const float let_26_delayed_62 = let_26_delayed_62_buf[ptr_delay_62];;
      const float let_28_delayed_62 = let_28_delayed_62_buf[ptr_delay_62];;
      const float let_30_delayed_62 = let_30_delayed_62_buf[ptr_delay_62];;
      const float let_33_delayed_2 = let_33_delayed_2_buf[ptr_delay_2];;
      const float let_36_delayed_2 = let_36_delayed_2_buf[ptr_delay_2];;
      const float let_39_delayed_2 = let_39_delayed_2_buf[ptr_delay_2];;
      const float let_42_delayed_2 = let_42_delayed_2_buf[ptr_delay_2];;
      const float let_45_delayed_2 = let_45_delayed_2_buf[ptr_delay_2];;
      const float let_48_delayed_2 = let_48_delayed_2_buf[ptr_delay_2];;
      const float let_51_delayed_2 = let_51_delayed_2_buf[ptr_delay_2];;
      const float let_54_delayed_2 = let_54_delayed_2_buf[ptr_delay_2];;
      const float let_57_delayed_2 = let_57_delayed_2_buf[ptr_delay_2];;
      const float let_60_delayed_2 = let_60_delayed_2_buf[ptr_delay_2];;
      const float let_63_delayed_2 = let_63_delayed_2_buf[ptr_delay_2];;
      const float let_66_delayed_2 = let_66_delayed_2_buf[ptr_delay_2];;
      const float let_69_delayed_2 = let_69_delayed_2_buf[ptr_delay_2];;
      const float let_72_delayed_2 = let_72_delayed_2_buf[ptr_delay_2];;
      const float let_75_delayed_2 = let_75_delayed_2_buf[ptr_delay_2];;
      const float let_78_delayed_1 = let_78_delayed_1_buf[ptr_delay_1];;
      const float let_81_delayed_1 = let_81_delayed_1_buf[ptr_delay_1];;
      const float let_85_delayed_2 = let_85_delayed_2_buf[ptr_delay_2];;
      const float let_90_delayed_2 = let_90_delayed_2_buf[ptr_delay_2];;
      const float let_95_delayed_2 = let_95_delayed_2_buf[ptr_delay_2];;
      const float let_100_delayed_2 = let_100_delayed_2_buf[ptr_delay_2];;
      const float let_105_delayed_2 = let_105_delayed_2_buf[ptr_delay_2];;
      const float let_110_delayed_2 = let_110_delayed_2_buf[ptr_delay_2];;
      const float let_115_delayed_2 = let_115_delayed_2_buf[ptr_delay_2];;
      const float let_120_delayed_2 = let_120_delayed_2_buf[ptr_delay_2];;
      const float let_125_delayed_2 = let_125_delayed_2_buf[ptr_delay_2];;
      const float let_130_delayed_2 = let_130_delayed_2_buf[ptr_delay_2];;
      const float let_135_delayed_2 = let_135_delayed_2_buf[ptr_delay_2];;
      const float let_140_delayed_2 = let_140_delayed_2_buf[ptr_delay_2];;
      const float let_145_delayed_2 = let_145_delayed_2_buf[ptr_delay_2];;
      const float let_150_delayed_2 = let_150_delayed_2_buf[ptr_delay_2];;
      const float let_155_delayed_1 = let_155_delayed_1_buf[ptr_delay_1];;
      const float let_158_delayed_1 = let_158_delayed_1_buf[ptr_delay_1];;
      const float let_161_delayed_62 = let_161_delayed_62_buf[ptr_delay_62];;
      const float let_164_delayed_62 = let_164_delayed_62_buf[ptr_delay_62];;
      const float let_167_delayed_62 = let_167_delayed_62_buf[ptr_delay_62];;
      const float let_170_delayed_62 = let_170_delayed_62_buf[ptr_delay_62];;
      const float let_173_delayed_62 = let_173_delayed_62_buf[ptr_delay_62];;
      const float let_176_delayed_62 = let_176_delayed_62_buf[ptr_delay_62];;
      const float let_179_delayed_62 = let_179_delayed_62_buf[ptr_delay_62];;
      const float let_182_delayed_62 = let_182_delayed_62_buf[ptr_delay_62];;
      const float let_185_delayed_62 = let_185_delayed_62_buf[ptr_delay_62];;
      const float let_188_delayed_62 = let_188_delayed_62_buf[ptr_delay_62];;
      const float let_191_delayed_62 = let_191_delayed_62_buf[ptr_delay_62];;
      const float let_194_delayed_62 = let_194_delayed_62_buf[ptr_delay_62];;
      const float let_197_delayed_62 = let_197_delayed_62_buf[ptr_delay_62];;
      const float let_200_delayed_62 = let_200_delayed_62_buf[ptr_delay_62];;
      const float let_203_delayed_2 = let_203_delayed_2_buf[ptr_delay_2];;
      const float let_207_delayed_62 = let_207_delayed_62_buf[ptr_delay_62];;
      const float let_238_delayed_62 = let_238_delayed_62_buf[ptr_delay_62];;
      const float let_0 = fifo_ref_0.val_0;
      const float let_1 = fifo_ref_0.val_0;
      const float let_2 = fifo_ref_0.val_1;
      const float let_3 = fifo_ref_0.val_1;
      const float let_4 = fifo_ref_0.val_2;
      const float let_5 = fifo_ref_0.val_2;
      const float let_6 = fifo_ref_0.val_3;
      const float let_7 = fifo_ref_0.val_3;
      const float let_8 = fifo_ref_0.val_4;
      const float let_9 = fifo_ref_0.val_4;
      const float let_10 = fifo_ref_0.val_5;
      const float let_11 = fifo_ref_0.val_5;
      const float let_12 = fifo_ref_0.val_6;
      const float let_13 = fifo_ref_0.val_6;
      const float let_14 = fifo_ref_0.val_7;
      const float let_15 = fifo_ref_0.val_7;
      const float let_16 = fifo_ref_0.val_8;
      const float let_17 = fifo_ref_0.val_8;
      const float let_18 = fifo_ref_0.val_9;
      const float let_19 = fifo_ref_0.val_9;
      const float let_20 = fifo_ref_0.val_10;
      const float let_21 = fifo_ref_0.val_10;
      const float let_22 = fifo_ref_0.val_11;
      const float let_23 = fifo_ref_0.val_11;
      const float let_24 = fifo_ref_0.val_12;
      const float let_25 = fifo_ref_0.val_12;
      const float let_26 = fifo_ref_0.val_13;
      const float let_27 = fifo_ref_0.val_13;
      const float let_28 = fifo_ref_0.val_14;
      const float let_29 = fifo_ref_0.val_14;
      const float let_30 = fifo_ref_0.val_15;
      const float let_31 = fifo_ref_0.val_15;
      const float let_32 = let_0_delayed_62;
      const float let_33 = let_32;
      const float let_34 = let_32;
      const float let_35 = let_2_delayed_62;
      const float let_36 = let_35;
      const float let_37 = let_35;
      const float let_38 = let_4_delayed_62;
      const float let_39 = let_38;
      const float let_40 = let_38;
      const float let_41 = let_6_delayed_62;
      const float let_42 = let_41;
      const float let_43 = let_41;
      const float let_44 = let_8_delayed_62;
      const float let_45 = let_44;
      const float let_46 = let_44;
      const float let_47 = let_10_delayed_62;
      const float let_48 = let_47;
      const float let_49 = let_47;
      const float let_50 = let_12_delayed_62;
      const float let_51 = let_50;
      const float let_52 = let_50;
      const float let_53 = let_14_delayed_62;
      const float let_54 = let_53;
      const float let_55 = let_53;
      const float let_56 = let_16_delayed_62;
      const float let_57 = let_56;
      const float let_58 = let_56;
      const float let_59 = let_18_delayed_62;
      const float let_60 = let_59;
      const float let_61 = let_59;
      const float let_62 = let_20_delayed_62;
      const float let_63 = let_62;
      const float let_64 = let_62;
      const float let_65 = let_22_delayed_62;
      const float let_66 = let_65;
      const float let_67 = let_65;
      const float let_68 = let_24_delayed_62;
      const float let_69 = let_68;
      const float let_70 = let_68;
      const float let_71 = let_26_delayed_62;
      const float let_72 = let_71;
      const float let_73 = let_71;
      const float let_74 = let_28_delayed_62;
      const float let_75 = let_74;
      const float let_76 = let_74;
      const float let_77 = let_30_delayed_62;
      const float let_78 = let_77;
      const float let_79 = let_77;
      const float let_80 = let_33_delayed_2;
      const float let_81 = let_80;
      const float let_82 = let_80;
      const float let_83 = let_80;
      const float let_84 = let_36_delayed_2;
      const float let_85 = let_84;
      const float let_86 = let_84;
      const float let_87 = let_84;
      const float let_88 = let_84;
      const float let_89 = let_39_delayed_2;
      const float let_90 = let_89;
      const float let_91 = let_89;
      const float let_92 = let_89;
      const float let_93 = let_89;
      const float let_94 = let_42_delayed_2;
      const float let_95 = let_94;
      const float let_96 = let_94;
      const float let_97 = let_94;
      const float let_98 = let_94;
      const float let_99 = let_45_delayed_2;
      const float let_100 = let_99;
      const float let_101 = let_99;
      const float let_102 = let_99;
      const float let_103 = let_99;
      const float let_104 = let_48_delayed_2;
      const float let_105 = let_104;
      const float let_106 = let_104;
      const float let_107 = let_104;
      const float let_108 = let_104;
      const float let_109 = let_51_delayed_2;
      const float let_110 = let_109;
      const float let_111 = let_109;
      const float let_112 = let_109;
      const float let_113 = let_109;
      const float let_114 = let_54_delayed_2;
      const float let_115 = let_114;
      const float let_116 = let_114;
      const float let_117 = let_114;
      const float let_118 = let_114;
      const float let_119 = let_57_delayed_2;
      const float let_120 = let_119;
      const float let_121 = let_119;
      const float let_122 = let_119;
      const float let_123 = let_119;
      const float let_124 = let_60_delayed_2;
      const float let_125 = let_124;
      const float let_126 = let_124;
      const float let_127 = let_124;
      const float let_128 = let_124;
      const float let_129 = let_63_delayed_2;
      const float let_130 = let_129;
      const float let_131 = let_129;
      const float let_132 = let_129;
      const float let_133 = let_129;
      const float let_134 = let_66_delayed_2;
      const float let_135 = let_134;
      const float let_136 = let_134;
      const float let_137 = let_134;
      const float let_138 = let_134;
      const float let_139 = let_69_delayed_2;
      const float let_140 = let_139;
      const float let_141 = let_139;
      const float let_142 = let_139;
      const float let_143 = let_139;
      const float let_144 = let_72_delayed_2;
      const float let_145 = let_144;
      const float let_146 = let_144;
      const float let_147 = let_144;
      const float let_148 = let_144;
      const float let_149 = let_75_delayed_2;
      const float let_150 = let_149;
      const float let_151 = let_149;
      const float let_152 = let_149;
      const float let_153 = let_149;
      const float let_154 = let_78_delayed_1;
      const float let_155 = let_154;
      const float let_156 = let_154;
      const float let_157 = let_81_delayed_1;
      const float let_158 = let_157;
      const float let_159 = let_157;
      const float let_160 = let_85_delayed_2;
      const float let_161 = let_160;
      const float let_162 = let_160;
      const float let_163 = let_90_delayed_2;
      const float let_164 = let_163;
      const float let_165 = let_163;
      const float let_166 = let_95_delayed_2;
      const float let_167 = let_166;
      const float let_168 = let_166;
      const float let_169 = let_100_delayed_2;
      const float let_170 = let_169;
      const float let_171 = let_169;
      const float let_172 = let_105_delayed_2;
      const float let_173 = let_172;
      const float let_174 = let_172;
      const float let_175 = let_110_delayed_2;
      const float let_176 = let_175;
      const float let_177 = let_175;
      const float let_178 = let_115_delayed_2;
      const float let_179 = let_178;
      const float let_180 = let_178;
      const float let_181 = let_120_delayed_2;
      const float let_182 = let_181;
      const float let_183 = let_181;
      const float let_184 = let_125_delayed_2;
      const float let_185 = let_184;
      const float let_186 = let_184;
      const float let_187 = let_130_delayed_2;
      const float let_188 = let_187;
      const float let_189 = let_187;
      const float let_190 = let_135_delayed_2;
      const float let_191 = let_190;
      const float let_192 = let_190;
      const float let_193 = let_140_delayed_2;
      const float let_194 = let_193;
      const float let_195 = let_193;
      const float let_196 = let_145_delayed_2;
      const float let_197 = let_196;
      const float let_198 = let_196;
      const float let_199 = let_150_delayed_2;
      const float let_200 = let_199;
      const float let_201 = let_199;
      const float let_202 = let_155_delayed_1;
      const float let_203 = let_202;
      const float let_204 = let_202;
      const float let_205 = let_202;
      const float let_206 = let_158_delayed_1;
      const float let_207 = let_206;
      const float let_208 = let_206;
      const float let_209 = let_161_delayed_62;
      const float let_210 = let_209;
      const float let_211 = let_164_delayed_62;
      const float let_212 = let_211;
      const float let_213 = let_167_delayed_62;
      const float let_214 = let_213;
      const float let_215 = let_170_delayed_62;
      const float let_216 = let_215;
      const float let_217 = let_173_delayed_62;
      const float let_218 = let_217;
      const float let_219 = let_176_delayed_62;
      const float let_220 = let_219;
      const float let_221 = let_179_delayed_62;
      const float let_222 = let_221;
      const float let_223 = let_182_delayed_62;
      const float let_224 = let_223;
      const float let_225 = let_185_delayed_62;
      const float let_226 = let_225;
      const float let_227 = let_188_delayed_62;
      const float let_228 = let_227;
      const float let_229 = let_191_delayed_62;
      const float let_230 = let_229;
      const float let_231 = let_194_delayed_62;
      const float let_232 = let_231;
      const float let_233 = let_197_delayed_62;
      const float let_234 = let_233;
      const float let_235 = let_200_delayed_62;
      const float let_236 = let_235;
      const float let_237 = let_203_delayed_2;
      const float let_238 = let_237;
      const float let_239 = let_237;
      const float let_240 = let_207_delayed_62;
      const float let_241 = let_240;
      const float let_242 = let_238_delayed_62;
      const float let_243 = let_242;
      fifo_st_0.write({(float)((let_87 + let_83 + let_91 + let_37 + let_162 + let_3 + let_210) * 0.142857142f), (float)((let_92 + let_88 + let_96 + let_40 + let_165 + let_5 + let_212) * 0.142857142f), (float)((let_97 + let_93 + let_101 + let_43 + let_168 + let_7 + let_214) * 0.142857142f), (float)((let_102 + let_98 + let_106 + let_46 + let_171 + let_9 + let_216) * 0.142857142f), (float)((let_107 + let_103 + let_111 + let_49 + let_174 + let_11 + let_218) * 0.142857142f), (float)((let_112 + let_108 + let_116 + let_52 + let_177 + let_13 + let_220) * 0.142857142f), (float)((let_117 + let_113 + let_121 + let_55 + let_180 + let_15 + let_222) * 0.142857142f), (float)((let_122 + let_118 + let_126 + let_58 + let_183 + let_17 + let_224) * 0.142857142f), (float)((let_127 + let_123 + let_131 + let_61 + let_186 + let_19 + let_226) * 0.142857142f), (float)((let_132 + let_128 + let_136 + let_64 + let_189 + let_21 + let_228) * 0.142857142f), (float)((let_137 + let_133 + let_141 + let_67 + let_192 + let_23 + let_230) * 0.142857142f), (float)((let_142 + let_138 + let_146 + let_70 + let_195 + let_25 + let_232) * 0.142857142f), (float)((let_147 + let_143 + let_151 + let_73 + let_198 + let_27 + let_234) * 0.142857142f), (float)((let_152 + let_148 + let_204 + let_76 + let_201 + let_29 + let_236) * 0.142857142f), (float)((let_82 + let_156 + let_86 + let_34 + let_208 + let_1 + let_241) * 0.142857142f), (float)((let_205 + let_153 + let_159 + let_79 + let_239 + let_31 + let_243) * 0.142857142f)});
      let_0_delayed_62_buf[ptr_delay_62] = let_0;
      let_2_delayed_62_buf[ptr_delay_62] = let_2;
      let_4_delayed_62_buf[ptr_delay_62] = let_4;
      let_6_delayed_62_buf[ptr_delay_62] = let_6;
      let_8_delayed_62_buf[ptr_delay_62] = let_8;
      let_10_delayed_62_buf[ptr_delay_62] = let_10;
      let_12_delayed_62_buf[ptr_delay_62] = let_12;
      let_14_delayed_62_buf[ptr_delay_62] = let_14;
      let_16_delayed_62_buf[ptr_delay_62] = let_16;
      let_18_delayed_62_buf[ptr_delay_62] = let_18;
      let_20_delayed_62_buf[ptr_delay_62] = let_20;
      let_22_delayed_62_buf[ptr_delay_62] = let_22;
      let_24_delayed_62_buf[ptr_delay_62] = let_24;
      let_26_delayed_62_buf[ptr_delay_62] = let_26;
      let_28_delayed_62_buf[ptr_delay_62] = let_28;
      let_30_delayed_62_buf[ptr_delay_62] = let_30;
      let_33_delayed_2_buf[ptr_delay_2] = let_33;
      let_36_delayed_2_buf[ptr_delay_2] = let_36;
      let_39_delayed_2_buf[ptr_delay_2] = let_39;
      let_42_delayed_2_buf[ptr_delay_2] = let_42;
      let_45_delayed_2_buf[ptr_delay_2] = let_45;
      let_48_delayed_2_buf[ptr_delay_2] = let_48;
      let_51_delayed_2_buf[ptr_delay_2] = let_51;
      let_54_delayed_2_buf[ptr_delay_2] = let_54;
      let_57_delayed_2_buf[ptr_delay_2] = let_57;
      let_60_delayed_2_buf[ptr_delay_2] = let_60;
      let_63_delayed_2_buf[ptr_delay_2] = let_63;
      let_66_delayed_2_buf[ptr_delay_2] = let_66;
      let_69_delayed_2_buf[ptr_delay_2] = let_69;
      let_72_delayed_2_buf[ptr_delay_2] = let_72;
      let_75_delayed_2_buf[ptr_delay_2] = let_75;
      let_78_delayed_1_buf[ptr_delay_1] = let_78;
      let_81_delayed_1_buf[ptr_delay_1] = let_81;
      let_85_delayed_2_buf[ptr_delay_2] = let_85;
      let_90_delayed_2_buf[ptr_delay_2] = let_90;
      let_95_delayed_2_buf[ptr_delay_2] = let_95;
      let_100_delayed_2_buf[ptr_delay_2] = let_100;
      let_105_delayed_2_buf[ptr_delay_2] = let_105;
      let_110_delayed_2_buf[ptr_delay_2] = let_110;
      let_115_delayed_2_buf[ptr_delay_2] = let_115;
      let_120_delayed_2_buf[ptr_delay_2] = let_120;
      let_125_delayed_2_buf[ptr_delay_2] = let_125;
      let_130_delayed_2_buf[ptr_delay_2] = let_130;
      let_135_delayed_2_buf[ptr_delay_2] = let_135;
      let_140_delayed_2_buf[ptr_delay_2] = let_140;
      let_145_delayed_2_buf[ptr_delay_2] = let_145;
      let_150_delayed_2_buf[ptr_delay_2] = let_150;
      let_155_delayed_1_buf[ptr_delay_1] = let_155;
      let_158_delayed_1_buf[ptr_delay_1] = let_158;
      let_161_delayed_62_buf[ptr_delay_62] = let_161;
      let_164_delayed_62_buf[ptr_delay_62] = let_164;
      let_167_delayed_62_buf[ptr_delay_62] = let_167;
      let_170_delayed_62_buf[ptr_delay_62] = let_170;
      let_173_delayed_62_buf[ptr_delay_62] = let_173;
      let_176_delayed_62_buf[ptr_delay_62] = let_176;
      let_179_delayed_62_buf[ptr_delay_62] = let_179;
      let_182_delayed_62_buf[ptr_delay_62] = let_182;
      let_185_delayed_62_buf[ptr_delay_62] = let_185;
      let_188_delayed_62_buf[ptr_delay_62] = let_188;
      let_191_delayed_62_buf[ptr_delay_62] = let_191;
      let_194_delayed_62_buf[ptr_delay_62] = let_194;
      let_197_delayed_62_buf[ptr_delay_62] = let_197;
      let_200_delayed_62_buf[ptr_delay_62] = let_200;
      let_203_delayed_2_buf[ptr_delay_2] = let_203;
      let_207_delayed_62_buf[ptr_delay_62] = let_207;
      let_238_delayed_62_buf[ptr_delay_62] = let_238;
      ptr_delay_62 < 61 ? (++ptr_delay_62) : (ptr_delay_62 = 0);
      ptr_delay_2 < 1 ? (++ptr_delay_2) : (ptr_delay_2 = 0);
      ptr_delay_1 < 0 ? (++ptr_delay_1) : (ptr_delay_1 = 0);
    } // if not empty
  } // for module_1
} // Module1Func

void Module2Func(
  tapa::ostream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float>& fifo_st_0, 
  tapa::istream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float>& fifo_ld_0)
{
  ap_uint<6> ptr_delay_62 = 0;
  ap_uint<1> ptr_delay_2 = 0;
  ap_uint<1> ptr_delay_1 = 0;
  float let_0_delayed_62_buf[62];
  float let_3_delayed_2_buf[2];
  float let_10_delayed_62_buf[62];
  float let_13_delayed_2_buf[2];
  float let_20_delayed_62_buf[62];
  float let_23_delayed_2_buf[2];
  float let_30_delayed_62_buf[62];
  float let_33_delayed_2_buf[2];
  float let_40_delayed_62_buf[62];
  float let_43_delayed_2_buf[2];
  float let_50_delayed_62_buf[62];
  float let_53_delayed_2_buf[2];
  float let_60_delayed_62_buf[62];
  float let_63_delayed_2_buf[2];
  float let_70_delayed_62_buf[62];
  float let_73_delayed_2_buf[2];
  float let_80_delayed_62_buf[62];
  float let_83_delayed_2_buf[2];
  float let_90_delayed_62_buf[62];
  float let_93_delayed_2_buf[2];
  float let_100_delayed_62_buf[62];
  float let_103_delayed_2_buf[2];
  float let_110_delayed_62_buf[62];
  float let_113_delayed_2_buf[2];
  float let_120_delayed_62_buf[62];
  float let_123_delayed_2_buf[2];
  float let_130_delayed_62_buf[62];
  float let_133_delayed_2_buf[2];
  float let_140_delayed_62_buf[62];
  float let_143_delayed_2_buf[2];
  float let_146_delayed_1_buf[1];
  float let_6_delayed_2_buf[2];
  float let_16_delayed_2_buf[2];
  float let_26_delayed_2_buf[2];
  float let_36_delayed_2_buf[2];
  float let_46_delayed_2_buf[2];
  float let_56_delayed_2_buf[2];
  float let_66_delayed_2_buf[2];
  float let_76_delayed_2_buf[2];
  float let_86_delayed_2_buf[2];
  float let_96_delayed_2_buf[2];
  float let_106_delayed_2_buf[2];
  float let_116_delayed_2_buf[2];
  float let_126_delayed_2_buf[2];
  float let_136_delayed_2_buf[2];
  float let_194_delayed_62_buf[62];
  float let_197_delayed_1_buf[1];
  float let_200_delayed_1_buf[1];
  float let_150_delayed_1_buf[1];
  float let_153_delayed_62_buf[62];
  float let_156_delayed_62_buf[62];
  float let_159_delayed_62_buf[62];
  float let_162_delayed_62_buf[62];
  float let_165_delayed_62_buf[62];
  float let_168_delayed_62_buf[62];
  float let_171_delayed_62_buf[62];
  float let_174_delayed_62_buf[62];
  float let_177_delayed_62_buf[62];
  float let_180_delayed_62_buf[62];
  float let_183_delayed_62_buf[62];
  float let_186_delayed_62_buf[62];
  float let_189_delayed_62_buf[62];
  float let_192_delayed_62_buf[62];
  float let_203_delayed_2_buf[2];
  float let_207_delayed_62_buf[62];
  float let_238_delayed_62_buf[62];
#ifdef __VITIS_HLS__
#pragma HLS bind_storage variable = let_0_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_3_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_10_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_13_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_20_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_23_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_30_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_33_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_40_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_43_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_50_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_53_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_60_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_63_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_70_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_73_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_80_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_83_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_90_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_93_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_100_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_103_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_110_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_113_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_120_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_123_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_130_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_133_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_140_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_143_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_146_delayed_1_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_6_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_16_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_26_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_36_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_46_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_56_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_66_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_76_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_86_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_96_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_106_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_116_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_126_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_136_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_194_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_197_delayed_1_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_200_delayed_1_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_150_delayed_1_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_153_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_156_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_159_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_162_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_165_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_168_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_171_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_174_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_177_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_180_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_183_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_186_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_189_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_192_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_203_delayed_2_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_207_delayed_62_buf type = ram_s2p latency = 3
#pragma HLS bind_storage variable = let_238_delayed_62_buf type = ram_s2p latency = 3
#endif  // __VITIS_HLS__
module_2:
  for (;;)
  {
#pragma HLS pipeline II = 1
#pragma HLS dependence inter true variable = let_0_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_3_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_10_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_13_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_20_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_23_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_30_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_33_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_40_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_43_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_50_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_53_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_60_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_63_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_70_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_73_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_80_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_83_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_90_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_93_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_100_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_103_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_110_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_113_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_120_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_123_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_130_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_133_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_140_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_143_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_146_delayed_1_buf distance = 1
#pragma HLS dependence inter true variable = let_6_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_16_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_26_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_36_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_46_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_56_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_66_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_76_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_86_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_96_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_106_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_116_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_126_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_136_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_194_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_197_delayed_1_buf distance = 1
#pragma HLS dependence inter true variable = let_200_delayed_1_buf distance = 1
#pragma HLS dependence inter true variable = let_150_delayed_1_buf distance = 1
#pragma HLS dependence inter true variable = let_153_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_156_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_159_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_162_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_165_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_168_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_171_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_174_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_177_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_180_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_183_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_186_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_189_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_192_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_203_delayed_2_buf distance = 2
#pragma HLS dependence inter true variable = let_207_delayed_62_buf distance = 62
#pragma HLS dependence inter true variable = let_238_delayed_62_buf distance = 62
    if (!fifo_ld_0.empty())
    {
      haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float fifo_ref_0;
      fifo_ref_0 = fifo_ld_0.read(nullptr);
      const float let_0_delayed_62 = let_0_delayed_62_buf[ptr_delay_62];;
      const float let_3_delayed_2 = let_3_delayed_2_buf[ptr_delay_2];;
      const float let_10_delayed_62 = let_10_delayed_62_buf[ptr_delay_62];;
      const float let_13_delayed_2 = let_13_delayed_2_buf[ptr_delay_2];;
      const float let_20_delayed_62 = let_20_delayed_62_buf[ptr_delay_62];;
      const float let_23_delayed_2 = let_23_delayed_2_buf[ptr_delay_2];;
      const float let_30_delayed_62 = let_30_delayed_62_buf[ptr_delay_62];;
      const float let_33_delayed_2 = let_33_delayed_2_buf[ptr_delay_2];;
      const float let_40_delayed_62 = let_40_delayed_62_buf[ptr_delay_62];;
      const float let_43_delayed_2 = let_43_delayed_2_buf[ptr_delay_2];;
      const float let_50_delayed_62 = let_50_delayed_62_buf[ptr_delay_62];;
      const float let_53_delayed_2 = let_53_delayed_2_buf[ptr_delay_2];;
      const float let_60_delayed_62 = let_60_delayed_62_buf[ptr_delay_62];;
      const float let_63_delayed_2 = let_63_delayed_2_buf[ptr_delay_2];;
      const float let_70_delayed_62 = let_70_delayed_62_buf[ptr_delay_62];;
      const float let_73_delayed_2 = let_73_delayed_2_buf[ptr_delay_2];;
      const float let_80_delayed_62 = let_80_delayed_62_buf[ptr_delay_62];;
      const float let_83_delayed_2 = let_83_delayed_2_buf[ptr_delay_2];;
      const float let_90_delayed_62 = let_90_delayed_62_buf[ptr_delay_62];;
      const float let_93_delayed_2 = let_93_delayed_2_buf[ptr_delay_2];;
      const float let_100_delayed_62 = let_100_delayed_62_buf[ptr_delay_62];;
      const float let_103_delayed_2 = let_103_delayed_2_buf[ptr_delay_2];;
      const float let_110_delayed_62 = let_110_delayed_62_buf[ptr_delay_62];;
      const float let_113_delayed_2 = let_113_delayed_2_buf[ptr_delay_2];;
      const float let_120_delayed_62 = let_120_delayed_62_buf[ptr_delay_62];;
      const float let_123_delayed_2 = let_123_delayed_2_buf[ptr_delay_2];;
      const float let_130_delayed_62 = let_130_delayed_62_buf[ptr_delay_62];;
      const float let_133_delayed_2 = let_133_delayed_2_buf[ptr_delay_2];;
      const float let_140_delayed_62 = let_140_delayed_62_buf[ptr_delay_62];;
      const float let_143_delayed_2 = let_143_delayed_2_buf[ptr_delay_2];;
      const float let_146_delayed_1 = let_146_delayed_1_buf[ptr_delay_1];;
      const float let_6_delayed_2 = let_6_delayed_2_buf[ptr_delay_2];;
      const float let_16_delayed_2 = let_16_delayed_2_buf[ptr_delay_2];;
      const float let_26_delayed_2 = let_26_delayed_2_buf[ptr_delay_2];;
      const float let_36_delayed_2 = let_36_delayed_2_buf[ptr_delay_2];;
      const float let_46_delayed_2 = let_46_delayed_2_buf[ptr_delay_2];;
      const float let_56_delayed_2 = let_56_delayed_2_buf[ptr_delay_2];;
      const float let_66_delayed_2 = let_66_delayed_2_buf[ptr_delay_2];;
      const float let_76_delayed_2 = let_76_delayed_2_buf[ptr_delay_2];;
      const float let_86_delayed_2 = let_86_delayed_2_buf[ptr_delay_2];;
      const float let_96_delayed_2 = let_96_delayed_2_buf[ptr_delay_2];;
      const float let_106_delayed_2 = let_106_delayed_2_buf[ptr_delay_2];;
      const float let_116_delayed_2 = let_116_delayed_2_buf[ptr_delay_2];;
      const float let_126_delayed_2 = let_126_delayed_2_buf[ptr_delay_2];;
      const float let_136_delayed_2 = let_136_delayed_2_buf[ptr_delay_2];;
      const float let_194_delayed_62 = let_194_delayed_62_buf[ptr_delay_62];;
      const float let_197_delayed_1 = let_197_delayed_1_buf[ptr_delay_1];;
      const float let_200_delayed_1 = let_200_delayed_1_buf[ptr_delay_1];;
      const float let_150_delayed_1 = let_150_delayed_1_buf[ptr_delay_1];;
      const float let_153_delayed_62 = let_153_delayed_62_buf[ptr_delay_62];;
      const float let_156_delayed_62 = let_156_delayed_62_buf[ptr_delay_62];;
      const float let_159_delayed_62 = let_159_delayed_62_buf[ptr_delay_62];;
      const float let_162_delayed_62 = let_162_delayed_62_buf[ptr_delay_62];;
      const float let_165_delayed_62 = let_165_delayed_62_buf[ptr_delay_62];;
      const float let_168_delayed_62 = let_168_delayed_62_buf[ptr_delay_62];;
      const float let_171_delayed_62 = let_171_delayed_62_buf[ptr_delay_62];;
      const float let_174_delayed_62 = let_174_delayed_62_buf[ptr_delay_62];;
      const float let_177_delayed_62 = let_177_delayed_62_buf[ptr_delay_62];;
      const float let_180_delayed_62 = let_180_delayed_62_buf[ptr_delay_62];;
      const float let_183_delayed_62 = let_183_delayed_62_buf[ptr_delay_62];;
      const float let_186_delayed_62 = let_186_delayed_62_buf[ptr_delay_62];;
      const float let_189_delayed_62 = let_189_delayed_62_buf[ptr_delay_62];;
      const float let_192_delayed_62 = let_192_delayed_62_buf[ptr_delay_62];;
      const float let_203_delayed_2 = let_203_delayed_2_buf[ptr_delay_2];;
      const float let_207_delayed_62 = let_207_delayed_62_buf[ptr_delay_62];;
      const float let_238_delayed_62 = let_238_delayed_62_buf[ptr_delay_62];;
      const float let_0 = fifo_ref_0.val_0;
      const float let_1 = fifo_ref_0.val_0;
      const float let_2 = let_0_delayed_62;
      const float let_3 = let_2;
      const float let_4 = let_2;
      const float let_5 = let_3_delayed_2;
      const float let_6 = let_5;
      const float let_7 = let_5;
      const float let_8 = let_5;
      const float let_9 = let_5;
      const float let_10 = fifo_ref_0.val_1;
      const float let_11 = fifo_ref_0.val_1;
      const float let_12 = let_10_delayed_62;
      const float let_13 = let_12;
      const float let_14 = let_12;
      const float let_15 = let_13_delayed_2;
      const float let_16 = let_15;
      const float let_17 = let_15;
      const float let_18 = let_15;
      const float let_19 = let_15;
      const float let_20 = fifo_ref_0.val_2;
      const float let_21 = fifo_ref_0.val_2;
      const float let_22 = let_20_delayed_62;
      const float let_23 = let_22;
      const float let_24 = let_22;
      const float let_25 = let_23_delayed_2;
      const float let_26 = let_25;
      const float let_27 = let_25;
      const float let_28 = let_25;
      const float let_29 = let_25;
      const float let_30 = fifo_ref_0.val_3;
      const float let_31 = fifo_ref_0.val_3;
      const float let_32 = let_30_delayed_62;
      const float let_33 = let_32;
      const float let_34 = let_32;
      const float let_35 = let_33_delayed_2;
      const float let_36 = let_35;
      const float let_37 = let_35;
      const float let_38 = let_35;
      const float let_39 = let_35;
      const float let_40 = fifo_ref_0.val_4;
      const float let_41 = fifo_ref_0.val_4;
      const float let_42 = let_40_delayed_62;
      const float let_43 = let_42;
      const float let_44 = let_42;
      const float let_45 = let_43_delayed_2;
      const float let_46 = let_45;
      const float let_47 = let_45;
      const float let_48 = let_45;
      const float let_49 = let_45;
      const float let_50 = fifo_ref_0.val_5;
      const float let_51 = fifo_ref_0.val_5;
      const float let_52 = let_50_delayed_62;
      const float let_53 = let_52;
      const float let_54 = let_52;
      const float let_55 = let_53_delayed_2;
      const float let_56 = let_55;
      const float let_57 = let_55;
      const float let_58 = let_55;
      const float let_59 = let_55;
      const float let_60 = fifo_ref_0.val_6;
      const float let_61 = fifo_ref_0.val_6;
      const float let_62 = let_60_delayed_62;
      const float let_63 = let_62;
      const float let_64 = let_62;
      const float let_65 = let_63_delayed_2;
      const float let_66 = let_65;
      const float let_67 = let_65;
      const float let_68 = let_65;
      const float let_69 = let_65;
      const float let_70 = fifo_ref_0.val_7;
      const float let_71 = fifo_ref_0.val_7;
      const float let_72 = let_70_delayed_62;
      const float let_73 = let_72;
      const float let_74 = let_72;
      const float let_75 = let_73_delayed_2;
      const float let_76 = let_75;
      const float let_77 = let_75;
      const float let_78 = let_75;
      const float let_79 = let_75;
      const float let_80 = fifo_ref_0.val_8;
      const float let_81 = fifo_ref_0.val_8;
      const float let_82 = let_80_delayed_62;
      const float let_83 = let_82;
      const float let_84 = let_82;
      const float let_85 = let_83_delayed_2;
      const float let_86 = let_85;
      const float let_87 = let_85;
      const float let_88 = let_85;
      const float let_89 = let_85;
      const float let_90 = fifo_ref_0.val_9;
      const float let_91 = fifo_ref_0.val_9;
      const float let_92 = let_90_delayed_62;
      const float let_93 = let_92;
      const float let_94 = let_92;
      const float let_95 = let_93_delayed_2;
      const float let_96 = let_95;
      const float let_97 = let_95;
      const float let_98 = let_95;
      const float let_99 = let_95;
      const float let_100 = fifo_ref_0.val_10;
      const float let_101 = fifo_ref_0.val_10;
      const float let_102 = let_100_delayed_62;
      const float let_103 = let_102;
      const float let_104 = let_102;
      const float let_105 = let_103_delayed_2;
      const float let_106 = let_105;
      const float let_107 = let_105;
      const float let_108 = let_105;
      const float let_109 = let_105;
      const float let_110 = fifo_ref_0.val_11;
      const float let_111 = fifo_ref_0.val_11;
      const float let_112 = let_110_delayed_62;
      const float let_113 = let_112;
      const float let_114 = let_112;
      const float let_115 = let_113_delayed_2;
      const float let_116 = let_115;
      const float let_117 = let_115;
      const float let_118 = let_115;
      const float let_119 = let_115;
      const float let_120 = fifo_ref_0.val_12;
      const float let_121 = fifo_ref_0.val_12;
      const float let_122 = let_120_delayed_62;
      const float let_123 = let_122;
      const float let_124 = let_122;
      const float let_125 = let_123_delayed_2;
      const float let_126 = let_125;
      const float let_127 = let_125;
      const float let_128 = let_125;
      const float let_129 = let_125;
      const float let_130 = fifo_ref_0.val_13;
      const float let_131 = fifo_ref_0.val_13;
      const float let_132 = let_130_delayed_62;
      const float let_133 = let_132;
      const float let_134 = let_132;
      const float let_135 = let_133_delayed_2;
      const float let_136 = let_135;
      const float let_137 = let_135;
      const float let_138 = let_135;
      const float let_139 = let_135;
      const float let_140 = fifo_ref_0.val_14;
      const float let_141 = fifo_ref_0.val_14;
      const float let_142 = let_140_delayed_62;
      const float let_143 = let_142;
      const float let_144 = let_142;
      const float let_145 = let_143_delayed_2;
      const float let_146 = let_145;
      const float let_147 = let_145;
      const float let_148 = let_145;
      const float let_149 = let_146_delayed_1;
      const float let_150 = let_149;
      const float let_151 = let_149;
      const float let_152 = let_6_delayed_2;
      const float let_153 = let_152;
      const float let_154 = let_152;
      const float let_155 = let_16_delayed_2;
      const float let_156 = let_155;
      const float let_157 = let_155;
      const float let_158 = let_26_delayed_2;
      const float let_159 = let_158;
      const float let_160 = let_158;
      const float let_161 = let_36_delayed_2;
      const float let_162 = let_161;
      const float let_163 = let_161;
      const float let_164 = let_46_delayed_2;
      const float let_165 = let_164;
      const float let_166 = let_164;
      const float let_167 = let_56_delayed_2;
      const float let_168 = let_167;
      const float let_169 = let_167;
      const float let_170 = let_66_delayed_2;
      const float let_171 = let_170;
      const float let_172 = let_170;
      const float let_173 = let_76_delayed_2;
      const float let_174 = let_173;
      const float let_175 = let_173;
      const float let_176 = let_86_delayed_2;
      const float let_177 = let_176;
      const float let_178 = let_176;
      const float let_179 = let_96_delayed_2;
      const float let_180 = let_179;
      const float let_181 = let_179;
      const float let_182 = let_106_delayed_2;
      const float let_183 = let_182;
      const float let_184 = let_182;
      const float let_185 = let_116_delayed_2;
      const float let_186 = let_185;
      const float let_187 = let_185;
      const float let_188 = let_126_delayed_2;
      const float let_189 = let_188;
      const float let_190 = let_188;
      const float let_191 = let_136_delayed_2;
      const float let_192 = let_191;
      const float let_193 = let_191;
      const float let_194 = fifo_ref_0.val_15;
      const float let_195 = fifo_ref_0.val_15;
      const float let_196 = let_194_delayed_62;
      const float let_197 = let_196;
      const float let_198 = let_196;
      const float let_199 = let_197_delayed_1;
      const float let_200 = let_199;
      const float let_201 = let_199;
      const float let_202 = let_200_delayed_1;
      const float let_203 = let_202;
      const float let_204 = let_202;
      const float let_205 = let_202;
      const float let_206 = let_150_delayed_1;
      const float let_207 = let_206;
      const float let_208 = let_206;
      const float let_209 = let_153_delayed_62;
      const float let_210 = let_209;
      const float let_211 = let_156_delayed_62;
      const float let_212 = let_211;
      const float let_213 = let_159_delayed_62;
      const float let_214 = let_213;
      const float let_215 = let_162_delayed_62;
      const float let_216 = let_215;
      const float let_217 = let_165_delayed_62;
      const float let_218 = let_217;
      const float let_219 = let_168_delayed_62;
      const float let_220 = let_219;
      const float let_221 = let_171_delayed_62;
      const float let_222 = let_221;
      const float let_223 = let_174_delayed_62;
      const float let_224 = let_223;
      const float let_225 = let_177_delayed_62;
      const float let_226 = let_225;
      const float let_227 = let_180_delayed_62;
      const float let_228 = let_227;
      const float let_229 = let_183_delayed_62;
      const float let_230 = let_229;
      const float let_231 = let_186_delayed_62;
      const float let_232 = let_231;
      const float let_233 = let_189_delayed_62;
      const float let_234 = let_233;
      const float let_235 = let_192_delayed_62;
      const float let_236 = let_235;
      const float let_237 = let_203_delayed_2;
      const float let_238 = let_237;
      const float let_239 = let_237;
      const float let_240 = let_207_delayed_62;
      const float let_241 = let_240;
      const float let_242 = let_238_delayed_62;
      const float let_243 = let_242;
      fifo_st_0.write({(float)((let_8 + let_148 + let_17 + let_4 + let_154 + let_1 + let_210) * 0.142857142f), (float)((let_18 + let_9 + let_27 + let_14 + let_157 + let_11 + let_212) * 0.142857142f), (float)((let_28 + let_19 + let_37 + let_24 + let_160 + let_21 + let_214) * 0.142857142f), (float)((let_38 + let_29 + let_47 + let_34 + let_163 + let_31 + let_216) * 0.142857142f), (float)((let_48 + let_39 + let_57 + let_44 + let_166 + let_41 + let_218) * 0.142857142f), (float)((let_58 + let_49 + let_67 + let_54 + let_169 + let_51 + let_220) * 0.142857142f), (float)((let_68 + let_59 + let_77 + let_64 + let_172 + let_61 + let_222) * 0.142857142f), (float)((let_78 + let_69 + let_87 + let_74 + let_175 + let_71 + let_224) * 0.142857142f), (float)((let_88 + let_79 + let_97 + let_84 + let_178 + let_81 + let_226) * 0.142857142f), (float)((let_98 + let_89 + let_107 + let_94 + let_181 + let_91 + let_228) * 0.142857142f), (float)((let_108 + let_99 + let_117 + let_104 + let_184 + let_101 + let_230) * 0.142857142f), (float)((let_118 + let_109 + let_127 + let_114 + let_187 + let_111 + let_232) * 0.142857142f), (float)((let_128 + let_119 + let_137 + let_124 + let_190 + let_121 + let_234) * 0.142857142f), (float)((let_138 + let_129 + let_204 + let_134 + let_193 + let_131 + let_236) * 0.142857142f), (float)((let_147 + let_201 + let_7 + let_144 + let_208 + let_141 + let_241) * 0.142857142f), (float)((let_205 + let_139 + let_151 + let_198 + let_239 + let_195 + let_243) * 0.142857142f)});
      let_0_delayed_62_buf[ptr_delay_62] = let_0;
      let_3_delayed_2_buf[ptr_delay_2] = let_3;
      let_10_delayed_62_buf[ptr_delay_62] = let_10;
      let_13_delayed_2_buf[ptr_delay_2] = let_13;
      let_20_delayed_62_buf[ptr_delay_62] = let_20;
      let_23_delayed_2_buf[ptr_delay_2] = let_23;
      let_30_delayed_62_buf[ptr_delay_62] = let_30;
      let_33_delayed_2_buf[ptr_delay_2] = let_33;
      let_40_delayed_62_buf[ptr_delay_62] = let_40;
      let_43_delayed_2_buf[ptr_delay_2] = let_43;
      let_50_delayed_62_buf[ptr_delay_62] = let_50;
      let_53_delayed_2_buf[ptr_delay_2] = let_53;
      let_60_delayed_62_buf[ptr_delay_62] = let_60;
      let_63_delayed_2_buf[ptr_delay_2] = let_63;
      let_70_delayed_62_buf[ptr_delay_62] = let_70;
      let_73_delayed_2_buf[ptr_delay_2] = let_73;
      let_80_delayed_62_buf[ptr_delay_62] = let_80;
      let_83_delayed_2_buf[ptr_delay_2] = let_83;
      let_90_delayed_62_buf[ptr_delay_62] = let_90;
      let_93_delayed_2_buf[ptr_delay_2] = let_93;
      let_100_delayed_62_buf[ptr_delay_62] = let_100;
      let_103_delayed_2_buf[ptr_delay_2] = let_103;
      let_110_delayed_62_buf[ptr_delay_62] = let_110;
      let_113_delayed_2_buf[ptr_delay_2] = let_113;
      let_120_delayed_62_buf[ptr_delay_62] = let_120;
      let_123_delayed_2_buf[ptr_delay_2] = let_123;
      let_130_delayed_62_buf[ptr_delay_62] = let_130;
      let_133_delayed_2_buf[ptr_delay_2] = let_133;
      let_140_delayed_62_buf[ptr_delay_62] = let_140;
      let_143_delayed_2_buf[ptr_delay_2] = let_143;
      let_146_delayed_1_buf[ptr_delay_1] = let_146;
      let_6_delayed_2_buf[ptr_delay_2] = let_6;
      let_16_delayed_2_buf[ptr_delay_2] = let_16;
      let_26_delayed_2_buf[ptr_delay_2] = let_26;
      let_36_delayed_2_buf[ptr_delay_2] = let_36;
      let_46_delayed_2_buf[ptr_delay_2] = let_46;
      let_56_delayed_2_buf[ptr_delay_2] = let_56;
      let_66_delayed_2_buf[ptr_delay_2] = let_66;
      let_76_delayed_2_buf[ptr_delay_2] = let_76;
      let_86_delayed_2_buf[ptr_delay_2] = let_86;
      let_96_delayed_2_buf[ptr_delay_2] = let_96;
      let_106_delayed_2_buf[ptr_delay_2] = let_106;
      let_116_delayed_2_buf[ptr_delay_2] = let_116;
      let_126_delayed_2_buf[ptr_delay_2] = let_126;
      let_136_delayed_2_buf[ptr_delay_2] = let_136;
      let_194_delayed_62_buf[ptr_delay_62] = let_194;
      let_197_delayed_1_buf[ptr_delay_1] = let_197;
      let_200_delayed_1_buf[ptr_delay_1] = let_200;
      let_150_delayed_1_buf[ptr_delay_1] = let_150;
      let_153_delayed_62_buf[ptr_delay_62] = let_153;
      let_156_delayed_62_buf[ptr_delay_62] = let_156;
      let_159_delayed_62_buf[ptr_delay_62] = let_159;
      let_162_delayed_62_buf[ptr_delay_62] = let_162;
      let_165_delayed_62_buf[ptr_delay_62] = let_165;
      let_168_delayed_62_buf[ptr_delay_62] = let_168;
      let_171_delayed_62_buf[ptr_delay_62] = let_171;
      let_174_delayed_62_buf[ptr_delay_62] = let_174;
      let_177_delayed_62_buf[ptr_delay_62] = let_177;
      let_180_delayed_62_buf[ptr_delay_62] = let_180;
      let_183_delayed_62_buf[ptr_delay_62] = let_183;
      let_186_delayed_62_buf[ptr_delay_62] = let_186;
      let_189_delayed_62_buf[ptr_delay_62] = let_189;
      let_192_delayed_62_buf[ptr_delay_62] = let_192;
      let_203_delayed_2_buf[ptr_delay_2] = let_203;
      let_207_delayed_62_buf[ptr_delay_62] = let_207;
      let_238_delayed_62_buf[ptr_delay_62] = let_238;
      ptr_delay_62 < 61 ? (++ptr_delay_62) : (ptr_delay_62 = 0);
      ptr_delay_2 < 1 ? (++ptr_delay_2) : (ptr_delay_2 = 0);
      ptr_delay_1 < 0 ? (++ptr_delay_1) : (ptr_delay_1 = 0);
    } // if not empty
  } // for module_2
} // Module2Func

void Module3Func(
  tapa::ostream<tapa::vec_t<float, 16>>& dram_t0_bank_1_fifo, 
  tapa::istream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float>& fifo_ld_0)
{
#ifdef __VITIS_HLS__
#endif  // __VITIS_HLS__
module_3:
  for (;;)
  {
#pragma HLS pipeline II = 1
    if (!fifo_ld_0.empty())
    {
      haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float fifo_ref_0;
      tapa::vec_t<float, 16> dram_t0_bank_1_buf;
      fifo_ref_0 = fifo_ld_0.read(nullptr);
      dram_t0_bank_1_buf.set(14, fifo_ref_0.val_0);
      dram_t0_bank_1_buf.set(13, fifo_ref_0.val_1);
      dram_t0_bank_1_buf.set(12, fifo_ref_0.val_2);
      dram_t0_bank_1_buf.set(11, fifo_ref_0.val_3);
      dram_t0_bank_1_buf.set(10, fifo_ref_0.val_4);
      dram_t0_bank_1_buf.set(9, fifo_ref_0.val_5);
      dram_t0_bank_1_buf.set(8, fifo_ref_0.val_6);
      dram_t0_bank_1_buf.set(7, fifo_ref_0.val_7);
      dram_t0_bank_1_buf.set(6, fifo_ref_0.val_8);
      dram_t0_bank_1_buf.set(5, fifo_ref_0.val_9);
      dram_t0_bank_1_buf.set(4, fifo_ref_0.val_10);
      dram_t0_bank_1_buf.set(3, fifo_ref_0.val_11);
      dram_t0_bank_1_buf.set(2, fifo_ref_0.val_12);
      dram_t0_bank_1_buf.set(1, fifo_ref_0.val_13);
      dram_t0_bank_1_buf.set(15, fifo_ref_0.val_14);
      dram_t0_bank_1_buf.set(0, fifo_ref_0.val_15);
      dram_t0_bank_1_fifo.write(dram_t0_bank_1_buf);
    } // if not empty
  } // for module_3
} // Module3Func

void jacobi3d_kernel(
  tapa::mmap<tapa::vec_t<float, 16>> bank_1_t0, 
  tapa::mmap<tapa::vec_t<float, 16>> bank_0_t1, 
  uint64_t coalesced_data_num)
{
  tapa::stream<tapa::vec_t<float, 16>, 4096> bank_0_t1_buf("bank_0_t1_buf");
  tapa::stream<tapa::vec_t<float, 16>, 4096> bank_1_t0_buf("bank_1_t0_buf");

  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_bank_0_to_t1_iter1("from_t1_bank_0_to_t1_iter1");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter1_to_t1_iter2("from_t1_iter1_to_t1_iter2");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter2_to_t1_iter3("from_t1_iter2_to_t1_iter3");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter3_to_t1_iter4("from_t1_iter3_to_t1_iter4");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter4_to_t1_iter5("from_t1_iter4_to_t1_iter5");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter5_to_t1_iter6("from_t1_iter5_to_t1_iter6");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 134> from_t1_iter6_to_t1_iter7("from_t1_iter6_to_t1_iter7");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter7_to_t1_iter8("from_t1_iter7_to_t1_iter8");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter8_to_t1_iter9("from_t1_iter8_to_t1_iter9");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter9_to_t1_iter10("from_t1_iter9_to_t1_iter10");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter10_to_t1_iter11("from_t1_iter10_to_t1_iter11");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 132> from_t1_iter11_to_t1_iter12("from_t1_iter11_to_t1_iter12");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter12_to_t1_iter13("from_t1_iter12_to_t1_iter13");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 140> from_t1_iter13_to_t1_iter14("from_t1_iter13_to_t1_iter14");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter14_to_t1_iter15("from_t1_iter14_to_t1_iter15");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter15_to_t1_iter16("from_t1_iter15_to_t1_iter16");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter16_to_t1_iter17("from_t1_iter16_to_t1_iter17");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter17_to_t1_iter18("from_t1_iter17_to_t1_iter18");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter18_to_t1_iter19("from_t1_iter18_to_t1_iter19");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter19_to_t1_iter20("from_t1_iter19_to_t1_iter20");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter20_to_t1_iter21("from_t1_iter20_to_t1_iter21");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 132> from_t1_iter21_to_t1_iter22("from_t1_iter21_to_t1_iter22");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter22_to_t1_iter23("from_t1_iter22_to_t1_iter23");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter23_to_t1_iter24("from_t1_iter23_to_t1_iter24");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter24_to_t1_iter25("from_t1_iter24_to_t1_iter25");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter25_to_t1_iter26("from_t1_iter25_to_t1_iter26");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 134> from_t1_iter26_to_t1_iter27("from_t1_iter26_to_t1_iter27");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter27_to_t1_iter28("from_t1_iter27_to_t1_iter28");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter28_to_t1_iter29("from_t1_iter28_to_t1_iter29");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter29_to_t1_iter30("from_t1_iter29_to_t1_iter30");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter30_to_t1_iter31("from_t1_iter30_to_t1_iter31");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter31_to_t1_iter32("from_t1_iter31_to_t1_iter32");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter32_to_t1_iter33("from_t1_iter32_to_t1_iter33");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter33_to_t1_iter34("from_t1_iter33_to_t1_iter34");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter34_to_t1_iter35("from_t1_iter34_to_t1_iter35");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter35_to_t1_iter36("from_t1_iter35_to_t1_iter36");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter36_to_t1_iter37("from_t1_iter36_to_t1_iter37");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter37_to_t1_iter38("from_t1_iter37_to_t1_iter38");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter38_to_t1_iter39("from_t1_iter38_to_t1_iter39");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter39_to_t1_iter40("from_t1_iter39_to_t1_iter40");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter40_to_t1_iter41("from_t1_iter40_to_t1_iter41");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 132> from_t1_iter41_to_t1_iter42("from_t1_iter41_to_t1_iter42");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter42_to_t1_iter43("from_t1_iter42_to_t1_iter43");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 134> from_t1_iter43_to_t1_iter44("from_t1_iter43_to_t1_iter44");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter44_to_t1_iter45("from_t1_iter44_to_t1_iter45");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter45_to_t1_iter46("from_t1_iter45_to_t1_iter46");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter46_to_t1_iter47("from_t1_iter46_to_t1_iter47");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 132> from_t1_iter47_to_t1_iter48("from_t1_iter47_to_t1_iter48");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter48_to_t1_iter49("from_t1_iter48_to_t1_iter49");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter49_to_t1_iter50("from_t1_iter49_to_t1_iter50");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 134> from_t1_iter50_to_t1_iter51("from_t1_iter50_to_t1_iter51");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter51_to_t1_iter52("from_t1_iter51_to_t1_iter52");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter52_to_t1_iter53("from_t1_iter52_to_t1_iter53");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter53_to_t1_iter54("from_t1_iter53_to_t1_iter54");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter54_to_t1_iter55("from_t1_iter54_to_t1_iter55");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter55_to_t1_iter56("from_t1_iter55_to_t1_iter56");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter56_to_t1_iter57("from_t1_iter56_to_t1_iter57");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter57_to_t1_iter58("from_t1_iter57_to_t1_iter58");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter58_to_t1_iter59("from_t1_iter58_to_t1_iter59");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter59_to_t1_iter60("from_t1_iter59_to_t1_iter60");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter60_to_t1_iter61("from_t1_iter60_to_t1_iter61");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 136> from_t1_iter61_to_t1_iter62("from_t1_iter61_to_t1_iter62");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter62_to_t1_iter63("from_t1_iter62_to_t1_iter63");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter63_to_t1_iter64("from_t1_iter63_to_t1_iter64");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter64_to_t1_iter65("from_t1_iter64_to_t1_iter65");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter65_to_t1_iter66("from_t1_iter65_to_t1_iter66");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter66_to_t1_iter67("from_t1_iter66_to_t1_iter67");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter67_to_t1_iter68("from_t1_iter67_to_t1_iter68");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter68_to_t1_iter69("from_t1_iter68_to_t1_iter69");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 134> from_t1_iter69_to_t1_iter70("from_t1_iter69_to_t1_iter70");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter70_to_t1_iter71("from_t1_iter70_to_t1_iter71");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter71_to_t1_iter72("from_t1_iter71_to_t1_iter72");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 132> from_t1_iter72_to_t1_iter73("from_t1_iter72_to_t1_iter73");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter73_to_t1_iter74("from_t1_iter73_to_t1_iter74");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 134> from_t1_iter74_to_t1_iter75("from_t1_iter74_to_t1_iter75");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter75_to_t1_iter76("from_t1_iter75_to_t1_iter76");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 132> from_t1_iter76_to_t1_iter77("from_t1_iter76_to_t1_iter77");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter77_to_t1_iter78("from_t1_iter77_to_t1_iter78");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter78_to_t1_iter79("from_t1_iter78_to_t1_iter79");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter79_to_t1_iter80("from_t1_iter79_to_t1_iter80");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 132> from_t1_iter80_to_t1_iter81("from_t1_iter80_to_t1_iter81");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter81_to_t1_iter82("from_t1_iter81_to_t1_iter82");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter82_to_t1_iter83("from_t1_iter82_to_t1_iter83");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter83_to_t1_iter84("from_t1_iter83_to_t1_iter84");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 136> from_t1_iter84_to_t1_iter85("from_t1_iter84_to_t1_iter85");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter85_to_t1_iter86("from_t1_iter85_to_t1_iter86");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 136> from_t1_iter86_to_t1_iter87("from_t1_iter86_to_t1_iter87");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter87_to_t1_iter88("from_t1_iter87_to_t1_iter88");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter88_to_t1_iter89("from_t1_iter88_to_t1_iter89");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 134> from_t1_iter89_to_t1_iter90("from_t1_iter89_to_t1_iter90");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 130> from_t1_iter90_to_t1_iter91("from_t1_iter90_to_t1_iter91");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter91_to_t1_iter92("from_t1_iter91_to_t1_iter92");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter92_to_t1_iter93("from_t1_iter92_to_t1_iter93");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter93_to_t1_iter94("from_t1_iter93_to_t1_iter94");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter94_to_t1_iter95("from_t1_iter94_to_t1_iter95");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 136> from_t1_iter95_to_t1_iter96("from_t1_iter95_to_t1_iter96");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter96_to_t1_iter97("from_t1_iter96_to_t1_iter97");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter97_to_t1_iter98("from_t1_iter97_to_t1_iter98");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 132> from_t1_iter98_to_t1_iter99("from_t1_iter98_to_t1_iter99");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter99_to_t1_iter100("from_t1_iter99_to_t1_iter100");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter100_to_t1_iter101("from_t1_iter100_to_t1_iter101");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter101_to_t1_iter102("from_t1_iter101_to_t1_iter102");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 136> from_t1_iter102_to_t1_iter103("from_t1_iter102_to_t1_iter103");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter103_to_t1_iter104("from_t1_iter103_to_t1_iter104");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter104_to_t1_iter105("from_t1_iter104_to_t1_iter105");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter105_to_t1_iter106("from_t1_iter105_to_t1_iter106");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 140> from_t1_iter106_to_t1_iter107("from_t1_iter106_to_t1_iter107");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter107_to_t1_iter108("from_t1_iter107_to_t1_iter108");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t1_iter108_to_t0("from_t1_iter108_to_t0");
  tapa::stream<haoda_tuple_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float_float, 128> from_t0_to_t0_bank_1("from_t0_to_t0_bank_1");

  tapa::task()
    .invoke(BurstRead_floatx16,
      bank_0_t1_buf,
      bank_0_t1,
      coalesced_data_num)
    .invoke<tapa::detach>(Module0Func,
      /*output*/ from_t1_bank_0_to_t1_iter1,
      /* input*/ bank_0_t1_buf)
    .invoke<tapa::detach>(Module1Func,
      /*output*/ from_t1_iter1_to_t1_iter2,
      /* input*/ from_t1_bank_0_to_t1_iter1)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter2_to_t1_iter3,
      /* input*/ from_t1_iter1_to_t1_iter2)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter3_to_t1_iter4,
      /* input*/ from_t1_iter2_to_t1_iter3)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter4_to_t1_iter5,
      /* input*/ from_t1_iter3_to_t1_iter4)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter5_to_t1_iter6,
      /* input*/ from_t1_iter4_to_t1_iter5)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter6_to_t1_iter7,
      /* input*/ from_t1_iter5_to_t1_iter6)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter7_to_t1_iter8,
      /* input*/ from_t1_iter6_to_t1_iter7)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter8_to_t1_iter9,
      /* input*/ from_t1_iter7_to_t1_iter8)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter9_to_t1_iter10,
      /* input*/ from_t1_iter8_to_t1_iter9)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter10_to_t1_iter11,
      /* input*/ from_t1_iter9_to_t1_iter10)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter11_to_t1_iter12,
      /* input*/ from_t1_iter10_to_t1_iter11)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter12_to_t1_iter13,
      /* input*/ from_t1_iter11_to_t1_iter12)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter13_to_t1_iter14,
      /* input*/ from_t1_iter12_to_t1_iter13)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter14_to_t1_iter15,
      /* input*/ from_t1_iter13_to_t1_iter14)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter15_to_t1_iter16,
      /* input*/ from_t1_iter14_to_t1_iter15)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter16_to_t1_iter17,
      /* input*/ from_t1_iter15_to_t1_iter16)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter17_to_t1_iter18,
      /* input*/ from_t1_iter16_to_t1_iter17)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter18_to_t1_iter19,
      /* input*/ from_t1_iter17_to_t1_iter18)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter19_to_t1_iter20,
      /* input*/ from_t1_iter18_to_t1_iter19)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter20_to_t1_iter21,
      /* input*/ from_t1_iter19_to_t1_iter20)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter21_to_t1_iter22,
      /* input*/ from_t1_iter20_to_t1_iter21)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter22_to_t1_iter23,
      /* input*/ from_t1_iter21_to_t1_iter22)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter23_to_t1_iter24,
      /* input*/ from_t1_iter22_to_t1_iter23)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter24_to_t1_iter25,
      /* input*/ from_t1_iter23_to_t1_iter24)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter25_to_t1_iter26,
      /* input*/ from_t1_iter24_to_t1_iter25)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter26_to_t1_iter27,
      /* input*/ from_t1_iter25_to_t1_iter26)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter27_to_t1_iter28,
      /* input*/ from_t1_iter26_to_t1_iter27)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter28_to_t1_iter29,
      /* input*/ from_t1_iter27_to_t1_iter28)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter29_to_t1_iter30,
      /* input*/ from_t1_iter28_to_t1_iter29)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter30_to_t1_iter31,
      /* input*/ from_t1_iter29_to_t1_iter30)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter31_to_t1_iter32,
      /* input*/ from_t1_iter30_to_t1_iter31)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter32_to_t1_iter33,
      /* input*/ from_t1_iter31_to_t1_iter32)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter33_to_t1_iter34,
      /* input*/ from_t1_iter32_to_t1_iter33)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter34_to_t1_iter35,
      /* input*/ from_t1_iter33_to_t1_iter34)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter35_to_t1_iter36,
      /* input*/ from_t1_iter34_to_t1_iter35)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter36_to_t1_iter37,
      /* input*/ from_t1_iter35_to_t1_iter36)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter37_to_t1_iter38,
      /* input*/ from_t1_iter36_to_t1_iter37)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter38_to_t1_iter39,
      /* input*/ from_t1_iter37_to_t1_iter38)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter39_to_t1_iter40,
      /* input*/ from_t1_iter38_to_t1_iter39)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter40_to_t1_iter41,
      /* input*/ from_t1_iter39_to_t1_iter40)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter41_to_t1_iter42,
      /* input*/ from_t1_iter40_to_t1_iter41)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter42_to_t1_iter43,
      /* input*/ from_t1_iter41_to_t1_iter42)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter43_to_t1_iter44,
      /* input*/ from_t1_iter42_to_t1_iter43)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter44_to_t1_iter45,
      /* input*/ from_t1_iter43_to_t1_iter44)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter45_to_t1_iter46,
      /* input*/ from_t1_iter44_to_t1_iter45)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter46_to_t1_iter47,
      /* input*/ from_t1_iter45_to_t1_iter46)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter47_to_t1_iter48,
      /* input*/ from_t1_iter46_to_t1_iter47)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter48_to_t1_iter49,
      /* input*/ from_t1_iter47_to_t1_iter48)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter49_to_t1_iter50,
      /* input*/ from_t1_iter48_to_t1_iter49)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter50_to_t1_iter51,
      /* input*/ from_t1_iter49_to_t1_iter50)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter51_to_t1_iter52,
      /* input*/ from_t1_iter50_to_t1_iter51)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter52_to_t1_iter53,
      /* input*/ from_t1_iter51_to_t1_iter52)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter53_to_t1_iter54,
      /* input*/ from_t1_iter52_to_t1_iter53)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter54_to_t1_iter55,
      /* input*/ from_t1_iter53_to_t1_iter54)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter55_to_t1_iter56,
      /* input*/ from_t1_iter54_to_t1_iter55)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter56_to_t1_iter57,
      /* input*/ from_t1_iter55_to_t1_iter56)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter57_to_t1_iter58,
      /* input*/ from_t1_iter56_to_t1_iter57)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter58_to_t1_iter59,
      /* input*/ from_t1_iter57_to_t1_iter58)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter59_to_t1_iter60,
      /* input*/ from_t1_iter58_to_t1_iter59)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter60_to_t1_iter61,
      /* input*/ from_t1_iter59_to_t1_iter60)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter61_to_t1_iter62,
      /* input*/ from_t1_iter60_to_t1_iter61)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter62_to_t1_iter63,
      /* input*/ from_t1_iter61_to_t1_iter62)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter63_to_t1_iter64,
      /* input*/ from_t1_iter62_to_t1_iter63)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter64_to_t1_iter65,
      /* input*/ from_t1_iter63_to_t1_iter64)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter65_to_t1_iter66,
      /* input*/ from_t1_iter64_to_t1_iter65)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter66_to_t1_iter67,
      /* input*/ from_t1_iter65_to_t1_iter66)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter67_to_t1_iter68,
      /* input*/ from_t1_iter66_to_t1_iter67)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter68_to_t1_iter69,
      /* input*/ from_t1_iter67_to_t1_iter68)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter69_to_t1_iter70,
      /* input*/ from_t1_iter68_to_t1_iter69)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter70_to_t1_iter71,
      /* input*/ from_t1_iter69_to_t1_iter70)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter71_to_t1_iter72,
      /* input*/ from_t1_iter70_to_t1_iter71)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter72_to_t1_iter73,
      /* input*/ from_t1_iter71_to_t1_iter72)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter73_to_t1_iter74,
      /* input*/ from_t1_iter72_to_t1_iter73)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter74_to_t1_iter75,
      /* input*/ from_t1_iter73_to_t1_iter74)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter75_to_t1_iter76,
      /* input*/ from_t1_iter74_to_t1_iter75)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter76_to_t1_iter77,
      /* input*/ from_t1_iter75_to_t1_iter76)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter77_to_t1_iter78,
      /* input*/ from_t1_iter76_to_t1_iter77)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter78_to_t1_iter79,
      /* input*/ from_t1_iter77_to_t1_iter78)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter79_to_t1_iter80,
      /* input*/ from_t1_iter78_to_t1_iter79)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter80_to_t1_iter81,
      /* input*/ from_t1_iter79_to_t1_iter80)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter81_to_t1_iter82,
      /* input*/ from_t1_iter80_to_t1_iter81)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter82_to_t1_iter83,
      /* input*/ from_t1_iter81_to_t1_iter82)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter83_to_t1_iter84,
      /* input*/ from_t1_iter82_to_t1_iter83)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter84_to_t1_iter85,
      /* input*/ from_t1_iter83_to_t1_iter84)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter85_to_t1_iter86,
      /* input*/ from_t1_iter84_to_t1_iter85)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter86_to_t1_iter87,
      /* input*/ from_t1_iter85_to_t1_iter86)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter87_to_t1_iter88,
      /* input*/ from_t1_iter86_to_t1_iter87)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter88_to_t1_iter89,
      /* input*/ from_t1_iter87_to_t1_iter88)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter89_to_t1_iter90,
      /* input*/ from_t1_iter88_to_t1_iter89)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter90_to_t1_iter91,
      /* input*/ from_t1_iter89_to_t1_iter90)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter91_to_t1_iter92,
      /* input*/ from_t1_iter90_to_t1_iter91)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter92_to_t1_iter93,
      /* input*/ from_t1_iter91_to_t1_iter92)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter93_to_t1_iter94,
      /* input*/ from_t1_iter92_to_t1_iter93)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter94_to_t1_iter95,
      /* input*/ from_t1_iter93_to_t1_iter94)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter95_to_t1_iter96,
      /* input*/ from_t1_iter94_to_t1_iter95)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter96_to_t1_iter97,
      /* input*/ from_t1_iter95_to_t1_iter96)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter97_to_t1_iter98,
      /* input*/ from_t1_iter96_to_t1_iter97)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter98_to_t1_iter99,
      /* input*/ from_t1_iter97_to_t1_iter98)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter99_to_t1_iter100,
      /* input*/ from_t1_iter98_to_t1_iter99)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter100_to_t1_iter101,
      /* input*/ from_t1_iter99_to_t1_iter100)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter101_to_t1_iter102,
      /* input*/ from_t1_iter100_to_t1_iter101)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter102_to_t1_iter103,
      /* input*/ from_t1_iter101_to_t1_iter102)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter103_to_t1_iter104,
      /* input*/ from_t1_iter102_to_t1_iter103)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter104_to_t1_iter105,
      /* input*/ from_t1_iter103_to_t1_iter104)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter105_to_t1_iter106,
      /* input*/ from_t1_iter104_to_t1_iter105)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter106_to_t1_iter107,
      /* input*/ from_t1_iter105_to_t1_iter106)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter107_to_t1_iter108,
      /* input*/ from_t1_iter106_to_t1_iter107)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t1_iter108_to_t0,
      /* input*/ from_t1_iter107_to_t1_iter108)
    .invoke<tapa::detach>(Module2Func,
      /*output*/ from_t0_to_t0_bank_1,
      /* input*/ from_t1_iter108_to_t0)
    .invoke<tapa::detach>(Module3Func,
      /*output*/ bank_1_t0_buf,
      /* input*/ from_t0_to_t0_bank_1)
    .invoke(BurstWrite_floatx16,
      bank_1_t0,
      bank_1_t0_buf,
      coalesced_data_num)
  ;
}
