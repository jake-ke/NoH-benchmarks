#include "kernel_host.h"
#include <assert.h>
#include <stdio.h>
#include "kernel_kernel.h"

#include "kernel.h"

//#define LAYOUT1
#define LAYOUT2
//#define LAYOUT3

int main(int argc, char **argv) {
//  data_t A[I][K], B[K][J], C[I][J], C_golden[I][J]; 
#ifdef LAYOUT2  
  static data_t A[I][K], B[J][K], C[I][J], C_golden[I][J]; // gemm0,3
#endif  
#ifdef LAYOUT3  
  static data_t A[K][I], B[K][J], C[I][J], C_golden[I][J]; // gemm4
#endif  

  for (int i = 0; i < I; i++) 
    for (int k = 0; k < K; k++) {
#ifdef LAYOUT2      
      A[i][k] = (data_t)rand() / RAND_MAX;
#endif
#ifdef LAYOUT3      
      A[k][i] = (data_t)rand() / RAND_MAX;
#endif      
    }

  for (int j = 0; j < J; j++)
    for (int k = 0; k < K; k++) {
#ifdef LAYOUT2      
      B[j][k] = (data_t)rand() / RAND_MAX;
#endif
#ifdef LAYOUT3      
      B[k][j] = (data_t)rand() / RAND_MAX;
#endif      
    }

  {
    // Allocate memory in host memory
    std::vector<short, tapa::aligned_allocator<short>> dev_A_unserialized((144) * (64));
    std::vector<short, tapa::aligned_allocator<short>> dev_A(9216);
    std::vector<short, tapa::aligned_allocator<short>> dev_B_unserialized((136) * (64));
    std::vector<short, tapa::aligned_allocator<short>> dev_B(8704);
    std::vector<short, tapa::aligned_allocator<short>> dev_C_unserialized((144) * (136));
    std::vector<short, tapa::aligned_allocator<short>> dev_C(19584);

    // Initialize host buffers
    std::copy(reinterpret_cast<short *>(A), reinterpret_cast<short *>(A) + (144) * (64), dev_A_unserialized.begin());
    std::copy(reinterpret_cast<short *>(B), reinterpret_cast<short *>(B) + (136) * (64), dev_B_unserialized.begin());
    host_serialize_A(dev_A, dev_A_unserialized);
    host_serialize_B(dev_B, dev_B_unserialized);

    // Explicitly create TAPA mmap objects
    std::vector<tapa::read_only_mmap<short>> buffer_A;
    std::vector<tapa::read_only_mmap<short>> buffer_B;
    std::vector<tapa::write_only_mmap<short>> buffer_C;
    // Set the direction of the TAPA mmap objects
    for (int i = 0; i < 1; i++) {
      tapa::read_only_mmap<short> buffer_A_tmp(dev_A);
      buffer_A.push_back(std::move(buffer_A_tmp));
    }
    for (int i = 0; i < 1; i++) {
      tapa::read_only_mmap<short> buffer_B_tmp(dev_B);
      buffer_B.push_back(std::move(buffer_B_tmp));
    }
    for (int i = 0; i < 1; i++) {
      tapa::write_only_mmap<short> buffer_C_tmp(dev_C);
      buffer_C.push_back(std::move(buffer_C_tmp));
    }

    // Launch the kernel
    tapa::task().invoke(kernel0, buffer_A[0].vectorized<32>(), buffer_B[0].vectorized<32>(), buffer_C[0].vectorized<32>());
    host_deserialize_C(dev_C_unserialized, dev_C);
    // Restore data from host buffers
    std::copy(dev_C_unserialized.begin(), dev_C_unserialized.end(), reinterpret_cast<short *>(C));
  }

  for (int i = 0; i < I; i++)
    for (int j = 0; j < J; j++) {
      C_golden[i][j] = 0;
      for (int k = 0; k < K; k++) {
#ifdef LAYOUT2        
        C_golden[i][j] = C_golden[i][j] + A[i][k] * B[j][k];
#endif
#ifdef LAYOUT3        
        C_golden[i][j] = C_golden[i][j] + A[k][i] * B[k][j];
#endif        
      }
    }

  int err = 0;
  for (int i = 0; i < I; i++)
    for (int j = 0; j < J; j++) {
      if (fabs((float)C_golden[i][j] - (float)C[i][j]) > 0.001)
        err++;
    }

  if (err)
    printf("Failed with %d errors!\n", err);
  else
    printf("Passed!\n");

  return 0;
}
