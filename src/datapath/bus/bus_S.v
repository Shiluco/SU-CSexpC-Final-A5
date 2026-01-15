// S-bus module
// 6個の16ビット入力のORを取る
module bus_S(
    input  wire [15:0] in0,
    input  wire [15:0] in1,
    input  wire [15:0] in2,
    input  wire [15:0] in3,
    input  wire [15:0] in4,
    input  wire [15:0] in5,
    output wire [15:0] out
);

    // 中間ワイヤー
    wire [15:0] or_01, or_23, or_45;
    wire [15:0] or_0123, or_45_temp;

    // 1段目: ペアごとのOR
    or_16bit or_pair01 (.in0(in0), .in1(in1), .out(or_01));
    or_16bit or_pair23 (.in0(in2), .in1(in3), .out(or_23));
    or_16bit or_pair45 (.in0(in4), .in1(in5), .out(or_45));

    // 2段目: 4つの入力を結合
    or_16bit or_quad0123 (.in0(or_01), .in1(or_23), .out(or_0123));

    // 3段目: 6つの入力を結合
    or_16bit or_final (.in0(or_0123), .in1(or_45), .out(out));

endmodule
