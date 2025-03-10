#include "kernel_kernel.h"
template <typename T1, typename T2> inline T1 min(T1 x, T2 y) { return (x < T1(y)) ? x : T1(y); }
template <typename T1, typename T2> inline T1 max(T1 x, T2 y) { return (x > T1(y)) ? x : T1(y); }

/* Module Definition */
void A_IO_L3_in(tapa::istream<A_t32> &fifo_A_in, tapa::ostream<A_t32> &fifo_A_local_out) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  /* Variable Declaration */

  // array
  // io_L3
  for (int c3 = 0; c3 <= 17; c3 += 1) {
    // io_L2
    for (int c4 = 0; c4 <= 7; c4 += 1) {
      // access_coalesce
      // access_serialize
      for (int c5 = 0; c5 <= 1; c5 += 1) {
        // hls_pipeline
        {
          A_t32 in_data;
          A_t32 out_data;
          in_data = fifo_A_in.read();
          out_data = in_data;
          fifo_A_local_out.write(out_data);
        }
      }
    }
  }
}
/* Module Definition */

/* Module Definition */
void A_IO_L3_in_serialize(tapa::read_only_mmap<A_t32> A, tapa::ostream<A_t32> &fifo_A_local_out) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  /* Variable Declaration */

  for (int i = 0; i < 288; i++) {
  #pragma HLS PIPELINE II=1
    A_t32 fifo_data;
    fifo_data = A[i];
    fifo_A_local_out.write(fifo_data);
  }
}
/* Module Definition */

/* Module Definition */
void A_IO_L2_in_intra_trans(int idx, A_t32 local_A[8][2], tapa::ostream<A_t32> &fifo_A_local_out, bool intra_trans_en) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  int p0 = idx; // module id
  /* Variable Declaration */

  if (!intra_trans_en) return;


  // array
  // io_L3
  // io_L2
  // io_L1
  // pe
  for (int c5 = 0; c5 <= 1; c5 += 1) {
    // latency
    for (int c6 = 0; c6 <= 7; c6 += 1) {
      // latency
      for (int c7 = 0; c7 <= 7; c7 += 1) {
        // simd
        // hls_pipeline
        {
          A_t32 in_data;
          A_t32 out_data;
          in_data = local_A[c7][32 * c5 / 32];
          out_data = in_data;
          fifo_A_local_out.write(out_data);
        }
      }
    }
  }
}
/* Module Definition */

/* Module Definition */
void A_IO_L2_in_inter_trans(int idx, A_t32 local_A[8][2], tapa::istream<A_t32> &fifo_A_in, tapa::ostream<A_t32> &fifo_A_out, bool inter_trans_en) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  int p0 = idx; // module id
  /* Variable Declaration */

  if (!inter_trans_en) return;

  for (int c3 = p0; c3 <= 17; c3 += 1) {
    // io_L2
    if (c3 == p0) {
      for (int c4 = 0; c4 <= 7; c4 += 1) {
        // access_coalesce
        for (int c5 = 0; c5 <= 1; c5 += 1) {
          // hls_pipeline
          {
            A_t32 in_data;
            A_t32 out_data;
            in_data = fifo_A_in.read();
            out_data = in_data;
            local_A[c4][32 * c5 / 32] = out_data;
          }
        }
      }
    } else {
      for (int c4 = 0; c4 <= 7; c4 += 1) {
        // access_coalesce
        for (int c5 = 0; c5 <= 1; c5 += 1) {
          // hls_pipeline
          {
            A_t32 in_data;
            A_t32 out_data;
            in_data = fifo_A_in.read();
            out_data = in_data;
            fifo_A_out.write(out_data);
          }
        }
      }
    }
  }
}
/* Module Definition */

/* Module Definition */
void A_IO_L2_in_inter_trans_boundary(int idx, A_t32 local_A[8][2], tapa::istream<A_t32> &fifo_A_in, bool inter_trans_en) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  int p0 = idx; // module id
  /* Variable Declaration */

  if (!inter_trans_en) return;

  for (int c3 = p0; c3 <= 17; c3 += 1)
    if (c3 == p0) {
      // io_L2
      for (int c4 = 0; c4 <= 7; c4 += 1) {
        // access_coalesce
        for (int c5 = 0; c5 <= 1; c5 += 1) {
          // hls_pipeline
          {
            A_t32 in_data;
            A_t32 out_data;
            in_data = fifo_A_in.read();
            out_data = in_data;
            local_A[c4][32 * c5 / 32] = out_data;
          }
        }
      }
    }
}
/* Module Definition */

