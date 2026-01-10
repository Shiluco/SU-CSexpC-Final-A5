module register(
    // Control signals
    input  wire        CLK,      // Clock
    input  wire        CLR,      // Clear (active low)

    // Data inputs (16-bit) - r_d inputs from transfer module
    input  wire [15:0] r0_d,
    input  wire [15:0] r1_d,
    input  wire [15:0] r2_d,
    input  wire [15:0] r3_d,
    input  wire [15:0] r4_d,
    input  wire [15:0] r5_d,
    input  wire [15:0] r6_d,
    input  wire [15:0] r7_d,
    input  wire [15:0] b0_d,
    input  wire [15:0] SMA_out,  // MARの入力 (transfer_SMAから)
    input  wire [15:0] SMD_out,  // MDRの入力 (transfer_SMDから)
    input  wire [15:0] MMD_out,  // MDRの入力 (transfer_MMDから)
    input  wire [15:0] MIS_out,  // ISRの入力 (transfer_MISから)

    // Data outputs (16-bit) - individual outputs instead of array
    output wire [15:0] r0_q,
    output wire [15:0] r1_q,
    output wire [15:0] r2_q,
    output wire [15:0] r3_q,
    output wire [15:0] r4_q,
    output wire [15:0] r5_q,
    output wire [15:0] r6_q,
    output wire [15:0] r7_q,
    output wire [15:0] b0_q,
    output wire [15:0] mar_q,
    output wire [15:0] mdr_q,
    output wire [15:0] isr_q
);

    // Internal registers (array for R0-R7)
    wire [15:0] output_r [0:7];
    wire [15:0] output_b0;
    wire [15:0] output_mar;
    wire [15:0] output_mdr;
    wire [15:0] MDR_d;
    wire [15:0] output_isr;

    // CLR is active-low, DFF expects active-high
    wire clr_h = ~CLR;
    
    assign MDR_d = MMD_out | SMD_out;

    // レジスタの中身を更新 - DFFでr_dからr_qへ出力
    generate
        genvar k;
        // R0の各ビットにDFFをインスタンス化
        for (k = 0; k < 16; k = k + 1) begin : r0_gen
            dff_reg dff_r0 (.clk(CLK), .pre(1'b0), .clr(clr_h), .d(r0_d[k]), .q(output_r[0][k]));
        end
        // R1の各ビットにDFFをインスタンス化
        for (k = 0; k < 16; k = k + 1) begin : r1_gen
            dff_reg dff_r1 (.clk(CLK), .pre(1'b0), .clr(clr_h), .d(r1_d[k]), .q(output_r[1][k]));
        end
        // R2の各ビットにDFFをインスタンス化
        for (k = 0; k < 16; k = k + 1) begin : r2_gen
            dff_reg dff_r2 (.clk(CLK), .pre(1'b0), .clr(clr_h), .d(r2_d[k]), .q(output_r[2][k]));
        end
        // R3の各ビットにDFFをインスタンス化
        for (k = 0; k < 16; k = k + 1) begin : r3_gen
            dff_reg dff_r3 (.clk(CLK), .pre(1'b0), .clr(clr_h), .d(r3_d[k]), .q(output_r[3][k]));
        end
        // R4の各ビットにDFFをインスタンス化
        for (k = 0; k < 16; k = k + 1) begin : r4_gen
            dff_reg dff_r4 (.clk(CLK), .pre(1'b0), .clr(clr_h), .d(r4_d[k]), .q(output_r[4][k]));
        end
        // R5の各ビットにDFFをインスタンス化
        for (k = 0; k < 16; k = k + 1) begin : r5_gen
            dff_reg dff_r5 (.clk(CLK), .pre(1'b0), .clr(clr_h), .d(r5_d[k]), .q(output_r[5][k]));
        end
        // R6の各ビットにDFFをインスタンス化
        for (k = 0; k < 16; k = k + 1) begin : r6_gen
            dff_reg dff_r6 (.clk(CLK), .pre(1'b0), .clr(clr_h), .d(r6_d[k]), .q(output_r[6][k]));
        end
        // R7の各ビットにDFFをインスタンス化
        for (k = 0; k < 16; k = k + 1) begin : r7_gen
            dff_reg dff_r7 (.clk(CLK), .pre(1'b0), .clr(clr_h), .d(r7_d[k]), .q(output_r[7][k]));
        end
        // B0の各ビットにDFFをインスタンス化
        for (k = 0; k < 16; k = k + 1) begin : b0_gen
            dff_reg dff_b0 (.clk(CLK), .pre(1'b0), .clr(clr_h), .d(b0_d[k]), .q(output_b0[k]));
        end
        // MARの各ビットにDFFをインスタンス化
        for (k = 0; k < 16; k = k + 1) begin : mar_gen
            dff_reg dff_mar (.clk(CLK), .pre(1'b0), .clr(clr_h), .d(SMA_out[k]), .q(output_mar[k]));
        end
        // MDRの各ビットにDFFをインスタンス化
        for (k = 0; k < 16; k = k + 1) begin : mdr_gen
            dff_reg dff_mdr (.clk(CLK), .pre(1'b0), .clr(clr_h), .d(MDR_d[k]), .q(output_mdr[k]));
        end
        // ISRの各ビットにDFFをインスタンス化
        for (k = 0; k < 16; k = k + 1) begin : isr_gen
            dff_reg dff_isr (.clk(CLK), .pre(1'b0), .clr(clr_h), .d(MIS_out[k]), .q(output_isr[k]));
        end
    endgenerate

    // 出力を個別に割り当て
    assign r0_q = output_r[0];
    assign r1_q = output_r[1];
    assign r2_q = output_r[2];
    assign r3_q = output_r[3];
    assign r4_q = output_r[4];
    assign r5_q = output_r[5];
    assign r6_q = output_r[6];
    assign r7_q = output_r[7];
    assign b0_q = output_b0;
    assign mar_q = output_mar;
    assign mdr_q = output_mdr;
    assign isr_q = output_isr;

endmodule

// D-Flip-Flop module (renamed from "dff" to "dff_reg" to avoid Quartus primitive conflict)
module dff_reg (
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
