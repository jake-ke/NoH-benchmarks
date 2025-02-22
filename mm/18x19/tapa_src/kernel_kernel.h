#include <tapa.h>
#include <ap_int.h>

/* Data Type */
typedef short A_t1;
typedef short B_t1;
typedef short C_t1;
typedef tapa::vec_t<short, 32> A_t32;
typedef tapa::vec_t<short, 32> B_t32;
typedef tapa::vec_t<short, 32> C_t32;
typedef tapa::vec_t<short, 8> C_t8;
/* Data Type */

void kernel0(tapa::read_only_mmap<A_t32> A, tapa::read_only_mmap<B_t32> B, tapa::write_only_mmap<C_t32> C);
void A_IO_L2_in_intra_trans(int idx, A_t32 local_A[8][2], tapa::ostream<A_t32> &fifo_A_local_out, bool intra_trans_en);
void A_IO_L2_in_inter_trans(int idx, A_t32 local_A[8][2], tapa::istream<A_t32> &fifo_A_in, tapa::ostream<A_t32> &fifo_A_out, bool inter_trans_en);
void A_IO_L2_in_inter_trans_boundary(int idx, A_t32 local_A[8][2], tapa::istream<A_t32> &fifo_A_in, bool inter_trans_en);
void B_IO_L2_in_intra_trans(int idx, B_t32 local_B[8][2], tapa::ostream<B_t32> &fifo_B_local_out, bool intra_trans_en);
void B_IO_L2_in_inter_trans(int idx, B_t32 local_B[8][2], tapa::istream<B_t32> &fifo_B_in, tapa::ostream<B_t32> &fifo_B_out, bool inter_trans_en);
void B_IO_L2_in_inter_trans_boundary(int idx, B_t32 local_B[8][2], tapa::istream<B_t32> &fifo_B_in, bool inter_trans_en);
void PE_wrapper(int idx, int idy, tapa::istream<A_t32> &fifo_A_in, tapa::ostream<A_t32> &fifo_A_out, tapa::istream<B_t32> &fifo_B_in, tapa::ostream<B_t32> &fifo_B_out, tapa::ostream<short> &fifo_C_drain_out);
void C_drain_IO_L1_out_intra_trans(int idx, int idy, C_t8 local_C[8][1], tapa::istream<short> &fifo_C_drain_local_in);
void C_drain_IO_L1_out_inter_trans(int idx, int idy, C_t8 local_C[8][1], tapa::istream<C_t8> &fifo_C_drain_in, tapa::ostream<C_t8> &fifo_C_drain_out);
void C_drain_IO_L1_out_inter_trans_boundary(int idx, int idy, C_t8 local_C[8][1], tapa::ostream<C_t8> &fifo_C_drain_out);
void C_drain_IO_L1_out_wrapper(int idx, int idy, tapa::istream<C_t8> &fifo_C_drain_in, tapa::ostream<C_t8> &fifo_C_drain_out, tapa::istream<short> &fifo_C_drain_local_in);
void C_drain_IO_L1_out_boundary_wrapper(int idx, int idy, tapa::ostream<C_t8> &fifo_C_drain_out, tapa::istream<short> &fifo_C_drain_local_in);