/* Module Definition */
void A_IO_L2_in(int idx, tapa::istream<A_t32> &fifo_A_in, tapa::ostream<A_t32> &fifo_A_out, tapa::ostream<A_t32> &fifo_A_local_out) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  int p0 = idx; // module id
  A_t32 local_A_ping[8][2];
  #pragma HLS RESOURCE variable=local_A_ping core=RAM_1P_BRAM
  A_t32 local_A_pong[8][2];
  #pragma HLS RESOURCE variable=local_A_pong core=RAM_1P_BRAM
  bool arb = 0;
  bool inter_trans_en = 1;
  bool intra_trans_en = 0;
  /* Variable Declaration */

  {
    // array
    // io_L3
    {
      if (arb == 0) {
        A_IO_L2_in_inter_trans(
          /* module id */ idx, 
          /* array */ local_A_pong, 
          /* fifo */ fifo_A_in, 
          /* fifo */ fifo_A_out, 
          /* enable */ inter_trans_en
        );
        A_IO_L2_in_intra_trans(
          /* module id */ idx, 
          /* array */ local_A_ping, 
          /* fifo */ fifo_A_local_out, 
          /* enable */ intra_trans_en
        );
      } else {
        A_IO_L2_in_inter_trans(
          /* module id */ idx, 
          /* array */ local_A_ping, 
          /* fifo */ fifo_A_in, 
          /* fifo */ fifo_A_out, 
          /* enable */ inter_trans_en
        );
        A_IO_L2_in_intra_trans(
          /* module id */ idx, 
          /* array */ local_A_pong, 
          /* fifo */ fifo_A_local_out, 
          /* enable */ intra_trans_en
        );
      }
      intra_trans_en = 1;
      arb = !arb;
    }
    if (arb == 0) {
      A_IO_L2_in_intra_trans(
        /* module id */ idx, 
        /* array */ local_A_ping, 
        /* fifo */ fifo_A_local_out, 
        /* enable */ intra_trans_en
      );
    } else {
      A_IO_L2_in_intra_trans(
        /* module id */ idx, 
        /* array */ local_A_pong, 
        /* fifo */ fifo_A_local_out, 
        /* enable */ intra_trans_en
      );
    }
  }
}
/* Module Definition */

/* Module Definition */
void A_IO_L2_in_boundary(int idx, tapa::istream<A_t32> &fifo_A_in, tapa::ostream<A_t32> &fifo_A_local_out) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  int p0 = idx; // module id
  A_t32 local_A_ping[8][2];
  #pragma HLS RESOURCE variable=local_A_ping core=RAM_1P_BRAM
  A_t32 local_A_pong[8][2];
  #pragma HLS RESOURCE variable=local_A_pong core=RAM_1P_BRAM
  bool arb = 0;
  bool inter_trans_en = 1;
  bool intra_trans_en = 0;
  /* Variable Declaration */

  {
    // array
    // io_L3
    {
      if (arb == 0) {
        A_IO_L2_in_inter_trans_boundary(
          /* module id */ idx, 
          /* array */ local_A_pong, 
          /* fifo */ fifo_A_in, 
          /* enable */ inter_trans_en
        );
        A_IO_L2_in_intra_trans(
          /* module id */ idx, 
          /* array */ local_A_ping, 
          /* fifo */ fifo_A_local_out, 
          /* enable */ intra_trans_en
        );
      } else {
        A_IO_L2_in_inter_trans_boundary(
          /* module id */ idx, 
          /* array */ local_A_ping, 
          /* fifo */ fifo_A_in, 
          /* enable */ inter_trans_en
        );
        A_IO_L2_in_intra_trans(
          /* module id */ idx, 
          /* array */ local_A_pong, 
          /* fifo */ fifo_A_local_out, 
          /* enable */ intra_trans_en
        );
      }
      intra_trans_en = 1;
      arb = !arb;
    }
    if (arb == 0) {
      A_IO_L2_in_intra_trans(
        /* module id */ idx, 
        /* array */ local_A_ping, 
        /* fifo */ fifo_A_local_out, 
        /* enable */ intra_trans_en
      );
    } else {
      A_IO_L2_in_intra_trans(
        /* module id */ idx, 
        /* array */ local_A_pong, 
        /* fifo */ fifo_A_local_out, 
        /* enable */ intra_trans_en
      );
    }
  }
}
/* Module Definition */

/* Module Definition */
void B_IO_L3_in(tapa::istream<B_t32> &fifo_B_in, tapa::ostream<B_t32> &fifo_B_local_out) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  /* Variable Declaration */

  // array
  // io_L3
  for (int c3 = 0; c3 <= 16; c3 += 1) {
    // io_L2
    for (int c4 = 0; c4 <= 7; c4 += 1) {
      // access_coalesce
      // access_serialize
      for (int c5 = 0; c5 <= 1; c5 += 1) {
        // hls_pipeline
        {
          B_t32 in_data;
          B_t32 out_data;
          in_data = fifo_B_in.read();
          out_data = in_data;
          fifo_B_local_out.write(out_data);
        }
      }
    }
  }
}
/* Module Definition */

