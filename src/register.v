module register(
    // Control signals
    input  wire        CLK,      // Clock
    input  wire        CLR,      // Clear (active low)
    input  wire [7:0]  SR,       // Store Register enable (SR0-SR7)
    input  wire        SB0,      // Store B0 enable

    // Data inputs (16-bit)
    input  wire [15:0] s_bus,

    // Data outputs (16-bit)
    output wire [15:0] r_q [0:7],
    output wire [15:0] b0_q
);

    // Internal registers (array for R0-R7)
    wire [15:0] output_r [0:7];
    wire [15:0] output_b0;

    // Input multiplexers (array)
    wire [15:0] r_d [0:7];
    wire [15:0] b0_d;

    // CLR is active-low, DFF expects active-high
    wire clr_h = ~CLR;

    // 繰り返しによってdの入力を指定
    genvar j, k;
    generate
        for (j = 0; j < 8; j = j + 1) begin : mux_gen
            assign r_d[j] = SR[j] ? s_bus : output_r[j];
        end
    endgenerate
    assign b0_d   = SB0   ? s_bus : output_b0;

    // レジスタの中身を更新
    generate
        // R0-R7の各ビットにDFFをインスタンス化
        for (j = 0; j < 8; j = j + 1) begin : reg_gen
            for (k = 0; k < 16; k = k + 1) begin : bit_gen
                dff dff_inst (
                    .clk(CLK),
                    .pre(1'b0),           // プリセットは未使用
                    .clr(clr_h),          // アクティブHIGHに変換
                    .d(r_d[j][k]),
                    .q(output_r[j][k])
                );
            end
        end

        // B0の各ビットにDFFをインスタンス化
        for (k = 0; k < 16; k = k + 1) begin : b0_gen
            dff dff_b0_inst (
                .clk(CLK),
                .pre(1'b0),
                .clr(clr_h),
                .d(b0_d[k]),
                .q(output_b0[k])
            );
        end
    endgenerate

    // 出力を指定
    generate
        for (j = 0; j < 8; j = j + 1) begin : output_gen
            assign r_q[j] = output_r[j];
        end
    endgenerate
    assign b0_q = output_b0;

endmodule

module dff (
    input  wire clk,
    input  wire pre,   // async preset, active-high
    input  wire clr,   // async clear,  active-high
    input  wire d,
    output reg  q
);
    // 優先順位を明確化（一般に CLR を最優先）
    always @(posedge clk or posedge pre or posedge clr) begin
        if (clr)      q <= 1'b0;  // 非同期クリア
        else if (pre) q <= 1'b1;  // 非同期プリセット
        else          q <= d;     // クロック同期でDをラッチ
    end
endmodule


