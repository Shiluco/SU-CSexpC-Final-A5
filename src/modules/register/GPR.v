// General Purpose Register module
// switchable_registerを通した後、transferでRxAとのANDを取る
// すべてのレジスタ（R0-R7, B0等）で使用可能
module GPR(
    input  wire        CLK,          // クロック
    input  wire        CLR,          // クリア（active low）
    input  wire        SR,           // ストア制御信号（例: SR0, SR1, ...）
    input  wire [15:0] S_bus,        // Sバス入力
    input  wire        RA,           // レジスタ選択信号（例: R0A, R1A, ...）
    output wire [15:0] data_out      // 出力（Aバスへ）
);

    wire [15:0] reg_q;  // switchable_registerの出力

    // 1. switchable_register: SRx制御とレジスタ
    switchable_register sw_reg(
        .CLK(CLK),
        .CLR(CLR),
        .SR(SR),
        .S_bus(S_bus),
        .Q(reg_q)
    );

    // 2. transfer: RxAとのAND
    transfer_and_16bit ra_transfer(
        .enable(RA),
        .data_in(reg_q),
        .data_out(data_out)
    );

endmodule
