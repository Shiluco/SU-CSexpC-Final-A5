module transfer_register(
    // Register inputs from register module (array of 8 registers, 16-bit each)
    input  wire [15:0] r0_q,
    input  wire [15:0] r1_q,
    input  wire [15:0] r2_q,
    input  wire [15:0] r3_q,
    input  wire [15:0] r4_q,
    input  wire [15:0] r5_q,
    input  wire [15:0] r6_q,
    input  wire [15:0] r7_q,
    input  wire [15:0] b0_q,
    input  wire IF0,
    input  wire IF1,
    input  wire FF0,
    input  wire FF1,
    input  wire FF2,
    input  wire TF0,
    input  wire TF1,
    input  wire EX0,
    input  wire EX1,
    input  wire IT0,
    input  wire IT1,
    input  wire IT2,
    input  wire HLT,
    input  wire CLR,
    input  wire ASL,
    input  wire ASR,
    input  wire LSL,
    input  wire LSR,
    input  wire ROL,
    input  wire ROR,
    input  wire RLC,
    input  wire RRC,
    input  wire MOV,
    input  wire JMP,
    input  wire RET,
    input  wire ADD,
    input  wire ADC,
    input  wire RJP,
    input  wire SUB,
    input  wire SBC,
    input  wire CMP,
    input  wire NOP,
    input  wire OR,
    input  wire XOR,
    input  wire AND,
    input  wire BIT,
    input  wire JSR,
    input  wire RJS,
    input  wire SVC,
    input  wire BRN,
    input  wire BRZ,
    input  wire BRV,
    input  wire BRC,
    input  wire RBN,
    input  wire RBZ,
    input  wire RBV,
    input  wire RBC,
    input  wire MUL,
    input  wire MUL1,
    input  wire MUL21,
    input  wire MUL22,
    input  wire MUL3,
    input  wire MUL4,
    input  wire [7:0]  is_IP_to,
    input  wire [7:0]  is_D_from,
    input  wire [7:0]  is_R_to,

    // Select signal
    input  wire [7:0]  RA_control,      // Register select for A bus (0-7)
    input  wire B0B_control,

    input  wire [15:0] A_bus,

    // Transfer gate outputs (array of 8 outputs, 16-bit each)
    output wire [15:0] RA [0:7],
    output wire [15:0] B0B
);

    //　ここは制御入力部分で決定します。
    // assign RA_control[0] = (FF0 & is_R_to[0]) | (FF1 & is_IP_to[0]) | (TF0 & is_R_to[0]) | (TF1 & is_IP_to[0]);
    // assign RA_control[1] = (FF0 & is_R_to[1]) | (FF1 & is_IP_to[1]) | (TF0 & is_R_to[1]) | (TF1 & is_IP_to[1]);
    // assign RA_control[2] = (FF0 & is_R_to[2]) | (FF1 & is_IP_to[2]) | (TF0 & is_R_to[2]) | (TF1 & is_IP_to[2]);
    // assign RA_control[3] = (FF0 & is_R_to[3]) | (FF1 & is_IP_to[3]) | (TF0 & is_R_to[3]) | (TF1 & is_IP_to[3]);
    // assign RA_control[4] = (FF0 & is_R_to[4]) | (FF1 & is_IP_to[4]) | (TF0 & is_R_to[4]) | (TF1 & is_IP_to[4]);

    // RA[5] to RA[7] are always 0
    // assign RA_control[5] = 1'b0;
    // assign RA_control[6] = IT0 | IT1;
    // assign RA_control[7] = IF0 | IF1 | (FF0 & is_R_to[8]) | (FF1 & is_IP_to[7]) | (TF0 & is_D_from[7]) |
    //                         (EX1 & RJS);
    // Transfer gates - output register value only when selected by RA_control
    assign RA[0] = {16{RA_control[0]}} & r0_q;
    assign RA[1] = {16{RA_control[1]}} & r1_q;
    assign RA[2] = {16{RA_control[2]}} & r2_q;
    assign RA[3] = {16{RA_control[3]}} & r3_q;
    assign RA[4] = {16{RA_control[4]}} & r4_q;
    assign RA[5] = {16{RA_control[5]}} & r5_q;
    assign RA[6] = {16{RA_control[6]}} & r6_q;
    assign RA[7] = {16{RA_control[7]}} & r7_q;
    assign B0B = {16{B0B_control}} & b0_q;

