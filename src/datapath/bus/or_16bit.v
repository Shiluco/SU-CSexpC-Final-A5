// 16ビットORゲート（2入力）
module or_16bit(
    input  wire [15:0] in0,
    input  wire [15:0] in1,
    output wire [15:0] out
);

    assign out = in0 | in1;

endmodule
