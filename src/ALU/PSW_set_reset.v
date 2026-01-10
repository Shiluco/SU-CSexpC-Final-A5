// PSW (Program Status Word) Set/Reset module
// R5レジスタのセット/リセットをJKFFで制御
// 16ビットのJ入力とK入力を受け取り、各ビットをJKFFに通す
module PSW_set_reset(
    input  wire        clk,        // クロック
    input  wire        clr,        // クリア（active high）
    input  wire        pre,        // プリセット（active high）
    input  wire [15:0] J,          // J入力（16ビット）
    input  wire [15:0] K,          // K入力（16ビット）
    output wire [15:0] Q           // 出力（16ビット）
);

    // 16個のJKFFをインスタンス化
    // 各ビットに対してJKFFを使用
    jkff jkff_0  (.clk(clk), .clr(clr), .pre(pre), .j(J[0]),  .k(K[0]),  .q(Q[0]));
    jkff jkff_1  (.clk(clk), .clr(clr), .pre(pre), .j(J[1]),  .k(K[1]),  .q(Q[1]));
    jkff jkff_2  (.clk(clk), .clr(clr), .pre(pre), .j(J[2]),  .k(K[2]),  .q(Q[2]));
    jkff jkff_3  (.clk(clk), .clr(clr), .pre(pre), .j(J[3]),  .k(K[3]),  .q(Q[3]));
    jkff jkff_4  (.clk(clk), .clr(clr), .pre(pre), .j(J[4]),  .k(K[4]),  .q(Q[4]));
    jkff jkff_5  (.clk(clk), .clr(clr), .pre(pre), .j(J[5]),  .k(K[5]),  .q(Q[5]));
    jkff jkff_6  (.clk(clk), .clr(clr), .pre(pre), .j(J[6]),  .k(K[6]),  .q(Q[6]));
    jkff jkff_7  (.clk(clk), .clr(clr), .pre(pre), .j(J[7]),  .k(K[7]),  .q(Q[7]));
    jkff jkff_8  (.clk(clk), .clr(clr), .pre(pre), .j(J[8]),  .k(K[8]),  .q(Q[8]));
    jkff jkff_9  (.clk(clk), .clr(clr), .pre(pre), .j(J[9]),  .k(K[9]),  .q(Q[9]));
    jkff jkff_10 (.clk(clk), .clr(clr), .pre(pre), .j(J[10]), .k(K[10]), .q(Q[10]));
    jkff jkff_11 (.clk(clk), .clr(clr), .pre(pre), .j(J[11]), .k(K[11]), .q(Q[11]));
    jkff jkff_12 (.clk(clk), .clr(clr), .pre(pre), .j(J[12]), .k(K[12]), .q(Q[12]));
    jkff jkff_13 (.clk(clk), .clr(clr), .pre(pre), .j(J[13]), .k(K[13]), .q(Q[13]));
    jkff jkff_14 (.clk(clk), .clr(clr), .pre(pre), .j(J[14]), .k(K[14]), .q(Q[14]));
    jkff jkff_15 (.clk(clk), .clr(clr), .pre(pre), .j(J[15]), .k(K[15]), .q(Q[15]));

endmodule
