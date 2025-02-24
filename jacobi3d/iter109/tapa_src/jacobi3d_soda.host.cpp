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

#include <cassert>
#include <cfloat>
#include <cmath>
#include <cstdbool>
#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include <algorithm>
#include <iomanip>
#include <iostream>
#include <memory>
#include <random>
#include <regex>
#include <string>
#include <unordered_map>
#include <vector>

#include <frt.h>
#include <ap_int.h>
#ifdef SODA_TAPA_BINDING
#include <tapa.h>
#endif  // SODA_TAPA_BINDING

using std::clog;
using std::endl;
using std::regex;
using std::regex_match;
using std::string;
using std::unique_ptr;
using std::unordered_map;
using std::vector;

// C++ binding
extern "C" {
void jacobi3d_kernel(
  ap_uint<512>* bank_1_t0,
  ap_uint<512>* bank_0_t1,
  uint64_t coalesced_data_num);
}  // extern "C"

#ifdef SODA_TAPA_BINDING
// TAPA binding
void jacobi3d_kernel(
  tapa::mmap<tapa::vec_t<float, 16>> bank_1_t0,
  tapa::mmap<tapa::vec_t<float, 16>> bank_0_t1,
  uint64_t coalesced_data_num);
#endif  // SODA_TAPA_BINDING

namespace soda {
namespace app {
// app-specific constants
constexpr int kStencilDim0 = 219;
constexpr int kStencilDim1 = 219;
constexpr int kStencilDim2 = 219;
constexpr int kStencilDistance = 219;
constexpr int kWidth_t1 = 32;
constexpr int kWidth_t0 = 32;

// type alias
using Type_t1 = float;
using Type_t0 = float;

int jacobi3d(
  const Type_t1* var_t1_ptr, 
  const int32_t var_t1_extent[3], 
  const int32_t var_t1_stride[3], 
  const int32_t var_t1_min[3], 
  Type_t0* var_t0_ptr, 
  const int32_t var_t0_extent[3], 
  const int32_t var_t0_stride[3], 
  const int32_t var_t0_min[3], 
  const char* bitstream, 
  const int burst_width = 512, 
  const int tile_size_0 = 1, 
  const int tile_size_1 = 1, 
  const int unroll_factor = 16)
{
#ifdef SODA_CPP_BINDING
  // C++ binding only supports a fixed number of banks
  int bank_count_t1 = 1;
  int bank_count_t0 = 1;
#else  // SODA_CPP_BINDING
  // load bitstream
  auto instance = fpga::Instance(bitstream);
  auto args_info = instance.GetArgsInfo();
  // find out how many banks are used for each tensor
  int bank_count_t1 = 0;
  int bank_count_t0 = 0;
  const regex regex_t1(R"(^bank_\d+_t1$)");
  const regex regex_t0(R"(^bank_\d+_t0$)");
  for (const auto& arg : args_info) {
    if (regex_match(arg.name, regex_t1)) ++bank_count_t1;
    if (regex_match(arg.name, regex_t0)) ++bank_count_t0;
  }
#endif  // SODA_CPP_BINDING
  auto round_up = [](int64_t a, int64_t b) -> int64_t { return ((a - 1) / b + 1) * b; };

  // some run-time constants
  const int elem_count_per_cycle_t1 = burst_width / kWidth_t1 * bank_count_t1;
  const int elem_count_per_cycle_t0 = burst_width / kWidth_t0 * bank_count_t0;
  int32_t tile_count_dim_0 = (var_t1_extent[0] - kStencilDim0 + 1 - 1) / (tile_size_0 - kStencilDim0 + 1) + 1;
  int32_t tile_count_dim_1 = (var_t1_extent[1] - kStencilDim1 + 1 - 1) / (tile_size_1 - kStencilDim1 + 1) + 1;
  int64_t tile_count = tile_count_dim_0 * tile_count_dim_1;

  // align each linearized tile to multiples of burst_width
  int64_t elem_count_per_tile = tile_size_0 * tile_size_1 * var_t1_extent[2];
  int64_t cycle_count_per_tile = (elem_count_per_tile - 1) / elem_count_per_cycle_t1 + 1;
  int64_t elem_count_aligned_per_tile_i = cycle_count_per_tile * elem_count_per_cycle_t1;
  int64_t elem_count_aligned_per_tile_o = cycle_count_per_tile * elem_count_per_cycle_t0;

  // calculate size of each buffer
  int64_t buf_size_t1 = (tile_count * elem_count_aligned_per_tile_i + round_up(kStencilDistance, elem_count_per_cycle_t1)) / bank_count_t1 * sizeof(Type_t1);
  int64_t buf_size_t0 = (tile_count * elem_count_aligned_per_tile_o + round_up(kStencilDistance, elem_count_per_cycle_t0)) / bank_count_t0 * sizeof(Type_t0);

  // allocate memory for each buffer
  vector<unique_ptr<Type_t1, decltype(&free)>> buf_t1;
  buf_t1.reserve(bank_count_t1);
  for (int bank = 0; bank < bank_count_t1; ++bank) {
    buf_t1.emplace_back(static_cast<Type_t1*>(aligned_alloc(4096, round_up(buf_size_t1, 4096))), &free);
  }
  vector<unique_ptr<Type_t0, decltype(&free)>> buf_t0;
  buf_t0.reserve(bank_count_t0);
  for (int bank = 0; bank < bank_count_t0; ++bank) {
    buf_t0.emplace_back(static_cast<Type_t0*>(aligned_alloc(4096, round_up(buf_size_t0, 4096))), &free);
  }

  // tiling
  for(int32_t tile_index_dim_1 = 0; tile_index_dim_1 < tile_count_dim_1; ++tile_index_dim_1)
  {
    int32_t actual_tile_size_dim_1 = (tile_index_dim_1==tile_count_dim_1-1) ? var_t1_extent[1] - (tile_size_1 - kStencilDim1 + 1) * tile_index_dim_1 : tile_size_1;
    for(int32_t tile_index_dim_0 = 0; tile_index_dim_0 < tile_count_dim_0; ++tile_index_dim_0)
    {
      int32_t actual_tile_size_dim_0 = (tile_index_dim_0==tile_count_dim_0-1) ? var_t1_extent[0] - (tile_size_0 - kStencilDim0 + 1) * tile_index_dim_0 : tile_size_0;
#pragma omp parallel for
      for(int32_t k = 0; k < var_t1_extent[2]; ++k)
      {
        for(int32_t j = 0; j < actual_tile_size_dim_1; ++j)
        {
          for(int32_t i = 0; i < actual_tile_size_dim_0; ++i)
          {
            // (x, y, z, w) is coordinates in tiled image
            // (p, q, r, s) is coordinates in original image
            // (i, j, k, l) is coordinates in a tile
            int32_t burst_index = (i + j * tile_size_0 + k * tile_size_0 * tile_size_1) / elem_count_per_cycle_t1;
            int32_t burst_residue = (i + j * tile_size_0 + k * tile_size_0 * tile_size_1) % elem_count_per_cycle_t1;
            int32_t p = tile_index_dim_0 * (tile_size_0 - kStencilDim0) + i;
            int32_t q = tile_index_dim_1 * (tile_size_1 - kStencilDim1) + j;
            int32_t r = k;
            int64_t tiled_offset = (tile_index_dim_0 + tile_count_dim_0 * tile_index_dim_1) * elem_count_aligned_per_tile_i + burst_index * elem_count_per_cycle_t1 + burst_residue;
            int64_t original_offset = p * var_t1_stride[0] + q * var_t1_stride[1] + r * var_t1_stride[2];
            buf_t1[tiled_offset % bank_count_t1].get()[tiled_offset / bank_count_t1] = var_t1_ptr[std::max(int64_t(0), original_offset - 0)];
          }
        }
      }
    }
  }

  clog << "INFO: tile_count[0] = " << tile_count_dim_0 << ", tile_size[0] = " << tile_size_0 << endl;
  clog << "INFO: tile_count[1] = " << tile_count_dim_1 << ", tile_size[1] = " << tile_size_1 << endl;
  clog << "INFO: t1.extent[0] = " << var_t1_extent[0] << ", t1.extent[1] = " << var_t1_extent[1] << ", t1.extent[2] = " << var_t1_extent[2] << "" << endl;
  clog << "INFO: t1.stride[0] = " << var_t1_stride[0] << ", t1.stride[1] = " << var_t1_stride[1] << ", t1.stride[2] = " << var_t1_stride[2] << "" << endl;
  clog << "INFO: t1.min[0] = " << var_t1_min[0] << ", t1.min[1] = " << var_t1_min[1] << ", t1.min[2] = " << var_t1_min[2] << "" << endl;
  clog << "INFO: t0.extent[0] = " << var_t0_extent[0] << ", t0.extent[1] = " << var_t0_extent[1] << ", t0.extent[2] = " << var_t0_extent[2] << "" << endl;
  clog << "INFO: t0.stride[0] = " << var_t0_stride[0] << ", t0.stride[1] = " << var_t0_stride[1] << ", t0.stride[2] = " << var_t0_stride[2] << "" << endl;
  clog << "INFO: t0.min[0] = " << var_t0_min[0] << ", t0.min[1] = " << var_t0_min[1] << ", t0.min[2] = " << var_t0_min[2] << "" << endl;

  int64_t tile_data_count = ((int64_t(var_t1_extent[2]) * tile_size_0 * tile_size_1 - 1) / elem_count_per_cycle_t1 + 1) * elem_count_per_cycle_t1 / unroll_factor;
  int64_t cycle_count = ((int64_t(var_t1_extent[2]) * tile_size_0 * tile_size_1 * tile_count_dim_0 * tile_count_dim_1 + kStencilDistance - 1) / elem_count_per_cycle_t1 + 1);
  clog << "INFO: tile_data_count = " << tile_data_count << ", cycle_count = " << cycle_count << endl;

#ifdef SODA_CPP_BINDING
#ifdef SODA_TAPA_BINDING
  ::jacobi3d_kernel(
    tapa::write_only_mmap<float>(buf_t0[0].get(), buf_size_t0).vectorized<16>(), 
    tapa::read_only_mmap<float>(buf_t1[0].get(), buf_size_t1).vectorized<16>(), 
    cycle_count);

#else  // SODA_TAPA_BINDING
  ::jacobi3d_kernel(
    (ap_uint<512>*)buf_t0[0].get(), 
    (ap_uint<512>*)buf_t1[0].get(), 
    cycle_count);

#endif  // SODA_TAPA_BINDING
#else  // SODA_CPP_BINDING
  int arg_idx = 0;
  auto iter_t1 = buf_t1.begin();
  auto iter_t0 = buf_t0.begin();
  for (const auto& arg : args_info) {
    if (arg.name == "coalesced_data_num") {
      instance.SetArg(arg_idx, cycle_count);
      ++arg_idx;
    } else if (regex_match(arg.name, regex_t1)) {
      auto buf = fpga::WriteOnly(iter_t1->get(), buf_size_t1 / sizeof(Type_t1));
      instance.SetArg(arg_idx, buf);
      ++iter_t1;
      ++arg_idx;
    } else if (regex_match(arg.name, regex_t0)) {
      auto buf = fpga::ReadOnly(iter_t0->get(), buf_size_t0 / sizeof(Type_t0));
      instance.SetArg(arg_idx, buf);
      ++iter_t0;
      ++arg_idx;
    }
  }

  instance.WriteToDevice();
  instance.Exec();
  instance.ReadFromDevice();
  instance.Finish();

  clog << "Load throughput: " << std::setprecision(3) << instance.LoadThroughputGbps() << " GB/s" << endl;
  clog << "Compute latency: " << std::setprecision(3) << instance.ComputeTimeSeconds() << " s" << endl;
  clog << "Compute throughput (t1): " << std::setprecision(3) << var_t1_extent[0] * var_t1_extent[1] * var_t1_extent[2] / instance.ComputeTimeSeconds() * 1e-9 << " pixel/ns" << endl;
  clog << "Compute throughput (t0): " << std::setprecision(3) << var_t0_extent[0] * var_t0_extent[1] * var_t0_extent[2] / instance.ComputeTimeSeconds() * 1e-9 << " pixel/ns" << endl;
  clog << "Store throughput: " << std::setprecision(3) << instance.StoreThroughputGbps() <<" GB/s" << endl;
#endif  // SODA_CPP_BINDING

  for(int32_t tile_index_dim_1 = 0; tile_index_dim_1 < tile_count_dim_1; ++tile_index_dim_1)
  {
    int32_t actual_tile_size_dim_1 = (tile_index_dim_1 == tile_count_dim_1-1) ? var_t1_extent[1] - (tile_size_1 - kStencilDim1 + 1) * tile_index_dim_1 : tile_size_1;
    for(int32_t tile_index_dim_0 = 0; tile_index_dim_0 < tile_count_dim_0; ++tile_index_dim_0)
    {
      int32_t actual_tile_size_dim_0 = (tile_index_dim_0 == tile_count_dim_0-1) ? var_t1_extent[0] - (tile_size_0 - kStencilDim0 + 1) * tile_index_dim_0 : tile_size_0;
#pragma omp parallel for
      for(int32_t k = 109; k < var_t0_extent[2] - 109; ++k)
      {
        for(int32_t j = 109; j < actual_tile_size_dim_1 - 109; ++j)
        {
          for(int32_t i = 109; i < actual_tile_size_dim_0 - 109; ++i)
          {
            // (x, y, z, w) is coordinates in tiled image
            // (p, q, r, s) is coordinates in original image
            // (i, j, k, l) is coordinates in a tile
            int32_t p = tile_index_dim_0 * (tile_size_0-kStencilDim0 + 1) + i;
            int32_t q = tile_index_dim_1 * (tile_size_1-kStencilDim1 + 1) + j;
            int32_t r = k;
            int64_t original_offset = p * var_t0_stride[0] + q * var_t0_stride[1] + r * var_t0_stride[2];
            int32_t burst_index_t0 = (i + j * tile_size_0 + k * tile_size_0 * tile_size_1 + 111616) / elem_count_per_cycle_t0;
            int32_t burst_residue_t0 = (i + j * tile_size_0 + k * tile_size_0 * tile_size_1 + 111616) % elem_count_per_cycle_t0;
            int64_t tiled_offset_t0 = (tile_index_dim_0+tile_count_dim_0 * tile_index_dim_1) * elem_count_aligned_per_tile_o + burst_index_t0 * elem_count_per_cycle_t0 + burst_residue_t0;
            var_t0_ptr[original_offset] = buf_t0[tiled_offset_t0 % bank_count_t0].get()[tiled_offset_t0 / bank_count_t0];
          }
        }
      }
    }
  }
  return 0;
}

} // namespace app
} // namespace soda

#ifdef SODA_TEST_MAIN

#include <ap_int.h>
#include <gflags/gflags.h>

