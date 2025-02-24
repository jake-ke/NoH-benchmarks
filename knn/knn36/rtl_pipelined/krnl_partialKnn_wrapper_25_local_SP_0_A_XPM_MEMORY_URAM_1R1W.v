`timescale 1 ns / 1 ps

module krnl_partialKnn_wrapper_25_local_SP_0_A_XPM_MEMORY_URAM_1R1W(
    reset,
    clk,
    address0,
    ce0,
    we0,
    d0,
    q0);
parameter DataWidth = 256;
parameter AddressRange = 2048;
parameter AddressWidth = 11;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
input we0;
input[DataWidth - 1:0] d0;
output[DataWidth - 1:0] q0;
krnl_partialKnn_wrapper_25_local_SP_0_A_XPM_MEMORY_URAM_1R1W_xpm krnl_partialKnn_wrapper_25_local_SP_0_A_XPM_MEMORY_URAM_1R1W_xpm_U(
    .clka( clk ),
    .rsta( reset ),
    .addra( address0 ),
    .ena( ce0 ),
    .dina( d0 ),
    .wea( we0 ),
    .douta( q0 ));
endmodule