endmodule

module transfer_shifter(
    // Shifter outputs (16 individual 1-bit signals)
    input  wire shifter_0,
    input  wire shifter_1,
    input  wire shifter_2,
    input  wire shifter_3,
    input  wire shifter_4,
    input  wire shifter_5,
    input  wire shifter_6,
    input  wire shifter_7,
    input  wire shifter_8,
    input  wire shifter_9,
    input  wire shifter_A,
    input  wire shifter_B,
    input  wire shifter_C,
    input  wire shifter_D,
    input  wire shifter_E,
    input  wire shifter_F,
    input  wire IF0,
    input  wire IF1,
    input  wire FF0,
    input  wire FF1,
    input  wire FF2,
    input  wire TF0,
    input  wire TF1,
    input  wire EX0,
    input  wire EX1,
    input  wire IT0,
    input  wire IT1,
    input  wire IT2,
    input  wire HLT,
    input  wire CLR,
    input  wire ASL,
    input  wire ASR,
    input  wire LSL,
    input  wire LSR,
    input  wire ROL,
    input  wire ROR,
    input  wire RLC,
    input  wire RRC,
    input  wire MOV,
    input  wire JMP,
    input  wire RET,
    input  wire ADD,
    input  wire ADC,
    input  wire RJP,
    input  wire SUB,
    input  wire SBC,
    input  wire CMP,
    input  wire NOP,
    input  wire OR,
    input  wire XOR,
    input  wire AND,
    input  wire BIT,
    input  wire JSR,
    input  wire RJS,
    input  wire SVC,
    input  wire BRN,
    input  wire BRZ,
    input  wire BRV,
    input  wire BRC,
    input  wire RBN,
    input  wire RBZ,
    input  wire RBV,
    input  wire RBC,
    input  wire MUL,
    input  wire MUL1,
    input  wire MUL21,
    input  wire MUL22,
    input  wire MUL3,
    input  wire MUL4,
    input  wire [7:0]  is_IP_to,
    input  wire [7:0]  is_D_from,
    input  wire [7:0]  is_R_to,

    // Transfer enable signal
    input  wire        shifter_t,

    // Transfer gate output (16-bit)
    output wire [15:0] SHS
);
    //ここの条件文は制御入力部分で定義します。
   // assign shifter_t = ASL | ASR| LSL | LSR | ROL | ROR | RLC | RRC;

    // Concatenate all shifter outputs into 16-bit vector
    wire [15:0] shifter_concat = {shifter_F, shifter_E, shifter_D, shifter_C,
                                  shifter_B, shifter_A, shifter_9, shifter_8,
                                  shifter_7, shifter_6, shifter_5, shifter_4,
                                  shifter_3, shifter_2, shifter_1, shifter_0};

    // OR with NOT of transfer enable signal
    assign SHS = {16{shifter_t}} | shifter_concat;

endmodule

