module top (
    input  wire clk,
    input  wire reset,      // async, active-high

    // isr_decoderの全制御信号出力
    output wire MDA,

    output wire R0A,
    output wire R1A,
    output wire R2A,
    output wire R3A,
    output wire R4A,
    output wire R5A,
    output wire R6A,
    output wire R7A,

    output wire B0B,

    output wire SMD,
    output wire SMA,

    output wire SR0,
    output wire SR1,
    output wire SR2,
    output wire SR3,
    output wire SR4,
    output wire SR5,
    output wire SR6,
    output wire SR7,

    output wire SB0,
    output wire ALS,

    output wire ALU_x,
    output wire ALU_y,
    output wire ALU_z,
    output wire ALU_u,
    output wire ALU_v,

    output wire SHS,

    output wire SFT_A,
    output wire SFT_B,
    output wire SFT_C,
    output wire SFT_D,
    output wire SFT_E,
    output wire SFT_R,
    output wire SFT_L,

    output wire SET_PSW,

    output wire R_W_N,
    output wire MREQ_N,
    output wire MIRQ_N,
    output wire MIS,

    output wire MMD,
    output wire MDM
);

    // =========================
    // 固定値信号（テスト用）
    // =========================
    // status_counterへの制御入力を固定値に設定
    wire ITA    = 1'b0;  // 命令終了確認なし
    wire ACK    = 1'b0;  // 確認なし

    // ISRとPSWを固定値に設定（未実装のため）
    wire [15:0] ISR = 16'h0000;  // NOP命令相当
    wire PSW_N  = 1'b0;  // 負フラグ
    wire PSW_Z  = 1'b0;  // ゼロフラグ
    wire PSW_V  = 1'b0;  // オーバーフローフラグ
    wire PSW_C  = 1'b0;  // キャリーフラグ

    // =========================
    // 内部配線信号
    // =========================
    // isr_decoderの出力（status_counterへの入力）
    wire FROM_D;  // isr_decoderのf_is_D出力
    wire TO_D;    // isr_decoderのt_is_D出力

    // status_counterの出力（isr_decoderへの入力）
    wire IF0, IF1;           // Instruction Fetch状態
    wire FF0, FF1, FF2;      // First Flag状態
    wire TF0, TF1;           // Transfer Flag状態
    wire EX0, EX1;           // Execute状態
    wire IT0, IT1, IT2;      // Instruction Termination状態

    // =========================
    // status_counter インスタンス
    // =========================
    status_counter u_status_counter (
        .clk    (clk),
        .reset  (reset),
        .ITA    (ITA),
        .ACK    (ACK),
        .FROM_D (FROM_D),
        .TO_D   (TO_D),
        .IF0    (IF0),
        .IF1    (IF1),
        .FF0    (FF0),
        .FF1    (FF1),
        .FF2    (FF2),
        .TF0    (TF0),
        .TF1    (TF1),
        .EX0    (EX0),
        .EX1    (EX1),
        .IT0    (IT0),
        .IT1    (IT1),
        .IT2    (IT2)
    );

    // =========================
    // isr_decoder インスタンス
    // =========================
    isr_decoder u_isr_decoder (
        // ISRとPSW入力
        .ISR    (ISR),
        .PSW_N  (PSW_N),
        .PSW_Z  (PSW_Z),
        .PSW_V  (PSW_V),
        .PSW_C  (PSW_C),

        // status_counterからの状態信号
        .IF0    (IF0),
        .IF1    (IF1),
        .FF0    (FF0),
        .FF1    (FF1),
        .FF2    (FF2),
        .TF0    (TF0),
        .TF1    (TF1),
        .EX0    (EX0),
        .EX1    (EX1),
        .IT0    (IT0),
        .IT1    (IT1),
        .IT2    (IT2),

        // 制御信号出力
        .MDA     (MDA),
        .R0A     (R0A),
        .R1A     (R1A),
        .R2A     (R2A),
        .R3A     (R3A),
        .R4A     (R4A),
        .R5A     (R5A),
        .R6A     (R6A),
        .R7A     (R7A),
        .B0B     (B0B),
        .SMD     (SMD),
        .SMA     (SMA),
        .SR0     (SR0),
        .SR1     (SR1),
        .SR2     (SR2),
        .SR3     (SR3),
        .SR4     (SR4),
        .SR5     (SR5),
        .SR6     (SR6),
        .SR7     (SR7),
        .SB0     (SB0),
        .ALS     (ALS),
        .ALU_x   (ALU_x),
        .ALU_y   (ALU_y),
        .ALU_z   (ALU_z),
        .ALU_u   (ALU_u),
        .ALU_v   (ALU_v),
        .SHS     (SHS),
        .SFT_A   (SFT_A),
        .SFT_B   (SFT_B),
        .SFT_C   (SFT_C),
        .SFT_D   (SFT_D),
        .SFT_E   (SFT_E),
        .SFT_R   (SFT_R),
        .SFT_L   (SFT_L),
        .SET_PSW (SET_PSW),
        .R_W_N   (R_W_N),
        .MREQ_N  (MREQ_N),
        .MIRQ_N  (MIRQ_N),
        .MIS     (MIS),
        .MMD     (MMD),
        .MDM     (MDM),
        .f_is_D  (FROM_D),
        .t_is_D  (TO_D)
    );

endmodule