/* Module Definition */
void B_IO_L3_in_serialize(tapa::read_only_mmap<B_t32> B, tapa::ostream<B_t32> &fifo_B_local_out) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  /* Variable Declaration */

  for (int i = 0; i < 272; i++) {
  #pragma HLS PIPELINE II=1
    B_t32 fifo_data;
    fifo_data = B[i];
    fifo_B_local_out.write(fifo_data);
  }
}
/* Module Definition */

/* Module Definition */
void B_IO_L2_in_intra_trans(int idx, B_t32 local_B[8][2], tapa::ostream<B_t32> &fifo_B_local_out, bool intra_trans_en) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  int p0 = idx; // module id
  /* Variable Declaration */

  if (!intra_trans_en) return;


  // array
  // io_L3
  // io_L2
  // io_L1
  // pe
  for (int c5 = 0; c5 <= 1; c5 += 1) {
    // latency
    for (int c6 = 0; c6 <= 7; c6 += 1) {
      // latency
      for (int c7 = 0; c7 <= 7; c7 += 1) {
        // simd
        // hls_pipeline
        {
          B_t32 in_data;
          B_t32 out_data;
          in_data = local_B[c6][32 * c5 / 32];
          out_data = in_data;
          fifo_B_local_out.write(out_data);
        }
      }
    }
  }
}
/* Module Definition */

/* Module Definition */
void B_IO_L2_in_inter_trans(int idx, B_t32 local_B[8][2], tapa::istream<B_t32> &fifo_B_in, tapa::ostream<B_t32> &fifo_B_out, bool inter_trans_en) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  int p0 = idx; // module id
  /* Variable Declaration */

  if (!inter_trans_en) return;

  for (int c3 = p0; c3 <= 16; c3 += 1) {
    // io_L2
    if (c3 == p0) {
      for (int c4 = 0; c4 <= 7; c4 += 1) {
        // access_coalesce
        for (int c5 = 0; c5 <= 1; c5 += 1) {
          // hls_pipeline
          {
            B_t32 in_data;
            B_t32 out_data;
            in_data = fifo_B_in.read();
            out_data = in_data;
            local_B[c4][32 * c5 / 32] = out_data;
          }
        }
      }
    } else {
      for (int c4 = 0; c4 <= 7; c4 += 1) {
        // access_coalesce
        for (int c5 = 0; c5 <= 1; c5 += 1) {
          // hls_pipeline
          {
            B_t32 in_data;
            B_t32 out_data;
            in_data = fifo_B_in.read();
            out_data = in_data;
            fifo_B_out.write(out_data);
          }
        }
      }
    }
  }
}
/* Module Definition */

/* Module Definition */
void B_IO_L2_in_inter_trans_boundary(int idx, B_t32 local_B[8][2], tapa::istream<B_t32> &fifo_B_in, bool inter_trans_en) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  int p0 = idx; // module id
  /* Variable Declaration */

  if (!inter_trans_en) return;

  for (int c3 = p0; c3 <= 16; c3 += 1)
    if (c3 == p0) {
      // io_L2
      for (int c4 = 0; c4 <= 7; c4 += 1) {
        // access_coalesce
        for (int c5 = 0; c5 <= 1; c5 += 1) {
          // hls_pipeline
          {
            B_t32 in_data;
            B_t32 out_data;
            in_data = fifo_B_in.read();
            out_data = in_data;
            local_B[c4][32 * c5 / 32] = out_data;
          }
        }
      }
    }
}
/* Module Definition */

/* Module Definition */
void B_IO_L2_in(int idx, tapa::istream<B_t32> &fifo_B_in, tapa::ostream<B_t32> &fifo_B_out, tapa::ostream<B_t32> &fifo_B_local_out) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  int p0 = idx; // module id
  B_t32 local_B_ping[8][2];
  #pragma HLS RESOURCE variable=local_B_ping core=RAM_1P_BRAM
  B_t32 local_B_pong[8][2];
  #pragma HLS RESOURCE variable=local_B_pong core=RAM_1P_BRAM
  bool arb = 0;
  bool inter_trans_en = 1;
  bool intra_trans_en = 0;
  /* Variable Declaration */

  {
    // array
    // io_L3
    {
      if (arb == 0) {
        B_IO_L2_in_inter_trans(
          /* module id */ idx, 
          /* array */ local_B_pong, 
          /* fifo */ fifo_B_in, 
          /* fifo */ fifo_B_out, 
          /* enable */ inter_trans_en
        );
        B_IO_L2_in_intra_trans(
          /* module id */ idx, 
          /* array */ local_B_ping, 
          /* fifo */ fifo_B_local_out, 
          /* enable */ intra_trans_en
        );
      } else {
        B_IO_L2_in_inter_trans(
          /* module id */ idx, 
          /* array */ local_B_ping, 
          /* fifo */ fifo_B_in, 
          /* fifo */ fifo_B_out, 
          /* enable */ inter_trans_en
        );
        B_IO_L2_in_intra_trans(
          /* module id */ idx, 
          /* array */ local_B_pong, 
          /* fifo */ fifo_B_local_out, 
          /* enable */ intra_trans_en
        );
      }
      intra_trans_en = 1;
      arb = !arb;
    }
    if (arb == 0) {
      B_IO_L2_in_intra_trans(
        /* module id */ idx, 
        /* array */ local_B_ping, 
        /* fifo */ fifo_B_local_out, 
        /* enable */ intra_trans_en
      );
    } else {
      B_IO_L2_in_intra_trans(
        /* module id */ idx, 
        /* array */ local_B_pong, 
        /* fifo */ fifo_B_local_out, 
        /* enable */ intra_trans_en
      );
    }
  }
}
/* Module Definition */

