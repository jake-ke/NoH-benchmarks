`timescale 1 ns / 1 ps

module C_drain_IO_L3_out_serialize_C_m_axi_burst_converter
#(parameter
    DATA_WIDTH                   = 32,
    ADDR_WIDTH                   = 32,
    MAX_BURST_LEN                = 16
)(
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  clk_en,
    input  wire [ADDR_WIDTH-1:0] in_REQ_ADDR,
    input  wire [31:0]           in_REQ_LEN,
    input  wire                  in_REQ_VALID,
    output wire                  out_REQ_READY,
    output wire [ADDR_WIDTH-1:0] out_BURST_ADDR,
    output wire [7:0]            out_BURST_LEN,
    output wire                  out_BURST_VALID,
    input  wire                  in_BURST_READY,
    output wire                  out_CTRL_INFO,
    output wire [7:0]            out_CTRL_LEN,
    output wire                  out_CTRL_VALID,
    input  wire                  in_CTRL_READY
);
//------------------------Parameter----------------------
    localparam
        DATA_BYTES      = DATA_WIDTH / 8,
        ADDR_ALIGN      = log2(DATA_BYTES),
        BOUNDARY_BEATS  = {12-ADDR_ALIGN{1'b1}},
        NUM_BEAT_WIDTH  = log2(MAX_BURST_LEN);
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
    wire [ADDR_WIDTH-1:0]       tmp_addr;
    wire [31:0]                 tmp_len;
    wire                        req_valid;
    wire                        read_req;
    wire                        next_req;
    reg  [ADDR_WIDTH - 1:0]     start_addr;
    wire [ADDR_WIDTH - 1:0]     sect_addr;
    reg  [ADDR_WIDTH - 1:0]     sect_addr_buf;
    reg                         req_handling;
    reg  [11 - ADDR_ALIGN:0]    start_to_4k;
    reg  [11 - ADDR_ALIGN:0]    end_from_4k;
    wire [11 - ADDR_ALIGN:0]    sect_len;
    reg  [11 - ADDR_ALIGN:0]    sect_len_buf;
    reg  [11 - ADDR_ALIGN:0]    beat_len;
    
    reg  [ADDR_WIDTH - 13:0]    sect_cnt;
    reg  [19:0]                 sect_total;
    reg  [19:0]                 sect_total_buf;
    wire [19:0]                 sect_total_tmp;
    wire                        ready_for_sect;
    wire                        single_sect;
    reg                         first_sect;
    reg                         last_sect;
    wire                        last_sect_tmp;
    reg                         last_sect_buf;
    wire                        next_sect;
    reg                         burst_valid;
    wire                        ost_ctrl_info;
    wire [7:0]                  ost_ctrl_len;
    wire                        ost_ctrl_valid;
//------------------------Instantiation------------------
    C_drain_IO_L3_out_serialize_C_m_axi_reg_slice #(
        .DATA_WIDTH     (ADDR_WIDTH + 32)
    ) rs_req (
        .clk            (clk),
        .reset          (reset),
        .s_data         ({in_REQ_LEN, in_REQ_ADDR}),
        .s_valid        (in_REQ_VALID),
        .s_ready        (out_REQ_READY),
        .m_data         ({tmp_len, tmp_addr}),
        .m_valid        (req_valid),
        .m_ready        (next_req));
//------------------------Body---------------------------
    assign read_req      = last_sect_tmp & next_sect | ~req_handling;
    assign next_req      = req_valid & read_req;
    always @(posedge clk)
    begin
        if (reset) begin
            start_addr  <= 0;
            beat_len    <= 0;
            sect_total  <= 0;
            end_from_4k <= 0;
            start_to_4k <= 0;
        end
        else if (clk_en) begin
            if (next_req) begin
                start_addr  <= {tmp_addr[ADDR_WIDTH-1:ADDR_ALIGN], {ADDR_ALIGN{1'b0}}};
                beat_len    <= (tmp_len[11:0] + tmp_addr[ADDR_ALIGN-1:0]) >> ADDR_ALIGN;
                sect_total  <= (tmp_len + tmp_addr[11:0]) >> 12;
                end_from_4k <= (tmp_addr[11:0] + tmp_len[11:0]) >> ADDR_ALIGN; 
                start_to_4k <= BOUNDARY_BEATS - tmp_addr[11:ADDR_ALIGN];
            end
        end
    end
    always @(posedge clk)
    begin
        if (reset)
            req_handling <= 1'b0;
        else if (clk_en) begin
            if (next_req)
                req_handling <= 1'b1;
            else if (~req_valid && last_sect_tmp & next_sect)
                req_handling <= 1'b0;
        end
    end
    // 4k boundary
    assign last_sect_tmp  = single_sect || last_sect;
    assign sect_total_tmp = first_sect ? sect_total : sect_total_buf;
    
    assign single_sect  = (sect_total == 0);
    assign next_sect  = req_handling && ready_for_sect;
    assign sect_addr  = (first_sect)? start_addr : {sect_cnt, {12{1'b0}}};
    
    assign sect_len   = single_sect              ? beat_len :
                        ( first_sect && ~last_sect)? start_to_4k :
                        (~first_sect &&  last_sect)? end_from_4k :
                                                     BOUNDARY_BEATS;
    always @(posedge clk)
    begin
        if (reset) begin
            first_sect <= 1'b0;
            last_sect <= 1'b0;
            sect_cnt <= 0;
        end
        else if (clk_en) begin
            if (next_req) begin
                first_sect <= 1'b1;
                last_sect <= 1'b0;
                sect_cnt <= tmp_addr[ADDR_WIDTH-1:12];
            end
            else if (next_sect) begin
                first_sect <= 1'b0;
                last_sect <= (sect_total_tmp == 1);
                sect_cnt <= sect_cnt + 1;
            end
        end
    end
    always @(posedge clk)
    begin
        if (reset) begin
            sect_addr_buf  <= 0;
            sect_len_buf   <= 0;
            last_sect_buf  <= 1'b0;
            sect_total_buf <= 0;
        end
        else if (clk_en) begin
            if (next_sect) begin
                sect_addr_buf  <= sect_addr;
                sect_len_buf   <= sect_len;
                last_sect_buf  <= last_sect_tmp;
                sect_total_buf <= sect_total_tmp - 1;
            end
        end
    end
    generate
    if (DATA_BYTES >= 4096/MAX_BURST_LEN) begin : must_one_burst
        assign out_BURST_ADDR  = sect_addr_buf;
        assign out_BURST_LEN   = sect_len_buf;
        assign out_BURST_VALID = burst_valid;
        assign out_CTRL_VALID  = next_sect;
        assign out_CTRL_INFO   = last_sect_tmp;
        assign out_CTRL_LEN    = sect_len;
        assign ready_for_sect = ~(burst_valid && ~in_BURST_READY) && in_CTRL_READY;
        always @(posedge clk)
        begin
            if (reset)
                burst_valid <= 1'b0;
            else if (clk_en) begin
                if (next_sect)
                    burst_valid <= 1'b1;
                else if (in_BURST_READY)
                    burst_valid <= 1'b0;
            end
        end
    end
    else begin : could_multi_bursts
        wire [ADDR_WIDTH - 1:0]                   addr_tmp;
        reg  [ADDR_WIDTH - 1:0]                   addr_buf;
        reg  [ADDR_ALIGN + 8:0]                   addr_step;
        wire [7:0]                                len_tmp;
        reg  [7:0]                                len_buf;
        reg                                       sect_handling;
        reg  [11 - NUM_BEAT_WIDTH - ADDR_ALIGN:0] loop_cnt;
        reg                                       first_loop;
        reg                                       last_loop;
        wire                                      next_loop;
        wire                                      ready_for_loop;
        assign out_BURST_ADDR  = addr_buf;
        assign out_BURST_LEN   = len_buf;
        assign out_BURST_VALID = burst_valid;
        assign out_CTRL_VALID  = next_loop;
        assign out_CTRL_INFO   = last_loop && last_sect_buf;
        assign out_CTRL_LEN    = len_tmp;
        assign next_loop       = sect_handling && ready_for_loop;
        assign ready_for_sect  = ~sect_handling || (last_loop && next_loop);
        assign ready_for_loop  = ~(burst_valid && ~in_BURST_READY) && in_CTRL_READY;
        always @(posedge clk)
        begin
            if (reset)
                burst_valid <= 1'b0;
            else if (clk_en) begin
                if (next_loop)
                    burst_valid <= 1'b1;
                else if (in_BURST_READY)
                    burst_valid <= 1'b0;
            end
        end
        always @(posedge clk)
        begin
            if (reset)
                sect_handling <= 1'b0;
            else if (clk_en) begin
                if (req_handling && ~sect_handling)
                    sect_handling <= 1'b1;
                else if (~req_handling && last_loop && next_loop)
                    sect_handling <= 1'b0;
            end
        end
        always @(posedge clk)
        begin
            if (reset) begin
                first_loop <= 1'b0;
                last_loop <= 1'b0;
                loop_cnt <= 0;
            end
            else if (clk_en) begin
                if (next_sect) begin
                    first_loop <= 1'b1;
                    last_loop <= (sect_len[11 - ADDR_ALIGN : NUM_BEAT_WIDTH] == 0);
                    loop_cnt <= sect_len[11 - ADDR_ALIGN : NUM_BEAT_WIDTH];
                end
                else if (next_loop) begin
                    first_loop <= 1'b0;
                    last_loop <= (loop_cnt == 1);
                    loop_cnt <= loop_cnt - 1;
                end
            end
        end
        assign addr_tmp = first_loop ? sect_addr_buf : (addr_buf + addr_step);
        assign len_tmp  = (NUM_BEAT_WIDTH == 0) ? 0 :
                          last_loop ? sect_len_buf[NUM_BEAT_WIDTH - 1:0] : 
                                      { NUM_BEAT_WIDTH{1'b1} };
        always @(posedge clk)
        begin
            if (reset) begin
                addr_buf  <= 0;
                addr_step <= 0;
                len_buf   <= 0;
            end
            else if (clk_en) begin
                if (next_loop) begin
                    addr_buf  <= addr_tmp;
                    addr_step <= (len_tmp + 1) << ADDR_ALIGN;
                    len_buf   <= len_tmp;
                end
            end
        end
    end
    endgenerate
endmodule