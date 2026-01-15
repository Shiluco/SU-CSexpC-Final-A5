// Tri-state buffer (1-bit)
module tristate(
    input  wire data_in,    // データ入力
    input  wire enable,     // イネーブル信号
    output wire data_out    // データ出力（tri-state）
);

    // bufif1: enable=1の時にdata_inを出力、enable=0の時はハイインピーダンス(Z)
    bufif1(data_out, data_in, enable);

endmodule