/* Module Definition */
void B_IO_L2_in_boundary(int idx, tapa::istream<B_t32> &fifo_B_in, tapa::ostream<B_t32> &fifo_B_local_out) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  int p0 = idx; // module id
  B_t32 local_B_ping[8][2];
  #pragma HLS RESOURCE variable=local_B_ping core=RAM_1P_BRAM
  B_t32 local_B_pong[8][2];
  #pragma HLS RESOURCE variable=local_B_pong core=RAM_1P_BRAM
  bool arb = 0;
  bool inter_trans_en = 1;
  bool intra_trans_en = 0;
  /* Variable Declaration */

  {
    // array
    // io_L3
    {
      if (arb == 0) {
        B_IO_L2_in_inter_trans_boundary(
          /* module id */ idx, 
          /* array */ local_B_pong, 
          /* fifo */ fifo_B_in, 
          /* enable */ inter_trans_en
        );
        B_IO_L2_in_intra_trans(
          /* module id */ idx, 
          /* array */ local_B_ping, 
          /* fifo */ fifo_B_local_out, 
          /* enable */ intra_trans_en
        );
      } else {
        B_IO_L2_in_inter_trans_boundary(
          /* module id */ idx, 
          /* array */ local_B_ping, 
          /* fifo */ fifo_B_in, 
          /* enable */ inter_trans_en
        );
        B_IO_L2_in_intra_trans(
          /* module id */ idx, 
          /* array */ local_B_pong, 
          /* fifo */ fifo_B_local_out, 
          /* enable */ intra_trans_en
        );
      }
      intra_trans_en = 1;
      arb = !arb;
    }
    if (arb == 0) {
      B_IO_L2_in_intra_trans(
        /* module id */ idx, 
        /* array */ local_B_ping, 
        /* fifo */ fifo_B_local_out, 
        /* enable */ intra_trans_en
      );
    } else {
      B_IO_L2_in_intra_trans(
        /* module id */ idx, 
        /* array */ local_B_pong, 
        /* fifo */ fifo_B_local_out, 
        /* enable */ intra_trans_en
      );
    }
  }
}
/* Module Definition */