module transfer_ALU(
    // ALU outputs (16 individual 1-bit signals)
    input  wire ALU_0,
    input  wire ALU_1,
    input  wire ALU_2,
    input  wire ALU_3,
    input  wire ALU_4,
    input  wire ALU_5,
    input  wire ALU_6,
    input  wire ALU_7,
    input  wire ALU_8,
    input  wire ALU_9,
    input  wire ALU_A,
    input  wire ALU_B,
    input  wire ALU_C,
    input  wire ALU_D,
    input  wire ALU_E,
    input  wire ALU_F,
    input  wire IF0,
    input  wire IF1,
    input  wire FF0,
    input  wire FF1,
    input  wire FF2,
    input  wire TF0,
    input  wire TF1,
    input  wire EX0,
    input  wire EX1,
    input  wire IT0,
    input  wire IT1,
    input  wire IT2,
    input  wire HLT,
    input  wire CLR,
    input  wire ASL,
    input  wire ASR,
    input  wire LSL,
    input  wire LSR,
    input  wire ROL,
    input  wire ROR,
    input  wire RLC,
    input  wire RRC,
    input  wire MOV,
    input  wire JMP,
    input  wire RET,
    input  wire ADD,
    input  wire ADC,
    input  wire RJP,
    input  wire SUB,
    input  wire SBC,
    input  wire CMP,
    input  wire NOP,
    input  wire OR,
    input  wire XOR,
    input  wire AND,
    input  wire BIT,
    input  wire JSR,
    input  wire RJS,
    input  wire SVC,
    input  wire BRN,
    input  wire BRZ,
    input  wire BRV,
    input  wire BRC,
    input  wire RBN,
    input  wire RBZ,
    input  wire RBV,
    input  wire RBC,
    input  wire MUL,
    input  wire MUL1,
    input  wire MUL21,
    input  wire MUL22,
    input  wire MUL3,
    input  wire MUL4,
    input  wire [7:0]  is_IP_to,
    input  wire [7:0]  is_D_from,
    input  wire [7:0]  is_R_to,

    // Transfer enable signal
    input  wire        shifter_t,

    // Transfer gate output (16-bit)
    output wire [15:0] ALS_out
);

    //assign shifter_t = ASL | ASR| LSL | LSR | ROL | ROR | RLC | RRC | HLT | NOP | (EX0 & MUL) | 
    //                    MUL1 | MUL21 | MUL22 | MUL3 | MUL4 | IT0 | IT2;

    // Concatenate all ALU outputs into 16-bit vector
    wire [15:0] ALU_out = {ALU_F, ALU_E, ALU_D, ALU_C,
                              ALU_B, ALU_A, ALU_9, ALU_8,
                              ALU_7, ALU_6, ALU_5, ALU_4,
                              ALU_3, ALU_2, ALU_1, ALU_0};

    // OR with NOT of transfer enable signal
    assign ALS_out = {16{~shifter_t}} | ALU_out;

endmodule

module transfer_SMA(
    // S-bus input (16-bit)
    input  wire [15:0] S_bus,
    input  wire        SMA,

    // Transfer gate output (16-bit)
    output wire [15:0] SMA_out
);

    assign SMA_out = {16{SMA}} & S_bus;

endmodule

module transfer_SMD(
    // S-bus input (16-bit)
    input  wire [15:0] S_bus,
    input  wire        SMD,

    // Transfer gate output (16-bit)
    output wire [15:0] SMD_out
);

    assign SMD_out = {16{SMD}} & S_bus;

endmodule

module transfer_MDM(
    // ALU outputs (16 individual 1-bit signals)
    input  wire [15:0] S_bus,
    input  wire MDM,

    // Transfer gate output (16-bit)
    output wire [15:0] MDM_out,
    output wire [15:0] tri_out
);

    tri_state tri_0  (.in(S_bus[0]),  .en(MDM), .out(tri_out[0]));
    tri_state tri_1  (.in(S_bus[1]),  .en(MDM), .out(tri_out[1]));
    tri_state tri_2  (.in(S_bus[2]),  .en(MDM), .out(tri_out[2]));
    tri_state tri_3  (.in(S_bus[3]),  .en(MDM), .out(tri_out[3]));
    tri_state tri_4  (.in(S_bus[4]),  .en(MDM), .out(tri_out[4]));
    tri_state tri_5  (.in(S_bus[5]),  .en(MDM), .out(tri_out[5]));
    tri_state tri_6  (.in(S_bus[6]),  .en(MDM), .out(tri_out[6]));
    tri_state tri_7  (.in(S_bus[7]),  .en(MDM), .out(tri_out[7]));
    tri_state tri_8  (.in(S_bus[8]),  .en(MDM), .out(tri_out[8]));
    tri_state tri_9  (.in(S_bus[9]),  .en(MDM), .out(tri_out[9]));
    tri_state tri_10 (.in(S_bus[10]), .en(MDM), .out(tri_out[10]));
    tri_state tri_11 (.in(S_bus[11]), .en(MDM), .out(tri_out[11]));
    tri_state tri_12 (.in(S_bus[12]), .en(MDM), .out(tri_out[12]));
    tri_state tri_13 (.in(S_bus[13]), .en(MDM), .out(tri_out[13]));
    tri_state tri_14 (.in(S_bus[14]), .en(MDM), .out(tri_out[14]));
    tri_state tri_15 (.in(S_bus[15]), .en(MDM), .out(tri_out[15]));

    assign MDM_out = tri_out[15:0];

