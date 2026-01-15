// Shifter module wrapper
// shifter単体モジュールの出力とSHSとのANDを取る
module shifter_module(
    // 制御信号
    input  wire        Rin,       // Rotate Right
    input  wire        Lin,       // Rotate Left
    input  wire        Ain,       // Arithmetic Shift
    input  wire        Bin,       // Logic Shift
    input  wire        Cin,       // Carry input
    input  wire        Din,       // Other control
    input  wire        Ein,       // Other control
    input  wire        SHS,       // Shifter to S-bus制御信号

    // 入力データ（A-bus）
    input  wire [15:0] A_bus,

    // 出力データ（16ビット）
    output wire [15:0] shifter_out,         // Gated output (with SHS)
    output wire [15:0] shifter_result_bus,  // Raw ungated output

    // ステータスフラグ
    output wire        Cf         // Carry flag
);

    // shifterの個別ビット出力
    wire Szero, Sone, Stwo, Sthree, Sfour, Sfive, Ssix, Sseven;
    wire Seight, Snine, SA, SB, SC, SD, SE, SF;

    // shifterインスタンス化
    shifter shifter_inst(
        .Rin(Rin),
        .Lin(Lin),
        .Ain(Ain),
        .Bin(Bin),
        .Cin(Cin),
        .Din(Din),
        .Ein(Ein),
        .A_bus(A_bus),
        .Szero(Szero),
        .Sone(Sone),
        .Stwo(Stwo),
        .Sthree(Sthree),
        .Sfour(Sfour),
        .Sfive(Sfive),
        .Ssix(Ssix),
        .Sseven(Sseven),
        .Seight(Seight),
        .Snine(Snine),
        .SA(SA),
        .SB(SB),
        .SC(SC),
        .SD(SD),
        .SE(SE),
        .SF(SF),
        .Cf(Cf)
    );

    // 個別ビット出力を16ビットバスに結合（生の出力）
    assign shifter_result_bus[0]  = Szero;
    assign shifter_result_bus[1]  = Sone;
    assign shifter_result_bus[2]  = Stwo;
    assign shifter_result_bus[3]  = Sthree;
    assign shifter_result_bus[4]  = Sfour;
    assign shifter_result_bus[5]  = Sfive;
    assign shifter_result_bus[6]  = Ssix;
    assign shifter_result_bus[7]  = Sseven;
    assign shifter_result_bus[8]  = Seight;
    assign shifter_result_bus[9]  = Snine;
    assign shifter_result_bus[10] = SA;
    assign shifter_result_bus[11] = SB;
    assign shifter_result_bus[12] = SC;
    assign shifter_result_bus[13] = SD;
    assign shifter_result_bus[14] = SE;
    assign shifter_result_bus[15] = SF;

    // SHS制御信号とのAND（ゲート済み出力）
    transfer_and_16bit shifter_and(
        .enable(SHS),
        .data_in(shifter_result_bus),
        .data_out(shifter_out)
    );

endmodule