/* Module Definition */
void PE(int idx, int idy, tapa::istream<A_t32> &fifo_A_in, tapa::ostream<A_t32> &fifo_A_out, tapa::istream<B_t32> &fifo_B_in, tapa::ostream<B_t32> &fifo_B_out, tapa::ostream<short> &fifo_C_drain_out) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  int p0 = idx, p1 = idy; // module id
  A_t1 local_A[1][32];
  #pragma HLS ARRAY_PARTITION variable=local_A dim=2 factor=32 cyclic
  #pragma HLS RESOURCE variable=local_A core=RAM_2P_BRAM
  B_t1 local_B[1][32];
  #pragma HLS ARRAY_PARTITION variable=local_B dim=2 factor=32 cyclic
  #pragma HLS RESOURCE variable=local_B core=RAM_2P_BRAM
  C_t1 local_C[8][8];
  #pragma HLS RESOURCE variable=local_C core=RAM_2P_BRAM
  /* Variable Declaration */

  // array
  // pe
  for (int c5 = 0; c5 <= 1; c5 += 1) {
    // latency
    for (int c6 = 0; c6 <= 7; c6 += 1) {
      // latency
      for (int c7 = 0; c7 <= 7; c7 += 1) {
        // hls_pipeline
        {
          {
            A_t32 fifo_data;
            fifo_data = fifo_A_in.read();
            for (int n = 0; n < 32; n++) {
            #pragma HLS UNROLL
              local_A[0][n] = fifo_data[n];
            }
          }
          {
            B_t32 fifo_data;
            fifo_data = fifo_B_in.read();
            for (int n = 0; n < 32; n++) {
            #pragma HLS UNROLL
              local_B[0][n] = fifo_data[n];
            }
          }
          // simd
          {
            if (c5 == 0) {
              // hls_unroll
              local_C[c7][c6] = 0;
            }
            for (int c8 = 0; c8 <= 31; c8 += 1) {
              // hls_unroll
              local_C[c7][c6] = (local_C[c7][c6] + (local_A[0][c8] * local_B[0][c8]));
            }
          }
          if (c5 == 1)
            fifo_C_drain_out.write(local_C[c7][c6]);
          {
            B_t32 fifo_data;
            short f31, f30, f29, f28, f27, f26, f25, f24, f23, f22, f21, f20, f19, f18, f17, f16, f15, f14, f13, f12, f11, f10, f9, f8, f7, f6, f5, f4, f3, f2, f1, f0;
            f31 = local_B[0][31];
            f30 = local_B[0][30];
            f29 = local_B[0][29];
            f28 = local_B[0][28];
            f27 = local_B[0][27];
            f26 = local_B[0][26];
            f25 = local_B[0][25];
            f24 = local_B[0][24];
            f23 = local_B[0][23];
            f22 = local_B[0][22];
            f21 = local_B[0][21];
            f20 = local_B[0][20];
            f19 = local_B[0][19];
            f18 = local_B[0][18];
            f17 = local_B[0][17];
            f16 = local_B[0][16];
            f15 = local_B[0][15];
            f14 = local_B[0][14];
            f13 = local_B[0][13];
            f12 = local_B[0][12];
            f11 = local_B[0][11];
            f10 = local_B[0][10];
            f9 = local_B[0][9];
            f8 = local_B[0][8];
            f7 = local_B[0][7];
            f6 = local_B[0][6];
            f5 = local_B[0][5];
            f4 = local_B[0][4];
            f3 = local_B[0][3];
            f2 = local_B[0][2];
            f1 = local_B[0][1];
            f0 = local_B[0][0];
            fifo_data.set(31, f31);
            fifo_data.set(30, f30);
            fifo_data.set(29, f29);
            fifo_data.set(28, f28);
            fifo_data.set(27, f27);
            fifo_data.set(26, f26);
            fifo_data.set(25, f25);
            fifo_data.set(24, f24);
            fifo_data.set(23, f23);
            fifo_data.set(22, f22);
            fifo_data.set(21, f21);
            fifo_data.set(20, f20);
            fifo_data.set(19, f19);
            fifo_data.set(18, f18);
            fifo_data.set(17, f17);
            fifo_data.set(16, f16);
            fifo_data.set(15, f15);
            fifo_data.set(14, f14);
            fifo_data.set(13, f13);
            fifo_data.set(12, f12);
            fifo_data.set(11, f11);
            fifo_data.set(10, f10);
            fifo_data.set(9, f9);
            fifo_data.set(8, f8);
            fifo_data.set(7, f7);
            fifo_data.set(6, f6);
            fifo_data.set(5, f5);
            fifo_data.set(4, f4);
            fifo_data.set(3, f3);
            fifo_data.set(2, f2);
            fifo_data.set(1, f1);
            fifo_data.set(0, f0);
            fifo_B_out.write(fifo_data);
          }
          {
            A_t32 fifo_data;
            short f31, f30, f29, f28, f27, f26, f25, f24, f23, f22, f21, f20, f19, f18, f17, f16, f15, f14, f13, f12, f11, f10, f9, f8, f7, f6, f5, f4, f3, f2, f1, f0;
            f31 = local_A[0][31];
            f30 = local_A[0][30];
            f29 = local_A[0][29];
            f28 = local_A[0][28];
            f27 = local_A[0][27];
            f26 = local_A[0][26];
            f25 = local_A[0][25];
            f24 = local_A[0][24];
            f23 = local_A[0][23];
            f22 = local_A[0][22];
            f21 = local_A[0][21];
            f20 = local_A[0][20];
            f19 = local_A[0][19];
            f18 = local_A[0][18];
            f17 = local_A[0][17];
            f16 = local_A[0][16];
            f15 = local_A[0][15];
            f14 = local_A[0][14];
            f13 = local_A[0][13];
            f12 = local_A[0][12];
            f11 = local_A[0][11];
            f10 = local_A[0][10];
            f9 = local_A[0][9];
            f8 = local_A[0][8];
            f7 = local_A[0][7];
            f6 = local_A[0][6];
            f5 = local_A[0][5];
            f4 = local_A[0][4];
            f3 = local_A[0][3];
            f2 = local_A[0][2];
            f1 = local_A[0][1];
            f0 = local_A[0][0];
            fifo_data.set(31, f31);
            fifo_data.set(30, f30);
            fifo_data.set(29, f29);
            fifo_data.set(28, f28);
            fifo_data.set(27, f27);
            fifo_data.set(26, f26);
            fifo_data.set(25, f25);
            fifo_data.set(24, f24);
            fifo_data.set(23, f23);
            fifo_data.set(22, f22);
            fifo_data.set(21, f21);
            fifo_data.set(20, f20);
            fifo_data.set(19, f19);
            fifo_data.set(18, f18);
            fifo_data.set(17, f17);
            fifo_data.set(16, f16);
            fifo_data.set(15, f15);
            fifo_data.set(14, f14);
            fifo_data.set(13, f13);
            fifo_data.set(12, f12);
            fifo_data.set(11, f11);
            fifo_data.set(10, f10);
            fifo_data.set(9, f9);
            fifo_data.set(8, f8);
            fifo_data.set(7, f7);
            fifo_data.set(6, f6);
            fifo_data.set(5, f5);
            fifo_data.set(4, f4);
            fifo_data.set(3, f3);
            fifo_data.set(2, f2);
            fifo_data.set(1, f1);
            fifo_data.set(0, f0);
            fifo_A_out.write(fifo_data);
          }
        }
      }
    }
  }
}
/* Module Definition */

