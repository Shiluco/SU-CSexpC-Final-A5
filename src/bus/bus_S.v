// S-bus module
// 2個の16ビット入力のORを取る
module bus_S(
    input  wire [15:0] in0,
    input  wire [15:0] in1,
    output wire [15:0] out
);

    // or_16bitモジュールを使用
    or_16bit or_s (.in0(in0), .in1(in1), .out(out));

endmodule