int main(int argc, char *argv[])
{
  gflags::ParseCommandLineFlags(&argc, &argv, true);
  if (argc < 2 || argc > 5) {
    clog << "Usage: \n  " << argv[0] << " <xclbin> [input dimension 0] [input dimension 1] [input dimension 2]" << endl;
    return 2;
  }
  const char* xclbin = argv[1];
  int32_t dims[3] = {1, 1, soda::app::kStencilDim2 + 1};
  // int32_t dims[3] = {32, 32, soda::app::kStencilDim2 + 1};
  if (argc > 2) {
    dims[0] = std::max(dims[0], atoi(argv[2]));
  }
  if (argc > 3) {
    dims[1] = std::max(dims[1], atoi(argv[3]));
  }
  if (argc > 4) {
    dims[2] = std::max(dims[2], atoi(argv[4]));
  }

  vector<float> data_t1(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1[3] = {0, 0, 0};
  vector<float> data_t1_iter1(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter1[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter1[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter1[3] = {0, 0, 0};
  vector<float> data_t1_iter2(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter2[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter2[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter2[3] = {0, 0, 0};
  vector<float> data_t1_iter3(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter3[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter3[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter3[3] = {0, 0, 0};
  vector<float> data_t1_iter4(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter4[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter4[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter4[3] = {0, 0, 0};
  vector<float> data_t1_iter5(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter5[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter5[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter5[3] = {0, 0, 0};
  vector<float> data_t1_iter6(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter6[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter6[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter6[3] = {0, 0, 0};
  vector<float> data_t1_iter7(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter7[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter7[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter7[3] = {0, 0, 0};
  vector<float> data_t1_iter8(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter8[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter8[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter8[3] = {0, 0, 0};
  vector<float> data_t1_iter9(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter9[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter9[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter9[3] = {0, 0, 0};
  vector<float> data_t1_iter10(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter10[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter10[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter10[3] = {0, 0, 0};
  vector<float> data_t1_iter11(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter11[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter11[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter11[3] = {0, 0, 0};
  vector<float> data_t1_iter12(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter12[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter12[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter12[3] = {0, 0, 0};
  vector<float> data_t1_iter13(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter13[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter13[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter13[3] = {0, 0, 0};
  vector<float> data_t1_iter14(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter14[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter14[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter14[3] = {0, 0, 0};
  vector<float> data_t1_iter15(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter15[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter15[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter15[3] = {0, 0, 0};
  vector<float> data_t1_iter16(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter16[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter16[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter16[3] = {0, 0, 0};
  vector<float> data_t1_iter17(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter17[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter17[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter17[3] = {0, 0, 0};
  vector<float> data_t1_iter18(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter18[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter18[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter18[3] = {0, 0, 0};
  vector<float> data_t1_iter19(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter19[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter19[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter19[3] = {0, 0, 0};
  vector<float> data_t1_iter20(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter20[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter20[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter20[3] = {0, 0, 0};
  vector<float> data_t1_iter21(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter21[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter21[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter21[3] = {0, 0, 0};
  vector<float> data_t1_iter22(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter22[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter22[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter22[3] = {0, 0, 0};
  vector<float> data_t1_iter23(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter23[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter23[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter23[3] = {0, 0, 0};
  vector<float> data_t1_iter24(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter24[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter24[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter24[3] = {0, 0, 0};
  vector<float> data_t1_iter25(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter25[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter25[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter25[3] = {0, 0, 0};
  vector<float> data_t1_iter26(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter26[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter26[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter26[3] = {0, 0, 0};
  vector<float> data_t1_iter27(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter27[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter27[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter27[3] = {0, 0, 0};
  vector<float> data_t1_iter28(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter28[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter28[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter28[3] = {0, 0, 0};
  vector<float> data_t1_iter29(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter29[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter29[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter29[3] = {0, 0, 0};
  vector<float> data_t1_iter30(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter30[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter30[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter30[3] = {0, 0, 0};
  vector<float> data_t1_iter31(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter31[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter31[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter31[3] = {0, 0, 0};
  vector<float> data_t1_iter32(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter32[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter32[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter32[3] = {0, 0, 0};
  vector<float> data_t1_iter33(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter33[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter33[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter33[3] = {0, 0, 0};
  vector<float> data_t1_iter34(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter34[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter34[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter34[3] = {0, 0, 0};
  vector<float> data_t1_iter35(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter35[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter35[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter35[3] = {0, 0, 0};
  vector<float> data_t1_iter36(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter36[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter36[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter36[3] = {0, 0, 0};
  vector<float> data_t1_iter37(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter37[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter37[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter37[3] = {0, 0, 0};
  vector<float> data_t1_iter38(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter38[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter38[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter38[3] = {0, 0, 0};
  vector<float> data_t1_iter39(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter39[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter39[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter39[3] = {0, 0, 0};
  vector<float> data_t1_iter40(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter40[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter40[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter40[3] = {0, 0, 0};
  vector<float> data_t1_iter41(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter41[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter41[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter41[3] = {0, 0, 0};
  vector<float> data_t1_iter42(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter42[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter42[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter42[3] = {0, 0, 0};
  vector<float> data_t1_iter43(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter43[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter43[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter43[3] = {0, 0, 0};
  vector<float> data_t1_iter44(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter44[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter44[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter44[3] = {0, 0, 0};
  vector<float> data_t1_iter45(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter45[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter45[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter45[3] = {0, 0, 0};
  vector<float> data_t1_iter46(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter46[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter46[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter46[3] = {0, 0, 0};
  vector<float> data_t1_iter47(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter47[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter47[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter47[3] = {0, 0, 0};
  vector<float> data_t1_iter48(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter48[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter48[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter48[3] = {0, 0, 0};
  vector<float> data_t1_iter49(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter49[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter49[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter49[3] = {0, 0, 0};
  vector<float> data_t1_iter50(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter50[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter50[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter50[3] = {0, 0, 0};
  vector<float> data_t1_iter51(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter51[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter51[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter51[3] = {0, 0, 0};
  vector<float> data_t1_iter52(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter52[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter52[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter52[3] = {0, 0, 0};
  vector<float> data_t1_iter53(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter53[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter53[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter53[3] = {0, 0, 0};
  vector<float> data_t1_iter54(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter54[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter54[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter54[3] = {0, 0, 0};
  vector<float> data_t1_iter55(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter55[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter55[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter55[3] = {0, 0, 0};
  vector<float> data_t1_iter56(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter56[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter56[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter56[3] = {0, 0, 0};
  vector<float> data_t1_iter57(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter57[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter57[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter57[3] = {0, 0, 0};
  vector<float> data_t1_iter58(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter58[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter58[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter58[3] = {0, 0, 0};
  vector<float> data_t1_iter59(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter59[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter59[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter59[3] = {0, 0, 0};
  vector<float> data_t1_iter60(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter60[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter60[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter60[3] = {0, 0, 0};
  vector<float> data_t1_iter61(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter61[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter61[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter61[3] = {0, 0, 0};
  vector<float> data_t1_iter62(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter62[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter62[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter62[3] = {0, 0, 0};
  vector<float> data_t1_iter63(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter63[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter63[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter63[3] = {0, 0, 0};
  vector<float> data_t1_iter64(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter64[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter64[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter64[3] = {0, 0, 0};
  vector<float> data_t1_iter65(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter65[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter65[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter65[3] = {0, 0, 0};
  vector<float> data_t1_iter66(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter66[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter66[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter66[3] = {0, 0, 0};
  vector<float> data_t1_iter67(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter67[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter67[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter67[3] = {0, 0, 0};
  vector<float> data_t1_iter68(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter68[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter68[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter68[3] = {0, 0, 0};
  vector<float> data_t1_iter69(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter69[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter69[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter69[3] = {0, 0, 0};
  vector<float> data_t1_iter70(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter70[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter70[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter70[3] = {0, 0, 0};
  vector<float> data_t1_iter71(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter71[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter71[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter71[3] = {0, 0, 0};
  vector<float> data_t1_iter72(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter72[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter72[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter72[3] = {0, 0, 0};
  vector<float> data_t1_iter73(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter73[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter73[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter73[3] = {0, 0, 0};
  vector<float> data_t1_iter74(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter74[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter74[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter74[3] = {0, 0, 0};
  vector<float> data_t1_iter75(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter75[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter75[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter75[3] = {0, 0, 0};
  vector<float> data_t1_iter76(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter76[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter76[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter76[3] = {0, 0, 0};
  vector<float> data_t1_iter77(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter77[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter77[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter77[3] = {0, 0, 0};
  vector<float> data_t1_iter78(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter78[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter78[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter78[3] = {0, 0, 0};
  vector<float> data_t1_iter79(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter79[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter79[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter79[3] = {0, 0, 0};
  vector<float> data_t1_iter80(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter80[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter80[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter80[3] = {0, 0, 0};
  vector<float> data_t1_iter81(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter81[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter81[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter81[3] = {0, 0, 0};
  vector<float> data_t1_iter82(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter82[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter82[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter82[3] = {0, 0, 0};
  vector<float> data_t1_iter83(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter83[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter83[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter83[3] = {0, 0, 0};
  vector<float> data_t1_iter84(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter84[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter84[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter84[3] = {0, 0, 0};
  vector<float> data_t1_iter85(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter85[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter85[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter85[3] = {0, 0, 0};
  vector<float> data_t1_iter86(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter86[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter86[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter86[3] = {0, 0, 0};
  vector<float> data_t1_iter87(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter87[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter87[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter87[3] = {0, 0, 0};
  vector<float> data_t1_iter88(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter88[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter88[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter88[3] = {0, 0, 0};
  vector<float> data_t1_iter89(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter89[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter89[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter89[3] = {0, 0, 0};
  vector<float> data_t1_iter90(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter90[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter90[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter90[3] = {0, 0, 0};
  vector<float> data_t1_iter91(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter91[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter91[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter91[3] = {0, 0, 0};
  vector<float> data_t1_iter92(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter92[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter92[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter92[3] = {0, 0, 0};
  vector<float> data_t1_iter93(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter93[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter93[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter93[3] = {0, 0, 0};
  vector<float> data_t1_iter94(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter94[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter94[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter94[3] = {0, 0, 0};
  vector<float> data_t1_iter95(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter95[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter95[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter95[3] = {0, 0, 0};
  vector<float> data_t1_iter96(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter96[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter96[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter96[3] = {0, 0, 0};
  vector<float> data_t1_iter97(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter97[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter97[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter97[3] = {0, 0, 0};
  vector<float> data_t1_iter98(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter98[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter98[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter98[3] = {0, 0, 0};
  vector<float> data_t1_iter99(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter99[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter99[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter99[3] = {0, 0, 0};
  vector<float> data_t1_iter100(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter100[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter100[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter100[3] = {0, 0, 0};
  vector<float> data_t1_iter101(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter101[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter101[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter101[3] = {0, 0, 0};
  vector<float> data_t1_iter102(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter102[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter102[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter102[3] = {0, 0, 0};
  vector<float> data_t1_iter103(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter103[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter103[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter103[3] = {0, 0, 0};
  vector<float> data_t1_iter104(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter104[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter104[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter104[3] = {0, 0, 0};
  vector<float> data_t1_iter105(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter105[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter105[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter105[3] = {0, 0, 0};
  vector<float> data_t1_iter106(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter106[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter106[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter106[3] = {0, 0, 0};
  vector<float> data_t1_iter107(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter107[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter107[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter107[3] = {0, 0, 0};
  vector<float> data_t1_iter108(dims[0] * dims[1] * dims[2]);
  int32_t extent_t1_iter108[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t1_iter108[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t1_iter108[3] = {0, 0, 0};
  vector<float> data_t0(dims[0] * dims[1] * dims[2]);
  int32_t extent_t0[3] = {dims[0], dims[1], dims[2]};
  int32_t stride_t0[3] = {1, dims[0], dims[0] * dims[1]};
  int32_t min_t0[3] = {0, 0, 0};

  std::default_random_engine generator;
  std::uniform_real_distribution<double> distribution(0.0, 1.0);

  // initialization can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 0; r < dims[2]; ++r)
  {
    for(int32_t q = 0; q < dims[1]; ++q)
    {
      for(int32_t p = 0; p < dims[0]; ++p)
      {
        data_t1[p * stride_t1[0] + q * stride_t1[1] + r * stride_t1[2]] = distribution(generator);
      }
    }
  }

  soda::app::jacobi3d(
    data_t1.data(), 
    extent_t1, 
    stride_t1, 
    min_t1, 
    data_t0.data(), 
    extent_t0, 
    stride_t0, 
    min_t0, 
    xclbin);

  int error_count = 0;

  // produce t1_iter1, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 1; r < dims[2] - 1; ++r)
  {
    for(int32_t q = 1; q < dims[1] - 1; ++q)
    {
      for(int32_t p = 1; p < dims[0] - 1; ++p)
      {
        // t1_iter1(0, 0, 0) = ((t1(0, 0, 0) + t1(1, 0, 0) + t1(-1, 0, 0) + t1(0, 1, 0) + t1(0, -1, 0) + t1(0, 0, 1) + t1(0, 0, -1)) * 0.142857142f)
        data_t1_iter1[p*stride_t1_iter1[0]+q*stride_t1_iter1[1]+r*stride_t1_iter1[2]] = ((data_t1[(p+0)*stride_t1[0] + (q+0)*stride_t1[1] + (r+0)*stride_t1[2]] + data_t1[(p+1)*stride_t1[0] + (q+0)*stride_t1[1] + (r+0)*stride_t1[2]] + data_t1[(p-1)*stride_t1[0] + (q+0)*stride_t1[1] + (r+0)*stride_t1[2]] + data_t1[(p+0)*stride_t1[0] + (q+1)*stride_t1[1] + (r+0)*stride_t1[2]] + data_t1[(p+0)*stride_t1[0] + (q-1)*stride_t1[1] + (r+0)*stride_t1[2]] + data_t1[(p+0)*stride_t1[0] + (q+0)*stride_t1[1] + (r+1)*stride_t1[2]] + data_t1[(p+0)*stride_t1[0] + (q+0)*stride_t1[1] + (r-1)*stride_t1[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter2, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 2; r < dims[2] - 2; ++r)
  {
    for(int32_t q = 2; q < dims[1] - 2; ++q)
    {
      for(int32_t p = 2; p < dims[0] - 2; ++p)
      {
        // t1_iter2(0, 0, 0) = ((t1_iter1(0, 0, 0) + t1_iter1(1, 0, 0) + t1_iter1(-1, 0, 0) + t1_iter1(0, 1, 0) + t1_iter1(0, -1, 0) + t1_iter1(0, 0, 1) + t1_iter1(0, 0, -1)) * 0.142857142f)
        data_t1_iter2[p*stride_t1_iter2[0]+q*stride_t1_iter2[1]+r*stride_t1_iter2[2]] = ((data_t1_iter1[(p+0)*stride_t1_iter1[0] + (q+0)*stride_t1_iter1[1] + (r+0)*stride_t1_iter1[2]] + data_t1_iter1[(p+1)*stride_t1_iter1[0] + (q+0)*stride_t1_iter1[1] + (r+0)*stride_t1_iter1[2]] + data_t1_iter1[(p-1)*stride_t1_iter1[0] + (q+0)*stride_t1_iter1[1] + (r+0)*stride_t1_iter1[2]] + data_t1_iter1[(p+0)*stride_t1_iter1[0] + (q+1)*stride_t1_iter1[1] + (r+0)*stride_t1_iter1[2]] + data_t1_iter1[(p+0)*stride_t1_iter1[0] + (q-1)*stride_t1_iter1[1] + (r+0)*stride_t1_iter1[2]] + data_t1_iter1[(p+0)*stride_t1_iter1[0] + (q+0)*stride_t1_iter1[1] + (r+1)*stride_t1_iter1[2]] + data_t1_iter1[(p+0)*stride_t1_iter1[0] + (q+0)*stride_t1_iter1[1] + (r-1)*stride_t1_iter1[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter3, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 3; r < dims[2] - 3; ++r)
  {
    for(int32_t q = 3; q < dims[1] - 3; ++q)
    {
      for(int32_t p = 3; p < dims[0] - 3; ++p)
      {
        // t1_iter3(0, 0, 0) = ((t1_iter2(0, 0, 0) + t1_iter2(1, 0, 0) + t1_iter2(-1, 0, 0) + t1_iter2(0, 1, 0) + t1_iter2(0, -1, 0) + t1_iter2(0, 0, 1) + t1_iter2(0, 0, -1)) * 0.142857142f)
        data_t1_iter3[p*stride_t1_iter3[0]+q*stride_t1_iter3[1]+r*stride_t1_iter3[2]] = ((data_t1_iter2[(p+0)*stride_t1_iter2[0] + (q+0)*stride_t1_iter2[1] + (r+0)*stride_t1_iter2[2]] + data_t1_iter2[(p+1)*stride_t1_iter2[0] + (q+0)*stride_t1_iter2[1] + (r+0)*stride_t1_iter2[2]] + data_t1_iter2[(p-1)*stride_t1_iter2[0] + (q+0)*stride_t1_iter2[1] + (r+0)*stride_t1_iter2[2]] + data_t1_iter2[(p+0)*stride_t1_iter2[0] + (q+1)*stride_t1_iter2[1] + (r+0)*stride_t1_iter2[2]] + data_t1_iter2[(p+0)*stride_t1_iter2[0] + (q-1)*stride_t1_iter2[1] + (r+0)*stride_t1_iter2[2]] + data_t1_iter2[(p+0)*stride_t1_iter2[0] + (q+0)*stride_t1_iter2[1] + (r+1)*stride_t1_iter2[2]] + data_t1_iter2[(p+0)*stride_t1_iter2[0] + (q+0)*stride_t1_iter2[1] + (r-1)*stride_t1_iter2[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter4, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 4; r < dims[2] - 4; ++r)
  {
    for(int32_t q = 4; q < dims[1] - 4; ++q)
    {
      for(int32_t p = 4; p < dims[0] - 4; ++p)
      {
        // t1_iter4(0, 0, 0) = ((t1_iter3(0, 0, 0) + t1_iter3(1, 0, 0) + t1_iter3(-1, 0, 0) + t1_iter3(0, 1, 0) + t1_iter3(0, -1, 0) + t1_iter3(0, 0, 1) + t1_iter3(0, 0, -1)) * 0.142857142f)
        data_t1_iter4[p*stride_t1_iter4[0]+q*stride_t1_iter4[1]+r*stride_t1_iter4[2]] = ((data_t1_iter3[(p+0)*stride_t1_iter3[0] + (q+0)*stride_t1_iter3[1] + (r+0)*stride_t1_iter3[2]] + data_t1_iter3[(p+1)*stride_t1_iter3[0] + (q+0)*stride_t1_iter3[1] + (r+0)*stride_t1_iter3[2]] + data_t1_iter3[(p-1)*stride_t1_iter3[0] + (q+0)*stride_t1_iter3[1] + (r+0)*stride_t1_iter3[2]] + data_t1_iter3[(p+0)*stride_t1_iter3[0] + (q+1)*stride_t1_iter3[1] + (r+0)*stride_t1_iter3[2]] + data_t1_iter3[(p+0)*stride_t1_iter3[0] + (q-1)*stride_t1_iter3[1] + (r+0)*stride_t1_iter3[2]] + data_t1_iter3[(p+0)*stride_t1_iter3[0] + (q+0)*stride_t1_iter3[1] + (r+1)*stride_t1_iter3[2]] + data_t1_iter3[(p+0)*stride_t1_iter3[0] + (q+0)*stride_t1_iter3[1] + (r-1)*stride_t1_iter3[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter5, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 5; r < dims[2] - 5; ++r)
  {
    for(int32_t q = 5; q < dims[1] - 5; ++q)
    {
      for(int32_t p = 5; p < dims[0] - 5; ++p)
      {
        // t1_iter5(0, 0, 0) = ((t1_iter4(0, 0, 0) + t1_iter4(1, 0, 0) + t1_iter4(-1, 0, 0) + t1_iter4(0, 1, 0) + t1_iter4(0, -1, 0) + t1_iter4(0, 0, 1) + t1_iter4(0, 0, -1)) * 0.142857142f)
        data_t1_iter5[p*stride_t1_iter5[0]+q*stride_t1_iter5[1]+r*stride_t1_iter5[2]] = ((data_t1_iter4[(p+0)*stride_t1_iter4[0] + (q+0)*stride_t1_iter4[1] + (r+0)*stride_t1_iter4[2]] + data_t1_iter4[(p+1)*stride_t1_iter4[0] + (q+0)*stride_t1_iter4[1] + (r+0)*stride_t1_iter4[2]] + data_t1_iter4[(p-1)*stride_t1_iter4[0] + (q+0)*stride_t1_iter4[1] + (r+0)*stride_t1_iter4[2]] + data_t1_iter4[(p+0)*stride_t1_iter4[0] + (q+1)*stride_t1_iter4[1] + (r+0)*stride_t1_iter4[2]] + data_t1_iter4[(p+0)*stride_t1_iter4[0] + (q-1)*stride_t1_iter4[1] + (r+0)*stride_t1_iter4[2]] + data_t1_iter4[(p+0)*stride_t1_iter4[0] + (q+0)*stride_t1_iter4[1] + (r+1)*stride_t1_iter4[2]] + data_t1_iter4[(p+0)*stride_t1_iter4[0] + (q+0)*stride_t1_iter4[1] + (r-1)*stride_t1_iter4[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter6, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 6; r < dims[2] - 6; ++r)
  {
    for(int32_t q = 6; q < dims[1] - 6; ++q)
    {
      for(int32_t p = 6; p < dims[0] - 6; ++p)
      {
        // t1_iter6(0, 0, 0) = ((t1_iter5(0, 0, 0) + t1_iter5(1, 0, 0) + t1_iter5(-1, 0, 0) + t1_iter5(0, 1, 0) + t1_iter5(0, -1, 0) + t1_iter5(0, 0, 1) + t1_iter5(0, 0, -1)) * 0.142857142f)
        data_t1_iter6[p*stride_t1_iter6[0]+q*stride_t1_iter6[1]+r*stride_t1_iter6[2]] = ((data_t1_iter5[(p+0)*stride_t1_iter5[0] + (q+0)*stride_t1_iter5[1] + (r+0)*stride_t1_iter5[2]] + data_t1_iter5[(p+1)*stride_t1_iter5[0] + (q+0)*stride_t1_iter5[1] + (r+0)*stride_t1_iter5[2]] + data_t1_iter5[(p-1)*stride_t1_iter5[0] + (q+0)*stride_t1_iter5[1] + (r+0)*stride_t1_iter5[2]] + data_t1_iter5[(p+0)*stride_t1_iter5[0] + (q+1)*stride_t1_iter5[1] + (r+0)*stride_t1_iter5[2]] + data_t1_iter5[(p+0)*stride_t1_iter5[0] + (q-1)*stride_t1_iter5[1] + (r+0)*stride_t1_iter5[2]] + data_t1_iter5[(p+0)*stride_t1_iter5[0] + (q+0)*stride_t1_iter5[1] + (r+1)*stride_t1_iter5[2]] + data_t1_iter5[(p+0)*stride_t1_iter5[0] + (q+0)*stride_t1_iter5[1] + (r-1)*stride_t1_iter5[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter7, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 7; r < dims[2] - 7; ++r)
  {
    for(int32_t q = 7; q < dims[1] - 7; ++q)
    {
      for(int32_t p = 7; p < dims[0] - 7; ++p)
      {
        // t1_iter7(0, 0, 0) = ((t1_iter6(0, 0, 0) + t1_iter6(1, 0, 0) + t1_iter6(-1, 0, 0) + t1_iter6(0, 1, 0) + t1_iter6(0, -1, 0) + t1_iter6(0, 0, 1) + t1_iter6(0, 0, -1)) * 0.142857142f)
        data_t1_iter7[p*stride_t1_iter7[0]+q*stride_t1_iter7[1]+r*stride_t1_iter7[2]] = ((data_t1_iter6[(p+0)*stride_t1_iter6[0] + (q+0)*stride_t1_iter6[1] + (r+0)*stride_t1_iter6[2]] + data_t1_iter6[(p+1)*stride_t1_iter6[0] + (q+0)*stride_t1_iter6[1] + (r+0)*stride_t1_iter6[2]] + data_t1_iter6[(p-1)*stride_t1_iter6[0] + (q+0)*stride_t1_iter6[1] + (r+0)*stride_t1_iter6[2]] + data_t1_iter6[(p+0)*stride_t1_iter6[0] + (q+1)*stride_t1_iter6[1] + (r+0)*stride_t1_iter6[2]] + data_t1_iter6[(p+0)*stride_t1_iter6[0] + (q-1)*stride_t1_iter6[1] + (r+0)*stride_t1_iter6[2]] + data_t1_iter6[(p+0)*stride_t1_iter6[0] + (q+0)*stride_t1_iter6[1] + (r+1)*stride_t1_iter6[2]] + data_t1_iter6[(p+0)*stride_t1_iter6[0] + (q+0)*stride_t1_iter6[1] + (r-1)*stride_t1_iter6[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter8, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 8; r < dims[2] - 8; ++r)
  {
    for(int32_t q = 8; q < dims[1] - 8; ++q)
    {
      for(int32_t p = 8; p < dims[0] - 8; ++p)
      {
        // t1_iter8(0, 0, 0) = ((t1_iter7(0, 0, 0) + t1_iter7(1, 0, 0) + t1_iter7(-1, 0, 0) + t1_iter7(0, 1, 0) + t1_iter7(0, -1, 0) + t1_iter7(0, 0, 1) + t1_iter7(0, 0, -1)) * 0.142857142f)
        data_t1_iter8[p*stride_t1_iter8[0]+q*stride_t1_iter8[1]+r*stride_t1_iter8[2]] = ((data_t1_iter7[(p+0)*stride_t1_iter7[0] + (q+0)*stride_t1_iter7[1] + (r+0)*stride_t1_iter7[2]] + data_t1_iter7[(p+1)*stride_t1_iter7[0] + (q+0)*stride_t1_iter7[1] + (r+0)*stride_t1_iter7[2]] + data_t1_iter7[(p-1)*stride_t1_iter7[0] + (q+0)*stride_t1_iter7[1] + (r+0)*stride_t1_iter7[2]] + data_t1_iter7[(p+0)*stride_t1_iter7[0] + (q+1)*stride_t1_iter7[1] + (r+0)*stride_t1_iter7[2]] + data_t1_iter7[(p+0)*stride_t1_iter7[0] + (q-1)*stride_t1_iter7[1] + (r+0)*stride_t1_iter7[2]] + data_t1_iter7[(p+0)*stride_t1_iter7[0] + (q+0)*stride_t1_iter7[1] + (r+1)*stride_t1_iter7[2]] + data_t1_iter7[(p+0)*stride_t1_iter7[0] + (q+0)*stride_t1_iter7[1] + (r-1)*stride_t1_iter7[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter9, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 9; r < dims[2] - 9; ++r)
  {
    for(int32_t q = 9; q < dims[1] - 9; ++q)
    {
      for(int32_t p = 9; p < dims[0] - 9; ++p)
      {
        // t1_iter9(0, 0, 0) = ((t1_iter8(0, 0, 0) + t1_iter8(1, 0, 0) + t1_iter8(-1, 0, 0) + t1_iter8(0, 1, 0) + t1_iter8(0, -1, 0) + t1_iter8(0, 0, 1) + t1_iter8(0, 0, -1)) * 0.142857142f)
        data_t1_iter9[p*stride_t1_iter9[0]+q*stride_t1_iter9[1]+r*stride_t1_iter9[2]] = ((data_t1_iter8[(p+0)*stride_t1_iter8[0] + (q+0)*stride_t1_iter8[1] + (r+0)*stride_t1_iter8[2]] + data_t1_iter8[(p+1)*stride_t1_iter8[0] + (q+0)*stride_t1_iter8[1] + (r+0)*stride_t1_iter8[2]] + data_t1_iter8[(p-1)*stride_t1_iter8[0] + (q+0)*stride_t1_iter8[1] + (r+0)*stride_t1_iter8[2]] + data_t1_iter8[(p+0)*stride_t1_iter8[0] + (q+1)*stride_t1_iter8[1] + (r+0)*stride_t1_iter8[2]] + data_t1_iter8[(p+0)*stride_t1_iter8[0] + (q-1)*stride_t1_iter8[1] + (r+0)*stride_t1_iter8[2]] + data_t1_iter8[(p+0)*stride_t1_iter8[0] + (q+0)*stride_t1_iter8[1] + (r+1)*stride_t1_iter8[2]] + data_t1_iter8[(p+0)*stride_t1_iter8[0] + (q+0)*stride_t1_iter8[1] + (r-1)*stride_t1_iter8[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter10, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 10; r < dims[2] - 10; ++r)
  {
    for(int32_t q = 10; q < dims[1] - 10; ++q)
    {
      for(int32_t p = 10; p < dims[0] - 10; ++p)
      {
        // t1_iter10(0, 0, 0) = ((t1_iter9(0, 0, 0) + t1_iter9(1, 0, 0) + t1_iter9(-1, 0, 0) + t1_iter9(0, 1, 0) + t1_iter9(0, -1, 0) + t1_iter9(0, 0, 1) + t1_iter9(0, 0, -1)) * 0.142857142f)
        data_t1_iter10[p*stride_t1_iter10[0]+q*stride_t1_iter10[1]+r*stride_t1_iter10[2]] = ((data_t1_iter9[(p+0)*stride_t1_iter9[0] + (q+0)*stride_t1_iter9[1] + (r+0)*stride_t1_iter9[2]] + data_t1_iter9[(p+1)*stride_t1_iter9[0] + (q+0)*stride_t1_iter9[1] + (r+0)*stride_t1_iter9[2]] + data_t1_iter9[(p-1)*stride_t1_iter9[0] + (q+0)*stride_t1_iter9[1] + (r+0)*stride_t1_iter9[2]] + data_t1_iter9[(p+0)*stride_t1_iter9[0] + (q+1)*stride_t1_iter9[1] + (r+0)*stride_t1_iter9[2]] + data_t1_iter9[(p+0)*stride_t1_iter9[0] + (q-1)*stride_t1_iter9[1] + (r+0)*stride_t1_iter9[2]] + data_t1_iter9[(p+0)*stride_t1_iter9[0] + (q+0)*stride_t1_iter9[1] + (r+1)*stride_t1_iter9[2]] + data_t1_iter9[(p+0)*stride_t1_iter9[0] + (q+0)*stride_t1_iter9[1] + (r-1)*stride_t1_iter9[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter11, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 11; r < dims[2] - 11; ++r)
  {
    for(int32_t q = 11; q < dims[1] - 11; ++q)
    {
      for(int32_t p = 11; p < dims[0] - 11; ++p)
      {
        // t1_iter11(0, 0, 0) = ((t1_iter10(0, 0, 0) + t1_iter10(1, 0, 0) + t1_iter10(-1, 0, 0) + t1_iter10(0, 1, 0) + t1_iter10(0, -1, 0) + t1_iter10(0, 0, 1) + t1_iter10(0, 0, -1)) * 0.142857142f)
        data_t1_iter11[p*stride_t1_iter11[0]+q*stride_t1_iter11[1]+r*stride_t1_iter11[2]] = ((data_t1_iter10[(p+0)*stride_t1_iter10[0] + (q+0)*stride_t1_iter10[1] + (r+0)*stride_t1_iter10[2]] + data_t1_iter10[(p+1)*stride_t1_iter10[0] + (q+0)*stride_t1_iter10[1] + (r+0)*stride_t1_iter10[2]] + data_t1_iter10[(p-1)*stride_t1_iter10[0] + (q+0)*stride_t1_iter10[1] + (r+0)*stride_t1_iter10[2]] + data_t1_iter10[(p+0)*stride_t1_iter10[0] + (q+1)*stride_t1_iter10[1] + (r+0)*stride_t1_iter10[2]] + data_t1_iter10[(p+0)*stride_t1_iter10[0] + (q-1)*stride_t1_iter10[1] + (r+0)*stride_t1_iter10[2]] + data_t1_iter10[(p+0)*stride_t1_iter10[0] + (q+0)*stride_t1_iter10[1] + (r+1)*stride_t1_iter10[2]] + data_t1_iter10[(p+0)*stride_t1_iter10[0] + (q+0)*stride_t1_iter10[1] + (r-1)*stride_t1_iter10[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter12, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 12; r < dims[2] - 12; ++r)
  {
    for(int32_t q = 12; q < dims[1] - 12; ++q)
    {
      for(int32_t p = 12; p < dims[0] - 12; ++p)
      {
        // t1_iter12(0, 0, 0) = ((t1_iter11(0, 0, 0) + t1_iter11(1, 0, 0) + t1_iter11(-1, 0, 0) + t1_iter11(0, 1, 0) + t1_iter11(0, -1, 0) + t1_iter11(0, 0, 1) + t1_iter11(0, 0, -1)) * 0.142857142f)
        data_t1_iter12[p*stride_t1_iter12[0]+q*stride_t1_iter12[1]+r*stride_t1_iter12[2]] = ((data_t1_iter11[(p+0)*stride_t1_iter11[0] + (q+0)*stride_t1_iter11[1] + (r+0)*stride_t1_iter11[2]] + data_t1_iter11[(p+1)*stride_t1_iter11[0] + (q+0)*stride_t1_iter11[1] + (r+0)*stride_t1_iter11[2]] + data_t1_iter11[(p-1)*stride_t1_iter11[0] + (q+0)*stride_t1_iter11[1] + (r+0)*stride_t1_iter11[2]] + data_t1_iter11[(p+0)*stride_t1_iter11[0] + (q+1)*stride_t1_iter11[1] + (r+0)*stride_t1_iter11[2]] + data_t1_iter11[(p+0)*stride_t1_iter11[0] + (q-1)*stride_t1_iter11[1] + (r+0)*stride_t1_iter11[2]] + data_t1_iter11[(p+0)*stride_t1_iter11[0] + (q+0)*stride_t1_iter11[1] + (r+1)*stride_t1_iter11[2]] + data_t1_iter11[(p+0)*stride_t1_iter11[0] + (q+0)*stride_t1_iter11[1] + (r-1)*stride_t1_iter11[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter13, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 13; r < dims[2] - 13; ++r)
  {
    for(int32_t q = 13; q < dims[1] - 13; ++q)
    {
      for(int32_t p = 13; p < dims[0] - 13; ++p)
      {
        // t1_iter13(0, 0, 0) = ((t1_iter12(0, 0, 0) + t1_iter12(1, 0, 0) + t1_iter12(-1, 0, 0) + t1_iter12(0, 1, 0) + t1_iter12(0, -1, 0) + t1_iter12(0, 0, 1) + t1_iter12(0, 0, -1)) * 0.142857142f)
        data_t1_iter13[p*stride_t1_iter13[0]+q*stride_t1_iter13[1]+r*stride_t1_iter13[2]] = ((data_t1_iter12[(p+0)*stride_t1_iter12[0] + (q+0)*stride_t1_iter12[1] + (r+0)*stride_t1_iter12[2]] + data_t1_iter12[(p+1)*stride_t1_iter12[0] + (q+0)*stride_t1_iter12[1] + (r+0)*stride_t1_iter12[2]] + data_t1_iter12[(p-1)*stride_t1_iter12[0] + (q+0)*stride_t1_iter12[1] + (r+0)*stride_t1_iter12[2]] + data_t1_iter12[(p+0)*stride_t1_iter12[0] + (q+1)*stride_t1_iter12[1] + (r+0)*stride_t1_iter12[2]] + data_t1_iter12[(p+0)*stride_t1_iter12[0] + (q-1)*stride_t1_iter12[1] + (r+0)*stride_t1_iter12[2]] + data_t1_iter12[(p+0)*stride_t1_iter12[0] + (q+0)*stride_t1_iter12[1] + (r+1)*stride_t1_iter12[2]] + data_t1_iter12[(p+0)*stride_t1_iter12[0] + (q+0)*stride_t1_iter12[1] + (r-1)*stride_t1_iter12[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter14, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 14; r < dims[2] - 14; ++r)
  {
    for(int32_t q = 14; q < dims[1] - 14; ++q)
    {
      for(int32_t p = 14; p < dims[0] - 14; ++p)
      {
        // t1_iter14(0, 0, 0) = ((t1_iter13(0, 0, 0) + t1_iter13(1, 0, 0) + t1_iter13(-1, 0, 0) + t1_iter13(0, 1, 0) + t1_iter13(0, -1, 0) + t1_iter13(0, 0, 1) + t1_iter13(0, 0, -1)) * 0.142857142f)
        data_t1_iter14[p*stride_t1_iter14[0]+q*stride_t1_iter14[1]+r*stride_t1_iter14[2]] = ((data_t1_iter13[(p+0)*stride_t1_iter13[0] + (q+0)*stride_t1_iter13[1] + (r+0)*stride_t1_iter13[2]] + data_t1_iter13[(p+1)*stride_t1_iter13[0] + (q+0)*stride_t1_iter13[1] + (r+0)*stride_t1_iter13[2]] + data_t1_iter13[(p-1)*stride_t1_iter13[0] + (q+0)*stride_t1_iter13[1] + (r+0)*stride_t1_iter13[2]] + data_t1_iter13[(p+0)*stride_t1_iter13[0] + (q+1)*stride_t1_iter13[1] + (r+0)*stride_t1_iter13[2]] + data_t1_iter13[(p+0)*stride_t1_iter13[0] + (q-1)*stride_t1_iter13[1] + (r+0)*stride_t1_iter13[2]] + data_t1_iter13[(p+0)*stride_t1_iter13[0] + (q+0)*stride_t1_iter13[1] + (r+1)*stride_t1_iter13[2]] + data_t1_iter13[(p+0)*stride_t1_iter13[0] + (q+0)*stride_t1_iter13[1] + (r-1)*stride_t1_iter13[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter15, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 15; r < dims[2] - 15; ++r)
  {
    for(int32_t q = 15; q < dims[1] - 15; ++q)
    {
      for(int32_t p = 15; p < dims[0] - 15; ++p)
      {
        // t1_iter15(0, 0, 0) = ((t1_iter14(0, 0, 0) + t1_iter14(1, 0, 0) + t1_iter14(-1, 0, 0) + t1_iter14(0, 1, 0) + t1_iter14(0, -1, 0) + t1_iter14(0, 0, 1) + t1_iter14(0, 0, -1)) * 0.142857142f)
        data_t1_iter15[p*stride_t1_iter15[0]+q*stride_t1_iter15[1]+r*stride_t1_iter15[2]] = ((data_t1_iter14[(p+0)*stride_t1_iter14[0] + (q+0)*stride_t1_iter14[1] + (r+0)*stride_t1_iter14[2]] + data_t1_iter14[(p+1)*stride_t1_iter14[0] + (q+0)*stride_t1_iter14[1] + (r+0)*stride_t1_iter14[2]] + data_t1_iter14[(p-1)*stride_t1_iter14[0] + (q+0)*stride_t1_iter14[1] + (r+0)*stride_t1_iter14[2]] + data_t1_iter14[(p+0)*stride_t1_iter14[0] + (q+1)*stride_t1_iter14[1] + (r+0)*stride_t1_iter14[2]] + data_t1_iter14[(p+0)*stride_t1_iter14[0] + (q-1)*stride_t1_iter14[1] + (r+0)*stride_t1_iter14[2]] + data_t1_iter14[(p+0)*stride_t1_iter14[0] + (q+0)*stride_t1_iter14[1] + (r+1)*stride_t1_iter14[2]] + data_t1_iter14[(p+0)*stride_t1_iter14[0] + (q+0)*stride_t1_iter14[1] + (r-1)*stride_t1_iter14[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter16, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 16; r < dims[2] - 16; ++r)
  {
    for(int32_t q = 16; q < dims[1] - 16; ++q)
    {
      for(int32_t p = 16; p < dims[0] - 16; ++p)
      {
        // t1_iter16(0, 0, 0) = ((t1_iter15(0, 0, 0) + t1_iter15(1, 0, 0) + t1_iter15(-1, 0, 0) + t1_iter15(0, 1, 0) + t1_iter15(0, -1, 0) + t1_iter15(0, 0, 1) + t1_iter15(0, 0, -1)) * 0.142857142f)
        data_t1_iter16[p*stride_t1_iter16[0]+q*stride_t1_iter16[1]+r*stride_t1_iter16[2]] = ((data_t1_iter15[(p+0)*stride_t1_iter15[0] + (q+0)*stride_t1_iter15[1] + (r+0)*stride_t1_iter15[2]] + data_t1_iter15[(p+1)*stride_t1_iter15[0] + (q+0)*stride_t1_iter15[1] + (r+0)*stride_t1_iter15[2]] + data_t1_iter15[(p-1)*stride_t1_iter15[0] + (q+0)*stride_t1_iter15[1] + (r+0)*stride_t1_iter15[2]] + data_t1_iter15[(p+0)*stride_t1_iter15[0] + (q+1)*stride_t1_iter15[1] + (r+0)*stride_t1_iter15[2]] + data_t1_iter15[(p+0)*stride_t1_iter15[0] + (q-1)*stride_t1_iter15[1] + (r+0)*stride_t1_iter15[2]] + data_t1_iter15[(p+0)*stride_t1_iter15[0] + (q+0)*stride_t1_iter15[1] + (r+1)*stride_t1_iter15[2]] + data_t1_iter15[(p+0)*stride_t1_iter15[0] + (q+0)*stride_t1_iter15[1] + (r-1)*stride_t1_iter15[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter17, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 17; r < dims[2] - 17; ++r)
  {
    for(int32_t q = 17; q < dims[1] - 17; ++q)
    {
      for(int32_t p = 17; p < dims[0] - 17; ++p)
      {
        // t1_iter17(0, 0, 0) = ((t1_iter16(0, 0, 0) + t1_iter16(1, 0, 0) + t1_iter16(-1, 0, 0) + t1_iter16(0, 1, 0) + t1_iter16(0, -1, 0) + t1_iter16(0, 0, 1) + t1_iter16(0, 0, -1)) * 0.142857142f)
        data_t1_iter17[p*stride_t1_iter17[0]+q*stride_t1_iter17[1]+r*stride_t1_iter17[2]] = ((data_t1_iter16[(p+0)*stride_t1_iter16[0] + (q+0)*stride_t1_iter16[1] + (r+0)*stride_t1_iter16[2]] + data_t1_iter16[(p+1)*stride_t1_iter16[0] + (q+0)*stride_t1_iter16[1] + (r+0)*stride_t1_iter16[2]] + data_t1_iter16[(p-1)*stride_t1_iter16[0] + (q+0)*stride_t1_iter16[1] + (r+0)*stride_t1_iter16[2]] + data_t1_iter16[(p+0)*stride_t1_iter16[0] + (q+1)*stride_t1_iter16[1] + (r+0)*stride_t1_iter16[2]] + data_t1_iter16[(p+0)*stride_t1_iter16[0] + (q-1)*stride_t1_iter16[1] + (r+0)*stride_t1_iter16[2]] + data_t1_iter16[(p+0)*stride_t1_iter16[0] + (q+0)*stride_t1_iter16[1] + (r+1)*stride_t1_iter16[2]] + data_t1_iter16[(p+0)*stride_t1_iter16[0] + (q+0)*stride_t1_iter16[1] + (r-1)*stride_t1_iter16[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter18, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 18; r < dims[2] - 18; ++r)
  {
    for(int32_t q = 18; q < dims[1] - 18; ++q)
    {
      for(int32_t p = 18; p < dims[0] - 18; ++p)
      {
        // t1_iter18(0, 0, 0) = ((t1_iter17(0, 0, 0) + t1_iter17(1, 0, 0) + t1_iter17(-1, 0, 0) + t1_iter17(0, 1, 0) + t1_iter17(0, -1, 0) + t1_iter17(0, 0, 1) + t1_iter17(0, 0, -1)) * 0.142857142f)
        data_t1_iter18[p*stride_t1_iter18[0]+q*stride_t1_iter18[1]+r*stride_t1_iter18[2]] = ((data_t1_iter17[(p+0)*stride_t1_iter17[0] + (q+0)*stride_t1_iter17[1] + (r+0)*stride_t1_iter17[2]] + data_t1_iter17[(p+1)*stride_t1_iter17[0] + (q+0)*stride_t1_iter17[1] + (r+0)*stride_t1_iter17[2]] + data_t1_iter17[(p-1)*stride_t1_iter17[0] + (q+0)*stride_t1_iter17[1] + (r+0)*stride_t1_iter17[2]] + data_t1_iter17[(p+0)*stride_t1_iter17[0] + (q+1)*stride_t1_iter17[1] + (r+0)*stride_t1_iter17[2]] + data_t1_iter17[(p+0)*stride_t1_iter17[0] + (q-1)*stride_t1_iter17[1] + (r+0)*stride_t1_iter17[2]] + data_t1_iter17[(p+0)*stride_t1_iter17[0] + (q+0)*stride_t1_iter17[1] + (r+1)*stride_t1_iter17[2]] + data_t1_iter17[(p+0)*stride_t1_iter17[0] + (q+0)*stride_t1_iter17[1] + (r-1)*stride_t1_iter17[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter19, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 19; r < dims[2] - 19; ++r)
  {
    for(int32_t q = 19; q < dims[1] - 19; ++q)
    {
      for(int32_t p = 19; p < dims[0] - 19; ++p)
      {
        // t1_iter19(0, 0, 0) = ((t1_iter18(0, 0, 0) + t1_iter18(1, 0, 0) + t1_iter18(-1, 0, 0) + t1_iter18(0, 1, 0) + t1_iter18(0, -1, 0) + t1_iter18(0, 0, 1) + t1_iter18(0, 0, -1)) * 0.142857142f)
        data_t1_iter19[p*stride_t1_iter19[0]+q*stride_t1_iter19[1]+r*stride_t1_iter19[2]] = ((data_t1_iter18[(p+0)*stride_t1_iter18[0] + (q+0)*stride_t1_iter18[1] + (r+0)*stride_t1_iter18[2]] + data_t1_iter18[(p+1)*stride_t1_iter18[0] + (q+0)*stride_t1_iter18[1] + (r+0)*stride_t1_iter18[2]] + data_t1_iter18[(p-1)*stride_t1_iter18[0] + (q+0)*stride_t1_iter18[1] + (r+0)*stride_t1_iter18[2]] + data_t1_iter18[(p+0)*stride_t1_iter18[0] + (q+1)*stride_t1_iter18[1] + (r+0)*stride_t1_iter18[2]] + data_t1_iter18[(p+0)*stride_t1_iter18[0] + (q-1)*stride_t1_iter18[1] + (r+0)*stride_t1_iter18[2]] + data_t1_iter18[(p+0)*stride_t1_iter18[0] + (q+0)*stride_t1_iter18[1] + (r+1)*stride_t1_iter18[2]] + data_t1_iter18[(p+0)*stride_t1_iter18[0] + (q+0)*stride_t1_iter18[1] + (r-1)*stride_t1_iter18[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter20, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 20; r < dims[2] - 20; ++r)
  {
    for(int32_t q = 20; q < dims[1] - 20; ++q)
    {
      for(int32_t p = 20; p < dims[0] - 20; ++p)
      {
        // t1_iter20(0, 0, 0) = ((t1_iter19(0, 0, 0) + t1_iter19(1, 0, 0) + t1_iter19(-1, 0, 0) + t1_iter19(0, 1, 0) + t1_iter19(0, -1, 0) + t1_iter19(0, 0, 1) + t1_iter19(0, 0, -1)) * 0.142857142f)
        data_t1_iter20[p*stride_t1_iter20[0]+q*stride_t1_iter20[1]+r*stride_t1_iter20[2]] = ((data_t1_iter19[(p+0)*stride_t1_iter19[0] + (q+0)*stride_t1_iter19[1] + (r+0)*stride_t1_iter19[2]] + data_t1_iter19[(p+1)*stride_t1_iter19[0] + (q+0)*stride_t1_iter19[1] + (r+0)*stride_t1_iter19[2]] + data_t1_iter19[(p-1)*stride_t1_iter19[0] + (q+0)*stride_t1_iter19[1] + (r+0)*stride_t1_iter19[2]] + data_t1_iter19[(p+0)*stride_t1_iter19[0] + (q+1)*stride_t1_iter19[1] + (r+0)*stride_t1_iter19[2]] + data_t1_iter19[(p+0)*stride_t1_iter19[0] + (q-1)*stride_t1_iter19[1] + (r+0)*stride_t1_iter19[2]] + data_t1_iter19[(p+0)*stride_t1_iter19[0] + (q+0)*stride_t1_iter19[1] + (r+1)*stride_t1_iter19[2]] + data_t1_iter19[(p+0)*stride_t1_iter19[0] + (q+0)*stride_t1_iter19[1] + (r-1)*stride_t1_iter19[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter21, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 21; r < dims[2] - 21; ++r)
  {
    for(int32_t q = 21; q < dims[1] - 21; ++q)
    {
      for(int32_t p = 21; p < dims[0] - 21; ++p)
      {
        // t1_iter21(0, 0, 0) = ((t1_iter20(0, 0, 0) + t1_iter20(1, 0, 0) + t1_iter20(-1, 0, 0) + t1_iter20(0, 1, 0) + t1_iter20(0, -1, 0) + t1_iter20(0, 0, 1) + t1_iter20(0, 0, -1)) * 0.142857142f)
        data_t1_iter21[p*stride_t1_iter21[0]+q*stride_t1_iter21[1]+r*stride_t1_iter21[2]] = ((data_t1_iter20[(p+0)*stride_t1_iter20[0] + (q+0)*stride_t1_iter20[1] + (r+0)*stride_t1_iter20[2]] + data_t1_iter20[(p+1)*stride_t1_iter20[0] + (q+0)*stride_t1_iter20[1] + (r+0)*stride_t1_iter20[2]] + data_t1_iter20[(p-1)*stride_t1_iter20[0] + (q+0)*stride_t1_iter20[1] + (r+0)*stride_t1_iter20[2]] + data_t1_iter20[(p+0)*stride_t1_iter20[0] + (q+1)*stride_t1_iter20[1] + (r+0)*stride_t1_iter20[2]] + data_t1_iter20[(p+0)*stride_t1_iter20[0] + (q-1)*stride_t1_iter20[1] + (r+0)*stride_t1_iter20[2]] + data_t1_iter20[(p+0)*stride_t1_iter20[0] + (q+0)*stride_t1_iter20[1] + (r+1)*stride_t1_iter20[2]] + data_t1_iter20[(p+0)*stride_t1_iter20[0] + (q+0)*stride_t1_iter20[1] + (r-1)*stride_t1_iter20[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter22, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 22; r < dims[2] - 22; ++r)
  {
    for(int32_t q = 22; q < dims[1] - 22; ++q)
    {
      for(int32_t p = 22; p < dims[0] - 22; ++p)
      {
        // t1_iter22(0, 0, 0) = ((t1_iter21(0, 0, 0) + t1_iter21(1, 0, 0) + t1_iter21(-1, 0, 0) + t1_iter21(0, 1, 0) + t1_iter21(0, -1, 0) + t1_iter21(0, 0, 1) + t1_iter21(0, 0, -1)) * 0.142857142f)
        data_t1_iter22[p*stride_t1_iter22[0]+q*stride_t1_iter22[1]+r*stride_t1_iter22[2]] = ((data_t1_iter21[(p+0)*stride_t1_iter21[0] + (q+0)*stride_t1_iter21[1] + (r+0)*stride_t1_iter21[2]] + data_t1_iter21[(p+1)*stride_t1_iter21[0] + (q+0)*stride_t1_iter21[1] + (r+0)*stride_t1_iter21[2]] + data_t1_iter21[(p-1)*stride_t1_iter21[0] + (q+0)*stride_t1_iter21[1] + (r+0)*stride_t1_iter21[2]] + data_t1_iter21[(p+0)*stride_t1_iter21[0] + (q+1)*stride_t1_iter21[1] + (r+0)*stride_t1_iter21[2]] + data_t1_iter21[(p+0)*stride_t1_iter21[0] + (q-1)*stride_t1_iter21[1] + (r+0)*stride_t1_iter21[2]] + data_t1_iter21[(p+0)*stride_t1_iter21[0] + (q+0)*stride_t1_iter21[1] + (r+1)*stride_t1_iter21[2]] + data_t1_iter21[(p+0)*stride_t1_iter21[0] + (q+0)*stride_t1_iter21[1] + (r-1)*stride_t1_iter21[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter23, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 23; r < dims[2] - 23; ++r)
  {
    for(int32_t q = 23; q < dims[1] - 23; ++q)
    {
      for(int32_t p = 23; p < dims[0] - 23; ++p)
      {
        // t1_iter23(0, 0, 0) = ((t1_iter22(0, 0, 0) + t1_iter22(1, 0, 0) + t1_iter22(-1, 0, 0) + t1_iter22(0, 1, 0) + t1_iter22(0, -1, 0) + t1_iter22(0, 0, 1) + t1_iter22(0, 0, -1)) * 0.142857142f)
        data_t1_iter23[p*stride_t1_iter23[0]+q*stride_t1_iter23[1]+r*stride_t1_iter23[2]] = ((data_t1_iter22[(p+0)*stride_t1_iter22[0] + (q+0)*stride_t1_iter22[1] + (r+0)*stride_t1_iter22[2]] + data_t1_iter22[(p+1)*stride_t1_iter22[0] + (q+0)*stride_t1_iter22[1] + (r+0)*stride_t1_iter22[2]] + data_t1_iter22[(p-1)*stride_t1_iter22[0] + (q+0)*stride_t1_iter22[1] + (r+0)*stride_t1_iter22[2]] + data_t1_iter22[(p+0)*stride_t1_iter22[0] + (q+1)*stride_t1_iter22[1] + (r+0)*stride_t1_iter22[2]] + data_t1_iter22[(p+0)*stride_t1_iter22[0] + (q-1)*stride_t1_iter22[1] + (r+0)*stride_t1_iter22[2]] + data_t1_iter22[(p+0)*stride_t1_iter22[0] + (q+0)*stride_t1_iter22[1] + (r+1)*stride_t1_iter22[2]] + data_t1_iter22[(p+0)*stride_t1_iter22[0] + (q+0)*stride_t1_iter22[1] + (r-1)*stride_t1_iter22[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter24, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 24; r < dims[2] - 24; ++r)
  {
    for(int32_t q = 24; q < dims[1] - 24; ++q)
    {
      for(int32_t p = 24; p < dims[0] - 24; ++p)
      {
        // t1_iter24(0, 0, 0) = ((t1_iter23(0, 0, 0) + t1_iter23(1, 0, 0) + t1_iter23(-1, 0, 0) + t1_iter23(0, 1, 0) + t1_iter23(0, -1, 0) + t1_iter23(0, 0, 1) + t1_iter23(0, 0, -1)) * 0.142857142f)
        data_t1_iter24[p*stride_t1_iter24[0]+q*stride_t1_iter24[1]+r*stride_t1_iter24[2]] = ((data_t1_iter23[(p+0)*stride_t1_iter23[0] + (q+0)*stride_t1_iter23[1] + (r+0)*stride_t1_iter23[2]] + data_t1_iter23[(p+1)*stride_t1_iter23[0] + (q+0)*stride_t1_iter23[1] + (r+0)*stride_t1_iter23[2]] + data_t1_iter23[(p-1)*stride_t1_iter23[0] + (q+0)*stride_t1_iter23[1] + (r+0)*stride_t1_iter23[2]] + data_t1_iter23[(p+0)*stride_t1_iter23[0] + (q+1)*stride_t1_iter23[1] + (r+0)*stride_t1_iter23[2]] + data_t1_iter23[(p+0)*stride_t1_iter23[0] + (q-1)*stride_t1_iter23[1] + (r+0)*stride_t1_iter23[2]] + data_t1_iter23[(p+0)*stride_t1_iter23[0] + (q+0)*stride_t1_iter23[1] + (r+1)*stride_t1_iter23[2]] + data_t1_iter23[(p+0)*stride_t1_iter23[0] + (q+0)*stride_t1_iter23[1] + (r-1)*stride_t1_iter23[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter25, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 25; r < dims[2] - 25; ++r)
  {
    for(int32_t q = 25; q < dims[1] - 25; ++q)
    {
      for(int32_t p = 25; p < dims[0] - 25; ++p)
      {
        // t1_iter25(0, 0, 0) = ((t1_iter24(0, 0, 0) + t1_iter24(1, 0, 0) + t1_iter24(-1, 0, 0) + t1_iter24(0, 1, 0) + t1_iter24(0, -1, 0) + t1_iter24(0, 0, 1) + t1_iter24(0, 0, -1)) * 0.142857142f)
        data_t1_iter25[p*stride_t1_iter25[0]+q*stride_t1_iter25[1]+r*stride_t1_iter25[2]] = ((data_t1_iter24[(p+0)*stride_t1_iter24[0] + (q+0)*stride_t1_iter24[1] + (r+0)*stride_t1_iter24[2]] + data_t1_iter24[(p+1)*stride_t1_iter24[0] + (q+0)*stride_t1_iter24[1] + (r+0)*stride_t1_iter24[2]] + data_t1_iter24[(p-1)*stride_t1_iter24[0] + (q+0)*stride_t1_iter24[1] + (r+0)*stride_t1_iter24[2]] + data_t1_iter24[(p+0)*stride_t1_iter24[0] + (q+1)*stride_t1_iter24[1] + (r+0)*stride_t1_iter24[2]] + data_t1_iter24[(p+0)*stride_t1_iter24[0] + (q-1)*stride_t1_iter24[1] + (r+0)*stride_t1_iter24[2]] + data_t1_iter24[(p+0)*stride_t1_iter24[0] + (q+0)*stride_t1_iter24[1] + (r+1)*stride_t1_iter24[2]] + data_t1_iter24[(p+0)*stride_t1_iter24[0] + (q+0)*stride_t1_iter24[1] + (r-1)*stride_t1_iter24[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter26, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 26; r < dims[2] - 26; ++r)
  {
    for(int32_t q = 26; q < dims[1] - 26; ++q)
    {
      for(int32_t p = 26; p < dims[0] - 26; ++p)
      {
        // t1_iter26(0, 0, 0) = ((t1_iter25(0, 0, 0) + t1_iter25(1, 0, 0) + t1_iter25(-1, 0, 0) + t1_iter25(0, 1, 0) + t1_iter25(0, -1, 0) + t1_iter25(0, 0, 1) + t1_iter25(0, 0, -1)) * 0.142857142f)
        data_t1_iter26[p*stride_t1_iter26[0]+q*stride_t1_iter26[1]+r*stride_t1_iter26[2]] = ((data_t1_iter25[(p+0)*stride_t1_iter25[0] + (q+0)*stride_t1_iter25[1] + (r+0)*stride_t1_iter25[2]] + data_t1_iter25[(p+1)*stride_t1_iter25[0] + (q+0)*stride_t1_iter25[1] + (r+0)*stride_t1_iter25[2]] + data_t1_iter25[(p-1)*stride_t1_iter25[0] + (q+0)*stride_t1_iter25[1] + (r+0)*stride_t1_iter25[2]] + data_t1_iter25[(p+0)*stride_t1_iter25[0] + (q+1)*stride_t1_iter25[1] + (r+0)*stride_t1_iter25[2]] + data_t1_iter25[(p+0)*stride_t1_iter25[0] + (q-1)*stride_t1_iter25[1] + (r+0)*stride_t1_iter25[2]] + data_t1_iter25[(p+0)*stride_t1_iter25[0] + (q+0)*stride_t1_iter25[1] + (r+1)*stride_t1_iter25[2]] + data_t1_iter25[(p+0)*stride_t1_iter25[0] + (q+0)*stride_t1_iter25[1] + (r-1)*stride_t1_iter25[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter27, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 27; r < dims[2] - 27; ++r)
  {
    for(int32_t q = 27; q < dims[1] - 27; ++q)
    {
      for(int32_t p = 27; p < dims[0] - 27; ++p)
      {
        // t1_iter27(0, 0, 0) = ((t1_iter26(0, 0, 0) + t1_iter26(1, 0, 0) + t1_iter26(-1, 0, 0) + t1_iter26(0, 1, 0) + t1_iter26(0, -1, 0) + t1_iter26(0, 0, 1) + t1_iter26(0, 0, -1)) * 0.142857142f)
        data_t1_iter27[p*stride_t1_iter27[0]+q*stride_t1_iter27[1]+r*stride_t1_iter27[2]] = ((data_t1_iter26[(p+0)*stride_t1_iter26[0] + (q+0)*stride_t1_iter26[1] + (r+0)*stride_t1_iter26[2]] + data_t1_iter26[(p+1)*stride_t1_iter26[0] + (q+0)*stride_t1_iter26[1] + (r+0)*stride_t1_iter26[2]] + data_t1_iter26[(p-1)*stride_t1_iter26[0] + (q+0)*stride_t1_iter26[1] + (r+0)*stride_t1_iter26[2]] + data_t1_iter26[(p+0)*stride_t1_iter26[0] + (q+1)*stride_t1_iter26[1] + (r+0)*stride_t1_iter26[2]] + data_t1_iter26[(p+0)*stride_t1_iter26[0] + (q-1)*stride_t1_iter26[1] + (r+0)*stride_t1_iter26[2]] + data_t1_iter26[(p+0)*stride_t1_iter26[0] + (q+0)*stride_t1_iter26[1] + (r+1)*stride_t1_iter26[2]] + data_t1_iter26[(p+0)*stride_t1_iter26[0] + (q+0)*stride_t1_iter26[1] + (r-1)*stride_t1_iter26[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter28, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 28; r < dims[2] - 28; ++r)
  {
    for(int32_t q = 28; q < dims[1] - 28; ++q)
    {
      for(int32_t p = 28; p < dims[0] - 28; ++p)
      {
        // t1_iter28(0, 0, 0) = ((t1_iter27(0, 0, 0) + t1_iter27(1, 0, 0) + t1_iter27(-1, 0, 0) + t1_iter27(0, 1, 0) + t1_iter27(0, -1, 0) + t1_iter27(0, 0, 1) + t1_iter27(0, 0, -1)) * 0.142857142f)
        data_t1_iter28[p*stride_t1_iter28[0]+q*stride_t1_iter28[1]+r*stride_t1_iter28[2]] = ((data_t1_iter27[(p+0)*stride_t1_iter27[0] + (q+0)*stride_t1_iter27[1] + (r+0)*stride_t1_iter27[2]] + data_t1_iter27[(p+1)*stride_t1_iter27[0] + (q+0)*stride_t1_iter27[1] + (r+0)*stride_t1_iter27[2]] + data_t1_iter27[(p-1)*stride_t1_iter27[0] + (q+0)*stride_t1_iter27[1] + (r+0)*stride_t1_iter27[2]] + data_t1_iter27[(p+0)*stride_t1_iter27[0] + (q+1)*stride_t1_iter27[1] + (r+0)*stride_t1_iter27[2]] + data_t1_iter27[(p+0)*stride_t1_iter27[0] + (q-1)*stride_t1_iter27[1] + (r+0)*stride_t1_iter27[2]] + data_t1_iter27[(p+0)*stride_t1_iter27[0] + (q+0)*stride_t1_iter27[1] + (r+1)*stride_t1_iter27[2]] + data_t1_iter27[(p+0)*stride_t1_iter27[0] + (q+0)*stride_t1_iter27[1] + (r-1)*stride_t1_iter27[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter29, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 29; r < dims[2] - 29; ++r)
  {
    for(int32_t q = 29; q < dims[1] - 29; ++q)
    {
      for(int32_t p = 29; p < dims[0] - 29; ++p)
      {
        // t1_iter29(0, 0, 0) = ((t1_iter28(0, 0, 0) + t1_iter28(1, 0, 0) + t1_iter28(-1, 0, 0) + t1_iter28(0, 1, 0) + t1_iter28(0, -1, 0) + t1_iter28(0, 0, 1) + t1_iter28(0, 0, -1)) * 0.142857142f)
        data_t1_iter29[p*stride_t1_iter29[0]+q*stride_t1_iter29[1]+r*stride_t1_iter29[2]] = ((data_t1_iter28[(p+0)*stride_t1_iter28[0] + (q+0)*stride_t1_iter28[1] + (r+0)*stride_t1_iter28[2]] + data_t1_iter28[(p+1)*stride_t1_iter28[0] + (q+0)*stride_t1_iter28[1] + (r+0)*stride_t1_iter28[2]] + data_t1_iter28[(p-1)*stride_t1_iter28[0] + (q+0)*stride_t1_iter28[1] + (r+0)*stride_t1_iter28[2]] + data_t1_iter28[(p+0)*stride_t1_iter28[0] + (q+1)*stride_t1_iter28[1] + (r+0)*stride_t1_iter28[2]] + data_t1_iter28[(p+0)*stride_t1_iter28[0] + (q-1)*stride_t1_iter28[1] + (r+0)*stride_t1_iter28[2]] + data_t1_iter28[(p+0)*stride_t1_iter28[0] + (q+0)*stride_t1_iter28[1] + (r+1)*stride_t1_iter28[2]] + data_t1_iter28[(p+0)*stride_t1_iter28[0] + (q+0)*stride_t1_iter28[1] + (r-1)*stride_t1_iter28[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter30, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 30; r < dims[2] - 30; ++r)
  {
    for(int32_t q = 30; q < dims[1] - 30; ++q)
    {
      for(int32_t p = 30; p < dims[0] - 30; ++p)
      {
        // t1_iter30(0, 0, 0) = ((t1_iter29(0, 0, 0) + t1_iter29(1, 0, 0) + t1_iter29(-1, 0, 0) + t1_iter29(0, 1, 0) + t1_iter29(0, -1, 0) + t1_iter29(0, 0, 1) + t1_iter29(0, 0, -1)) * 0.142857142f)
        data_t1_iter30[p*stride_t1_iter30[0]+q*stride_t1_iter30[1]+r*stride_t1_iter30[2]] = ((data_t1_iter29[(p+0)*stride_t1_iter29[0] + (q+0)*stride_t1_iter29[1] + (r+0)*stride_t1_iter29[2]] + data_t1_iter29[(p+1)*stride_t1_iter29[0] + (q+0)*stride_t1_iter29[1] + (r+0)*stride_t1_iter29[2]] + data_t1_iter29[(p-1)*stride_t1_iter29[0] + (q+0)*stride_t1_iter29[1] + (r+0)*stride_t1_iter29[2]] + data_t1_iter29[(p+0)*stride_t1_iter29[0] + (q+1)*stride_t1_iter29[1] + (r+0)*stride_t1_iter29[2]] + data_t1_iter29[(p+0)*stride_t1_iter29[0] + (q-1)*stride_t1_iter29[1] + (r+0)*stride_t1_iter29[2]] + data_t1_iter29[(p+0)*stride_t1_iter29[0] + (q+0)*stride_t1_iter29[1] + (r+1)*stride_t1_iter29[2]] + data_t1_iter29[(p+0)*stride_t1_iter29[0] + (q+0)*stride_t1_iter29[1] + (r-1)*stride_t1_iter29[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter31, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 31; r < dims[2] - 31; ++r)
  {
    for(int32_t q = 31; q < dims[1] - 31; ++q)
    {
      for(int32_t p = 31; p < dims[0] - 31; ++p)
      {
        // t1_iter31(0, 0, 0) = ((t1_iter30(0, 0, 0) + t1_iter30(1, 0, 0) + t1_iter30(-1, 0, 0) + t1_iter30(0, 1, 0) + t1_iter30(0, -1, 0) + t1_iter30(0, 0, 1) + t1_iter30(0, 0, -1)) * 0.142857142f)
        data_t1_iter31[p*stride_t1_iter31[0]+q*stride_t1_iter31[1]+r*stride_t1_iter31[2]] = ((data_t1_iter30[(p+0)*stride_t1_iter30[0] + (q+0)*stride_t1_iter30[1] + (r+0)*stride_t1_iter30[2]] + data_t1_iter30[(p+1)*stride_t1_iter30[0] + (q+0)*stride_t1_iter30[1] + (r+0)*stride_t1_iter30[2]] + data_t1_iter30[(p-1)*stride_t1_iter30[0] + (q+0)*stride_t1_iter30[1] + (r+0)*stride_t1_iter30[2]] + data_t1_iter30[(p+0)*stride_t1_iter30[0] + (q+1)*stride_t1_iter30[1] + (r+0)*stride_t1_iter30[2]] + data_t1_iter30[(p+0)*stride_t1_iter30[0] + (q-1)*stride_t1_iter30[1] + (r+0)*stride_t1_iter30[2]] + data_t1_iter30[(p+0)*stride_t1_iter30[0] + (q+0)*stride_t1_iter30[1] + (r+1)*stride_t1_iter30[2]] + data_t1_iter30[(p+0)*stride_t1_iter30[0] + (q+0)*stride_t1_iter30[1] + (r-1)*stride_t1_iter30[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter32, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 32; r < dims[2] - 32; ++r)
  {
    for(int32_t q = 32; q < dims[1] - 32; ++q)
    {
      for(int32_t p = 32; p < dims[0] - 32; ++p)
      {
        // t1_iter32(0, 0, 0) = ((t1_iter31(0, 0, 0) + t1_iter31(1, 0, 0) + t1_iter31(-1, 0, 0) + t1_iter31(0, 1, 0) + t1_iter31(0, -1, 0) + t1_iter31(0, 0, 1) + t1_iter31(0, 0, -1)) * 0.142857142f)
        data_t1_iter32[p*stride_t1_iter32[0]+q*stride_t1_iter32[1]+r*stride_t1_iter32[2]] = ((data_t1_iter31[(p+0)*stride_t1_iter31[0] + (q+0)*stride_t1_iter31[1] + (r+0)*stride_t1_iter31[2]] + data_t1_iter31[(p+1)*stride_t1_iter31[0] + (q+0)*stride_t1_iter31[1] + (r+0)*stride_t1_iter31[2]] + data_t1_iter31[(p-1)*stride_t1_iter31[0] + (q+0)*stride_t1_iter31[1] + (r+0)*stride_t1_iter31[2]] + data_t1_iter31[(p+0)*stride_t1_iter31[0] + (q+1)*stride_t1_iter31[1] + (r+0)*stride_t1_iter31[2]] + data_t1_iter31[(p+0)*stride_t1_iter31[0] + (q-1)*stride_t1_iter31[1] + (r+0)*stride_t1_iter31[2]] + data_t1_iter31[(p+0)*stride_t1_iter31[0] + (q+0)*stride_t1_iter31[1] + (r+1)*stride_t1_iter31[2]] + data_t1_iter31[(p+0)*stride_t1_iter31[0] + (q+0)*stride_t1_iter31[1] + (r-1)*stride_t1_iter31[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter33, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 33; r < dims[2] - 33; ++r)
  {
    for(int32_t q = 33; q < dims[1] - 33; ++q)
    {
      for(int32_t p = 33; p < dims[0] - 33; ++p)
      {
        // t1_iter33(0, 0, 0) = ((t1_iter32(0, 0, 0) + t1_iter32(1, 0, 0) + t1_iter32(-1, 0, 0) + t1_iter32(0, 1, 0) + t1_iter32(0, -1, 0) + t1_iter32(0, 0, 1) + t1_iter32(0, 0, -1)) * 0.142857142f)
        data_t1_iter33[p*stride_t1_iter33[0]+q*stride_t1_iter33[1]+r*stride_t1_iter33[2]] = ((data_t1_iter32[(p+0)*stride_t1_iter32[0] + (q+0)*stride_t1_iter32[1] + (r+0)*stride_t1_iter32[2]] + data_t1_iter32[(p+1)*stride_t1_iter32[0] + (q+0)*stride_t1_iter32[1] + (r+0)*stride_t1_iter32[2]] + data_t1_iter32[(p-1)*stride_t1_iter32[0] + (q+0)*stride_t1_iter32[1] + (r+0)*stride_t1_iter32[2]] + data_t1_iter32[(p+0)*stride_t1_iter32[0] + (q+1)*stride_t1_iter32[1] + (r+0)*stride_t1_iter32[2]] + data_t1_iter32[(p+0)*stride_t1_iter32[0] + (q-1)*stride_t1_iter32[1] + (r+0)*stride_t1_iter32[2]] + data_t1_iter32[(p+0)*stride_t1_iter32[0] + (q+0)*stride_t1_iter32[1] + (r+1)*stride_t1_iter32[2]] + data_t1_iter32[(p+0)*stride_t1_iter32[0] + (q+0)*stride_t1_iter32[1] + (r-1)*stride_t1_iter32[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter34, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 34; r < dims[2] - 34; ++r)
  {
    for(int32_t q = 34; q < dims[1] - 34; ++q)
    {
      for(int32_t p = 34; p < dims[0] - 34; ++p)
      {
        // t1_iter34(0, 0, 0) = ((t1_iter33(0, 0, 0) + t1_iter33(1, 0, 0) + t1_iter33(-1, 0, 0) + t1_iter33(0, 1, 0) + t1_iter33(0, -1, 0) + t1_iter33(0, 0, 1) + t1_iter33(0, 0, -1)) * 0.142857142f)
        data_t1_iter34[p*stride_t1_iter34[0]+q*stride_t1_iter34[1]+r*stride_t1_iter34[2]] = ((data_t1_iter33[(p+0)*stride_t1_iter33[0] + (q+0)*stride_t1_iter33[1] + (r+0)*stride_t1_iter33[2]] + data_t1_iter33[(p+1)*stride_t1_iter33[0] + (q+0)*stride_t1_iter33[1] + (r+0)*stride_t1_iter33[2]] + data_t1_iter33[(p-1)*stride_t1_iter33[0] + (q+0)*stride_t1_iter33[1] + (r+0)*stride_t1_iter33[2]] + data_t1_iter33[(p+0)*stride_t1_iter33[0] + (q+1)*stride_t1_iter33[1] + (r+0)*stride_t1_iter33[2]] + data_t1_iter33[(p+0)*stride_t1_iter33[0] + (q-1)*stride_t1_iter33[1] + (r+0)*stride_t1_iter33[2]] + data_t1_iter33[(p+0)*stride_t1_iter33[0] + (q+0)*stride_t1_iter33[1] + (r+1)*stride_t1_iter33[2]] + data_t1_iter33[(p+0)*stride_t1_iter33[0] + (q+0)*stride_t1_iter33[1] + (r-1)*stride_t1_iter33[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter35, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 35; r < dims[2] - 35; ++r)
  {
    for(int32_t q = 35; q < dims[1] - 35; ++q)
    {
      for(int32_t p = 35; p < dims[0] - 35; ++p)
      {
        // t1_iter35(0, 0, 0) = ((t1_iter34(0, 0, 0) + t1_iter34(1, 0, 0) + t1_iter34(-1, 0, 0) + t1_iter34(0, 1, 0) + t1_iter34(0, -1, 0) + t1_iter34(0, 0, 1) + t1_iter34(0, 0, -1)) * 0.142857142f)
        data_t1_iter35[p*stride_t1_iter35[0]+q*stride_t1_iter35[1]+r*stride_t1_iter35[2]] = ((data_t1_iter34[(p+0)*stride_t1_iter34[0] + (q+0)*stride_t1_iter34[1] + (r+0)*stride_t1_iter34[2]] + data_t1_iter34[(p+1)*stride_t1_iter34[0] + (q+0)*stride_t1_iter34[1] + (r+0)*stride_t1_iter34[2]] + data_t1_iter34[(p-1)*stride_t1_iter34[0] + (q+0)*stride_t1_iter34[1] + (r+0)*stride_t1_iter34[2]] + data_t1_iter34[(p+0)*stride_t1_iter34[0] + (q+1)*stride_t1_iter34[1] + (r+0)*stride_t1_iter34[2]] + data_t1_iter34[(p+0)*stride_t1_iter34[0] + (q-1)*stride_t1_iter34[1] + (r+0)*stride_t1_iter34[2]] + data_t1_iter34[(p+0)*stride_t1_iter34[0] + (q+0)*stride_t1_iter34[1] + (r+1)*stride_t1_iter34[2]] + data_t1_iter34[(p+0)*stride_t1_iter34[0] + (q+0)*stride_t1_iter34[1] + (r-1)*stride_t1_iter34[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter36, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 36; r < dims[2] - 36; ++r)
  {
    for(int32_t q = 36; q < dims[1] - 36; ++q)
    {
      for(int32_t p = 36; p < dims[0] - 36; ++p)
      {
        // t1_iter36(0, 0, 0) = ((t1_iter35(0, 0, 0) + t1_iter35(1, 0, 0) + t1_iter35(-1, 0, 0) + t1_iter35(0, 1, 0) + t1_iter35(0, -1, 0) + t1_iter35(0, 0, 1) + t1_iter35(0, 0, -1)) * 0.142857142f)
        data_t1_iter36[p*stride_t1_iter36[0]+q*stride_t1_iter36[1]+r*stride_t1_iter36[2]] = ((data_t1_iter35[(p+0)*stride_t1_iter35[0] + (q+0)*stride_t1_iter35[1] + (r+0)*stride_t1_iter35[2]] + data_t1_iter35[(p+1)*stride_t1_iter35[0] + (q+0)*stride_t1_iter35[1] + (r+0)*stride_t1_iter35[2]] + data_t1_iter35[(p-1)*stride_t1_iter35[0] + (q+0)*stride_t1_iter35[1] + (r+0)*stride_t1_iter35[2]] + data_t1_iter35[(p+0)*stride_t1_iter35[0] + (q+1)*stride_t1_iter35[1] + (r+0)*stride_t1_iter35[2]] + data_t1_iter35[(p+0)*stride_t1_iter35[0] + (q-1)*stride_t1_iter35[1] + (r+0)*stride_t1_iter35[2]] + data_t1_iter35[(p+0)*stride_t1_iter35[0] + (q+0)*stride_t1_iter35[1] + (r+1)*stride_t1_iter35[2]] + data_t1_iter35[(p+0)*stride_t1_iter35[0] + (q+0)*stride_t1_iter35[1] + (r-1)*stride_t1_iter35[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter37, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 37; r < dims[2] - 37; ++r)
  {
    for(int32_t q = 37; q < dims[1] - 37; ++q)
    {
      for(int32_t p = 37; p < dims[0] - 37; ++p)
      {
        // t1_iter37(0, 0, 0) = ((t1_iter36(0, 0, 0) + t1_iter36(1, 0, 0) + t1_iter36(-1, 0, 0) + t1_iter36(0, 1, 0) + t1_iter36(0, -1, 0) + t1_iter36(0, 0, 1) + t1_iter36(0, 0, -1)) * 0.142857142f)
        data_t1_iter37[p*stride_t1_iter37[0]+q*stride_t1_iter37[1]+r*stride_t1_iter37[2]] = ((data_t1_iter36[(p+0)*stride_t1_iter36[0] + (q+0)*stride_t1_iter36[1] + (r+0)*stride_t1_iter36[2]] + data_t1_iter36[(p+1)*stride_t1_iter36[0] + (q+0)*stride_t1_iter36[1] + (r+0)*stride_t1_iter36[2]] + data_t1_iter36[(p-1)*stride_t1_iter36[0] + (q+0)*stride_t1_iter36[1] + (r+0)*stride_t1_iter36[2]] + data_t1_iter36[(p+0)*stride_t1_iter36[0] + (q+1)*stride_t1_iter36[1] + (r+0)*stride_t1_iter36[2]] + data_t1_iter36[(p+0)*stride_t1_iter36[0] + (q-1)*stride_t1_iter36[1] + (r+0)*stride_t1_iter36[2]] + data_t1_iter36[(p+0)*stride_t1_iter36[0] + (q+0)*stride_t1_iter36[1] + (r+1)*stride_t1_iter36[2]] + data_t1_iter36[(p+0)*stride_t1_iter36[0] + (q+0)*stride_t1_iter36[1] + (r-1)*stride_t1_iter36[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter38, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 38; r < dims[2] - 38; ++r)
  {
    for(int32_t q = 38; q < dims[1] - 38; ++q)
    {
      for(int32_t p = 38; p < dims[0] - 38; ++p)
      {
        // t1_iter38(0, 0, 0) = ((t1_iter37(0, 0, 0) + t1_iter37(1, 0, 0) + t1_iter37(-1, 0, 0) + t1_iter37(0, 1, 0) + t1_iter37(0, -1, 0) + t1_iter37(0, 0, 1) + t1_iter37(0, 0, -1)) * 0.142857142f)
        data_t1_iter38[p*stride_t1_iter38[0]+q*stride_t1_iter38[1]+r*stride_t1_iter38[2]] = ((data_t1_iter37[(p+0)*stride_t1_iter37[0] + (q+0)*stride_t1_iter37[1] + (r+0)*stride_t1_iter37[2]] + data_t1_iter37[(p+1)*stride_t1_iter37[0] + (q+0)*stride_t1_iter37[1] + (r+0)*stride_t1_iter37[2]] + data_t1_iter37[(p-1)*stride_t1_iter37[0] + (q+0)*stride_t1_iter37[1] + (r+0)*stride_t1_iter37[2]] + data_t1_iter37[(p+0)*stride_t1_iter37[0] + (q+1)*stride_t1_iter37[1] + (r+0)*stride_t1_iter37[2]] + data_t1_iter37[(p+0)*stride_t1_iter37[0] + (q-1)*stride_t1_iter37[1] + (r+0)*stride_t1_iter37[2]] + data_t1_iter37[(p+0)*stride_t1_iter37[0] + (q+0)*stride_t1_iter37[1] + (r+1)*stride_t1_iter37[2]] + data_t1_iter37[(p+0)*stride_t1_iter37[0] + (q+0)*stride_t1_iter37[1] + (r-1)*stride_t1_iter37[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter39, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 39; r < dims[2] - 39; ++r)
  {
    for(int32_t q = 39; q < dims[1] - 39; ++q)
    {
      for(int32_t p = 39; p < dims[0] - 39; ++p)
      {
        // t1_iter39(0, 0, 0) = ((t1_iter38(0, 0, 0) + t1_iter38(1, 0, 0) + t1_iter38(-1, 0, 0) + t1_iter38(0, 1, 0) + t1_iter38(0, -1, 0) + t1_iter38(0, 0, 1) + t1_iter38(0, 0, -1)) * 0.142857142f)
        data_t1_iter39[p*stride_t1_iter39[0]+q*stride_t1_iter39[1]+r*stride_t1_iter39[2]] = ((data_t1_iter38[(p+0)*stride_t1_iter38[0] + (q+0)*stride_t1_iter38[1] + (r+0)*stride_t1_iter38[2]] + data_t1_iter38[(p+1)*stride_t1_iter38[0] + (q+0)*stride_t1_iter38[1] + (r+0)*stride_t1_iter38[2]] + data_t1_iter38[(p-1)*stride_t1_iter38[0] + (q+0)*stride_t1_iter38[1] + (r+0)*stride_t1_iter38[2]] + data_t1_iter38[(p+0)*stride_t1_iter38[0] + (q+1)*stride_t1_iter38[1] + (r+0)*stride_t1_iter38[2]] + data_t1_iter38[(p+0)*stride_t1_iter38[0] + (q-1)*stride_t1_iter38[1] + (r+0)*stride_t1_iter38[2]] + data_t1_iter38[(p+0)*stride_t1_iter38[0] + (q+0)*stride_t1_iter38[1] + (r+1)*stride_t1_iter38[2]] + data_t1_iter38[(p+0)*stride_t1_iter38[0] + (q+0)*stride_t1_iter38[1] + (r-1)*stride_t1_iter38[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter40, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 40; r < dims[2] - 40; ++r)
  {
    for(int32_t q = 40; q < dims[1] - 40; ++q)
    {
      for(int32_t p = 40; p < dims[0] - 40; ++p)
      {
        // t1_iter40(0, 0, 0) = ((t1_iter39(0, 0, 0) + t1_iter39(1, 0, 0) + t1_iter39(-1, 0, 0) + t1_iter39(0, 1, 0) + t1_iter39(0, -1, 0) + t1_iter39(0, 0, 1) + t1_iter39(0, 0, -1)) * 0.142857142f)
        data_t1_iter40[p*stride_t1_iter40[0]+q*stride_t1_iter40[1]+r*stride_t1_iter40[2]] = ((data_t1_iter39[(p+0)*stride_t1_iter39[0] + (q+0)*stride_t1_iter39[1] + (r+0)*stride_t1_iter39[2]] + data_t1_iter39[(p+1)*stride_t1_iter39[0] + (q+0)*stride_t1_iter39[1] + (r+0)*stride_t1_iter39[2]] + data_t1_iter39[(p-1)*stride_t1_iter39[0] + (q+0)*stride_t1_iter39[1] + (r+0)*stride_t1_iter39[2]] + data_t1_iter39[(p+0)*stride_t1_iter39[0] + (q+1)*stride_t1_iter39[1] + (r+0)*stride_t1_iter39[2]] + data_t1_iter39[(p+0)*stride_t1_iter39[0] + (q-1)*stride_t1_iter39[1] + (r+0)*stride_t1_iter39[2]] + data_t1_iter39[(p+0)*stride_t1_iter39[0] + (q+0)*stride_t1_iter39[1] + (r+1)*stride_t1_iter39[2]] + data_t1_iter39[(p+0)*stride_t1_iter39[0] + (q+0)*stride_t1_iter39[1] + (r-1)*stride_t1_iter39[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter41, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 41; r < dims[2] - 41; ++r)
  {
    for(int32_t q = 41; q < dims[1] - 41; ++q)
    {
      for(int32_t p = 41; p < dims[0] - 41; ++p)
      {
        // t1_iter41(0, 0, 0) = ((t1_iter40(0, 0, 0) + t1_iter40(1, 0, 0) + t1_iter40(-1, 0, 0) + t1_iter40(0, 1, 0) + t1_iter40(0, -1, 0) + t1_iter40(0, 0, 1) + t1_iter40(0, 0, -1)) * 0.142857142f)
        data_t1_iter41[p*stride_t1_iter41[0]+q*stride_t1_iter41[1]+r*stride_t1_iter41[2]] = ((data_t1_iter40[(p+0)*stride_t1_iter40[0] + (q+0)*stride_t1_iter40[1] + (r+0)*stride_t1_iter40[2]] + data_t1_iter40[(p+1)*stride_t1_iter40[0] + (q+0)*stride_t1_iter40[1] + (r+0)*stride_t1_iter40[2]] + data_t1_iter40[(p-1)*stride_t1_iter40[0] + (q+0)*stride_t1_iter40[1] + (r+0)*stride_t1_iter40[2]] + data_t1_iter40[(p+0)*stride_t1_iter40[0] + (q+1)*stride_t1_iter40[1] + (r+0)*stride_t1_iter40[2]] + data_t1_iter40[(p+0)*stride_t1_iter40[0] + (q-1)*stride_t1_iter40[1] + (r+0)*stride_t1_iter40[2]] + data_t1_iter40[(p+0)*stride_t1_iter40[0] + (q+0)*stride_t1_iter40[1] + (r+1)*stride_t1_iter40[2]] + data_t1_iter40[(p+0)*stride_t1_iter40[0] + (q+0)*stride_t1_iter40[1] + (r-1)*stride_t1_iter40[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter42, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 42; r < dims[2] - 42; ++r)
  {
    for(int32_t q = 42; q < dims[1] - 42; ++q)
    {
      for(int32_t p = 42; p < dims[0] - 42; ++p)
      {
        // t1_iter42(0, 0, 0) = ((t1_iter41(0, 0, 0) + t1_iter41(1, 0, 0) + t1_iter41(-1, 0, 0) + t1_iter41(0, 1, 0) + t1_iter41(0, -1, 0) + t1_iter41(0, 0, 1) + t1_iter41(0, 0, -1)) * 0.142857142f)
        data_t1_iter42[p*stride_t1_iter42[0]+q*stride_t1_iter42[1]+r*stride_t1_iter42[2]] = ((data_t1_iter41[(p+0)*stride_t1_iter41[0] + (q+0)*stride_t1_iter41[1] + (r+0)*stride_t1_iter41[2]] + data_t1_iter41[(p+1)*stride_t1_iter41[0] + (q+0)*stride_t1_iter41[1] + (r+0)*stride_t1_iter41[2]] + data_t1_iter41[(p-1)*stride_t1_iter41[0] + (q+0)*stride_t1_iter41[1] + (r+0)*stride_t1_iter41[2]] + data_t1_iter41[(p+0)*stride_t1_iter41[0] + (q+1)*stride_t1_iter41[1] + (r+0)*stride_t1_iter41[2]] + data_t1_iter41[(p+0)*stride_t1_iter41[0] + (q-1)*stride_t1_iter41[1] + (r+0)*stride_t1_iter41[2]] + data_t1_iter41[(p+0)*stride_t1_iter41[0] + (q+0)*stride_t1_iter41[1] + (r+1)*stride_t1_iter41[2]] + data_t1_iter41[(p+0)*stride_t1_iter41[0] + (q+0)*stride_t1_iter41[1] + (r-1)*stride_t1_iter41[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter43, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 43; r < dims[2] - 43; ++r)
  {
    for(int32_t q = 43; q < dims[1] - 43; ++q)
    {
      for(int32_t p = 43; p < dims[0] - 43; ++p)
      {
        // t1_iter43(0, 0, 0) = ((t1_iter42(0, 0, 0) + t1_iter42(1, 0, 0) + t1_iter42(-1, 0, 0) + t1_iter42(0, 1, 0) + t1_iter42(0, -1, 0) + t1_iter42(0, 0, 1) + t1_iter42(0, 0, -1)) * 0.142857142f)
        data_t1_iter43[p*stride_t1_iter43[0]+q*stride_t1_iter43[1]+r*stride_t1_iter43[2]] = ((data_t1_iter42[(p+0)*stride_t1_iter42[0] + (q+0)*stride_t1_iter42[1] + (r+0)*stride_t1_iter42[2]] + data_t1_iter42[(p+1)*stride_t1_iter42[0] + (q+0)*stride_t1_iter42[1] + (r+0)*stride_t1_iter42[2]] + data_t1_iter42[(p-1)*stride_t1_iter42[0] + (q+0)*stride_t1_iter42[1] + (r+0)*stride_t1_iter42[2]] + data_t1_iter42[(p+0)*stride_t1_iter42[0] + (q+1)*stride_t1_iter42[1] + (r+0)*stride_t1_iter42[2]] + data_t1_iter42[(p+0)*stride_t1_iter42[0] + (q-1)*stride_t1_iter42[1] + (r+0)*stride_t1_iter42[2]] + data_t1_iter42[(p+0)*stride_t1_iter42[0] + (q+0)*stride_t1_iter42[1] + (r+1)*stride_t1_iter42[2]] + data_t1_iter42[(p+0)*stride_t1_iter42[0] + (q+0)*stride_t1_iter42[1] + (r-1)*stride_t1_iter42[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter44, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 44; r < dims[2] - 44; ++r)
  {
    for(int32_t q = 44; q < dims[1] - 44; ++q)
    {
      for(int32_t p = 44; p < dims[0] - 44; ++p)
      {
        // t1_iter44(0, 0, 0) = ((t1_iter43(0, 0, 0) + t1_iter43(1, 0, 0) + t1_iter43(-1, 0, 0) + t1_iter43(0, 1, 0) + t1_iter43(0, -1, 0) + t1_iter43(0, 0, 1) + t1_iter43(0, 0, -1)) * 0.142857142f)
        data_t1_iter44[p*stride_t1_iter44[0]+q*stride_t1_iter44[1]+r*stride_t1_iter44[2]] = ((data_t1_iter43[(p+0)*stride_t1_iter43[0] + (q+0)*stride_t1_iter43[1] + (r+0)*stride_t1_iter43[2]] + data_t1_iter43[(p+1)*stride_t1_iter43[0] + (q+0)*stride_t1_iter43[1] + (r+0)*stride_t1_iter43[2]] + data_t1_iter43[(p-1)*stride_t1_iter43[0] + (q+0)*stride_t1_iter43[1] + (r+0)*stride_t1_iter43[2]] + data_t1_iter43[(p+0)*stride_t1_iter43[0] + (q+1)*stride_t1_iter43[1] + (r+0)*stride_t1_iter43[2]] + data_t1_iter43[(p+0)*stride_t1_iter43[0] + (q-1)*stride_t1_iter43[1] + (r+0)*stride_t1_iter43[2]] + data_t1_iter43[(p+0)*stride_t1_iter43[0] + (q+0)*stride_t1_iter43[1] + (r+1)*stride_t1_iter43[2]] + data_t1_iter43[(p+0)*stride_t1_iter43[0] + (q+0)*stride_t1_iter43[1] + (r-1)*stride_t1_iter43[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter45, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 45; r < dims[2] - 45; ++r)
  {
    for(int32_t q = 45; q < dims[1] - 45; ++q)
    {
      for(int32_t p = 45; p < dims[0] - 45; ++p)
      {
        // t1_iter45(0, 0, 0) = ((t1_iter44(0, 0, 0) + t1_iter44(1, 0, 0) + t1_iter44(-1, 0, 0) + t1_iter44(0, 1, 0) + t1_iter44(0, -1, 0) + t1_iter44(0, 0, 1) + t1_iter44(0, 0, -1)) * 0.142857142f)
        data_t1_iter45[p*stride_t1_iter45[0]+q*stride_t1_iter45[1]+r*stride_t1_iter45[2]] = ((data_t1_iter44[(p+0)*stride_t1_iter44[0] + (q+0)*stride_t1_iter44[1] + (r+0)*stride_t1_iter44[2]] + data_t1_iter44[(p+1)*stride_t1_iter44[0] + (q+0)*stride_t1_iter44[1] + (r+0)*stride_t1_iter44[2]] + data_t1_iter44[(p-1)*stride_t1_iter44[0] + (q+0)*stride_t1_iter44[1] + (r+0)*stride_t1_iter44[2]] + data_t1_iter44[(p+0)*stride_t1_iter44[0] + (q+1)*stride_t1_iter44[1] + (r+0)*stride_t1_iter44[2]] + data_t1_iter44[(p+0)*stride_t1_iter44[0] + (q-1)*stride_t1_iter44[1] + (r+0)*stride_t1_iter44[2]] + data_t1_iter44[(p+0)*stride_t1_iter44[0] + (q+0)*stride_t1_iter44[1] + (r+1)*stride_t1_iter44[2]] + data_t1_iter44[(p+0)*stride_t1_iter44[0] + (q+0)*stride_t1_iter44[1] + (r-1)*stride_t1_iter44[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter46, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 46; r < dims[2] - 46; ++r)
  {
    for(int32_t q = 46; q < dims[1] - 46; ++q)
    {
      for(int32_t p = 46; p < dims[0] - 46; ++p)
      {
        // t1_iter46(0, 0, 0) = ((t1_iter45(0, 0, 0) + t1_iter45(1, 0, 0) + t1_iter45(-1, 0, 0) + t1_iter45(0, 1, 0) + t1_iter45(0, -1, 0) + t1_iter45(0, 0, 1) + t1_iter45(0, 0, -1)) * 0.142857142f)
        data_t1_iter46[p*stride_t1_iter46[0]+q*stride_t1_iter46[1]+r*stride_t1_iter46[2]] = ((data_t1_iter45[(p+0)*stride_t1_iter45[0] + (q+0)*stride_t1_iter45[1] + (r+0)*stride_t1_iter45[2]] + data_t1_iter45[(p+1)*stride_t1_iter45[0] + (q+0)*stride_t1_iter45[1] + (r+0)*stride_t1_iter45[2]] + data_t1_iter45[(p-1)*stride_t1_iter45[0] + (q+0)*stride_t1_iter45[1] + (r+0)*stride_t1_iter45[2]] + data_t1_iter45[(p+0)*stride_t1_iter45[0] + (q+1)*stride_t1_iter45[1] + (r+0)*stride_t1_iter45[2]] + data_t1_iter45[(p+0)*stride_t1_iter45[0] + (q-1)*stride_t1_iter45[1] + (r+0)*stride_t1_iter45[2]] + data_t1_iter45[(p+0)*stride_t1_iter45[0] + (q+0)*stride_t1_iter45[1] + (r+1)*stride_t1_iter45[2]] + data_t1_iter45[(p+0)*stride_t1_iter45[0] + (q+0)*stride_t1_iter45[1] + (r-1)*stride_t1_iter45[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter47, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 47; r < dims[2] - 47; ++r)
  {
    for(int32_t q = 47; q < dims[1] - 47; ++q)
    {
      for(int32_t p = 47; p < dims[0] - 47; ++p)
      {
        // t1_iter47(0, 0, 0) = ((t1_iter46(0, 0, 0) + t1_iter46(1, 0, 0) + t1_iter46(-1, 0, 0) + t1_iter46(0, 1, 0) + t1_iter46(0, -1, 0) + t1_iter46(0, 0, 1) + t1_iter46(0, 0, -1)) * 0.142857142f)
        data_t1_iter47[p*stride_t1_iter47[0]+q*stride_t1_iter47[1]+r*stride_t1_iter47[2]] = ((data_t1_iter46[(p+0)*stride_t1_iter46[0] + (q+0)*stride_t1_iter46[1] + (r+0)*stride_t1_iter46[2]] + data_t1_iter46[(p+1)*stride_t1_iter46[0] + (q+0)*stride_t1_iter46[1] + (r+0)*stride_t1_iter46[2]] + data_t1_iter46[(p-1)*stride_t1_iter46[0] + (q+0)*stride_t1_iter46[1] + (r+0)*stride_t1_iter46[2]] + data_t1_iter46[(p+0)*stride_t1_iter46[0] + (q+1)*stride_t1_iter46[1] + (r+0)*stride_t1_iter46[2]] + data_t1_iter46[(p+0)*stride_t1_iter46[0] + (q-1)*stride_t1_iter46[1] + (r+0)*stride_t1_iter46[2]] + data_t1_iter46[(p+0)*stride_t1_iter46[0] + (q+0)*stride_t1_iter46[1] + (r+1)*stride_t1_iter46[2]] + data_t1_iter46[(p+0)*stride_t1_iter46[0] + (q+0)*stride_t1_iter46[1] + (r-1)*stride_t1_iter46[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter48, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 48; r < dims[2] - 48; ++r)
  {
    for(int32_t q = 48; q < dims[1] - 48; ++q)
    {
      for(int32_t p = 48; p < dims[0] - 48; ++p)
      {
        // t1_iter48(0, 0, 0) = ((t1_iter47(0, 0, 0) + t1_iter47(1, 0, 0) + t1_iter47(-1, 0, 0) + t1_iter47(0, 1, 0) + t1_iter47(0, -1, 0) + t1_iter47(0, 0, 1) + t1_iter47(0, 0, -1)) * 0.142857142f)
        data_t1_iter48[p*stride_t1_iter48[0]+q*stride_t1_iter48[1]+r*stride_t1_iter48[2]] = ((data_t1_iter47[(p+0)*stride_t1_iter47[0] + (q+0)*stride_t1_iter47[1] + (r+0)*stride_t1_iter47[2]] + data_t1_iter47[(p+1)*stride_t1_iter47[0] + (q+0)*stride_t1_iter47[1] + (r+0)*stride_t1_iter47[2]] + data_t1_iter47[(p-1)*stride_t1_iter47[0] + (q+0)*stride_t1_iter47[1] + (r+0)*stride_t1_iter47[2]] + data_t1_iter47[(p+0)*stride_t1_iter47[0] + (q+1)*stride_t1_iter47[1] + (r+0)*stride_t1_iter47[2]] + data_t1_iter47[(p+0)*stride_t1_iter47[0] + (q-1)*stride_t1_iter47[1] + (r+0)*stride_t1_iter47[2]] + data_t1_iter47[(p+0)*stride_t1_iter47[0] + (q+0)*stride_t1_iter47[1] + (r+1)*stride_t1_iter47[2]] + data_t1_iter47[(p+0)*stride_t1_iter47[0] + (q+0)*stride_t1_iter47[1] + (r-1)*stride_t1_iter47[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter49, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 49; r < dims[2] - 49; ++r)
  {
    for(int32_t q = 49; q < dims[1] - 49; ++q)
    {
      for(int32_t p = 49; p < dims[0] - 49; ++p)
      {
        // t1_iter49(0, 0, 0) = ((t1_iter48(0, 0, 0) + t1_iter48(1, 0, 0) + t1_iter48(-1, 0, 0) + t1_iter48(0, 1, 0) + t1_iter48(0, -1, 0) + t1_iter48(0, 0, 1) + t1_iter48(0, 0, -1)) * 0.142857142f)
        data_t1_iter49[p*stride_t1_iter49[0]+q*stride_t1_iter49[1]+r*stride_t1_iter49[2]] = ((data_t1_iter48[(p+0)*stride_t1_iter48[0] + (q+0)*stride_t1_iter48[1] + (r+0)*stride_t1_iter48[2]] + data_t1_iter48[(p+1)*stride_t1_iter48[0] + (q+0)*stride_t1_iter48[1] + (r+0)*stride_t1_iter48[2]] + data_t1_iter48[(p-1)*stride_t1_iter48[0] + (q+0)*stride_t1_iter48[1] + (r+0)*stride_t1_iter48[2]] + data_t1_iter48[(p+0)*stride_t1_iter48[0] + (q+1)*stride_t1_iter48[1] + (r+0)*stride_t1_iter48[2]] + data_t1_iter48[(p+0)*stride_t1_iter48[0] + (q-1)*stride_t1_iter48[1] + (r+0)*stride_t1_iter48[2]] + data_t1_iter48[(p+0)*stride_t1_iter48[0] + (q+0)*stride_t1_iter48[1] + (r+1)*stride_t1_iter48[2]] + data_t1_iter48[(p+0)*stride_t1_iter48[0] + (q+0)*stride_t1_iter48[1] + (r-1)*stride_t1_iter48[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter50, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 50; r < dims[2] - 50; ++r)
  {
    for(int32_t q = 50; q < dims[1] - 50; ++q)
    {
      for(int32_t p = 50; p < dims[0] - 50; ++p)
      {
        // t1_iter50(0, 0, 0) = ((t1_iter49(0, 0, 0) + t1_iter49(1, 0, 0) + t1_iter49(-1, 0, 0) + t1_iter49(0, 1, 0) + t1_iter49(0, -1, 0) + t1_iter49(0, 0, 1) + t1_iter49(0, 0, -1)) * 0.142857142f)
        data_t1_iter50[p*stride_t1_iter50[0]+q*stride_t1_iter50[1]+r*stride_t1_iter50[2]] = ((data_t1_iter49[(p+0)*stride_t1_iter49[0] + (q+0)*stride_t1_iter49[1] + (r+0)*stride_t1_iter49[2]] + data_t1_iter49[(p+1)*stride_t1_iter49[0] + (q+0)*stride_t1_iter49[1] + (r+0)*stride_t1_iter49[2]] + data_t1_iter49[(p-1)*stride_t1_iter49[0] + (q+0)*stride_t1_iter49[1] + (r+0)*stride_t1_iter49[2]] + data_t1_iter49[(p+0)*stride_t1_iter49[0] + (q+1)*stride_t1_iter49[1] + (r+0)*stride_t1_iter49[2]] + data_t1_iter49[(p+0)*stride_t1_iter49[0] + (q-1)*stride_t1_iter49[1] + (r+0)*stride_t1_iter49[2]] + data_t1_iter49[(p+0)*stride_t1_iter49[0] + (q+0)*stride_t1_iter49[1] + (r+1)*stride_t1_iter49[2]] + data_t1_iter49[(p+0)*stride_t1_iter49[0] + (q+0)*stride_t1_iter49[1] + (r-1)*stride_t1_iter49[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter51, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 51; r < dims[2] - 51; ++r)
  {
    for(int32_t q = 51; q < dims[1] - 51; ++q)
    {
      for(int32_t p = 51; p < dims[0] - 51; ++p)
      {
        // t1_iter51(0, 0, 0) = ((t1_iter50(0, 0, 0) + t1_iter50(1, 0, 0) + t1_iter50(-1, 0, 0) + t1_iter50(0, 1, 0) + t1_iter50(0, -1, 0) + t1_iter50(0, 0, 1) + t1_iter50(0, 0, -1)) * 0.142857142f)
        data_t1_iter51[p*stride_t1_iter51[0]+q*stride_t1_iter51[1]+r*stride_t1_iter51[2]] = ((data_t1_iter50[(p+0)*stride_t1_iter50[0] + (q+0)*stride_t1_iter50[1] + (r+0)*stride_t1_iter50[2]] + data_t1_iter50[(p+1)*stride_t1_iter50[0] + (q+0)*stride_t1_iter50[1] + (r+0)*stride_t1_iter50[2]] + data_t1_iter50[(p-1)*stride_t1_iter50[0] + (q+0)*stride_t1_iter50[1] + (r+0)*stride_t1_iter50[2]] + data_t1_iter50[(p+0)*stride_t1_iter50[0] + (q+1)*stride_t1_iter50[1] + (r+0)*stride_t1_iter50[2]] + data_t1_iter50[(p+0)*stride_t1_iter50[0] + (q-1)*stride_t1_iter50[1] + (r+0)*stride_t1_iter50[2]] + data_t1_iter50[(p+0)*stride_t1_iter50[0] + (q+0)*stride_t1_iter50[1] + (r+1)*stride_t1_iter50[2]] + data_t1_iter50[(p+0)*stride_t1_iter50[0] + (q+0)*stride_t1_iter50[1] + (r-1)*stride_t1_iter50[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter52, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 52; r < dims[2] - 52; ++r)
  {
    for(int32_t q = 52; q < dims[1] - 52; ++q)
    {
      for(int32_t p = 52; p < dims[0] - 52; ++p)
      {
        // t1_iter52(0, 0, 0) = ((t1_iter51(0, 0, 0) + t1_iter51(1, 0, 0) + t1_iter51(-1, 0, 0) + t1_iter51(0, 1, 0) + t1_iter51(0, -1, 0) + t1_iter51(0, 0, 1) + t1_iter51(0, 0, -1)) * 0.142857142f)
        data_t1_iter52[p*stride_t1_iter52[0]+q*stride_t1_iter52[1]+r*stride_t1_iter52[2]] = ((data_t1_iter51[(p+0)*stride_t1_iter51[0] + (q+0)*stride_t1_iter51[1] + (r+0)*stride_t1_iter51[2]] + data_t1_iter51[(p+1)*stride_t1_iter51[0] + (q+0)*stride_t1_iter51[1] + (r+0)*stride_t1_iter51[2]] + data_t1_iter51[(p-1)*stride_t1_iter51[0] + (q+0)*stride_t1_iter51[1] + (r+0)*stride_t1_iter51[2]] + data_t1_iter51[(p+0)*stride_t1_iter51[0] + (q+1)*stride_t1_iter51[1] + (r+0)*stride_t1_iter51[2]] + data_t1_iter51[(p+0)*stride_t1_iter51[0] + (q-1)*stride_t1_iter51[1] + (r+0)*stride_t1_iter51[2]] + data_t1_iter51[(p+0)*stride_t1_iter51[0] + (q+0)*stride_t1_iter51[1] + (r+1)*stride_t1_iter51[2]] + data_t1_iter51[(p+0)*stride_t1_iter51[0] + (q+0)*stride_t1_iter51[1] + (r-1)*stride_t1_iter51[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter53, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 53; r < dims[2] - 53; ++r)
  {
    for(int32_t q = 53; q < dims[1] - 53; ++q)
    {
      for(int32_t p = 53; p < dims[0] - 53; ++p)
      {
        // t1_iter53(0, 0, 0) = ((t1_iter52(0, 0, 0) + t1_iter52(1, 0, 0) + t1_iter52(-1, 0, 0) + t1_iter52(0, 1, 0) + t1_iter52(0, -1, 0) + t1_iter52(0, 0, 1) + t1_iter52(0, 0, -1)) * 0.142857142f)
        data_t1_iter53[p*stride_t1_iter53[0]+q*stride_t1_iter53[1]+r*stride_t1_iter53[2]] = ((data_t1_iter52[(p+0)*stride_t1_iter52[0] + (q+0)*stride_t1_iter52[1] + (r+0)*stride_t1_iter52[2]] + data_t1_iter52[(p+1)*stride_t1_iter52[0] + (q+0)*stride_t1_iter52[1] + (r+0)*stride_t1_iter52[2]] + data_t1_iter52[(p-1)*stride_t1_iter52[0] + (q+0)*stride_t1_iter52[1] + (r+0)*stride_t1_iter52[2]] + data_t1_iter52[(p+0)*stride_t1_iter52[0] + (q+1)*stride_t1_iter52[1] + (r+0)*stride_t1_iter52[2]] + data_t1_iter52[(p+0)*stride_t1_iter52[0] + (q-1)*stride_t1_iter52[1] + (r+0)*stride_t1_iter52[2]] + data_t1_iter52[(p+0)*stride_t1_iter52[0] + (q+0)*stride_t1_iter52[1] + (r+1)*stride_t1_iter52[2]] + data_t1_iter52[(p+0)*stride_t1_iter52[0] + (q+0)*stride_t1_iter52[1] + (r-1)*stride_t1_iter52[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter54, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 54; r < dims[2] - 54; ++r)
  {
    for(int32_t q = 54; q < dims[1] - 54; ++q)
    {
      for(int32_t p = 54; p < dims[0] - 54; ++p)
      {
        // t1_iter54(0, 0, 0) = ((t1_iter53(0, 0, 0) + t1_iter53(1, 0, 0) + t1_iter53(-1, 0, 0) + t1_iter53(0, 1, 0) + t1_iter53(0, -1, 0) + t1_iter53(0, 0, 1) + t1_iter53(0, 0, -1)) * 0.142857142f)
        data_t1_iter54[p*stride_t1_iter54[0]+q*stride_t1_iter54[1]+r*stride_t1_iter54[2]] = ((data_t1_iter53[(p+0)*stride_t1_iter53[0] + (q+0)*stride_t1_iter53[1] + (r+0)*stride_t1_iter53[2]] + data_t1_iter53[(p+1)*stride_t1_iter53[0] + (q+0)*stride_t1_iter53[1] + (r+0)*stride_t1_iter53[2]] + data_t1_iter53[(p-1)*stride_t1_iter53[0] + (q+0)*stride_t1_iter53[1] + (r+0)*stride_t1_iter53[2]] + data_t1_iter53[(p+0)*stride_t1_iter53[0] + (q+1)*stride_t1_iter53[1] + (r+0)*stride_t1_iter53[2]] + data_t1_iter53[(p+0)*stride_t1_iter53[0] + (q-1)*stride_t1_iter53[1] + (r+0)*stride_t1_iter53[2]] + data_t1_iter53[(p+0)*stride_t1_iter53[0] + (q+0)*stride_t1_iter53[1] + (r+1)*stride_t1_iter53[2]] + data_t1_iter53[(p+0)*stride_t1_iter53[0] + (q+0)*stride_t1_iter53[1] + (r-1)*stride_t1_iter53[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter55, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 55; r < dims[2] - 55; ++r)
  {
    for(int32_t q = 55; q < dims[1] - 55; ++q)
    {
      for(int32_t p = 55; p < dims[0] - 55; ++p)
      {
        // t1_iter55(0, 0, 0) = ((t1_iter54(0, 0, 0) + t1_iter54(1, 0, 0) + t1_iter54(-1, 0, 0) + t1_iter54(0, 1, 0) + t1_iter54(0, -1, 0) + t1_iter54(0, 0, 1) + t1_iter54(0, 0, -1)) * 0.142857142f)
        data_t1_iter55[p*stride_t1_iter55[0]+q*stride_t1_iter55[1]+r*stride_t1_iter55[2]] = ((data_t1_iter54[(p+0)*stride_t1_iter54[0] + (q+0)*stride_t1_iter54[1] + (r+0)*stride_t1_iter54[2]] + data_t1_iter54[(p+1)*stride_t1_iter54[0] + (q+0)*stride_t1_iter54[1] + (r+0)*stride_t1_iter54[2]] + data_t1_iter54[(p-1)*stride_t1_iter54[0] + (q+0)*stride_t1_iter54[1] + (r+0)*stride_t1_iter54[2]] + data_t1_iter54[(p+0)*stride_t1_iter54[0] + (q+1)*stride_t1_iter54[1] + (r+0)*stride_t1_iter54[2]] + data_t1_iter54[(p+0)*stride_t1_iter54[0] + (q-1)*stride_t1_iter54[1] + (r+0)*stride_t1_iter54[2]] + data_t1_iter54[(p+0)*stride_t1_iter54[0] + (q+0)*stride_t1_iter54[1] + (r+1)*stride_t1_iter54[2]] + data_t1_iter54[(p+0)*stride_t1_iter54[0] + (q+0)*stride_t1_iter54[1] + (r-1)*stride_t1_iter54[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter56, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 56; r < dims[2] - 56; ++r)
  {
    for(int32_t q = 56; q < dims[1] - 56; ++q)
    {
      for(int32_t p = 56; p < dims[0] - 56; ++p)
      {
        // t1_iter56(0, 0, 0) = ((t1_iter55(0, 0, 0) + t1_iter55(1, 0, 0) + t1_iter55(-1, 0, 0) + t1_iter55(0, 1, 0) + t1_iter55(0, -1, 0) + t1_iter55(0, 0, 1) + t1_iter55(0, 0, -1)) * 0.142857142f)
        data_t1_iter56[p*stride_t1_iter56[0]+q*stride_t1_iter56[1]+r*stride_t1_iter56[2]] = ((data_t1_iter55[(p+0)*stride_t1_iter55[0] + (q+0)*stride_t1_iter55[1] + (r+0)*stride_t1_iter55[2]] + data_t1_iter55[(p+1)*stride_t1_iter55[0] + (q+0)*stride_t1_iter55[1] + (r+0)*stride_t1_iter55[2]] + data_t1_iter55[(p-1)*stride_t1_iter55[0] + (q+0)*stride_t1_iter55[1] + (r+0)*stride_t1_iter55[2]] + data_t1_iter55[(p+0)*stride_t1_iter55[0] + (q+1)*stride_t1_iter55[1] + (r+0)*stride_t1_iter55[2]] + data_t1_iter55[(p+0)*stride_t1_iter55[0] + (q-1)*stride_t1_iter55[1] + (r+0)*stride_t1_iter55[2]] + data_t1_iter55[(p+0)*stride_t1_iter55[0] + (q+0)*stride_t1_iter55[1] + (r+1)*stride_t1_iter55[2]] + data_t1_iter55[(p+0)*stride_t1_iter55[0] + (q+0)*stride_t1_iter55[1] + (r-1)*stride_t1_iter55[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter57, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 57; r < dims[2] - 57; ++r)
  {
    for(int32_t q = 57; q < dims[1] - 57; ++q)
    {
      for(int32_t p = 57; p < dims[0] - 57; ++p)
      {
        // t1_iter57(0, 0, 0) = ((t1_iter56(0, 0, 0) + t1_iter56(1, 0, 0) + t1_iter56(-1, 0, 0) + t1_iter56(0, 1, 0) + t1_iter56(0, -1, 0) + t1_iter56(0, 0, 1) + t1_iter56(0, 0, -1)) * 0.142857142f)
        data_t1_iter57[p*stride_t1_iter57[0]+q*stride_t1_iter57[1]+r*stride_t1_iter57[2]] = ((data_t1_iter56[(p+0)*stride_t1_iter56[0] + (q+0)*stride_t1_iter56[1] + (r+0)*stride_t1_iter56[2]] + data_t1_iter56[(p+1)*stride_t1_iter56[0] + (q+0)*stride_t1_iter56[1] + (r+0)*stride_t1_iter56[2]] + data_t1_iter56[(p-1)*stride_t1_iter56[0] + (q+0)*stride_t1_iter56[1] + (r+0)*stride_t1_iter56[2]] + data_t1_iter56[(p+0)*stride_t1_iter56[0] + (q+1)*stride_t1_iter56[1] + (r+0)*stride_t1_iter56[2]] + data_t1_iter56[(p+0)*stride_t1_iter56[0] + (q-1)*stride_t1_iter56[1] + (r+0)*stride_t1_iter56[2]] + data_t1_iter56[(p+0)*stride_t1_iter56[0] + (q+0)*stride_t1_iter56[1] + (r+1)*stride_t1_iter56[2]] + data_t1_iter56[(p+0)*stride_t1_iter56[0] + (q+0)*stride_t1_iter56[1] + (r-1)*stride_t1_iter56[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter58, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 58; r < dims[2] - 58; ++r)
  {
    for(int32_t q = 58; q < dims[1] - 58; ++q)
    {
      for(int32_t p = 58; p < dims[0] - 58; ++p)
      {
        // t1_iter58(0, 0, 0) = ((t1_iter57(0, 0, 0) + t1_iter57(1, 0, 0) + t1_iter57(-1, 0, 0) + t1_iter57(0, 1, 0) + t1_iter57(0, -1, 0) + t1_iter57(0, 0, 1) + t1_iter57(0, 0, -1)) * 0.142857142f)
        data_t1_iter58[p*stride_t1_iter58[0]+q*stride_t1_iter58[1]+r*stride_t1_iter58[2]] = ((data_t1_iter57[(p+0)*stride_t1_iter57[0] + (q+0)*stride_t1_iter57[1] + (r+0)*stride_t1_iter57[2]] + data_t1_iter57[(p+1)*stride_t1_iter57[0] + (q+0)*stride_t1_iter57[1] + (r+0)*stride_t1_iter57[2]] + data_t1_iter57[(p-1)*stride_t1_iter57[0] + (q+0)*stride_t1_iter57[1] + (r+0)*stride_t1_iter57[2]] + data_t1_iter57[(p+0)*stride_t1_iter57[0] + (q+1)*stride_t1_iter57[1] + (r+0)*stride_t1_iter57[2]] + data_t1_iter57[(p+0)*stride_t1_iter57[0] + (q-1)*stride_t1_iter57[1] + (r+0)*stride_t1_iter57[2]] + data_t1_iter57[(p+0)*stride_t1_iter57[0] + (q+0)*stride_t1_iter57[1] + (r+1)*stride_t1_iter57[2]] + data_t1_iter57[(p+0)*stride_t1_iter57[0] + (q+0)*stride_t1_iter57[1] + (r-1)*stride_t1_iter57[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter59, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 59; r < dims[2] - 59; ++r)
  {
    for(int32_t q = 59; q < dims[1] - 59; ++q)
    {
      for(int32_t p = 59; p < dims[0] - 59; ++p)
      {
        // t1_iter59(0, 0, 0) = ((t1_iter58(0, 0, 0) + t1_iter58(1, 0, 0) + t1_iter58(-1, 0, 0) + t1_iter58(0, 1, 0) + t1_iter58(0, -1, 0) + t1_iter58(0, 0, 1) + t1_iter58(0, 0, -1)) * 0.142857142f)
        data_t1_iter59[p*stride_t1_iter59[0]+q*stride_t1_iter59[1]+r*stride_t1_iter59[2]] = ((data_t1_iter58[(p+0)*stride_t1_iter58[0] + (q+0)*stride_t1_iter58[1] + (r+0)*stride_t1_iter58[2]] + data_t1_iter58[(p+1)*stride_t1_iter58[0] + (q+0)*stride_t1_iter58[1] + (r+0)*stride_t1_iter58[2]] + data_t1_iter58[(p-1)*stride_t1_iter58[0] + (q+0)*stride_t1_iter58[1] + (r+0)*stride_t1_iter58[2]] + data_t1_iter58[(p+0)*stride_t1_iter58[0] + (q+1)*stride_t1_iter58[1] + (r+0)*stride_t1_iter58[2]] + data_t1_iter58[(p+0)*stride_t1_iter58[0] + (q-1)*stride_t1_iter58[1] + (r+0)*stride_t1_iter58[2]] + data_t1_iter58[(p+0)*stride_t1_iter58[0] + (q+0)*stride_t1_iter58[1] + (r+1)*stride_t1_iter58[2]] + data_t1_iter58[(p+0)*stride_t1_iter58[0] + (q+0)*stride_t1_iter58[1] + (r-1)*stride_t1_iter58[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter60, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 60; r < dims[2] - 60; ++r)
  {
    for(int32_t q = 60; q < dims[1] - 60; ++q)
    {
      for(int32_t p = 60; p < dims[0] - 60; ++p)
      {
        // t1_iter60(0, 0, 0) = ((t1_iter59(0, 0, 0) + t1_iter59(1, 0, 0) + t1_iter59(-1, 0, 0) + t1_iter59(0, 1, 0) + t1_iter59(0, -1, 0) + t1_iter59(0, 0, 1) + t1_iter59(0, 0, -1)) * 0.142857142f)
        data_t1_iter60[p*stride_t1_iter60[0]+q*stride_t1_iter60[1]+r*stride_t1_iter60[2]] = ((data_t1_iter59[(p+0)*stride_t1_iter59[0] + (q+0)*stride_t1_iter59[1] + (r+0)*stride_t1_iter59[2]] + data_t1_iter59[(p+1)*stride_t1_iter59[0] + (q+0)*stride_t1_iter59[1] + (r+0)*stride_t1_iter59[2]] + data_t1_iter59[(p-1)*stride_t1_iter59[0] + (q+0)*stride_t1_iter59[1] + (r+0)*stride_t1_iter59[2]] + data_t1_iter59[(p+0)*stride_t1_iter59[0] + (q+1)*stride_t1_iter59[1] + (r+0)*stride_t1_iter59[2]] + data_t1_iter59[(p+0)*stride_t1_iter59[0] + (q-1)*stride_t1_iter59[1] + (r+0)*stride_t1_iter59[2]] + data_t1_iter59[(p+0)*stride_t1_iter59[0] + (q+0)*stride_t1_iter59[1] + (r+1)*stride_t1_iter59[2]] + data_t1_iter59[(p+0)*stride_t1_iter59[0] + (q+0)*stride_t1_iter59[1] + (r-1)*stride_t1_iter59[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter61, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 61; r < dims[2] - 61; ++r)
  {
    for(int32_t q = 61; q < dims[1] - 61; ++q)
    {
      for(int32_t p = 61; p < dims[0] - 61; ++p)
      {
        // t1_iter61(0, 0, 0) = ((t1_iter60(0, 0, 0) + t1_iter60(1, 0, 0) + t1_iter60(-1, 0, 0) + t1_iter60(0, 1, 0) + t1_iter60(0, -1, 0) + t1_iter60(0, 0, 1) + t1_iter60(0, 0, -1)) * 0.142857142f)
        data_t1_iter61[p*stride_t1_iter61[0]+q*stride_t1_iter61[1]+r*stride_t1_iter61[2]] = ((data_t1_iter60[(p+0)*stride_t1_iter60[0] + (q+0)*stride_t1_iter60[1] + (r+0)*stride_t1_iter60[2]] + data_t1_iter60[(p+1)*stride_t1_iter60[0] + (q+0)*stride_t1_iter60[1] + (r+0)*stride_t1_iter60[2]] + data_t1_iter60[(p-1)*stride_t1_iter60[0] + (q+0)*stride_t1_iter60[1] + (r+0)*stride_t1_iter60[2]] + data_t1_iter60[(p+0)*stride_t1_iter60[0] + (q+1)*stride_t1_iter60[1] + (r+0)*stride_t1_iter60[2]] + data_t1_iter60[(p+0)*stride_t1_iter60[0] + (q-1)*stride_t1_iter60[1] + (r+0)*stride_t1_iter60[2]] + data_t1_iter60[(p+0)*stride_t1_iter60[0] + (q+0)*stride_t1_iter60[1] + (r+1)*stride_t1_iter60[2]] + data_t1_iter60[(p+0)*stride_t1_iter60[0] + (q+0)*stride_t1_iter60[1] + (r-1)*stride_t1_iter60[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter62, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 62; r < dims[2] - 62; ++r)
  {
    for(int32_t q = 62; q < dims[1] - 62; ++q)
    {
      for(int32_t p = 62; p < dims[0] - 62; ++p)
      {
        // t1_iter62(0, 0, 0) = ((t1_iter61(0, 0, 0) + t1_iter61(1, 0, 0) + t1_iter61(-1, 0, 0) + t1_iter61(0, 1, 0) + t1_iter61(0, -1, 0) + t1_iter61(0, 0, 1) + t1_iter61(0, 0, -1)) * 0.142857142f)
        data_t1_iter62[p*stride_t1_iter62[0]+q*stride_t1_iter62[1]+r*stride_t1_iter62[2]] = ((data_t1_iter61[(p+0)*stride_t1_iter61[0] + (q+0)*stride_t1_iter61[1] + (r+0)*stride_t1_iter61[2]] + data_t1_iter61[(p+1)*stride_t1_iter61[0] + (q+0)*stride_t1_iter61[1] + (r+0)*stride_t1_iter61[2]] + data_t1_iter61[(p-1)*stride_t1_iter61[0] + (q+0)*stride_t1_iter61[1] + (r+0)*stride_t1_iter61[2]] + data_t1_iter61[(p+0)*stride_t1_iter61[0] + (q+1)*stride_t1_iter61[1] + (r+0)*stride_t1_iter61[2]] + data_t1_iter61[(p+0)*stride_t1_iter61[0] + (q-1)*stride_t1_iter61[1] + (r+0)*stride_t1_iter61[2]] + data_t1_iter61[(p+0)*stride_t1_iter61[0] + (q+0)*stride_t1_iter61[1] + (r+1)*stride_t1_iter61[2]] + data_t1_iter61[(p+0)*stride_t1_iter61[0] + (q+0)*stride_t1_iter61[1] + (r-1)*stride_t1_iter61[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter63, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 63; r < dims[2] - 63; ++r)
  {
    for(int32_t q = 63; q < dims[1] - 63; ++q)
    {
      for(int32_t p = 63; p < dims[0] - 63; ++p)
      {
        // t1_iter63(0, 0, 0) = ((t1_iter62(0, 0, 0) + t1_iter62(1, 0, 0) + t1_iter62(-1, 0, 0) + t1_iter62(0, 1, 0) + t1_iter62(0, -1, 0) + t1_iter62(0, 0, 1) + t1_iter62(0, 0, -1)) * 0.142857142f)
        data_t1_iter63[p*stride_t1_iter63[0]+q*stride_t1_iter63[1]+r*stride_t1_iter63[2]] = ((data_t1_iter62[(p+0)*stride_t1_iter62[0] + (q+0)*stride_t1_iter62[1] + (r+0)*stride_t1_iter62[2]] + data_t1_iter62[(p+1)*stride_t1_iter62[0] + (q+0)*stride_t1_iter62[1] + (r+0)*stride_t1_iter62[2]] + data_t1_iter62[(p-1)*stride_t1_iter62[0] + (q+0)*stride_t1_iter62[1] + (r+0)*stride_t1_iter62[2]] + data_t1_iter62[(p+0)*stride_t1_iter62[0] + (q+1)*stride_t1_iter62[1] + (r+0)*stride_t1_iter62[2]] + data_t1_iter62[(p+0)*stride_t1_iter62[0] + (q-1)*stride_t1_iter62[1] + (r+0)*stride_t1_iter62[2]] + data_t1_iter62[(p+0)*stride_t1_iter62[0] + (q+0)*stride_t1_iter62[1] + (r+1)*stride_t1_iter62[2]] + data_t1_iter62[(p+0)*stride_t1_iter62[0] + (q+0)*stride_t1_iter62[1] + (r-1)*stride_t1_iter62[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter64, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 64; r < dims[2] - 64; ++r)
  {
    for(int32_t q = 64; q < dims[1] - 64; ++q)
    {
      for(int32_t p = 64; p < dims[0] - 64; ++p)
      {
        // t1_iter64(0, 0, 0) = ((t1_iter63(0, 0, 0) + t1_iter63(1, 0, 0) + t1_iter63(-1, 0, 0) + t1_iter63(0, 1, 0) + t1_iter63(0, -1, 0) + t1_iter63(0, 0, 1) + t1_iter63(0, 0, -1)) * 0.142857142f)
        data_t1_iter64[p*stride_t1_iter64[0]+q*stride_t1_iter64[1]+r*stride_t1_iter64[2]] = ((data_t1_iter63[(p+0)*stride_t1_iter63[0] + (q+0)*stride_t1_iter63[1] + (r+0)*stride_t1_iter63[2]] + data_t1_iter63[(p+1)*stride_t1_iter63[0] + (q+0)*stride_t1_iter63[1] + (r+0)*stride_t1_iter63[2]] + data_t1_iter63[(p-1)*stride_t1_iter63[0] + (q+0)*stride_t1_iter63[1] + (r+0)*stride_t1_iter63[2]] + data_t1_iter63[(p+0)*stride_t1_iter63[0] + (q+1)*stride_t1_iter63[1] + (r+0)*stride_t1_iter63[2]] + data_t1_iter63[(p+0)*stride_t1_iter63[0] + (q-1)*stride_t1_iter63[1] + (r+0)*stride_t1_iter63[2]] + data_t1_iter63[(p+0)*stride_t1_iter63[0] + (q+0)*stride_t1_iter63[1] + (r+1)*stride_t1_iter63[2]] + data_t1_iter63[(p+0)*stride_t1_iter63[0] + (q+0)*stride_t1_iter63[1] + (r-1)*stride_t1_iter63[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter65, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 65; r < dims[2] - 65; ++r)
  {
    for(int32_t q = 65; q < dims[1] - 65; ++q)
    {
      for(int32_t p = 65; p < dims[0] - 65; ++p)
      {
        // t1_iter65(0, 0, 0) = ((t1_iter64(0, 0, 0) + t1_iter64(1, 0, 0) + t1_iter64(-1, 0, 0) + t1_iter64(0, 1, 0) + t1_iter64(0, -1, 0) + t1_iter64(0, 0, 1) + t1_iter64(0, 0, -1)) * 0.142857142f)
        data_t1_iter65[p*stride_t1_iter65[0]+q*stride_t1_iter65[1]+r*stride_t1_iter65[2]] = ((data_t1_iter64[(p+0)*stride_t1_iter64[0] + (q+0)*stride_t1_iter64[1] + (r+0)*stride_t1_iter64[2]] + data_t1_iter64[(p+1)*stride_t1_iter64[0] + (q+0)*stride_t1_iter64[1] + (r+0)*stride_t1_iter64[2]] + data_t1_iter64[(p-1)*stride_t1_iter64[0] + (q+0)*stride_t1_iter64[1] + (r+0)*stride_t1_iter64[2]] + data_t1_iter64[(p+0)*stride_t1_iter64[0] + (q+1)*stride_t1_iter64[1] + (r+0)*stride_t1_iter64[2]] + data_t1_iter64[(p+0)*stride_t1_iter64[0] + (q-1)*stride_t1_iter64[1] + (r+0)*stride_t1_iter64[2]] + data_t1_iter64[(p+0)*stride_t1_iter64[0] + (q+0)*stride_t1_iter64[1] + (r+1)*stride_t1_iter64[2]] + data_t1_iter64[(p+0)*stride_t1_iter64[0] + (q+0)*stride_t1_iter64[1] + (r-1)*stride_t1_iter64[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter66, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 66; r < dims[2] - 66; ++r)
  {
    for(int32_t q = 66; q < dims[1] - 66; ++q)
    {
      for(int32_t p = 66; p < dims[0] - 66; ++p)
      {
        // t1_iter66(0, 0, 0) = ((t1_iter65(0, 0, 0) + t1_iter65(1, 0, 0) + t1_iter65(-1, 0, 0) + t1_iter65(0, 1, 0) + t1_iter65(0, -1, 0) + t1_iter65(0, 0, 1) + t1_iter65(0, 0, -1)) * 0.142857142f)
        data_t1_iter66[p*stride_t1_iter66[0]+q*stride_t1_iter66[1]+r*stride_t1_iter66[2]] = ((data_t1_iter65[(p+0)*stride_t1_iter65[0] + (q+0)*stride_t1_iter65[1] + (r+0)*stride_t1_iter65[2]] + data_t1_iter65[(p+1)*stride_t1_iter65[0] + (q+0)*stride_t1_iter65[1] + (r+0)*stride_t1_iter65[2]] + data_t1_iter65[(p-1)*stride_t1_iter65[0] + (q+0)*stride_t1_iter65[1] + (r+0)*stride_t1_iter65[2]] + data_t1_iter65[(p+0)*stride_t1_iter65[0] + (q+1)*stride_t1_iter65[1] + (r+0)*stride_t1_iter65[2]] + data_t1_iter65[(p+0)*stride_t1_iter65[0] + (q-1)*stride_t1_iter65[1] + (r+0)*stride_t1_iter65[2]] + data_t1_iter65[(p+0)*stride_t1_iter65[0] + (q+0)*stride_t1_iter65[1] + (r+1)*stride_t1_iter65[2]] + data_t1_iter65[(p+0)*stride_t1_iter65[0] + (q+0)*stride_t1_iter65[1] + (r-1)*stride_t1_iter65[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter67, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 67; r < dims[2] - 67; ++r)
  {
    for(int32_t q = 67; q < dims[1] - 67; ++q)
    {
      for(int32_t p = 67; p < dims[0] - 67; ++p)
      {
        // t1_iter67(0, 0, 0) = ((t1_iter66(0, 0, 0) + t1_iter66(1, 0, 0) + t1_iter66(-1, 0, 0) + t1_iter66(0, 1, 0) + t1_iter66(0, -1, 0) + t1_iter66(0, 0, 1) + t1_iter66(0, 0, -1)) * 0.142857142f)
        data_t1_iter67[p*stride_t1_iter67[0]+q*stride_t1_iter67[1]+r*stride_t1_iter67[2]] = ((data_t1_iter66[(p+0)*stride_t1_iter66[0] + (q+0)*stride_t1_iter66[1] + (r+0)*stride_t1_iter66[2]] + data_t1_iter66[(p+1)*stride_t1_iter66[0] + (q+0)*stride_t1_iter66[1] + (r+0)*stride_t1_iter66[2]] + data_t1_iter66[(p-1)*stride_t1_iter66[0] + (q+0)*stride_t1_iter66[1] + (r+0)*stride_t1_iter66[2]] + data_t1_iter66[(p+0)*stride_t1_iter66[0] + (q+1)*stride_t1_iter66[1] + (r+0)*stride_t1_iter66[2]] + data_t1_iter66[(p+0)*stride_t1_iter66[0] + (q-1)*stride_t1_iter66[1] + (r+0)*stride_t1_iter66[2]] + data_t1_iter66[(p+0)*stride_t1_iter66[0] + (q+0)*stride_t1_iter66[1] + (r+1)*stride_t1_iter66[2]] + data_t1_iter66[(p+0)*stride_t1_iter66[0] + (q+0)*stride_t1_iter66[1] + (r-1)*stride_t1_iter66[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter68, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 68; r < dims[2] - 68; ++r)
  {
    for(int32_t q = 68; q < dims[1] - 68; ++q)
    {
      for(int32_t p = 68; p < dims[0] - 68; ++p)
      {
        // t1_iter68(0, 0, 0) = ((t1_iter67(0, 0, 0) + t1_iter67(1, 0, 0) + t1_iter67(-1, 0, 0) + t1_iter67(0, 1, 0) + t1_iter67(0, -1, 0) + t1_iter67(0, 0, 1) + t1_iter67(0, 0, -1)) * 0.142857142f)
        data_t1_iter68[p*stride_t1_iter68[0]+q*stride_t1_iter68[1]+r*stride_t1_iter68[2]] = ((data_t1_iter67[(p+0)*stride_t1_iter67[0] + (q+0)*stride_t1_iter67[1] + (r+0)*stride_t1_iter67[2]] + data_t1_iter67[(p+1)*stride_t1_iter67[0] + (q+0)*stride_t1_iter67[1] + (r+0)*stride_t1_iter67[2]] + data_t1_iter67[(p-1)*stride_t1_iter67[0] + (q+0)*stride_t1_iter67[1] + (r+0)*stride_t1_iter67[2]] + data_t1_iter67[(p+0)*stride_t1_iter67[0] + (q+1)*stride_t1_iter67[1] + (r+0)*stride_t1_iter67[2]] + data_t1_iter67[(p+0)*stride_t1_iter67[0] + (q-1)*stride_t1_iter67[1] + (r+0)*stride_t1_iter67[2]] + data_t1_iter67[(p+0)*stride_t1_iter67[0] + (q+0)*stride_t1_iter67[1] + (r+1)*stride_t1_iter67[2]] + data_t1_iter67[(p+0)*stride_t1_iter67[0] + (q+0)*stride_t1_iter67[1] + (r-1)*stride_t1_iter67[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter69, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 69; r < dims[2] - 69; ++r)
  {
    for(int32_t q = 69; q < dims[1] - 69; ++q)
    {
      for(int32_t p = 69; p < dims[0] - 69; ++p)
      {
        // t1_iter69(0, 0, 0) = ((t1_iter68(0, 0, 0) + t1_iter68(1, 0, 0) + t1_iter68(-1, 0, 0) + t1_iter68(0, 1, 0) + t1_iter68(0, -1, 0) + t1_iter68(0, 0, 1) + t1_iter68(0, 0, -1)) * 0.142857142f)
        data_t1_iter69[p*stride_t1_iter69[0]+q*stride_t1_iter69[1]+r*stride_t1_iter69[2]] = ((data_t1_iter68[(p+0)*stride_t1_iter68[0] + (q+0)*stride_t1_iter68[1] + (r+0)*stride_t1_iter68[2]] + data_t1_iter68[(p+1)*stride_t1_iter68[0] + (q+0)*stride_t1_iter68[1] + (r+0)*stride_t1_iter68[2]] + data_t1_iter68[(p-1)*stride_t1_iter68[0] + (q+0)*stride_t1_iter68[1] + (r+0)*stride_t1_iter68[2]] + data_t1_iter68[(p+0)*stride_t1_iter68[0] + (q+1)*stride_t1_iter68[1] + (r+0)*stride_t1_iter68[2]] + data_t1_iter68[(p+0)*stride_t1_iter68[0] + (q-1)*stride_t1_iter68[1] + (r+0)*stride_t1_iter68[2]] + data_t1_iter68[(p+0)*stride_t1_iter68[0] + (q+0)*stride_t1_iter68[1] + (r+1)*stride_t1_iter68[2]] + data_t1_iter68[(p+0)*stride_t1_iter68[0] + (q+0)*stride_t1_iter68[1] + (r-1)*stride_t1_iter68[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter70, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 70; r < dims[2] - 70; ++r)
  {
    for(int32_t q = 70; q < dims[1] - 70; ++q)
    {
      for(int32_t p = 70; p < dims[0] - 70; ++p)
      {
        // t1_iter70(0, 0, 0) = ((t1_iter69(0, 0, 0) + t1_iter69(1, 0, 0) + t1_iter69(-1, 0, 0) + t1_iter69(0, 1, 0) + t1_iter69(0, -1, 0) + t1_iter69(0, 0, 1) + t1_iter69(0, 0, -1)) * 0.142857142f)
        data_t1_iter70[p*stride_t1_iter70[0]+q*stride_t1_iter70[1]+r*stride_t1_iter70[2]] = ((data_t1_iter69[(p+0)*stride_t1_iter69[0] + (q+0)*stride_t1_iter69[1] + (r+0)*stride_t1_iter69[2]] + data_t1_iter69[(p+1)*stride_t1_iter69[0] + (q+0)*stride_t1_iter69[1] + (r+0)*stride_t1_iter69[2]] + data_t1_iter69[(p-1)*stride_t1_iter69[0] + (q+0)*stride_t1_iter69[1] + (r+0)*stride_t1_iter69[2]] + data_t1_iter69[(p+0)*stride_t1_iter69[0] + (q+1)*stride_t1_iter69[1] + (r+0)*stride_t1_iter69[2]] + data_t1_iter69[(p+0)*stride_t1_iter69[0] + (q-1)*stride_t1_iter69[1] + (r+0)*stride_t1_iter69[2]] + data_t1_iter69[(p+0)*stride_t1_iter69[0] + (q+0)*stride_t1_iter69[1] + (r+1)*stride_t1_iter69[2]] + data_t1_iter69[(p+0)*stride_t1_iter69[0] + (q+0)*stride_t1_iter69[1] + (r-1)*stride_t1_iter69[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter71, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 71; r < dims[2] - 71; ++r)
  {
    for(int32_t q = 71; q < dims[1] - 71; ++q)
    {
      for(int32_t p = 71; p < dims[0] - 71; ++p)
      {
        // t1_iter71(0, 0, 0) = ((t1_iter70(0, 0, 0) + t1_iter70(1, 0, 0) + t1_iter70(-1, 0, 0) + t1_iter70(0, 1, 0) + t1_iter70(0, -1, 0) + t1_iter70(0, 0, 1) + t1_iter70(0, 0, -1)) * 0.142857142f)
        data_t1_iter71[p*stride_t1_iter71[0]+q*stride_t1_iter71[1]+r*stride_t1_iter71[2]] = ((data_t1_iter70[(p+0)*stride_t1_iter70[0] + (q+0)*stride_t1_iter70[1] + (r+0)*stride_t1_iter70[2]] + data_t1_iter70[(p+1)*stride_t1_iter70[0] + (q+0)*stride_t1_iter70[1] + (r+0)*stride_t1_iter70[2]] + data_t1_iter70[(p-1)*stride_t1_iter70[0] + (q+0)*stride_t1_iter70[1] + (r+0)*stride_t1_iter70[2]] + data_t1_iter70[(p+0)*stride_t1_iter70[0] + (q+1)*stride_t1_iter70[1] + (r+0)*stride_t1_iter70[2]] + data_t1_iter70[(p+0)*stride_t1_iter70[0] + (q-1)*stride_t1_iter70[1] + (r+0)*stride_t1_iter70[2]] + data_t1_iter70[(p+0)*stride_t1_iter70[0] + (q+0)*stride_t1_iter70[1] + (r+1)*stride_t1_iter70[2]] + data_t1_iter70[(p+0)*stride_t1_iter70[0] + (q+0)*stride_t1_iter70[1] + (r-1)*stride_t1_iter70[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter72, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 72; r < dims[2] - 72; ++r)
  {
    for(int32_t q = 72; q < dims[1] - 72; ++q)
    {
      for(int32_t p = 72; p < dims[0] - 72; ++p)
      {
        // t1_iter72(0, 0, 0) = ((t1_iter71(0, 0, 0) + t1_iter71(1, 0, 0) + t1_iter71(-1, 0, 0) + t1_iter71(0, 1, 0) + t1_iter71(0, -1, 0) + t1_iter71(0, 0, 1) + t1_iter71(0, 0, -1)) * 0.142857142f)
        data_t1_iter72[p*stride_t1_iter72[0]+q*stride_t1_iter72[1]+r*stride_t1_iter72[2]] = ((data_t1_iter71[(p+0)*stride_t1_iter71[0] + (q+0)*stride_t1_iter71[1] + (r+0)*stride_t1_iter71[2]] + data_t1_iter71[(p+1)*stride_t1_iter71[0] + (q+0)*stride_t1_iter71[1] + (r+0)*stride_t1_iter71[2]] + data_t1_iter71[(p-1)*stride_t1_iter71[0] + (q+0)*stride_t1_iter71[1] + (r+0)*stride_t1_iter71[2]] + data_t1_iter71[(p+0)*stride_t1_iter71[0] + (q+1)*stride_t1_iter71[1] + (r+0)*stride_t1_iter71[2]] + data_t1_iter71[(p+0)*stride_t1_iter71[0] + (q-1)*stride_t1_iter71[1] + (r+0)*stride_t1_iter71[2]] + data_t1_iter71[(p+0)*stride_t1_iter71[0] + (q+0)*stride_t1_iter71[1] + (r+1)*stride_t1_iter71[2]] + data_t1_iter71[(p+0)*stride_t1_iter71[0] + (q+0)*stride_t1_iter71[1] + (r-1)*stride_t1_iter71[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter73, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 73; r < dims[2] - 73; ++r)
  {
    for(int32_t q = 73; q < dims[1] - 73; ++q)
    {
      for(int32_t p = 73; p < dims[0] - 73; ++p)
      {
        // t1_iter73(0, 0, 0) = ((t1_iter72(0, 0, 0) + t1_iter72(1, 0, 0) + t1_iter72(-1, 0, 0) + t1_iter72(0, 1, 0) + t1_iter72(0, -1, 0) + t1_iter72(0, 0, 1) + t1_iter72(0, 0, -1)) * 0.142857142f)
        data_t1_iter73[p*stride_t1_iter73[0]+q*stride_t1_iter73[1]+r*stride_t1_iter73[2]] = ((data_t1_iter72[(p+0)*stride_t1_iter72[0] + (q+0)*stride_t1_iter72[1] + (r+0)*stride_t1_iter72[2]] + data_t1_iter72[(p+1)*stride_t1_iter72[0] + (q+0)*stride_t1_iter72[1] + (r+0)*stride_t1_iter72[2]] + data_t1_iter72[(p-1)*stride_t1_iter72[0] + (q+0)*stride_t1_iter72[1] + (r+0)*stride_t1_iter72[2]] + data_t1_iter72[(p+0)*stride_t1_iter72[0] + (q+1)*stride_t1_iter72[1] + (r+0)*stride_t1_iter72[2]] + data_t1_iter72[(p+0)*stride_t1_iter72[0] + (q-1)*stride_t1_iter72[1] + (r+0)*stride_t1_iter72[2]] + data_t1_iter72[(p+0)*stride_t1_iter72[0] + (q+0)*stride_t1_iter72[1] + (r+1)*stride_t1_iter72[2]] + data_t1_iter72[(p+0)*stride_t1_iter72[0] + (q+0)*stride_t1_iter72[1] + (r-1)*stride_t1_iter72[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter74, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 74; r < dims[2] - 74; ++r)
  {
    for(int32_t q = 74; q < dims[1] - 74; ++q)
    {
      for(int32_t p = 74; p < dims[0] - 74; ++p)
      {
        // t1_iter74(0, 0, 0) = ((t1_iter73(0, 0, 0) + t1_iter73(1, 0, 0) + t1_iter73(-1, 0, 0) + t1_iter73(0, 1, 0) + t1_iter73(0, -1, 0) + t1_iter73(0, 0, 1) + t1_iter73(0, 0, -1)) * 0.142857142f)
        data_t1_iter74[p*stride_t1_iter74[0]+q*stride_t1_iter74[1]+r*stride_t1_iter74[2]] = ((data_t1_iter73[(p+0)*stride_t1_iter73[0] + (q+0)*stride_t1_iter73[1] + (r+0)*stride_t1_iter73[2]] + data_t1_iter73[(p+1)*stride_t1_iter73[0] + (q+0)*stride_t1_iter73[1] + (r+0)*stride_t1_iter73[2]] + data_t1_iter73[(p-1)*stride_t1_iter73[0] + (q+0)*stride_t1_iter73[1] + (r+0)*stride_t1_iter73[2]] + data_t1_iter73[(p+0)*stride_t1_iter73[0] + (q+1)*stride_t1_iter73[1] + (r+0)*stride_t1_iter73[2]] + data_t1_iter73[(p+0)*stride_t1_iter73[0] + (q-1)*stride_t1_iter73[1] + (r+0)*stride_t1_iter73[2]] + data_t1_iter73[(p+0)*stride_t1_iter73[0] + (q+0)*stride_t1_iter73[1] + (r+1)*stride_t1_iter73[2]] + data_t1_iter73[(p+0)*stride_t1_iter73[0] + (q+0)*stride_t1_iter73[1] + (r-1)*stride_t1_iter73[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter75, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 75; r < dims[2] - 75; ++r)
  {
    for(int32_t q = 75; q < dims[1] - 75; ++q)
    {
      for(int32_t p = 75; p < dims[0] - 75; ++p)
      {
        // t1_iter75(0, 0, 0) = ((t1_iter74(0, 0, 0) + t1_iter74(1, 0, 0) + t1_iter74(-1, 0, 0) + t1_iter74(0, 1, 0) + t1_iter74(0, -1, 0) + t1_iter74(0, 0, 1) + t1_iter74(0, 0, -1)) * 0.142857142f)
        data_t1_iter75[p*stride_t1_iter75[0]+q*stride_t1_iter75[1]+r*stride_t1_iter75[2]] = ((data_t1_iter74[(p+0)*stride_t1_iter74[0] + (q+0)*stride_t1_iter74[1] + (r+0)*stride_t1_iter74[2]] + data_t1_iter74[(p+1)*stride_t1_iter74[0] + (q+0)*stride_t1_iter74[1] + (r+0)*stride_t1_iter74[2]] + data_t1_iter74[(p-1)*stride_t1_iter74[0] + (q+0)*stride_t1_iter74[1] + (r+0)*stride_t1_iter74[2]] + data_t1_iter74[(p+0)*stride_t1_iter74[0] + (q+1)*stride_t1_iter74[1] + (r+0)*stride_t1_iter74[2]] + data_t1_iter74[(p+0)*stride_t1_iter74[0] + (q-1)*stride_t1_iter74[1] + (r+0)*stride_t1_iter74[2]] + data_t1_iter74[(p+0)*stride_t1_iter74[0] + (q+0)*stride_t1_iter74[1] + (r+1)*stride_t1_iter74[2]] + data_t1_iter74[(p+0)*stride_t1_iter74[0] + (q+0)*stride_t1_iter74[1] + (r-1)*stride_t1_iter74[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter76, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 76; r < dims[2] - 76; ++r)
  {
    for(int32_t q = 76; q < dims[1] - 76; ++q)
    {
      for(int32_t p = 76; p < dims[0] - 76; ++p)
      {
        // t1_iter76(0, 0, 0) = ((t1_iter75(0, 0, 0) + t1_iter75(1, 0, 0) + t1_iter75(-1, 0, 0) + t1_iter75(0, 1, 0) + t1_iter75(0, -1, 0) + t1_iter75(0, 0, 1) + t1_iter75(0, 0, -1)) * 0.142857142f)
        data_t1_iter76[p*stride_t1_iter76[0]+q*stride_t1_iter76[1]+r*stride_t1_iter76[2]] = ((data_t1_iter75[(p+0)*stride_t1_iter75[0] + (q+0)*stride_t1_iter75[1] + (r+0)*stride_t1_iter75[2]] + data_t1_iter75[(p+1)*stride_t1_iter75[0] + (q+0)*stride_t1_iter75[1] + (r+0)*stride_t1_iter75[2]] + data_t1_iter75[(p-1)*stride_t1_iter75[0] + (q+0)*stride_t1_iter75[1] + (r+0)*stride_t1_iter75[2]] + data_t1_iter75[(p+0)*stride_t1_iter75[0] + (q+1)*stride_t1_iter75[1] + (r+0)*stride_t1_iter75[2]] + data_t1_iter75[(p+0)*stride_t1_iter75[0] + (q-1)*stride_t1_iter75[1] + (r+0)*stride_t1_iter75[2]] + data_t1_iter75[(p+0)*stride_t1_iter75[0] + (q+0)*stride_t1_iter75[1] + (r+1)*stride_t1_iter75[2]] + data_t1_iter75[(p+0)*stride_t1_iter75[0] + (q+0)*stride_t1_iter75[1] + (r-1)*stride_t1_iter75[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter77, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 77; r < dims[2] - 77; ++r)
  {
    for(int32_t q = 77; q < dims[1] - 77; ++q)
    {
      for(int32_t p = 77; p < dims[0] - 77; ++p)
      {
        // t1_iter77(0, 0, 0) = ((t1_iter76(0, 0, 0) + t1_iter76(1, 0, 0) + t1_iter76(-1, 0, 0) + t1_iter76(0, 1, 0) + t1_iter76(0, -1, 0) + t1_iter76(0, 0, 1) + t1_iter76(0, 0, -1)) * 0.142857142f)
        data_t1_iter77[p*stride_t1_iter77[0]+q*stride_t1_iter77[1]+r*stride_t1_iter77[2]] = ((data_t1_iter76[(p+0)*stride_t1_iter76[0] + (q+0)*stride_t1_iter76[1] + (r+0)*stride_t1_iter76[2]] + data_t1_iter76[(p+1)*stride_t1_iter76[0] + (q+0)*stride_t1_iter76[1] + (r+0)*stride_t1_iter76[2]] + data_t1_iter76[(p-1)*stride_t1_iter76[0] + (q+0)*stride_t1_iter76[1] + (r+0)*stride_t1_iter76[2]] + data_t1_iter76[(p+0)*stride_t1_iter76[0] + (q+1)*stride_t1_iter76[1] + (r+0)*stride_t1_iter76[2]] + data_t1_iter76[(p+0)*stride_t1_iter76[0] + (q-1)*stride_t1_iter76[1] + (r+0)*stride_t1_iter76[2]] + data_t1_iter76[(p+0)*stride_t1_iter76[0] + (q+0)*stride_t1_iter76[1] + (r+1)*stride_t1_iter76[2]] + data_t1_iter76[(p+0)*stride_t1_iter76[0] + (q+0)*stride_t1_iter76[1] + (r-1)*stride_t1_iter76[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter78, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 78; r < dims[2] - 78; ++r)
  {
    for(int32_t q = 78; q < dims[1] - 78; ++q)
    {
      for(int32_t p = 78; p < dims[0] - 78; ++p)
      {
        // t1_iter78(0, 0, 0) = ((t1_iter77(0, 0, 0) + t1_iter77(1, 0, 0) + t1_iter77(-1, 0, 0) + t1_iter77(0, 1, 0) + t1_iter77(0, -1, 0) + t1_iter77(0, 0, 1) + t1_iter77(0, 0, -1)) * 0.142857142f)
        data_t1_iter78[p*stride_t1_iter78[0]+q*stride_t1_iter78[1]+r*stride_t1_iter78[2]] = ((data_t1_iter77[(p+0)*stride_t1_iter77[0] + (q+0)*stride_t1_iter77[1] + (r+0)*stride_t1_iter77[2]] + data_t1_iter77[(p+1)*stride_t1_iter77[0] + (q+0)*stride_t1_iter77[1] + (r+0)*stride_t1_iter77[2]] + data_t1_iter77[(p-1)*stride_t1_iter77[0] + (q+0)*stride_t1_iter77[1] + (r+0)*stride_t1_iter77[2]] + data_t1_iter77[(p+0)*stride_t1_iter77[0] + (q+1)*stride_t1_iter77[1] + (r+0)*stride_t1_iter77[2]] + data_t1_iter77[(p+0)*stride_t1_iter77[0] + (q-1)*stride_t1_iter77[1] + (r+0)*stride_t1_iter77[2]] + data_t1_iter77[(p+0)*stride_t1_iter77[0] + (q+0)*stride_t1_iter77[1] + (r+1)*stride_t1_iter77[2]] + data_t1_iter77[(p+0)*stride_t1_iter77[0] + (q+0)*stride_t1_iter77[1] + (r-1)*stride_t1_iter77[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter79, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 79; r < dims[2] - 79; ++r)
  {
    for(int32_t q = 79; q < dims[1] - 79; ++q)
    {
      for(int32_t p = 79; p < dims[0] - 79; ++p)
      {
        // t1_iter79(0, 0, 0) = ((t1_iter78(0, 0, 0) + t1_iter78(1, 0, 0) + t1_iter78(-1, 0, 0) + t1_iter78(0, 1, 0) + t1_iter78(0, -1, 0) + t1_iter78(0, 0, 1) + t1_iter78(0, 0, -1)) * 0.142857142f)
        data_t1_iter79[p*stride_t1_iter79[0]+q*stride_t1_iter79[1]+r*stride_t1_iter79[2]] = ((data_t1_iter78[(p+0)*stride_t1_iter78[0] + (q+0)*stride_t1_iter78[1] + (r+0)*stride_t1_iter78[2]] + data_t1_iter78[(p+1)*stride_t1_iter78[0] + (q+0)*stride_t1_iter78[1] + (r+0)*stride_t1_iter78[2]] + data_t1_iter78[(p-1)*stride_t1_iter78[0] + (q+0)*stride_t1_iter78[1] + (r+0)*stride_t1_iter78[2]] + data_t1_iter78[(p+0)*stride_t1_iter78[0] + (q+1)*stride_t1_iter78[1] + (r+0)*stride_t1_iter78[2]] + data_t1_iter78[(p+0)*stride_t1_iter78[0] + (q-1)*stride_t1_iter78[1] + (r+0)*stride_t1_iter78[2]] + data_t1_iter78[(p+0)*stride_t1_iter78[0] + (q+0)*stride_t1_iter78[1] + (r+1)*stride_t1_iter78[2]] + data_t1_iter78[(p+0)*stride_t1_iter78[0] + (q+0)*stride_t1_iter78[1] + (r-1)*stride_t1_iter78[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter80, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 80; r < dims[2] - 80; ++r)
  {
    for(int32_t q = 80; q < dims[1] - 80; ++q)
    {
      for(int32_t p = 80; p < dims[0] - 80; ++p)
      {
        // t1_iter80(0, 0, 0) = ((t1_iter79(0, 0, 0) + t1_iter79(1, 0, 0) + t1_iter79(-1, 0, 0) + t1_iter79(0, 1, 0) + t1_iter79(0, -1, 0) + t1_iter79(0, 0, 1) + t1_iter79(0, 0, -1)) * 0.142857142f)
        data_t1_iter80[p*stride_t1_iter80[0]+q*stride_t1_iter80[1]+r*stride_t1_iter80[2]] = ((data_t1_iter79[(p+0)*stride_t1_iter79[0] + (q+0)*stride_t1_iter79[1] + (r+0)*stride_t1_iter79[2]] + data_t1_iter79[(p+1)*stride_t1_iter79[0] + (q+0)*stride_t1_iter79[1] + (r+0)*stride_t1_iter79[2]] + data_t1_iter79[(p-1)*stride_t1_iter79[0] + (q+0)*stride_t1_iter79[1] + (r+0)*stride_t1_iter79[2]] + data_t1_iter79[(p+0)*stride_t1_iter79[0] + (q+1)*stride_t1_iter79[1] + (r+0)*stride_t1_iter79[2]] + data_t1_iter79[(p+0)*stride_t1_iter79[0] + (q-1)*stride_t1_iter79[1] + (r+0)*stride_t1_iter79[2]] + data_t1_iter79[(p+0)*stride_t1_iter79[0] + (q+0)*stride_t1_iter79[1] + (r+1)*stride_t1_iter79[2]] + data_t1_iter79[(p+0)*stride_t1_iter79[0] + (q+0)*stride_t1_iter79[1] + (r-1)*stride_t1_iter79[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter81, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 81; r < dims[2] - 81; ++r)
  {
    for(int32_t q = 81; q < dims[1] - 81; ++q)
    {
      for(int32_t p = 81; p < dims[0] - 81; ++p)
      {
        // t1_iter81(0, 0, 0) = ((t1_iter80(0, 0, 0) + t1_iter80(1, 0, 0) + t1_iter80(-1, 0, 0) + t1_iter80(0, 1, 0) + t1_iter80(0, -1, 0) + t1_iter80(0, 0, 1) + t1_iter80(0, 0, -1)) * 0.142857142f)
        data_t1_iter81[p*stride_t1_iter81[0]+q*stride_t1_iter81[1]+r*stride_t1_iter81[2]] = ((data_t1_iter80[(p+0)*stride_t1_iter80[0] + (q+0)*stride_t1_iter80[1] + (r+0)*stride_t1_iter80[2]] + data_t1_iter80[(p+1)*stride_t1_iter80[0] + (q+0)*stride_t1_iter80[1] + (r+0)*stride_t1_iter80[2]] + data_t1_iter80[(p-1)*stride_t1_iter80[0] + (q+0)*stride_t1_iter80[1] + (r+0)*stride_t1_iter80[2]] + data_t1_iter80[(p+0)*stride_t1_iter80[0] + (q+1)*stride_t1_iter80[1] + (r+0)*stride_t1_iter80[2]] + data_t1_iter80[(p+0)*stride_t1_iter80[0] + (q-1)*stride_t1_iter80[1] + (r+0)*stride_t1_iter80[2]] + data_t1_iter80[(p+0)*stride_t1_iter80[0] + (q+0)*stride_t1_iter80[1] + (r+1)*stride_t1_iter80[2]] + data_t1_iter80[(p+0)*stride_t1_iter80[0] + (q+0)*stride_t1_iter80[1] + (r-1)*stride_t1_iter80[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter82, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 82; r < dims[2] - 82; ++r)
  {
    for(int32_t q = 82; q < dims[1] - 82; ++q)
    {
      for(int32_t p = 82; p < dims[0] - 82; ++p)
      {
        // t1_iter82(0, 0, 0) = ((t1_iter81(0, 0, 0) + t1_iter81(1, 0, 0) + t1_iter81(-1, 0, 0) + t1_iter81(0, 1, 0) + t1_iter81(0, -1, 0) + t1_iter81(0, 0, 1) + t1_iter81(0, 0, -1)) * 0.142857142f)
        data_t1_iter82[p*stride_t1_iter82[0]+q*stride_t1_iter82[1]+r*stride_t1_iter82[2]] = ((data_t1_iter81[(p+0)*stride_t1_iter81[0] + (q+0)*stride_t1_iter81[1] + (r+0)*stride_t1_iter81[2]] + data_t1_iter81[(p+1)*stride_t1_iter81[0] + (q+0)*stride_t1_iter81[1] + (r+0)*stride_t1_iter81[2]] + data_t1_iter81[(p-1)*stride_t1_iter81[0] + (q+0)*stride_t1_iter81[1] + (r+0)*stride_t1_iter81[2]] + data_t1_iter81[(p+0)*stride_t1_iter81[0] + (q+1)*stride_t1_iter81[1] + (r+0)*stride_t1_iter81[2]] + data_t1_iter81[(p+0)*stride_t1_iter81[0] + (q-1)*stride_t1_iter81[1] + (r+0)*stride_t1_iter81[2]] + data_t1_iter81[(p+0)*stride_t1_iter81[0] + (q+0)*stride_t1_iter81[1] + (r+1)*stride_t1_iter81[2]] + data_t1_iter81[(p+0)*stride_t1_iter81[0] + (q+0)*stride_t1_iter81[1] + (r-1)*stride_t1_iter81[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter83, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 83; r < dims[2] - 83; ++r)
  {
    for(int32_t q = 83; q < dims[1] - 83; ++q)
    {
      for(int32_t p = 83; p < dims[0] - 83; ++p)
      {
        // t1_iter83(0, 0, 0) = ((t1_iter82(0, 0, 0) + t1_iter82(1, 0, 0) + t1_iter82(-1, 0, 0) + t1_iter82(0, 1, 0) + t1_iter82(0, -1, 0) + t1_iter82(0, 0, 1) + t1_iter82(0, 0, -1)) * 0.142857142f)
        data_t1_iter83[p*stride_t1_iter83[0]+q*stride_t1_iter83[1]+r*stride_t1_iter83[2]] = ((data_t1_iter82[(p+0)*stride_t1_iter82[0] + (q+0)*stride_t1_iter82[1] + (r+0)*stride_t1_iter82[2]] + data_t1_iter82[(p+1)*stride_t1_iter82[0] + (q+0)*stride_t1_iter82[1] + (r+0)*stride_t1_iter82[2]] + data_t1_iter82[(p-1)*stride_t1_iter82[0] + (q+0)*stride_t1_iter82[1] + (r+0)*stride_t1_iter82[2]] + data_t1_iter82[(p+0)*stride_t1_iter82[0] + (q+1)*stride_t1_iter82[1] + (r+0)*stride_t1_iter82[2]] + data_t1_iter82[(p+0)*stride_t1_iter82[0] + (q-1)*stride_t1_iter82[1] + (r+0)*stride_t1_iter82[2]] + data_t1_iter82[(p+0)*stride_t1_iter82[0] + (q+0)*stride_t1_iter82[1] + (r+1)*stride_t1_iter82[2]] + data_t1_iter82[(p+0)*stride_t1_iter82[0] + (q+0)*stride_t1_iter82[1] + (r-1)*stride_t1_iter82[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter84, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 84; r < dims[2] - 84; ++r)
  {
    for(int32_t q = 84; q < dims[1] - 84; ++q)
    {
      for(int32_t p = 84; p < dims[0] - 84; ++p)
      {
        // t1_iter84(0, 0, 0) = ((t1_iter83(0, 0, 0) + t1_iter83(1, 0, 0) + t1_iter83(-1, 0, 0) + t1_iter83(0, 1, 0) + t1_iter83(0, -1, 0) + t1_iter83(0, 0, 1) + t1_iter83(0, 0, -1)) * 0.142857142f)
        data_t1_iter84[p*stride_t1_iter84[0]+q*stride_t1_iter84[1]+r*stride_t1_iter84[2]] = ((data_t1_iter83[(p+0)*stride_t1_iter83[0] + (q+0)*stride_t1_iter83[1] + (r+0)*stride_t1_iter83[2]] + data_t1_iter83[(p+1)*stride_t1_iter83[0] + (q+0)*stride_t1_iter83[1] + (r+0)*stride_t1_iter83[2]] + data_t1_iter83[(p-1)*stride_t1_iter83[0] + (q+0)*stride_t1_iter83[1] + (r+0)*stride_t1_iter83[2]] + data_t1_iter83[(p+0)*stride_t1_iter83[0] + (q+1)*stride_t1_iter83[1] + (r+0)*stride_t1_iter83[2]] + data_t1_iter83[(p+0)*stride_t1_iter83[0] + (q-1)*stride_t1_iter83[1] + (r+0)*stride_t1_iter83[2]] + data_t1_iter83[(p+0)*stride_t1_iter83[0] + (q+0)*stride_t1_iter83[1] + (r+1)*stride_t1_iter83[2]] + data_t1_iter83[(p+0)*stride_t1_iter83[0] + (q+0)*stride_t1_iter83[1] + (r-1)*stride_t1_iter83[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter85, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 85; r < dims[2] - 85; ++r)
  {
    for(int32_t q = 85; q < dims[1] - 85; ++q)
    {
      for(int32_t p = 85; p < dims[0] - 85; ++p)
      {
        // t1_iter85(0, 0, 0) = ((t1_iter84(0, 0, 0) + t1_iter84(1, 0, 0) + t1_iter84(-1, 0, 0) + t1_iter84(0, 1, 0) + t1_iter84(0, -1, 0) + t1_iter84(0, 0, 1) + t1_iter84(0, 0, -1)) * 0.142857142f)
        data_t1_iter85[p*stride_t1_iter85[0]+q*stride_t1_iter85[1]+r*stride_t1_iter85[2]] = ((data_t1_iter84[(p+0)*stride_t1_iter84[0] + (q+0)*stride_t1_iter84[1] + (r+0)*stride_t1_iter84[2]] + data_t1_iter84[(p+1)*stride_t1_iter84[0] + (q+0)*stride_t1_iter84[1] + (r+0)*stride_t1_iter84[2]] + data_t1_iter84[(p-1)*stride_t1_iter84[0] + (q+0)*stride_t1_iter84[1] + (r+0)*stride_t1_iter84[2]] + data_t1_iter84[(p+0)*stride_t1_iter84[0] + (q+1)*stride_t1_iter84[1] + (r+0)*stride_t1_iter84[2]] + data_t1_iter84[(p+0)*stride_t1_iter84[0] + (q-1)*stride_t1_iter84[1] + (r+0)*stride_t1_iter84[2]] + data_t1_iter84[(p+0)*stride_t1_iter84[0] + (q+0)*stride_t1_iter84[1] + (r+1)*stride_t1_iter84[2]] + data_t1_iter84[(p+0)*stride_t1_iter84[0] + (q+0)*stride_t1_iter84[1] + (r-1)*stride_t1_iter84[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter86, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 86; r < dims[2] - 86; ++r)
  {
    for(int32_t q = 86; q < dims[1] - 86; ++q)
    {
      for(int32_t p = 86; p < dims[0] - 86; ++p)
      {
        // t1_iter86(0, 0, 0) = ((t1_iter85(0, 0, 0) + t1_iter85(1, 0, 0) + t1_iter85(-1, 0, 0) + t1_iter85(0, 1, 0) + t1_iter85(0, -1, 0) + t1_iter85(0, 0, 1) + t1_iter85(0, 0, -1)) * 0.142857142f)
        data_t1_iter86[p*stride_t1_iter86[0]+q*stride_t1_iter86[1]+r*stride_t1_iter86[2]] = ((data_t1_iter85[(p+0)*stride_t1_iter85[0] + (q+0)*stride_t1_iter85[1] + (r+0)*stride_t1_iter85[2]] + data_t1_iter85[(p+1)*stride_t1_iter85[0] + (q+0)*stride_t1_iter85[1] + (r+0)*stride_t1_iter85[2]] + data_t1_iter85[(p-1)*stride_t1_iter85[0] + (q+0)*stride_t1_iter85[1] + (r+0)*stride_t1_iter85[2]] + data_t1_iter85[(p+0)*stride_t1_iter85[0] + (q+1)*stride_t1_iter85[1] + (r+0)*stride_t1_iter85[2]] + data_t1_iter85[(p+0)*stride_t1_iter85[0] + (q-1)*stride_t1_iter85[1] + (r+0)*stride_t1_iter85[2]] + data_t1_iter85[(p+0)*stride_t1_iter85[0] + (q+0)*stride_t1_iter85[1] + (r+1)*stride_t1_iter85[2]] + data_t1_iter85[(p+0)*stride_t1_iter85[0] + (q+0)*stride_t1_iter85[1] + (r-1)*stride_t1_iter85[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter87, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 87; r < dims[2] - 87; ++r)
  {
    for(int32_t q = 87; q < dims[1] - 87; ++q)
    {
      for(int32_t p = 87; p < dims[0] - 87; ++p)
      {
        // t1_iter87(0, 0, 0) = ((t1_iter86(0, 0, 0) + t1_iter86(1, 0, 0) + t1_iter86(-1, 0, 0) + t1_iter86(0, 1, 0) + t1_iter86(0, -1, 0) + t1_iter86(0, 0, 1) + t1_iter86(0, 0, -1)) * 0.142857142f)
        data_t1_iter87[p*stride_t1_iter87[0]+q*stride_t1_iter87[1]+r*stride_t1_iter87[2]] = ((data_t1_iter86[(p+0)*stride_t1_iter86[0] + (q+0)*stride_t1_iter86[1] + (r+0)*stride_t1_iter86[2]] + data_t1_iter86[(p+1)*stride_t1_iter86[0] + (q+0)*stride_t1_iter86[1] + (r+0)*stride_t1_iter86[2]] + data_t1_iter86[(p-1)*stride_t1_iter86[0] + (q+0)*stride_t1_iter86[1] + (r+0)*stride_t1_iter86[2]] + data_t1_iter86[(p+0)*stride_t1_iter86[0] + (q+1)*stride_t1_iter86[1] + (r+0)*stride_t1_iter86[2]] + data_t1_iter86[(p+0)*stride_t1_iter86[0] + (q-1)*stride_t1_iter86[1] + (r+0)*stride_t1_iter86[2]] + data_t1_iter86[(p+0)*stride_t1_iter86[0] + (q+0)*stride_t1_iter86[1] + (r+1)*stride_t1_iter86[2]] + data_t1_iter86[(p+0)*stride_t1_iter86[0] + (q+0)*stride_t1_iter86[1] + (r-1)*stride_t1_iter86[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter88, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 88; r < dims[2] - 88; ++r)
  {
    for(int32_t q = 88; q < dims[1] - 88; ++q)
    {
      for(int32_t p = 88; p < dims[0] - 88; ++p)
      {
        // t1_iter88(0, 0, 0) = ((t1_iter87(0, 0, 0) + t1_iter87(1, 0, 0) + t1_iter87(-1, 0, 0) + t1_iter87(0, 1, 0) + t1_iter87(0, -1, 0) + t1_iter87(0, 0, 1) + t1_iter87(0, 0, -1)) * 0.142857142f)
        data_t1_iter88[p*stride_t1_iter88[0]+q*stride_t1_iter88[1]+r*stride_t1_iter88[2]] = ((data_t1_iter87[(p+0)*stride_t1_iter87[0] + (q+0)*stride_t1_iter87[1] + (r+0)*stride_t1_iter87[2]] + data_t1_iter87[(p+1)*stride_t1_iter87[0] + (q+0)*stride_t1_iter87[1] + (r+0)*stride_t1_iter87[2]] + data_t1_iter87[(p-1)*stride_t1_iter87[0] + (q+0)*stride_t1_iter87[1] + (r+0)*stride_t1_iter87[2]] + data_t1_iter87[(p+0)*stride_t1_iter87[0] + (q+1)*stride_t1_iter87[1] + (r+0)*stride_t1_iter87[2]] + data_t1_iter87[(p+0)*stride_t1_iter87[0] + (q-1)*stride_t1_iter87[1] + (r+0)*stride_t1_iter87[2]] + data_t1_iter87[(p+0)*stride_t1_iter87[0] + (q+0)*stride_t1_iter87[1] + (r+1)*stride_t1_iter87[2]] + data_t1_iter87[(p+0)*stride_t1_iter87[0] + (q+0)*stride_t1_iter87[1] + (r-1)*stride_t1_iter87[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter89, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 89; r < dims[2] - 89; ++r)
  {
    for(int32_t q = 89; q < dims[1] - 89; ++q)
    {
      for(int32_t p = 89; p < dims[0] - 89; ++p)
      {
        // t1_iter89(0, 0, 0) = ((t1_iter88(0, 0, 0) + t1_iter88(1, 0, 0) + t1_iter88(-1, 0, 0) + t1_iter88(0, 1, 0) + t1_iter88(0, -1, 0) + t1_iter88(0, 0, 1) + t1_iter88(0, 0, -1)) * 0.142857142f)
        data_t1_iter89[p*stride_t1_iter89[0]+q*stride_t1_iter89[1]+r*stride_t1_iter89[2]] = ((data_t1_iter88[(p+0)*stride_t1_iter88[0] + (q+0)*stride_t1_iter88[1] + (r+0)*stride_t1_iter88[2]] + data_t1_iter88[(p+1)*stride_t1_iter88[0] + (q+0)*stride_t1_iter88[1] + (r+0)*stride_t1_iter88[2]] + data_t1_iter88[(p-1)*stride_t1_iter88[0] + (q+0)*stride_t1_iter88[1] + (r+0)*stride_t1_iter88[2]] + data_t1_iter88[(p+0)*stride_t1_iter88[0] + (q+1)*stride_t1_iter88[1] + (r+0)*stride_t1_iter88[2]] + data_t1_iter88[(p+0)*stride_t1_iter88[0] + (q-1)*stride_t1_iter88[1] + (r+0)*stride_t1_iter88[2]] + data_t1_iter88[(p+0)*stride_t1_iter88[0] + (q+0)*stride_t1_iter88[1] + (r+1)*stride_t1_iter88[2]] + data_t1_iter88[(p+0)*stride_t1_iter88[0] + (q+0)*stride_t1_iter88[1] + (r-1)*stride_t1_iter88[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter90, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 90; r < dims[2] - 90; ++r)
  {
    for(int32_t q = 90; q < dims[1] - 90; ++q)
    {
      for(int32_t p = 90; p < dims[0] - 90; ++p)
      {
        // t1_iter90(0, 0, 0) = ((t1_iter89(0, 0, 0) + t1_iter89(1, 0, 0) + t1_iter89(-1, 0, 0) + t1_iter89(0, 1, 0) + t1_iter89(0, -1, 0) + t1_iter89(0, 0, 1) + t1_iter89(0, 0, -1)) * 0.142857142f)
        data_t1_iter90[p*stride_t1_iter90[0]+q*stride_t1_iter90[1]+r*stride_t1_iter90[2]] = ((data_t1_iter89[(p+0)*stride_t1_iter89[0] + (q+0)*stride_t1_iter89[1] + (r+0)*stride_t1_iter89[2]] + data_t1_iter89[(p+1)*stride_t1_iter89[0] + (q+0)*stride_t1_iter89[1] + (r+0)*stride_t1_iter89[2]] + data_t1_iter89[(p-1)*stride_t1_iter89[0] + (q+0)*stride_t1_iter89[1] + (r+0)*stride_t1_iter89[2]] + data_t1_iter89[(p+0)*stride_t1_iter89[0] + (q+1)*stride_t1_iter89[1] + (r+0)*stride_t1_iter89[2]] + data_t1_iter89[(p+0)*stride_t1_iter89[0] + (q-1)*stride_t1_iter89[1] + (r+0)*stride_t1_iter89[2]] + data_t1_iter89[(p+0)*stride_t1_iter89[0] + (q+0)*stride_t1_iter89[1] + (r+1)*stride_t1_iter89[2]] + data_t1_iter89[(p+0)*stride_t1_iter89[0] + (q+0)*stride_t1_iter89[1] + (r-1)*stride_t1_iter89[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter91, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 91; r < dims[2] - 91; ++r)
  {
    for(int32_t q = 91; q < dims[1] - 91; ++q)
    {
      for(int32_t p = 91; p < dims[0] - 91; ++p)
      {
        // t1_iter91(0, 0, 0) = ((t1_iter90(0, 0, 0) + t1_iter90(1, 0, 0) + t1_iter90(-1, 0, 0) + t1_iter90(0, 1, 0) + t1_iter90(0, -1, 0) + t1_iter90(0, 0, 1) + t1_iter90(0, 0, -1)) * 0.142857142f)
        data_t1_iter91[p*stride_t1_iter91[0]+q*stride_t1_iter91[1]+r*stride_t1_iter91[2]] = ((data_t1_iter90[(p+0)*stride_t1_iter90[0] + (q+0)*stride_t1_iter90[1] + (r+0)*stride_t1_iter90[2]] + data_t1_iter90[(p+1)*stride_t1_iter90[0] + (q+0)*stride_t1_iter90[1] + (r+0)*stride_t1_iter90[2]] + data_t1_iter90[(p-1)*stride_t1_iter90[0] + (q+0)*stride_t1_iter90[1] + (r+0)*stride_t1_iter90[2]] + data_t1_iter90[(p+0)*stride_t1_iter90[0] + (q+1)*stride_t1_iter90[1] + (r+0)*stride_t1_iter90[2]] + data_t1_iter90[(p+0)*stride_t1_iter90[0] + (q-1)*stride_t1_iter90[1] + (r+0)*stride_t1_iter90[2]] + data_t1_iter90[(p+0)*stride_t1_iter90[0] + (q+0)*stride_t1_iter90[1] + (r+1)*stride_t1_iter90[2]] + data_t1_iter90[(p+0)*stride_t1_iter90[0] + (q+0)*stride_t1_iter90[1] + (r-1)*stride_t1_iter90[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter92, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 92; r < dims[2] - 92; ++r)
  {
    for(int32_t q = 92; q < dims[1] - 92; ++q)
    {
      for(int32_t p = 92; p < dims[0] - 92; ++p)
      {
        // t1_iter92(0, 0, 0) = ((t1_iter91(0, 0, 0) + t1_iter91(1, 0, 0) + t1_iter91(-1, 0, 0) + t1_iter91(0, 1, 0) + t1_iter91(0, -1, 0) + t1_iter91(0, 0, 1) + t1_iter91(0, 0, -1)) * 0.142857142f)
        data_t1_iter92[p*stride_t1_iter92[0]+q*stride_t1_iter92[1]+r*stride_t1_iter92[2]] = ((data_t1_iter91[(p+0)*stride_t1_iter91[0] + (q+0)*stride_t1_iter91[1] + (r+0)*stride_t1_iter91[2]] + data_t1_iter91[(p+1)*stride_t1_iter91[0] + (q+0)*stride_t1_iter91[1] + (r+0)*stride_t1_iter91[2]] + data_t1_iter91[(p-1)*stride_t1_iter91[0] + (q+0)*stride_t1_iter91[1] + (r+0)*stride_t1_iter91[2]] + data_t1_iter91[(p+0)*stride_t1_iter91[0] + (q+1)*stride_t1_iter91[1] + (r+0)*stride_t1_iter91[2]] + data_t1_iter91[(p+0)*stride_t1_iter91[0] + (q-1)*stride_t1_iter91[1] + (r+0)*stride_t1_iter91[2]] + data_t1_iter91[(p+0)*stride_t1_iter91[0] + (q+0)*stride_t1_iter91[1] + (r+1)*stride_t1_iter91[2]] + data_t1_iter91[(p+0)*stride_t1_iter91[0] + (q+0)*stride_t1_iter91[1] + (r-1)*stride_t1_iter91[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter93, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 93; r < dims[2] - 93; ++r)
  {
    for(int32_t q = 93; q < dims[1] - 93; ++q)
    {
      for(int32_t p = 93; p < dims[0] - 93; ++p)
      {
        // t1_iter93(0, 0, 0) = ((t1_iter92(0, 0, 0) + t1_iter92(1, 0, 0) + t1_iter92(-1, 0, 0) + t1_iter92(0, 1, 0) + t1_iter92(0, -1, 0) + t1_iter92(0, 0, 1) + t1_iter92(0, 0, -1)) * 0.142857142f)
        data_t1_iter93[p*stride_t1_iter93[0]+q*stride_t1_iter93[1]+r*stride_t1_iter93[2]] = ((data_t1_iter92[(p+0)*stride_t1_iter92[0] + (q+0)*stride_t1_iter92[1] + (r+0)*stride_t1_iter92[2]] + data_t1_iter92[(p+1)*stride_t1_iter92[0] + (q+0)*stride_t1_iter92[1] + (r+0)*stride_t1_iter92[2]] + data_t1_iter92[(p-1)*stride_t1_iter92[0] + (q+0)*stride_t1_iter92[1] + (r+0)*stride_t1_iter92[2]] + data_t1_iter92[(p+0)*stride_t1_iter92[0] + (q+1)*stride_t1_iter92[1] + (r+0)*stride_t1_iter92[2]] + data_t1_iter92[(p+0)*stride_t1_iter92[0] + (q-1)*stride_t1_iter92[1] + (r+0)*stride_t1_iter92[2]] + data_t1_iter92[(p+0)*stride_t1_iter92[0] + (q+0)*stride_t1_iter92[1] + (r+1)*stride_t1_iter92[2]] + data_t1_iter92[(p+0)*stride_t1_iter92[0] + (q+0)*stride_t1_iter92[1] + (r-1)*stride_t1_iter92[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter94, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 94; r < dims[2] - 94; ++r)
  {
    for(int32_t q = 94; q < dims[1] - 94; ++q)
    {
      for(int32_t p = 94; p < dims[0] - 94; ++p)
      {
        // t1_iter94(0, 0, 0) = ((t1_iter93(0, 0, 0) + t1_iter93(1, 0, 0) + t1_iter93(-1, 0, 0) + t1_iter93(0, 1, 0) + t1_iter93(0, -1, 0) + t1_iter93(0, 0, 1) + t1_iter93(0, 0, -1)) * 0.142857142f)
        data_t1_iter94[p*stride_t1_iter94[0]+q*stride_t1_iter94[1]+r*stride_t1_iter94[2]] = ((data_t1_iter93[(p+0)*stride_t1_iter93[0] + (q+0)*stride_t1_iter93[1] + (r+0)*stride_t1_iter93[2]] + data_t1_iter93[(p+1)*stride_t1_iter93[0] + (q+0)*stride_t1_iter93[1] + (r+0)*stride_t1_iter93[2]] + data_t1_iter93[(p-1)*stride_t1_iter93[0] + (q+0)*stride_t1_iter93[1] + (r+0)*stride_t1_iter93[2]] + data_t1_iter93[(p+0)*stride_t1_iter93[0] + (q+1)*stride_t1_iter93[1] + (r+0)*stride_t1_iter93[2]] + data_t1_iter93[(p+0)*stride_t1_iter93[0] + (q-1)*stride_t1_iter93[1] + (r+0)*stride_t1_iter93[2]] + data_t1_iter93[(p+0)*stride_t1_iter93[0] + (q+0)*stride_t1_iter93[1] + (r+1)*stride_t1_iter93[2]] + data_t1_iter93[(p+0)*stride_t1_iter93[0] + (q+0)*stride_t1_iter93[1] + (r-1)*stride_t1_iter93[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter95, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 95; r < dims[2] - 95; ++r)
  {
    for(int32_t q = 95; q < dims[1] - 95; ++q)
    {
      for(int32_t p = 95; p < dims[0] - 95; ++p)
      {
        // t1_iter95(0, 0, 0) = ((t1_iter94(0, 0, 0) + t1_iter94(1, 0, 0) + t1_iter94(-1, 0, 0) + t1_iter94(0, 1, 0) + t1_iter94(0, -1, 0) + t1_iter94(0, 0, 1) + t1_iter94(0, 0, -1)) * 0.142857142f)
        data_t1_iter95[p*stride_t1_iter95[0]+q*stride_t1_iter95[1]+r*stride_t1_iter95[2]] = ((data_t1_iter94[(p+0)*stride_t1_iter94[0] + (q+0)*stride_t1_iter94[1] + (r+0)*stride_t1_iter94[2]] + data_t1_iter94[(p+1)*stride_t1_iter94[0] + (q+0)*stride_t1_iter94[1] + (r+0)*stride_t1_iter94[2]] + data_t1_iter94[(p-1)*stride_t1_iter94[0] + (q+0)*stride_t1_iter94[1] + (r+0)*stride_t1_iter94[2]] + data_t1_iter94[(p+0)*stride_t1_iter94[0] + (q+1)*stride_t1_iter94[1] + (r+0)*stride_t1_iter94[2]] + data_t1_iter94[(p+0)*stride_t1_iter94[0] + (q-1)*stride_t1_iter94[1] + (r+0)*stride_t1_iter94[2]] + data_t1_iter94[(p+0)*stride_t1_iter94[0] + (q+0)*stride_t1_iter94[1] + (r+1)*stride_t1_iter94[2]] + data_t1_iter94[(p+0)*stride_t1_iter94[0] + (q+0)*stride_t1_iter94[1] + (r-1)*stride_t1_iter94[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter96, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 96; r < dims[2] - 96; ++r)
  {
    for(int32_t q = 96; q < dims[1] - 96; ++q)
    {
      for(int32_t p = 96; p < dims[0] - 96; ++p)
      {
        // t1_iter96(0, 0, 0) = ((t1_iter95(0, 0, 0) + t1_iter95(1, 0, 0) + t1_iter95(-1, 0, 0) + t1_iter95(0, 1, 0) + t1_iter95(0, -1, 0) + t1_iter95(0, 0, 1) + t1_iter95(0, 0, -1)) * 0.142857142f)
        data_t1_iter96[p*stride_t1_iter96[0]+q*stride_t1_iter96[1]+r*stride_t1_iter96[2]] = ((data_t1_iter95[(p+0)*stride_t1_iter95[0] + (q+0)*stride_t1_iter95[1] + (r+0)*stride_t1_iter95[2]] + data_t1_iter95[(p+1)*stride_t1_iter95[0] + (q+0)*stride_t1_iter95[1] + (r+0)*stride_t1_iter95[2]] + data_t1_iter95[(p-1)*stride_t1_iter95[0] + (q+0)*stride_t1_iter95[1] + (r+0)*stride_t1_iter95[2]] + data_t1_iter95[(p+0)*stride_t1_iter95[0] + (q+1)*stride_t1_iter95[1] + (r+0)*stride_t1_iter95[2]] + data_t1_iter95[(p+0)*stride_t1_iter95[0] + (q-1)*stride_t1_iter95[1] + (r+0)*stride_t1_iter95[2]] + data_t1_iter95[(p+0)*stride_t1_iter95[0] + (q+0)*stride_t1_iter95[1] + (r+1)*stride_t1_iter95[2]] + data_t1_iter95[(p+0)*stride_t1_iter95[0] + (q+0)*stride_t1_iter95[1] + (r-1)*stride_t1_iter95[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter97, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 97; r < dims[2] - 97; ++r)
  {
    for(int32_t q = 97; q < dims[1] - 97; ++q)
    {
      for(int32_t p = 97; p < dims[0] - 97; ++p)
      {
        // t1_iter97(0, 0, 0) = ((t1_iter96(0, 0, 0) + t1_iter96(1, 0, 0) + t1_iter96(-1, 0, 0) + t1_iter96(0, 1, 0) + t1_iter96(0, -1, 0) + t1_iter96(0, 0, 1) + t1_iter96(0, 0, -1)) * 0.142857142f)
        data_t1_iter97[p*stride_t1_iter97[0]+q*stride_t1_iter97[1]+r*stride_t1_iter97[2]] = ((data_t1_iter96[(p+0)*stride_t1_iter96[0] + (q+0)*stride_t1_iter96[1] + (r+0)*stride_t1_iter96[2]] + data_t1_iter96[(p+1)*stride_t1_iter96[0] + (q+0)*stride_t1_iter96[1] + (r+0)*stride_t1_iter96[2]] + data_t1_iter96[(p-1)*stride_t1_iter96[0] + (q+0)*stride_t1_iter96[1] + (r+0)*stride_t1_iter96[2]] + data_t1_iter96[(p+0)*stride_t1_iter96[0] + (q+1)*stride_t1_iter96[1] + (r+0)*stride_t1_iter96[2]] + data_t1_iter96[(p+0)*stride_t1_iter96[0] + (q-1)*stride_t1_iter96[1] + (r+0)*stride_t1_iter96[2]] + data_t1_iter96[(p+0)*stride_t1_iter96[0] + (q+0)*stride_t1_iter96[1] + (r+1)*stride_t1_iter96[2]] + data_t1_iter96[(p+0)*stride_t1_iter96[0] + (q+0)*stride_t1_iter96[1] + (r-1)*stride_t1_iter96[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter98, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 98; r < dims[2] - 98; ++r)
  {
    for(int32_t q = 98; q < dims[1] - 98; ++q)
    {
      for(int32_t p = 98; p < dims[0] - 98; ++p)
      {
        // t1_iter98(0, 0, 0) = ((t1_iter97(0, 0, 0) + t1_iter97(1, 0, 0) + t1_iter97(-1, 0, 0) + t1_iter97(0, 1, 0) + t1_iter97(0, -1, 0) + t1_iter97(0, 0, 1) + t1_iter97(0, 0, -1)) * 0.142857142f)
        data_t1_iter98[p*stride_t1_iter98[0]+q*stride_t1_iter98[1]+r*stride_t1_iter98[2]] = ((data_t1_iter97[(p+0)*stride_t1_iter97[0] + (q+0)*stride_t1_iter97[1] + (r+0)*stride_t1_iter97[2]] + data_t1_iter97[(p+1)*stride_t1_iter97[0] + (q+0)*stride_t1_iter97[1] + (r+0)*stride_t1_iter97[2]] + data_t1_iter97[(p-1)*stride_t1_iter97[0] + (q+0)*stride_t1_iter97[1] + (r+0)*stride_t1_iter97[2]] + data_t1_iter97[(p+0)*stride_t1_iter97[0] + (q+1)*stride_t1_iter97[1] + (r+0)*stride_t1_iter97[2]] + data_t1_iter97[(p+0)*stride_t1_iter97[0] + (q-1)*stride_t1_iter97[1] + (r+0)*stride_t1_iter97[2]] + data_t1_iter97[(p+0)*stride_t1_iter97[0] + (q+0)*stride_t1_iter97[1] + (r+1)*stride_t1_iter97[2]] + data_t1_iter97[(p+0)*stride_t1_iter97[0] + (q+0)*stride_t1_iter97[1] + (r-1)*stride_t1_iter97[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter99, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 99; r < dims[2] - 99; ++r)
  {
    for(int32_t q = 99; q < dims[1] - 99; ++q)
    {
      for(int32_t p = 99; p < dims[0] - 99; ++p)
      {
        // t1_iter99(0, 0, 0) = ((t1_iter98(0, 0, 0) + t1_iter98(1, 0, 0) + t1_iter98(-1, 0, 0) + t1_iter98(0, 1, 0) + t1_iter98(0, -1, 0) + t1_iter98(0, 0, 1) + t1_iter98(0, 0, -1)) * 0.142857142f)
        data_t1_iter99[p*stride_t1_iter99[0]+q*stride_t1_iter99[1]+r*stride_t1_iter99[2]] = ((data_t1_iter98[(p+0)*stride_t1_iter98[0] + (q+0)*stride_t1_iter98[1] + (r+0)*stride_t1_iter98[2]] + data_t1_iter98[(p+1)*stride_t1_iter98[0] + (q+0)*stride_t1_iter98[1] + (r+0)*stride_t1_iter98[2]] + data_t1_iter98[(p-1)*stride_t1_iter98[0] + (q+0)*stride_t1_iter98[1] + (r+0)*stride_t1_iter98[2]] + data_t1_iter98[(p+0)*stride_t1_iter98[0] + (q+1)*stride_t1_iter98[1] + (r+0)*stride_t1_iter98[2]] + data_t1_iter98[(p+0)*stride_t1_iter98[0] + (q-1)*stride_t1_iter98[1] + (r+0)*stride_t1_iter98[2]] + data_t1_iter98[(p+0)*stride_t1_iter98[0] + (q+0)*stride_t1_iter98[1] + (r+1)*stride_t1_iter98[2]] + data_t1_iter98[(p+0)*stride_t1_iter98[0] + (q+0)*stride_t1_iter98[1] + (r-1)*stride_t1_iter98[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter100, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 100; r < dims[2] - 100; ++r)
  {
    for(int32_t q = 100; q < dims[1] - 100; ++q)
    {
      for(int32_t p = 100; p < dims[0] - 100; ++p)
      {
        // t1_iter100(0, 0, 0) = ((t1_iter99(0, 0, 0) + t1_iter99(1, 0, 0) + t1_iter99(-1, 0, 0) + t1_iter99(0, 1, 0) + t1_iter99(0, -1, 0) + t1_iter99(0, 0, 1) + t1_iter99(0, 0, -1)) * 0.142857142f)
        data_t1_iter100[p*stride_t1_iter100[0]+q*stride_t1_iter100[1]+r*stride_t1_iter100[2]] = ((data_t1_iter99[(p+0)*stride_t1_iter99[0] + (q+0)*stride_t1_iter99[1] + (r+0)*stride_t1_iter99[2]] + data_t1_iter99[(p+1)*stride_t1_iter99[0] + (q+0)*stride_t1_iter99[1] + (r+0)*stride_t1_iter99[2]] + data_t1_iter99[(p-1)*stride_t1_iter99[0] + (q+0)*stride_t1_iter99[1] + (r+0)*stride_t1_iter99[2]] + data_t1_iter99[(p+0)*stride_t1_iter99[0] + (q+1)*stride_t1_iter99[1] + (r+0)*stride_t1_iter99[2]] + data_t1_iter99[(p+0)*stride_t1_iter99[0] + (q-1)*stride_t1_iter99[1] + (r+0)*stride_t1_iter99[2]] + data_t1_iter99[(p+0)*stride_t1_iter99[0] + (q+0)*stride_t1_iter99[1] + (r+1)*stride_t1_iter99[2]] + data_t1_iter99[(p+0)*stride_t1_iter99[0] + (q+0)*stride_t1_iter99[1] + (r-1)*stride_t1_iter99[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter101, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 101; r < dims[2] - 101; ++r)
  {
    for(int32_t q = 101; q < dims[1] - 101; ++q)
    {
      for(int32_t p = 101; p < dims[0] - 101; ++p)
      {
        // t1_iter101(0, 0, 0) = ((t1_iter100(0, 0, 0) + t1_iter100(1, 0, 0) + t1_iter100(-1, 0, 0) + t1_iter100(0, 1, 0) + t1_iter100(0, -1, 0) + t1_iter100(0, 0, 1) + t1_iter100(0, 0, -1)) * 0.142857142f)
        data_t1_iter101[p*stride_t1_iter101[0]+q*stride_t1_iter101[1]+r*stride_t1_iter101[2]] = ((data_t1_iter100[(p+0)*stride_t1_iter100[0] + (q+0)*stride_t1_iter100[1] + (r+0)*stride_t1_iter100[2]] + data_t1_iter100[(p+1)*stride_t1_iter100[0] + (q+0)*stride_t1_iter100[1] + (r+0)*stride_t1_iter100[2]] + data_t1_iter100[(p-1)*stride_t1_iter100[0] + (q+0)*stride_t1_iter100[1] + (r+0)*stride_t1_iter100[2]] + data_t1_iter100[(p+0)*stride_t1_iter100[0] + (q+1)*stride_t1_iter100[1] + (r+0)*stride_t1_iter100[2]] + data_t1_iter100[(p+0)*stride_t1_iter100[0] + (q-1)*stride_t1_iter100[1] + (r+0)*stride_t1_iter100[2]] + data_t1_iter100[(p+0)*stride_t1_iter100[0] + (q+0)*stride_t1_iter100[1] + (r+1)*stride_t1_iter100[2]] + data_t1_iter100[(p+0)*stride_t1_iter100[0] + (q+0)*stride_t1_iter100[1] + (r-1)*stride_t1_iter100[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter102, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 102; r < dims[2] - 102; ++r)
  {
    for(int32_t q = 102; q < dims[1] - 102; ++q)
    {
      for(int32_t p = 102; p < dims[0] - 102; ++p)
      {
        // t1_iter102(0, 0, 0) = ((t1_iter101(0, 0, 0) + t1_iter101(1, 0, 0) + t1_iter101(-1, 0, 0) + t1_iter101(0, 1, 0) + t1_iter101(0, -1, 0) + t1_iter101(0, 0, 1) + t1_iter101(0, 0, -1)) * 0.142857142f)
        data_t1_iter102[p*stride_t1_iter102[0]+q*stride_t1_iter102[1]+r*stride_t1_iter102[2]] = ((data_t1_iter101[(p+0)*stride_t1_iter101[0] + (q+0)*stride_t1_iter101[1] + (r+0)*stride_t1_iter101[2]] + data_t1_iter101[(p+1)*stride_t1_iter101[0] + (q+0)*stride_t1_iter101[1] + (r+0)*stride_t1_iter101[2]] + data_t1_iter101[(p-1)*stride_t1_iter101[0] + (q+0)*stride_t1_iter101[1] + (r+0)*stride_t1_iter101[2]] + data_t1_iter101[(p+0)*stride_t1_iter101[0] + (q+1)*stride_t1_iter101[1] + (r+0)*stride_t1_iter101[2]] + data_t1_iter101[(p+0)*stride_t1_iter101[0] + (q-1)*stride_t1_iter101[1] + (r+0)*stride_t1_iter101[2]] + data_t1_iter101[(p+0)*stride_t1_iter101[0] + (q+0)*stride_t1_iter101[1] + (r+1)*stride_t1_iter101[2]] + data_t1_iter101[(p+0)*stride_t1_iter101[0] + (q+0)*stride_t1_iter101[1] + (r-1)*stride_t1_iter101[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter103, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 103; r < dims[2] - 103; ++r)
  {
    for(int32_t q = 103; q < dims[1] - 103; ++q)
    {
      for(int32_t p = 103; p < dims[0] - 103; ++p)
      {
        // t1_iter103(0, 0, 0) = ((t1_iter102(0, 0, 0) + t1_iter102(1, 0, 0) + t1_iter102(-1, 0, 0) + t1_iter102(0, 1, 0) + t1_iter102(0, -1, 0) + t1_iter102(0, 0, 1) + t1_iter102(0, 0, -1)) * 0.142857142f)
        data_t1_iter103[p*stride_t1_iter103[0]+q*stride_t1_iter103[1]+r*stride_t1_iter103[2]] = ((data_t1_iter102[(p+0)*stride_t1_iter102[0] + (q+0)*stride_t1_iter102[1] + (r+0)*stride_t1_iter102[2]] + data_t1_iter102[(p+1)*stride_t1_iter102[0] + (q+0)*stride_t1_iter102[1] + (r+0)*stride_t1_iter102[2]] + data_t1_iter102[(p-1)*stride_t1_iter102[0] + (q+0)*stride_t1_iter102[1] + (r+0)*stride_t1_iter102[2]] + data_t1_iter102[(p+0)*stride_t1_iter102[0] + (q+1)*stride_t1_iter102[1] + (r+0)*stride_t1_iter102[2]] + data_t1_iter102[(p+0)*stride_t1_iter102[0] + (q-1)*stride_t1_iter102[1] + (r+0)*stride_t1_iter102[2]] + data_t1_iter102[(p+0)*stride_t1_iter102[0] + (q+0)*stride_t1_iter102[1] + (r+1)*stride_t1_iter102[2]] + data_t1_iter102[(p+0)*stride_t1_iter102[0] + (q+0)*stride_t1_iter102[1] + (r-1)*stride_t1_iter102[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter104, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 104; r < dims[2] - 104; ++r)
  {
    for(int32_t q = 104; q < dims[1] - 104; ++q)
    {
      for(int32_t p = 104; p < dims[0] - 104; ++p)
      {
        // t1_iter104(0, 0, 0) = ((t1_iter103(0, 0, 0) + t1_iter103(1, 0, 0) + t1_iter103(-1, 0, 0) + t1_iter103(0, 1, 0) + t1_iter103(0, -1, 0) + t1_iter103(0, 0, 1) + t1_iter103(0, 0, -1)) * 0.142857142f)
        data_t1_iter104[p*stride_t1_iter104[0]+q*stride_t1_iter104[1]+r*stride_t1_iter104[2]] = ((data_t1_iter103[(p+0)*stride_t1_iter103[0] + (q+0)*stride_t1_iter103[1] + (r+0)*stride_t1_iter103[2]] + data_t1_iter103[(p+1)*stride_t1_iter103[0] + (q+0)*stride_t1_iter103[1] + (r+0)*stride_t1_iter103[2]] + data_t1_iter103[(p-1)*stride_t1_iter103[0] + (q+0)*stride_t1_iter103[1] + (r+0)*stride_t1_iter103[2]] + data_t1_iter103[(p+0)*stride_t1_iter103[0] + (q+1)*stride_t1_iter103[1] + (r+0)*stride_t1_iter103[2]] + data_t1_iter103[(p+0)*stride_t1_iter103[0] + (q-1)*stride_t1_iter103[1] + (r+0)*stride_t1_iter103[2]] + data_t1_iter103[(p+0)*stride_t1_iter103[0] + (q+0)*stride_t1_iter103[1] + (r+1)*stride_t1_iter103[2]] + data_t1_iter103[(p+0)*stride_t1_iter103[0] + (q+0)*stride_t1_iter103[1] + (r-1)*stride_t1_iter103[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter105, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 105; r < dims[2] - 105; ++r)
  {
    for(int32_t q = 105; q < dims[1] - 105; ++q)
    {
      for(int32_t p = 105; p < dims[0] - 105; ++p)
      {
        // t1_iter105(0, 0, 0) = ((t1_iter104(0, 0, 0) + t1_iter104(1, 0, 0) + t1_iter104(-1, 0, 0) + t1_iter104(0, 1, 0) + t1_iter104(0, -1, 0) + t1_iter104(0, 0, 1) + t1_iter104(0, 0, -1)) * 0.142857142f)
        data_t1_iter105[p*stride_t1_iter105[0]+q*stride_t1_iter105[1]+r*stride_t1_iter105[2]] = ((data_t1_iter104[(p+0)*stride_t1_iter104[0] + (q+0)*stride_t1_iter104[1] + (r+0)*stride_t1_iter104[2]] + data_t1_iter104[(p+1)*stride_t1_iter104[0] + (q+0)*stride_t1_iter104[1] + (r+0)*stride_t1_iter104[2]] + data_t1_iter104[(p-1)*stride_t1_iter104[0] + (q+0)*stride_t1_iter104[1] + (r+0)*stride_t1_iter104[2]] + data_t1_iter104[(p+0)*stride_t1_iter104[0] + (q+1)*stride_t1_iter104[1] + (r+0)*stride_t1_iter104[2]] + data_t1_iter104[(p+0)*stride_t1_iter104[0] + (q-1)*stride_t1_iter104[1] + (r+0)*stride_t1_iter104[2]] + data_t1_iter104[(p+0)*stride_t1_iter104[0] + (q+0)*stride_t1_iter104[1] + (r+1)*stride_t1_iter104[2]] + data_t1_iter104[(p+0)*stride_t1_iter104[0] + (q+0)*stride_t1_iter104[1] + (r-1)*stride_t1_iter104[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter106, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 106; r < dims[2] - 106; ++r)
  {
    for(int32_t q = 106; q < dims[1] - 106; ++q)
    {
      for(int32_t p = 106; p < dims[0] - 106; ++p)
      {
        // t1_iter106(0, 0, 0) = ((t1_iter105(0, 0, 0) + t1_iter105(1, 0, 0) + t1_iter105(-1, 0, 0) + t1_iter105(0, 1, 0) + t1_iter105(0, -1, 0) + t1_iter105(0, 0, 1) + t1_iter105(0, 0, -1)) * 0.142857142f)
        data_t1_iter106[p*stride_t1_iter106[0]+q*stride_t1_iter106[1]+r*stride_t1_iter106[2]] = ((data_t1_iter105[(p+0)*stride_t1_iter105[0] + (q+0)*stride_t1_iter105[1] + (r+0)*stride_t1_iter105[2]] + data_t1_iter105[(p+1)*stride_t1_iter105[0] + (q+0)*stride_t1_iter105[1] + (r+0)*stride_t1_iter105[2]] + data_t1_iter105[(p-1)*stride_t1_iter105[0] + (q+0)*stride_t1_iter105[1] + (r+0)*stride_t1_iter105[2]] + data_t1_iter105[(p+0)*stride_t1_iter105[0] + (q+1)*stride_t1_iter105[1] + (r+0)*stride_t1_iter105[2]] + data_t1_iter105[(p+0)*stride_t1_iter105[0] + (q-1)*stride_t1_iter105[1] + (r+0)*stride_t1_iter105[2]] + data_t1_iter105[(p+0)*stride_t1_iter105[0] + (q+0)*stride_t1_iter105[1] + (r+1)*stride_t1_iter105[2]] + data_t1_iter105[(p+0)*stride_t1_iter105[0] + (q+0)*stride_t1_iter105[1] + (r-1)*stride_t1_iter105[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter107, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 107; r < dims[2] - 107; ++r)
  {
    for(int32_t q = 107; q < dims[1] - 107; ++q)
    {
      for(int32_t p = 107; p < dims[0] - 107; ++p)
      {
        // t1_iter107(0, 0, 0) = ((t1_iter106(0, 0, 0) + t1_iter106(1, 0, 0) + t1_iter106(-1, 0, 0) + t1_iter106(0, 1, 0) + t1_iter106(0, -1, 0) + t1_iter106(0, 0, 1) + t1_iter106(0, 0, -1)) * 0.142857142f)
        data_t1_iter107[p*stride_t1_iter107[0]+q*stride_t1_iter107[1]+r*stride_t1_iter107[2]] = ((data_t1_iter106[(p+0)*stride_t1_iter106[0] + (q+0)*stride_t1_iter106[1] + (r+0)*stride_t1_iter106[2]] + data_t1_iter106[(p+1)*stride_t1_iter106[0] + (q+0)*stride_t1_iter106[1] + (r+0)*stride_t1_iter106[2]] + data_t1_iter106[(p-1)*stride_t1_iter106[0] + (q+0)*stride_t1_iter106[1] + (r+0)*stride_t1_iter106[2]] + data_t1_iter106[(p+0)*stride_t1_iter106[0] + (q+1)*stride_t1_iter106[1] + (r+0)*stride_t1_iter106[2]] + data_t1_iter106[(p+0)*stride_t1_iter106[0] + (q-1)*stride_t1_iter106[1] + (r+0)*stride_t1_iter106[2]] + data_t1_iter106[(p+0)*stride_t1_iter106[0] + (q+0)*stride_t1_iter106[1] + (r+1)*stride_t1_iter106[2]] + data_t1_iter106[(p+0)*stride_t1_iter106[0] + (q+0)*stride_t1_iter106[1] + (r-1)*stride_t1_iter106[2]]) * 0.142857142f);
      }
    }
  }

  // produce t1_iter108, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 108; r < dims[2] - 108; ++r)
  {
    for(int32_t q = 108; q < dims[1] - 108; ++q)
    {
      for(int32_t p = 108; p < dims[0] - 108; ++p)
      {
        // t1_iter108(0, 0, 0) = ((t1_iter107(0, 0, 0) + t1_iter107(1, 0, 0) + t1_iter107(-1, 0, 0) + t1_iter107(0, 1, 0) + t1_iter107(0, -1, 0) + t1_iter107(0, 0, 1) + t1_iter107(0, 0, -1)) * 0.142857142f)
        data_t1_iter108[p*stride_t1_iter108[0]+q*stride_t1_iter108[1]+r*stride_t1_iter108[2]] = ((data_t1_iter107[(p+0)*stride_t1_iter107[0] + (q+0)*stride_t1_iter107[1] + (r+0)*stride_t1_iter107[2]] + data_t1_iter107[(p+1)*stride_t1_iter107[0] + (q+0)*stride_t1_iter107[1] + (r+0)*stride_t1_iter107[2]] + data_t1_iter107[(p-1)*stride_t1_iter107[0] + (q+0)*stride_t1_iter107[1] + (r+0)*stride_t1_iter107[2]] + data_t1_iter107[(p+0)*stride_t1_iter107[0] + (q+1)*stride_t1_iter107[1] + (r+0)*stride_t1_iter107[2]] + data_t1_iter107[(p+0)*stride_t1_iter107[0] + (q-1)*stride_t1_iter107[1] + (r+0)*stride_t1_iter107[2]] + data_t1_iter107[(p+0)*stride_t1_iter107[0] + (q+0)*stride_t1_iter107[1] + (r+1)*stride_t1_iter107[2]] + data_t1_iter107[(p+0)*stride_t1_iter107[0] + (q+0)*stride_t1_iter107[1] + (r-1)*stride_t1_iter107[2]]) * 0.142857142f);
      }
    }
  }

  // produce t0, can be parallelized with -fopenmp
#pragma omp parallel for
  for(int32_t r = 109; r < dims[2] - 109; ++r)
  {
    for(int32_t q = 109; q < dims[1] - 109; ++q)
    {
      for(int32_t p = 109; p < dims[0] - 109; ++p)
      {
        // t0(0, 0, 0) = ((t1_iter108(0, 0, 0) + t1_iter108(1, 0, 0) + t1_iter108(-1, 0, 0) + t1_iter108(0, 1, 0) + t1_iter108(0, -1, 0) + t1_iter108(0, 0, 1) + t1_iter108(0, 0, -1)) * 0.142857142f)
        float result_t0 = ((data_t1_iter108[(p+0)*stride_t1_iter108[0] + (q+0)*stride_t1_iter108[1] + (r+0)*stride_t1_iter108[2]] + data_t1_iter108[(p+1)*stride_t1_iter108[0] + (q+0)*stride_t1_iter108[1] + (r+0)*stride_t1_iter108[2]] + data_t1_iter108[(p-1)*stride_t1_iter108[0] + (q+0)*stride_t1_iter108[1] + (r+0)*stride_t1_iter108[2]] + data_t1_iter108[(p+0)*stride_t1_iter108[0] + (q+1)*stride_t1_iter108[1] + (r+0)*stride_t1_iter108[2]] + data_t1_iter108[(p+0)*stride_t1_iter108[0] + (q-1)*stride_t1_iter108[1] + (r+0)*stride_t1_iter108[2]] + data_t1_iter108[(p+0)*stride_t1_iter108[0] + (q+0)*stride_t1_iter108[1] + (r+1)*stride_t1_iter108[2]] + data_t1_iter108[(p+0)*stride_t1_iter108[0] + (q+0)*stride_t1_iter108[1] + (r-1)*stride_t1_iter108[2]]) * 0.142857142f);
        float val_fpga = data_t0[p * stride_t0[0] + q * stride_t0[1] + r * stride_t0[2]];
        float val_cpu = result_t0;
        double threshold = 0.00001;
        if (nullptr != getenv("THRESHOLD")) {
          threshold = atof(getenv("THRESHOLD"));
        }
        threshold *= threshold;
        if (double(val_fpga-val_cpu) * double(val_fpga-val_cpu) > threshold && double(val_fpga-val_cpu) * double(val_fpga-val_cpu) / (double(val_cpu) * double(val_cpu)) > threshold) {
          fprintf(stderr, "%lf != %lf @(%d, %d, %d)\n", double(val_fpga), double(val_cpu), p, q, r);
          ++error_count;
        }
      }
    }
  }

  clog << "INFO: " << (error_count ? "FAIL" : "PASS") << "!\n";

  return error_count ? 1 : 0;
}
#endif  // SODA_TEST_MAIN