/* Module Definition */
void PE_wrapper(int idx, int idy, tapa::istream<A_t32> &fifo_A_in, tapa::ostream<A_t32> &fifo_A_out, tapa::istream<B_t32> &fifo_B_in, tapa::ostream<B_t32> &fifo_B_out, tapa::ostream<short> &fifo_C_drain_out)
 {
  PE(
    /* module id */ idx, 
    /* module id */ idy, 
    /* fifo */ fifo_A_in, 
    /* fifo */ fifo_A_out, 
    /* fifo */ fifo_B_in, 
    /* fifo */ fifo_B_out, 
    /* fifo */ fifo_C_drain_out);
}
/* Module Definition */

/* Module Definition */
void A_PE_dummy_in(int idx, int idy, tapa::istream<A_t32> &fifo_A_in) {
  /* Variable Declaration */
  int p0 = idx, p1 = idy; // module id
  /* Variable Declaration */

  // array
  // pe
  for (int c5 = 0; c5 <= 1; c5 += 1) {
    // latency
    for (int c6 = 0; c6 <= 7; c6 += 1) {
      // latency
      for (int c7 = 0; c7 <= 7; c7 += 1) {
        // hls_pipeline
        A_t32 fifo_data;
        fifo_data = fifo_A_in.read();
      }
    }
  }
}
/* Module Definition */

/* Module Definition */
void B_PE_dummy_in(int idx, int idy, tapa::istream<B_t32> &fifo_B_in) {
  /* Variable Declaration */
  int p0 = idx, p1 = idy; // module id
  /* Variable Declaration */

  // array
  // pe
  for (int c5 = 0; c5 <= 1; c5 += 1) {
    // latency
    for (int c6 = 0; c6 <= 7; c6 += 1) {
      // latency
      for (int c7 = 0; c7 <= 7; c7 += 1) {
        // hls_pipeline
        B_t32 fifo_data;
        fifo_data = fifo_B_in.read();
      }
    }
  }
}
/* Module Definition */

/* Module Definition */
void C_drain_IO_L1_out_intra_trans(int idx, int idy, C_t8 local_C[8][1], tapa::istream<short> &fifo_C_drain_local_in) {
#pragma HLS INLINE
  /* Variable Declaration */
  int p0 = idx, p1 = idy; // module id
  /* Variable Declaration */


  // io_L1
  // pe
  // latency
  for (int c6 = 0; c6 <= 7; c6 += 1) {
    // latency
    for (int c7 = 0; c7 <= 7; c7 += 1) {
      // simd
      // hls_pipeline
      {
        C_t1 in_data;
        C_t8 out_data;
        short data_split[8];
        #pragma HLS ARRAY_PARTITION variable=data_split complete
        in_data = fifo_C_drain_local_in.read();
        int split_idx = (c6 / 1) % 8;
        out_data = local_C[c7][c6 / 8];
        for (int n = 0; n < 8; n++) {
        #pragma HLS UNROLL
          data_split[n] = out_data[n];
        }
        data_split[split_idx] = in_data;
        out_data.set(0, data_split[0]);
        out_data.set(1, data_split[1]);
        out_data.set(2, data_split[2]);
        out_data.set(3, data_split[3]);
        out_data.set(4, data_split[4]);
        out_data.set(5, data_split[5]);
        out_data.set(6, data_split[6]);
        out_data.set(7, data_split[7]);
        local_C[c7][c6 / 8] = out_data;
      }
    }
  }
}
/* Module Definition */

/* Module Definition */
void C_drain_IO_L1_out_inter_trans(int idx, int idy, C_t8 local_C[8][1], tapa::istream<C_t8> &fifo_C_drain_in, tapa::ostream<C_t8> &fifo_C_drain_out) {
#pragma HLS INLINE
  /* Variable Declaration */
  int p0 = idx, p1 = idy; // module id
  /* Variable Declaration */

  for (int c4 = p1; c4 <= 17; c4 += 1) {
    // io_L1
    if (c4 == p1) {
      for (int c5 = 0; c5 <= 7; c5 += 1) {
        // access_coalesce
        // hls_pipeline
        {
          C_t8 in_data;
          C_t8 out_data;
          in_data = local_C[c5][0 / 8];
          out_data = in_data;
          fifo_C_drain_out.write(out_data);
        }
      }
    } else {
      for (int c5 = 0; c5 <= 7; c5 += 1) {
        // access_coalesce
        // hls_pipeline
        {
          C_t8 in_data;
          C_t8 out_data;
          in_data = fifo_C_drain_in.read();
          out_data = in_data;
          fifo_C_drain_out.write(out_data);
        }
      }
    }
  }
}
/* Module Definition */

