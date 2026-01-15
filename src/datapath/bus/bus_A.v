// A-bus module
// 9個の16ビット入力のORを取る
module bus_A(
    input  wire [15:0] in0,
    input  wire [15:0] in1,
    input  wire [15:0] in2,
    input  wire [15:0] in3,
    input  wire [15:0] in4,
    input  wire [15:0] in5,
    input  wire [15:0] in6,
    input  wire [15:0] in7,
    input  wire [15:0] in8,
    output wire [15:0] out
);

    // 中間ワイヤー
    wire [15:0] or_01, or_23, or_45, or_67;
    wire [15:0] or_0123, or_4567;
    wire [15:0] or_01234567;

    // 1段目: ペアごとのOR
    or_16bit or_pair01 (.in0(in0), .in1(in1), .out(or_01));
    or_16bit or_pair23 (.in0(in2), .in1(in3), .out(or_23));
    or_16bit or_pair45 (.in0(in4), .in1(in5), .out(or_45));
    or_16bit or_pair67 (.in0(in6), .in1(in7), .out(or_67));

    // 2段目: 4つのペアを2つに
    or_16bit or_quad0123 (.in0(or_01), .in1(or_23), .out(or_0123));
    or_16bit or_quad4567 (.in0(or_45), .in1(or_67), .out(or_4567));

    // 3段目: 8つの入力を結合
    or_16bit or_oct (.in0(or_0123), .in1(or_4567), .out(or_01234567));

    // 4段目: 9番目の入力を追加
    or_16bit or_final (.in0(or_01234567), .in1(in8), .out(out));

endmodule
