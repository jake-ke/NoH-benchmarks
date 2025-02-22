template <typename T1, typename T2> inline T1 min(T1 x, T2 y) { return (x < T1(y)) ? x : T1(y); }
template <typename T1, typename T2> inline T1 max(T1 x, T2 y) { return (x > T1(y)) ? x : T1(y); }

#include <tapa.h>
using tapa::aligned_allocator;/* Helper Function */
void host_serialize_A(std::vector<short, aligned_allocator<short>> &A_to, std::vector<short, aligned_allocator<short>> &A_from){
  /* Variable Declaration */
  unsigned int cnt = 0;
  /* Variable Declaration */

  // array
  // io_L3
  for (int c3 = 0; c3 <= 17; c3 += 1) {
    // io_L2
    for (int c4 = 0; c4 <= 7; c4 += 1)
      for (int c5 = 0; c5 <= 63; c5 += 1)
        A_to[cnt++] = A_from[(8 * c3 + c4) * 64 + c5];
  }
}
/* Helper Function */

/* Helper Function */
void host_serialize_B(std::vector<short, aligned_allocator<short>> &B_to, std::vector<short, aligned_allocator<short>> &B_from){
  /* Variable Declaration */
  unsigned int cnt = 0;
  /* Variable Declaration */

  // array
  // io_L3
  for (int c3 = 0; c3 <= 16; c3 += 1) {
    // io_L2
    for (int c4 = 0; c4 <= 7; c4 += 1)
      for (int c5 = 0; c5 <= 63; c5 += 1)
        B_to[cnt++] = B_from[(8 * c3 + c4) * 64 + c5];
  }
}
/* Helper Function */

/* Helper Function */
void host_deserialize_C(std::vector<short, aligned_allocator<short>> &C_to, std::vector<short, aligned_allocator<short>> &C_from){
  /* Variable Declaration */
  unsigned int cnt = 0;
  /* Variable Declaration */

  // array
  // io_L3
  for (int c3 = 0; c3 <= 16; c3 += 1) {
    // io_L2
    for (int c4 = 0; c4 <= 17; c4 += 1) {
      // io_L1
      // pe
      for (int c5 = 0; c5 <= 7; c5 += 1)
        for (int c6 = 0; c6 <= 7; c6 += 1)
          C_to[(8 * c4 + c5) * 136 + (8 * c3 + c6)] = C_from[cnt++];
    }
  }
}
/* Helper Function */

