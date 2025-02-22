`timescale 1 ns / 1 ps

module C_drain_IO_L3_out_serialize_C_m_axi_write
#(parameter
    CONSERVATIVE              = 0,
    C_M_AXI_ID_WIDTH          = 1,
    C_M_AXI_AWUSER_WIDTH      = 1,
    C_M_AXI_WUSER_WIDTH       = 1,
    C_M_AXI_BUSER_WIDTH       = 1,
    C_USER_VALUE              = 1'b0,
    C_PROT_VALUE              = 3'b000,
    C_CACHE_VALUE             = 4'b0011,
    BUS_ADDR_WIDTH            = 32,
    BUS_DATA_WIDTH            = 32,
    NUM_WRITE_OUTSTANDING     = 2,
    MAX_WRITE_BURST_LENGTH    = 16
)(
    // system signal
    input  wire                             ACLK,
    input  wire                             ARESET,
    input  wire                             ACLK_EN,
    // write address channel
    output wire [C_M_AXI_ID_WIDTH-1:0]      out_BUS_AWID,
    output wire [2:0]                       out_BUS_AWSIZE,
    output wire [1:0]                       out_BUS_AWBURST,
    output wire [1:0]                       out_BUS_AWLOCK,
    output wire [3:0]                       out_BUS_AWCACHE,
    output wire [2:0]                       out_BUS_AWPROT,
    output wire [3:0]                       out_BUS_AWQOS,
    output wire [3:0]                       out_BUS_AWREGION,
    output wire [C_M_AXI_AWUSER_WIDTH-1:0]  out_BUS_AWUSER,
    output wire [BUS_ADDR_WIDTH-1:0]        out_BUS_AWADDR,
    output wire [7:0]                       out_BUS_AWLEN,
    output wire                             out_BUS_AWVALID,
    input  wire                             in_BUS_AWREADY,
    // write data channel
    output wire [C_M_AXI_ID_WIDTH-1:0]      out_BUS_WID,
    output wire [C_M_AXI_WUSER_WIDTH-1:0]   out_BUS_WUSER,
    output wire [BUS_DATA_WIDTH-1:0]        out_BUS_WDATA,
    output wire [BUS_DATA_WIDTH/8-1:0]      out_BUS_WSTRB,
    output wire                             out_BUS_WLAST,
    output wire                             out_BUS_WVALID,
    input  wire                             in_BUS_WREADY,
    // write response channel
    input  wire [C_M_AXI_ID_WIDTH-1:0]      in_BUS_BID,
    input  wire [1:0]                       in_BUS_BRESP,
    input  wire [C_M_AXI_BUSER_WIDTH-1:0]   in_BUS_BUSER,
    input  wire                             in_BUS_BVALID,
    output wire                             out_BUS_BREADY,
    // write request
    input  wire [BUS_ADDR_WIDTH-1:0]        in_HLS_AWADDR,
    input  wire [31:0]                      in_HLS_AWLEN,
    input  wire                             in_HLS_AWVALID,
    output wire                             out_HLS_AWREADY,
    input  wire [BUS_DATA_WIDTH-1:0]        in_HLS_WDATA,
    input  wire [BUS_DATA_WIDTH/8-1:0]      in_HLS_WSTRB,
    input  wire                             in_HLS_WVALID,
    output wire                             out_HLS_WREADY,
    output wire                             out_HLS_BVALID,
    input  wire                             in_HLS_BREADY);
//------------------------Parameter----------------------
    localparam
        BUS_DATA_BYTES  = BUS_DATA_WIDTH / 8,
        BUS_ADDR_ALIGN  = log2(BUS_DATA_BYTES);
//------------------------Task and function--------------
    function integer log2;
        input integer x;
        integer n, m;
    begin
        n = 0;
        m = 1;
        while (m < x) begin
            n = n + 1;
            m = m * 2;
        end
        log2 = n;
    end
    endfunction
//------------------------Local signal-------------------
    // AW channel
    wire [C_M_AXI_ID_WIDTH-1:0]         AWID_Dummy;
    wire [BUS_ADDR_WIDTH - 1:0]         AWADDR_Dummy;
    wire [7:0]                          AWLEN_Dummy;
    wire                                AWVALID_Dummy;
    wire                                AWREADY_Dummy;
 
    wire                                ost_ctrl_info;
    wire [7:0]                          ost_ctrl_len;
    wire                                ost_ctrl_valid;
    wire                                ost_ctrl_ready;
    // W channel
    wire                                next_data;
    wire                                data_valid;
    wire                                data_ready;
    reg  [BUS_DATA_WIDTH - 1:0]         data_buf;
    reg  [BUS_DATA_BYTES - 1:0]         strb_buf;
    wire                                ready_for_data;
    reg  [7:0]                          len_cnt;
    wire [7:0]                          burst_len;
    wire                                fifo_burst_ready;
    wire                                next_burst;
    wire                                burst_valid;
    reg                                 WVALID_Dummy;
    wire                                WREADY_Dummy;
    reg                                 WLAST_Dummy;
    //B channel
    wire                                next_resp;
    wire                                last_resp;
    wire                                need_wrsp;
    wire                                resp_valid;
    wire                                resp_ready;
    // regslice io ?  no 
//------------------------AW channel begin---------------
//------------------------Instantiation------------------
    C_drain_IO_L3_out_serialize_C_m_axi_burst_converter #(
        .DATA_WIDTH        (BUS_DATA_WIDTH),
        .ADDR_WIDTH        (BUS_ADDR_WIDTH),
        .MAX_BURST_LEN     (MAX_WRITE_BURST_LENGTH)
    ) wreq_burst_conv (
        .clk               (ACLK),
        .reset             (ARESET),
        .clk_en            (ACLK_EN),
        
        .in_REQ_ADDR       (in_HLS_AWADDR),
        .in_REQ_LEN        (in_HLS_AWLEN),
        .in_REQ_VALID      (in_HLS_AWVALID),
        .out_REQ_READY     (out_HLS_AWREADY),
        .out_BURST_ADDR    (AWADDR_Dummy),
        .out_BURST_LEN     (AWLEN_Dummy),
        .out_BURST_VALID   (AWVALID_Dummy),
        .in_BURST_READY    (AWREADY_Dummy),
        .out_CTRL_INFO     (ost_ctrl_info),
        .out_CTRL_LEN      (ost_ctrl_len),
        .out_CTRL_VALID    (ost_ctrl_valid),
        .in_CTRL_READY     (ost_ctrl_ready)
    );
    // burst converter
    assign out_BUS_AWID     = 0;
    assign out_BUS_AWSIZE   = BUS_ADDR_ALIGN;
    assign out_BUS_AWBURST  = 2'b01;
    assign out_BUS_AWLOCK   = 2'b00;
    assign out_BUS_AWCACHE  = C_CACHE_VALUE;
    assign out_BUS_AWPROT   = C_PROT_VALUE;
    assign out_BUS_AWUSER   = C_USER_VALUE;
    assign out_BUS_AWQOS    = 4'b0000;
    assign out_BUS_AWREGION = 4'b0000;
//------------------------AW channel end-----------------
//------------------------W channel begin----------------
//------------------------Instantiation------------------
    C_drain_IO_L3_out_serialize_C_m_axi_fifo #(
        .DATA_WIDTH     (8),
        .ADDR_WIDTH     (log2(NUM_WRITE_OUTSTANDING)),
        .DEPTH          (NUM_WRITE_OUTSTANDING)
    ) fifo_burst (
        .clk            (ACLK),
        .reset          (ARESET),
        .clk_en         (ACLK_EN),
        .if_full_n      (),
        .if_write       (ost_ctrl_valid),
        .if_din         (ost_ctrl_len),
        .if_empty_n     (burst_valid),
        .if_read        (next_burst),
        .if_dout        (burst_len),
        .if_num_data_valid());
//------------------------Body---------------------------
    assign out_BUS_WUSER    = C_USER_VALUE;
    assign out_BUS_WID      = 0;
    assign out_HLS_WREADY   = data_ready;
    assign data_valid       = in_HLS_WVALID;
    assign data_ready       = burst_valid && ready_for_data;
    assign next_data        = data_ready && data_valid;
    assign next_burst       = (len_cnt == burst_len) && next_data;
    assign ready_for_data   = ~WVALID_Dummy || WREADY_Dummy;
    always @(posedge ACLK)
    begin
        if (ARESET) begin
            strb_buf <= 0;
            data_buf <= 0;
        end
        if (ACLK_EN) begin
            if (next_data) begin
                data_buf <= in_HLS_WDATA;
                strb_buf <= in_HLS_WSTRB;
            end
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            WVALID_Dummy <= 1'b0;
        else if (ACLK_EN) begin
            if (next_data)
                WVALID_Dummy <= 1'b1;
            else if (ready_for_data)
                WVALID_Dummy <= 1'b0;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            WLAST_Dummy <= 0;
        else if (ACLK_EN) begin
            if (next_burst)
                WLAST_Dummy <= 1;
            else if (ready_for_data)
                WLAST_Dummy <= 0;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            len_cnt <= 0;
        else if (ACLK_EN) begin
            if (next_burst)
                len_cnt <= 0;
            else if (next_data)
                len_cnt <= len_cnt + 1;
        end
    end
//------------------------W channel end------------------
    // Write throttling unit
    C_drain_IO_L3_out_serialize_C_m_axi_throttle #(
        .CONSERVATIVE    (CONSERVATIVE),
        .USED_FIX        (0),
        .ADDR_WIDTH      (BUS_ADDR_WIDTH),
        .DATA_WIDTH      (BUS_DATA_WIDTH),
        .DEPTH           (MAX_WRITE_BURST_LENGTH),
        .MAXREQS         (NUM_WRITE_OUTSTANDING),
        .AVERAGE_MODE    (0)
    ) wreq_throttle (
        .clk             (ACLK),
        .reset           (ARESET),
        .clk_en          (ACLK_EN),
        // internal 
        .in_TOP_AWADDR   (AWADDR_Dummy),
        .in_TOP_AWLEN    (AWLEN_Dummy),
        .in_TOP_AWVALID  (AWVALID_Dummy),
        .out_TOP_AWREADY (AWREADY_Dummy),
        .in_TOP_WDATA    (data_buf),
        .in_TOP_WSTRB    (strb_buf),
        .in_TOP_WLAST    (WLAST_Dummy),
        .in_TOP_WVALID   (WVALID_Dummy),
        .out_TOP_WREADY  (WREADY_Dummy),
        // AXI BUS 
        .out_BUS_AWADDR  (out_BUS_AWADDR),
        .out_BUS_AWLEN   (out_BUS_AWLEN),
        .out_BUS_AWVALID (out_BUS_AWVALID),
        .in_BUS_AWREADY  (in_BUS_AWREADY),
        .out_BUS_WDATA   (out_BUS_WDATA),
        .out_BUS_WSTRB   (out_BUS_WSTRB),
        .out_BUS_WLAST   (out_BUS_WLAST),
        .out_BUS_WVALID  (out_BUS_WVALID),
        .in_BUS_WREADY   (in_BUS_WREADY)
    );
    
    
//------------------------B channel begin----------------
//------------------------Instantiation------------------
    C_drain_IO_L3_out_serialize_C_m_axi_reg_slice #(
        .DATA_WIDTH     (1)
    ) rs_resp (
        .clk            (ACLK),
        .reset          (ARESET),
        .s_data         (1'b1),
        .s_valid        (in_BUS_BVALID),
        .s_ready        (out_BUS_BREADY),
        .m_data         (),
        .m_valid        (resp_valid),
        .m_ready        (resp_ready));
    C_drain_IO_L3_out_serialize_C_m_axi_fifo #(
        .DATA_WIDTH     (1),
        .ADDR_WIDTH     (log2(NUM_WRITE_OUTSTANDING)),
        .DEPTH          (NUM_WRITE_OUTSTANDING)
    ) fifo_resp (
        .clk            (ACLK),
        .reset          (ARESET),
        .clk_en         (ACLK_EN),
        .if_full_n      (ost_ctrl_ready),
        .if_write       (ost_ctrl_valid),
        .if_din         (ost_ctrl_info),
        .if_empty_n     (need_wrsp),
        .if_read        (next_resp),
        .if_dout        (last_resp),
        .if_num_data_valid());
//------------------------Body---------------------------
    assign resp_ready = need_wrsp && (in_HLS_BREADY || (last_resp === 1'b0));
    assign next_resp  = resp_ready && resp_valid;
    assign out_HLS_BVALID = resp_valid && (last_resp === 1'b1 ) ;
//------------------------B channel end------------------
endmodule