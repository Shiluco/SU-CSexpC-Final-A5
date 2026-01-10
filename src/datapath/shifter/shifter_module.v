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
    output wire [15:0] shifter_out,

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

    // 個別ビット出力を16ビットバスに結合
    wire [15:0] shifter_raw_out;
    assign shifter_raw_out[0]  = Szero;
    assign shifter_raw_out[1]  = Sone;
    assign shifter_raw_out[2]  = Stwo;
    assign shifter_raw_out[3]  = Sthree;
    assign shifter_raw_out[4]  = Sfour;
    assign shifter_raw_out[5]  = Sfive;
    assign shifter_raw_out[6]  = Ssix;
    assign shifter_raw_out[7]  = Sseven;
    assign shifter_raw_out[8]  = Seight;
    assign shifter_raw_out[9]  = Snine;
    assign shifter_raw_out[10] = SA;
    assign shifter_raw_out[11] = SB;
    assign shifter_raw_out[12] = SC;
    assign shifter_raw_out[13] = SD;
    assign shifter_raw_out[14] = SE;
    assign shifter_raw_out[15] = SF;

    // SHS制御信号とのAND
    transfer_and_16bit shifter_and(
        .enable(SHS),
        .data_in(shifter_raw_out),
        .data_out(shifter_out)
    );

endmodule