/* Module Definition */
void C_drain_IO_L1_out_inter_trans_boundary(int idx, int idy, C_t8 local_C[8][1], tapa::ostream<C_t8> &fifo_C_drain_out) {
#pragma HLS INLINE
  /* Variable Declaration */
  int p0 = idx, p1 = idy; // module id
  /* Variable Declaration */

  for (int c4 = p1; c4 <= 17; c4 += 1)
    if (c4 == p1) {
      // io_L1
      for (int c5 = 0; c5 <= 7; c5 += 1) {
        // access_coalesce
        // hls_pipeline
        {
          C_t8 in_data;
          C_t8 out_data;
          in_data = local_C[c5][0 / 8];
          out_data = in_data;
          fifo_C_drain_out.write(out_data);
        }
      }
    }
}
/* Module Definition */

/* Module Definition */
void C_drain_IO_L1_out(int idx, int idy, tapa::istream<C_t8> &fifo_C_drain_in, tapa::ostream<C_t8> &fifo_C_drain_out, tapa::istream<short> &fifo_C_drain_local_in) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  int p0 = idx, p1 = idy; // module id
  C_t8 local_C[8][1];
  #pragma HLS RESOURCE variable=local_C core=RAM_2P_BRAM
  /* Variable Declaration */

  // array
  // io_L3
  // io_L2
  C_drain_IO_L1_out_intra_trans(
    /* module id */ idx, 
    /* module id */ idy, 
    /* array */ local_C, 
    /* fifo */ fifo_C_drain_local_in
  );
  C_drain_IO_L1_out_inter_trans(
    /* module id */ idx, 
    /* module id */ idy, 
    /* array */ local_C, 
    /* fifo */ fifo_C_drain_in, 
    /* fifo */ fifo_C_drain_out
  );
}
/* Module Definition */

/* Module Definition */
void C_drain_IO_L1_out_wrapper(int idx, int idy, tapa::istream<C_t8> &fifo_C_drain_in, tapa::ostream<C_t8> &fifo_C_drain_out, tapa::istream<short> &fifo_C_drain_local_in)
 {
  C_drain_IO_L1_out(
    /* module id */ idx, 
    /* module id */ idy, 
    /* fifo */ fifo_C_drain_in, 
    /* fifo */ fifo_C_drain_out, 
    /* fifo */ fifo_C_drain_local_in);
}
/* Module Definition */

/* Module Definition */
void C_drain_IO_L1_out_boundary(int idx, int idy, tapa::ostream<C_t8> &fifo_C_drain_out, tapa::istream<short> &fifo_C_drain_local_in) {
#pragma HLS INLINE
  /* Variable Declaration */
  int p0 = idx, p1 = idy; // module id
  C_t8 local_C[8][1];
  #pragma HLS RESOURCE variable=local_C core=RAM_2P_BRAM
  /* Variable Declaration */

  // array
  // io_L3
  // io_L2
  C_drain_IO_L1_out_intra_trans(
    /* module id */ idx, 
    /* module id */ idy, 
    /* array */ local_C, 
    /* fifo */ fifo_C_drain_local_in
  );
  C_drain_IO_L1_out_inter_trans_boundary(
    /* module id */ idx, 
    /* module id */ idy, 
    /* array */ local_C, 
    /* fifo */ fifo_C_drain_out
  );
}
/* Module Definition */

/* Module Definition */
void C_drain_IO_L1_out_boundary_wrapper(int idx, int idy, tapa::ostream<C_t8> &fifo_C_drain_out, tapa::istream<short> &fifo_C_drain_local_in)
 {
  C_drain_IO_L1_out_boundary(
    /* module id */ idx, 
    /* module id */ idy, 
    /* fifo */ fifo_C_drain_out, 
    /* fifo */ fifo_C_drain_local_in);
}
/* Module Definition */

/* Module Definition */
void C_drain_IO_L2_out(int idx, tapa::istream<C_t8> &fifo_C_drain_in, tapa::ostream<C_t8> &fifo_C_drain_out, tapa::istream<C_t8> &fifo_C_drain_local_in) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  int p0 = idx; // module id
  /* Variable Declaration */

  // array
  // io_L3
  for (int c3 = p0; c3 <= 16; c3 += 1) {
    // io_L2
    if (c3 == p0) {
      for (int c4 = 0; c4 <= 17; c4 += 1) {
        // io_L1
        for (int c5 = 0; c5 <= 7; c5 += 1) {
          // access_coalesce
          // hls_pipeline
          {
            C_t8 in_data;
            C_t8 out_data;
            in_data = fifo_C_drain_local_in.read();
            out_data = in_data;
            fifo_C_drain_out.write(out_data);
          }
        }
      }
    } else {
      for (int c4 = 0; c4 <= 17; c4 += 1) {
        // io_L1
        for (int c5 = 0; c5 <= 7; c5 += 1) {
          // access_coalesce
          // hls_pipeline
          {
            C_t8 in_data;
            C_t8 out_data;
            in_data = fifo_C_drain_in.read();
            out_data = in_data;
            fifo_C_drain_out.write(out_data);
          }
        }
      }
    }
  }
}
/* Module Definition */

