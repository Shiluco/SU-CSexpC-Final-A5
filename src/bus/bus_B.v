// B-bus module
// 1個の16ビット入力をそのまま出力
// （将来の拡張のため、モジュールとして定義）
module bus_B(
    input  wire [15:0] in0,
    output wire [15:0] out
);

    // 直接接続（スルー）
    assign out = in0;

endmodule