endmodule

module transfer_MMD(
    // M-bus input (16-bit)
    input  wire [15:0] M_bus,
    input  wire        MMD,

    // Transfer gate output (16-bit)
    output wire [15:0] MMD_out
);

    assign MMD_out = {16{MMD}} & M_bus;

endmodule

module transfer_MDA(
    // MDR output (16-bit)
    input  wire [15:0] MDR_out,
    input  wire        MDA,

    // Transfer gate output (16-bit)
    output wire [15:0] MDA_out
);

    assign MDA_out = {16{MDA}} & MDR_out;

endmodule

module transfer_MIS(
    // M-bus input (16-bit)
    input  wire [15:0] M_bus,
    input  wire        MIS,

    // Transfer gate output (16-bit)
    output wire [15:0] MIS_out
);

    assign MIS_out = {16{MIS}} & M_bus;

endmodule

module tri_state (
    input  wire in,
    input  wire en,   // 1: 出力有効
    output wire out
);
    bufif1 u_buf (out, in, en);
endmodule

// SR (Store Register) transfer module - determines r_d inputs for R0-R7 and B0 registers
// Note: MAR, MDR, ISR use separate transfer gates (SMA, SMD/MMD, MIS) and bypass this module
module transfer_SR(
    // Register outputs from register module (current values)
    input  wire [15:0] r0_q,
    input  wire [15:0] r1_q,
    input  wire [15:0] r2_q,
    input  wire [15:0] r3_q,
    input  wire [15:0] r4_q,
    input  wire [15:0] r5_q,
    input  wire [15:0] r6_q,
    input  wire [15:0] r7_q,
    input  wire [15:0] b0_q,

    // Control signals
    input  wire [7:0]  SR,       // Store Register enable (SR0-SR7)
    input  wire        SB0,      // Store B0 enable

    // Data input
    input  wire [15:0] S_bus,

    // Register inputs (r_d outputs to register module)
    output wire [15:0] r0_d,
    output wire [15:0] r1_d,
    output wire [15:0] r2_d,
    output wire [15:0] r3_d,
    output wire [15:0] r4_d,
    output wire [15:0] r5_d,
    output wire [15:0] r6_d,
    output wire [15:0] r7_d,
    output wire [15:0] b0_d
);

    // Input multiplexer logic - select between S_bus (write) and r_q (hold)
    assign r0_d = SR[0] ? S_bus : r0_q;
    assign r1_d = SR[1] ? S_bus : r1_q;
    assign r2_d = SR[2] ? S_bus : r2_q;
    assign r3_d = SR[3] ? S_bus : r3_q;
    assign r4_d = SR[4] ? S_bus : r4_q;
    assign r5_d = SR[5] ? S_bus : r5_q;
    assign r6_d = SR[6] ? S_bus : r6_q;
    assign r7_d = SR[7] ? S_bus : r7_q;
    assign b0_d = SB0 ? S_bus : b0_q;

endmodule