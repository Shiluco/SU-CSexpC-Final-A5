module isr (
    input  wire        CLK,
    input  wire        CLR,
    input  wire        MIS,
    input  wire [15:0] M_BUS,
    output wire [15:0] ISR
);
    // switchable_registerを使用
    // MISが1の時M_BUSからロード、MISが0の時は保持
    switchable_register #(
        .INIT_VALUE(16'b0)
    ) u_isr_reg (
        .CLK(CLK),
        .CLR(CLR),
        .SR(MIS),          // MIS信号で制御
        .S_bus(M_BUS),     // M_BUSから入力
        .Q(ISR)            // ISRとして出力
    );
endmodule