/* Module Definition */
void C_drain_IO_L2_out_boundary(int idx, tapa::ostream<C_t8> &fifo_C_drain_out, tapa::istream<C_t8> &fifo_C_drain_local_in) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  int p0 = idx; // module id
  /* Variable Declaration */

  // array
  // io_L3
  for (int c3 = p0; c3 <= 16; c3 += 1)
    if (c3 == p0) {
      // io_L2
      for (int c4 = 0; c4 <= 17; c4 += 1) {
        // io_L1
        for (int c5 = 0; c5 <= 7; c5 += 1) {
          // access_coalesce
          // hls_pipeline
          {
            C_t8 in_data;
            C_t8 out_data;
            in_data = fifo_C_drain_local_in.read();
            out_data = in_data;
            fifo_C_drain_out.write(out_data);
          }
        }
      }
    }
}
/* Module Definition */

/* Module Definition */
void C_drain_IO_L3_out(tapa::ostream<C_t8> &fifo_C_drain_out, tapa::istream<C_t8> &fifo_C_drain_local_in) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  /* Variable Declaration */

  // array
  // io_L3
  for (int c3 = 0; c3 <= 16; c3 += 1) {
    // io_L2
    for (int c4 = 0; c4 <= 17; c4 += 1) {
      // io_L1
      for (int c5 = 0; c5 <= 7; c5 += 1) {
        // access_coalesce
        // access_serialize
        // hls_pipeline
        {
          C_t8 in_data;
          C_t8 out_data;
          in_data = fifo_C_drain_local_in.read();
          out_data = in_data;
          fifo_C_drain_out.write(out_data);
        }
      }
    }
  }
}
/* Module Definition */

/* Module Definition */
void C_drain_IO_L3_out_serialize(tapa::write_only_mmap<C_t32> C, tapa::istream<C_t8> &fifo_C_drain_local_in) {
#pragma HLS INLINE OFF
  /* Variable Declaration */
  /* Variable Declaration */

  for (int i = 0; i < 612; i++) {
  #pragma HLS PIPELINE II=1
    C_t8 fifo_data;
    C_t32 mem_data;
    C_t8 mem_data_split[4];
    #pragma HLS ARRAY_PARTITION variable=mem_data_split complete
    for (int p = 0; p < 4; p++) {
      fifo_data = fifo_C_drain_local_in.read();
      mem_data_split[p] = fifo_data;
    }
    mem_data.set(0, mem_data_split[0][0]);
    mem_data.set(1, mem_data_split[0][1]);
    mem_data.set(2, mem_data_split[0][2]);
    mem_data.set(3, mem_data_split[0][3]);
    mem_data.set(4, mem_data_split[0][4]);
    mem_data.set(5, mem_data_split[0][5]);
    mem_data.set(6, mem_data_split[0][6]);
    mem_data.set(7, mem_data_split[0][7]);
    mem_data.set(8, mem_data_split[1][0]);
    mem_data.set(9, mem_data_split[1][1]);
    mem_data.set(10, mem_data_split[1][2]);
    mem_data.set(11, mem_data_split[1][3]);
    mem_data.set(12, mem_data_split[1][4]);
    mem_data.set(13, mem_data_split[1][5]);
    mem_data.set(14, mem_data_split[1][6]);
    mem_data.set(15, mem_data_split[1][7]);
    mem_data.set(16, mem_data_split[2][0]);
    mem_data.set(17, mem_data_split[2][1]);
    mem_data.set(18, mem_data_split[2][2]);
    mem_data.set(19, mem_data_split[2][3]);
    mem_data.set(20, mem_data_split[2][4]);
    mem_data.set(21, mem_data_split[2][5]);
    mem_data.set(22, mem_data_split[2][6]);
    mem_data.set(23, mem_data_split[2][7]);
    mem_data.set(24, mem_data_split[3][0]);
    mem_data.set(25, mem_data_split[3][1]);
    mem_data.set(26, mem_data_split[3][2]);
    mem_data.set(27, mem_data_split[3][3]);
    mem_data.set(28, mem_data_split[3][4]);
    mem_data.set(29, mem_data_split[3][5]);
    mem_data.set(30, mem_data_split[3][6]);
    mem_data.set(31, mem_data_split[3][7]);
    C[i] = mem_data;
  }
}
/* Module Definition */

