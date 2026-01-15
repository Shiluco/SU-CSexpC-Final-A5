module decoder (
    //ISRデコーダーは単体テストを行っていない
    //表に対応しているところまでは確認してあるが、実際に動作するかは不明
    input  wire [15:0] ISR,

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
    input  wire MUL1,
    input  wire MUL2_1,
    input  wire MUL2_2,
    input  wire MUL3,
    input  wire MUL4,

    input  wire PSW_N,
    input  wire PSW_Z,
    input  wire PSW_V,
    input  wire PSW_C,

    input  wire EIT,
    input  wire OIT,

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
    output wire MDM,

    output wire f_is_D,
    output wire t_is_D,
    output wire is_T_DFive,
    output wire is_T_DSeven,

    output wire EIT_gate,
    output wire OIT_gate,
    output wire op_MUL,
    output wire op_RIT,
    output wire op_SVC,

    output wire BUS_A_to_AND_one,
    output wire BUS_B_to_AND_one,
    output wire REG_A_to_BUS_S,
    output wire REG_B_to_BUS_S,
    output wire [2:0] MUL_ctrl,

    // 命令種別を外部に出力（controller から参照するため）
    output wire CLR_inst,
    output wire MOV,
    output wire ADD,
    output wire ADC,
    output wire SUB,
    output wire SBC,
    output wire CMP,

    output wire ASL,
    output wire ASR,
    output wire ROL,
    output wire ROR,
    output wire RLC,
    output wire RRC,
    output wire LSL,
    output wire LSR,

    output wire OR_inst,
    output wire XOR_inst,
    output wire AND_inst,
    output wire BIT_inst
);
    // 全体的にbdfに準拠するためにまとめていない。

    wire [5:0] ex_state = ISR[15:10];
    wire [1:0] f_mode   = ISR[9:8];
    wire [2:0] f_value  = ISR[7:5];
    wire [1:0] t_mode   = ISR[4:3];
    wire [2:0] t_value  = ISR[2:0];

    wire is_F_zero  = (f_value == 3'b000);
    wire is_F_one   = (f_value == 3'b001);
    wire is_F_two   = (f_value == 3'b010);
    wire is_F_three = (f_value == 3'b011);
    wire is_F_four  = (f_value == 3'b100);
    wire is_F_five  = (f_value == 3'b101);
    wire is_F_six   = (f_value == 3'b110);
    wire is_F_seven = (f_value == 3'b111);

    wire is_T_zero  = (t_value == 3'b000);
    wire is_T_one   = (t_value == 3'b001);
    wire is_T_two   = (t_value == 3'b010);
    wire is_T_three = (t_value == 3'b011);
    wire is_T_four  = (t_value == 3'b100);
    wire is_T_five  = (t_value == 3'b101);
    wire is_T_six   = (t_value == 3'b110);
    wire is_T_seven = (t_value == 3'b111);

    assign f_is_D  = (f_mode == 2'b00);
    wire   f_is_I  = (f_mode == 2'b01);
    wire   f_is_MI = (f_mode == 2'b10);
    wire   f_is_IP = (f_mode == 2'b11);

    assign t_is_D  = (t_mode == 2'b00);
    wire   t_is_I  = (t_mode == 2'b01);
    wire   t_is_MI = (t_mode == 2'b10);
    wire   t_is_IP = (t_mode == 2'b11);

    wire op_HLT = (ex_state == 6'b000000);
    wire op_CLR = (ex_state == 6'b000100);

    wire op_ASL = (ex_state == 6'b001000);
    wire op_ASR = (ex_state == 6'b001001);
    wire op_RLC = (ex_state == 6'b001010);
    wire op_RRC = (ex_state == 6'b001011);

    wire op_LSL = (ex_state == 6'b001100);
    wire op_LSR = (ex_state == 6'b001101);
    wire op_ROL = (ex_state == 6'b001110);
    wire op_ROR = (ex_state == 6'b001111);

    wire op_MOV = (ex_state == 6'b010000);
    wire op_JMP = (ex_state == 6'b010001);
    wire op_RET = (ex_state == 6'b010010);
    assign op_RIT = (ex_state == 6'b010011);

    wire op_ADD = (ex_state == 6'b010100);
    wire op_RJP = (ex_state == 6'b010101);
    wire op_ADC = (ex_state == 6'b010110);

    wire op_SUB = (ex_state == 6'b011000);
    wire op_SBC = (ex_state == 6'b011010);
    wire op_CMP = (ex_state == 6'b011011);

    wire op_NOP = (ex_state[5:2] == 4'b0111);

    wire op_OR  = (ex_state == 6'b100000);
    wire op_XOR = (ex_state == 6'b100001);
    wire op_AND = (ex_state == 6'b100010);
    wire op_BIT = (ex_state == 6'b100011);

    assign op_MUL = (ex_state == 6'b100100);

    wire op_JSR = (ex_state == 6'b101100);
    wire op_RJS = (ex_state == 6'b101101);
    assign op_SVC = (ex_state == 6'b101110);

    wire op_BRN = (ex_state == 6'b110000);
    wire op_BRZ = (ex_state == 6'b110001);
    wire op_BRV = (ex_state == 6'b110010);
    wire op_BRC = (ex_state == 6'b110011);

    wire op_RBN = (ex_state == 6'b111000);
    wire op_RBZ = (ex_state == 6'b111001);
    wire op_RBV = (ex_state == 6'b111010);
    wire op_RBC = (ex_state == 6'b111011);

    // 表との対応のために個別に定義している。

    assign MDA =
        FF2 |
        op_ASL | op_ASR | op_LSL | op_LSR | op_ROL | op_ROR | op_RLC | op_RRC |
        op_ADD | op_ADC | op_RJP | op_SUB | op_SBC | op_CMP |
        op_OR  | op_XOR | op_AND | op_BIT |
        op_RBN | op_RBZ | op_RBV | op_RBC;

    assign R0A =
        (FF0 & is_F_zero) |
        (FF1 & f_is_IP & is_F_zero) |
        (TF0 & is_T_zero) |
        (TF1 & t_is_IP & is_T_zero) |
        (MUL1 & is_T_zero);

    assign R1A =
        (FF0 & is_F_one) |
        (FF1 & f_is_IP & is_F_one) |
        (TF0 & is_T_one) |
        (TF1 & t_is_IP & is_T_one) |
        (MUL1 & is_T_one);

    assign R2A =
        (FF0 & is_F_two) |
        (FF1 & f_is_IP & is_F_two) |
        (TF0 & is_T_two) |
        (TF1 & t_is_IP & is_T_two) |
        (MUL1 & is_T_two);

    assign R3A =
        (FF0 & is_F_three) |
        (FF1 & f_is_IP & is_F_three) |
        (TF0 & is_T_three) |
        (TF1 & t_is_IP & is_T_three) |
        (MUL1 & is_T_three);

    assign R4A =
        (FF0 & is_F_four) |
        (FF1 & f_is_IP & is_F_four) |
        (TF0 & is_T_four) |
        (TF1 & t_is_IP & is_T_four) |
        (MUL1 & is_T_four);

    assign R5A =
        (FF0 & is_F_five) |
        (FF1 & f_is_IP & is_F_five) |
        (TF0 & is_T_five) |
        (TF1 & t_is_IP & is_T_five) |
        (MUL1 & is_T_five);

    assign R6A =
        (FF0 & is_F_six) |
        (FF1 & f_is_IP & is_F_six) |
        (TF0 & is_T_six) |
        (TF1 & t_is_IP & is_T_six) |
        op_RET | op_RIT |
        IT0 | IT1 |
        (MUL1 & is_T_six);

    assign R7A =
        IF0 | IF1 |
        (FF0 & is_F_seven) |
        (FF1 & f_is_IP & is_F_seven) |
        (TF0 & is_T_seven) |
        (TF1 & t_is_IP & is_T_seven) |
        (op_RJS & EX1) |
        (MUL1 & is_T_seven);

    assign B0B =
        op_MOV | op_JMP | op_ADD | op_ADC | op_RJP | op_SUB | op_SBC | op_CMP |
        op_OR | op_XOR | op_AND | op_BIT |
        op_JSR | op_RJS | op_SVC |
        op_BRN | op_BRZ | op_BRV | op_BRC |
        op_RBN | op_RBZ | op_RBV | op_RBC |
        EX1;

    assign SMD =
        IF0 | FF0 | TF0 |
        op_CLR | op_ASL | op_ASR | op_LSL | op_LSR | op_ROL | op_ROR | op_RLC | op_RRC |
        op_MOV |
        op_ADD | op_ADC | op_RJP | op_SUB | op_SBC |
        op_OR  | op_XOR | op_AND |
        op_JSR | op_RJS | op_SVC;

    assign SMA =
        IF0 | FF0 | TF0 |
        IT0;

    assign SR0 =
        (FF0 & is_F_zero) |
        (FF1 & f_is_IP & is_F_zero) |
        (TF1 & t_is_IP & is_T_zero) |
        (op_CLR & t_is_D & is_T_zero) |
        (op_ASL & t_is_D & is_T_zero) |
        (op_ASR & t_is_D & is_T_zero) |
        (op_LSL & t_is_D & is_T_zero) |
        (op_LSR & t_is_D & is_T_zero) |
        (op_ROL & t_is_D & is_T_zero) |
        (op_ROR & t_is_D & is_T_zero) |
        (op_RLC & t_is_D & is_T_zero) |
        (op_RRC & t_is_D & is_T_zero) |
        (op_MOV & t_is_D & is_T_zero) |
        (op_ADD & t_is_D & is_T_zero) |
        (op_ADC & t_is_D & is_T_zero) |
        (op_RJP & t_is_D & is_T_zero) |
        (op_OR  & t_is_D & is_T_zero) |
        (op_XOR & t_is_D & is_T_zero) |
        (op_AND & t_is_D & is_T_zero) |
        (MUL3 & is_T_zero);

    assign SR1 =
        (FF0 & is_F_one) |
        (FF1 & f_is_IP & is_F_one) |
        (TF1 & t_is_IP & is_T_one) |
        (op_CLR & t_is_D & is_T_one) |
        (op_ASL & t_is_D & is_T_one) |
        (op_ASR & t_is_D & is_T_one) |
        (op_LSL & t_is_D & is_T_one) |
        (op_LSR & t_is_D & is_T_one) |
        (op_ROL & t_is_D & is_T_one) |
        (op_ROR & t_is_D & is_T_one) |
        (op_RLC & t_is_D & is_T_one) |
        (op_RRC & t_is_D & is_T_one) |
        (op_MOV & t_is_D & is_T_one) |
        (op_ADD & t_is_D & is_T_one) |
        (op_ADC & t_is_D & is_T_one) |
        (op_RJP & t_is_D & is_T_one) |
        (op_OR  & t_is_D & is_T_one) |
        (op_XOR & t_is_D & is_T_one) |
        (op_AND & t_is_D & is_T_one) |
        (MUL3 & is_T_one) |
        (MUL4 & is_T_zero);

    assign SR2 =
        (FF0 & is_F_two) |
        (FF1 & f_is_IP & is_F_two) |
        (TF1 & t_is_IP & is_T_two) |
        (op_CLR & t_is_D & is_T_two) |
        (op_ASL & t_is_D & is_T_two) |
        (op_ASR & t_is_D & is_T_two) |
        (op_LSL & t_is_D & is_T_two) |
        (op_LSR & t_is_D & is_T_two) |
        (op_ROL & t_is_D & is_T_two) |
        (op_ROR & t_is_D & is_T_two) |
        (op_RLC & t_is_D & is_T_two) |
        (op_RRC & t_is_D & is_T_two) |
        (op_MOV & t_is_D & is_T_two) |
        (op_ADD & t_is_D & is_T_two) |
        (op_ADC & t_is_D & is_T_two) |
        (op_RJP & t_is_D & is_T_two) |
        (op_OR  & t_is_D & is_T_two) |
        (op_XOR & t_is_D & is_T_two) |
        (op_AND & t_is_D & is_T_two) |
        (MUL3 & is_T_two) |
        (MUL4 & is_T_one);

    assign SR3 =
        (FF0 & is_F_three) |
        (FF1 & f_is_IP & is_F_three) |
        (TF1 & t_is_IP & is_T_three) |
        (op_CLR & t_is_D & is_T_three) |
        (op_ASL & t_is_D & is_T_three) |
        (op_ASR & t_is_D & is_T_three) |
        (op_LSL & t_is_D & is_T_three) |
        (op_LSR & t_is_D & is_T_three) |
        (op_ROL & t_is_D & is_T_three) |
        (op_ROR & t_is_D & is_T_three) |
        (op_RLC & t_is_D & is_T_three) |
        (op_RRC & t_is_D & is_T_three) |
        (op_MOV & t_is_D & is_T_three) |
        (op_ADD & t_is_D & is_T_three) |
        (op_ADC & t_is_D & is_T_three) |
        (op_RJP & t_is_D & is_T_three) |
        (op_OR  & t_is_D & is_T_three) |
        (op_XOR & t_is_D & is_T_three) |
        (op_AND & t_is_D & is_T_three) |
        (MUL3 & is_T_three) |
        (MUL4 & is_T_two);

    assign SR4 =
        (FF0 & is_F_four) |
        (FF1 & f_is_IP & is_F_four) |
        (TF1 & t_is_IP & is_T_four) |
        (op_CLR & t_is_D & is_T_four) |
        (op_ASL & t_is_D & is_T_four) |
        (op_ASR & t_is_D & is_T_four) |
        (op_LSL & t_is_D & is_T_four) |
        (op_LSR & t_is_D & is_T_four) |
        (op_ROL & t_is_D & is_T_four) |
        (op_ROR & t_is_D & is_T_four) |
        (op_RLC & t_is_D & is_T_four) |
        (op_RRC & t_is_D & is_T_four) |
        (op_MOV & t_is_D & is_T_four) |
        (op_ADD & t_is_D & is_T_four) |
        (op_ADC & t_is_D & is_T_four) |
        (op_RJP & t_is_D & is_T_four) |
        (op_OR  & t_is_D & is_T_four) |
        (op_XOR & t_is_D & is_T_four) |
        (op_AND & t_is_D & is_T_four) |
        (MUL3 & is_T_four) |
        (MUL4 & is_T_three);

    assign SR5 =
        (FF0 & is_F_five) |
        (FF1 & f_is_IP & is_F_five) |
        (TF1 & t_is_IP & is_T_five) |
        (op_CLR & t_is_D & is_T_five) |
        (op_ASL & t_is_D & is_T_five) |
        (op_ASR & t_is_D & is_T_five) |
        (op_LSL & t_is_D & is_T_five) |
        (op_LSR & t_is_D & is_T_five) |
        (op_ROL & t_is_D & is_T_five) |
        (op_ROR & t_is_D & is_T_five) |
        (op_RLC & t_is_D & is_T_five) |
        (op_RRC & t_is_D & is_T_five) |
        (op_MOV & t_is_D & is_T_five) |
        (op_ADD & t_is_D & is_T_five) |
        (op_ADC & t_is_D & is_T_five) |
        (op_RJP & t_is_D & is_T_five) |
        (op_OR  & t_is_D & is_T_five) |
        (op_XOR & t_is_D & is_T_five) |
        (op_AND & t_is_D & is_T_five) |
        (MUL3 & is_T_five) |
        (MUL4 & is_T_four);

    assign SR6 =
        (FF0 & is_F_six) |
        (FF1 & f_is_IP & is_F_six) |
        (TF1 & t_is_IP & is_T_six) |
        (op_CLR & t_is_D & is_T_six) |
        (op_ASL & t_is_D & is_T_six) |
        (op_ASR & t_is_D & is_T_six) |
        (op_LSL & t_is_D & is_T_six) |
        (op_LSR & t_is_D & is_T_six) |
        (op_ROL & t_is_D & is_T_six) |
        (op_ROR & t_is_D & is_T_six) |
        (op_RLC & t_is_D & is_T_six) |
        (op_RRC & t_is_D & is_T_six) |
        (op_MOV & t_is_D & is_T_six) |
        (op_ADD & t_is_D & is_T_six) |
        (op_ADC & t_is_D & is_T_six) |
        (op_RJP & t_is_D & is_T_six) |
        (op_OR  & t_is_D & is_T_six) |
        (op_XOR & t_is_D & is_T_six) |
        (op_AND & t_is_D & is_T_six) |
        IT1 |
        (MUL3 & is_T_six) |
        (MUL4 & is_T_five);

    assign SR7 =
        IF1 |
        (FF0 & is_F_seven) |
        (FF1 & f_is_IP & is_F_seven) |
        (TF1 & t_is_IP & is_T_seven) |
        (op_CLR & t_is_D & is_T_seven) |
        (op_ASL & t_is_D & is_T_seven) |
        (op_ASR & t_is_D & is_T_seven) |
        (op_LSL & t_is_D & is_T_seven) |
        (op_LSR & t_is_D & is_T_seven) |
        (op_ROL & t_is_D & is_T_seven) |
        (op_ROR & t_is_D & is_T_seven) |
        (op_RLC & t_is_D & is_T_seven) |
        (op_RRC & t_is_D & is_T_seven) |
        (op_MOV & t_is_D & is_T_seven) |
        op_JMP | op_RET | op_RIT |
        (op_ADD & t_is_D & is_T_seven) |
        (op_ADC & t_is_D & is_T_seven) |
        (op_RJP & t_is_D & is_T_seven) |
        (op_OR  & t_is_D & is_T_seven) |
        (op_XOR & t_is_D & is_T_seven) |
        (op_AND & t_is_D & is_T_seven) |
        (PSW_N & op_BRN) | (PSW_Z & op_BRZ) | (PSW_V & op_BRV) | (PSW_C & op_BRC) |
        (PSW_N & op_RBN) | (PSW_Z & op_RBZ) | (PSW_V & op_RBV) | (PSW_C & op_RBC) |
        ((op_RJS | op_JSR | op_SVC) & EX1) |
        IT2 |
        (MUL4 & is_T_six);

    assign SB0 = FF2 | MUL2_1 | MUL2_2;

    assign ALS =
        IF0 | IF1 | FF0 | FF1 | FF2 | TF0 | TF1 |
        op_CLR |
        op_MOV | op_JMP | op_RET | op_RIT |
        op_ADD | op_ADC | op_RJP | op_SUB | op_SBC | op_CMP |
        op_OR  | op_XOR | op_AND | op_BIT |
        op_JSR | op_RJS | op_SVC |
        op_BRN | op_BRZ | op_BRV | op_BRC |
        op_RBN | op_RBZ | op_RBV | op_RBC |
        EX1 | IT0 | IT1;

    assign ALU_x =
        (f_is_MI & FF0) |
        op_SUB | op_SBC | op_CMP;

    assign ALU_y =
        IF0 | IF1 | FF0 | FF2 | TF0 | TF1 |
        op_MOV | op_JMP | op_RET | op_RIT |
        op_ADD | op_ADC | op_RJP | op_SUB | op_SBC | op_CMP |
        op_JSR | op_RJS | op_SVC |
        op_BRN | op_BRZ | op_BRV | op_BRC |
        EX1 | IT0 | IT1;

    assign ALU_z =
        op_OR |
        op_RBN | op_RBZ | op_RBV | op_RBC;

    assign ALU_u =
        IF1 | TF1 |
        (PSW_C & op_ADC) |
        op_SUB |
        (PSW_C & op_SBC) |
        op_CMP |
        IT1;

    assign ALU_v =
        IF0 | IF1 | FF0 | FF2 | TF0 | TF1 |
        op_MOV | op_JMP | op_RET | op_RIT |
        op_ADD | op_ADC | op_RJP | op_SUB | op_SBC | op_CMP |
        op_XOR |
        op_JSR | op_RJS | op_SVC |
        op_BRN | op_BRZ | op_BRV | op_BRC |
        op_RBN | op_RBZ | op_RBV | op_RBC |
        EX1 | IT0 | IT1;

    assign SHS =
        op_ASL | op_ASR | op_LSL | op_LSR | op_ROL | op_ROR | op_RLC | op_RRC;

    assign SFT_A = op_ASR;
    assign SFT_B = op_ROL;
    assign SFT_C = op_LSR | op_ROL | op_RLC;
    assign SFT_D = op_ROR;
    assign SFT_E = op_RLC | op_RRC;
    assign SFT_R = op_ASR | op_ROR | op_RRC;
    assign SFT_L = op_ASR | op_LSR | op_ROL | op_RLC;

    assign SET_PSW =
        op_CLR |
        op_ASL | op_ASR | op_LSL | op_LSR | op_ROL | op_ROR | op_RLC | op_RRC |
        op_MOV |
        op_ADD | op_ADC | op_SUB | op_SBC | op_CMP |
        op_OR  | op_XOR | op_AND | op_BIT;

    assign R_W_N =
        IF0 | IF1 | FF0 | IF1 | FF2 | TF0 | TF1 |
        op_HLT |
        op_CLR | op_ASL | op_ASR | op_LSL | op_LSR | op_ROL | op_ROR | op_RLC | op_RRC |
        op_MOV | op_JMP | op_RET | op_RIT |
        op_ADD | op_ADC | op_RJP | op_SUB | op_SBC | op_CMP |
        op_NOP |
        op_OR  | op_XOR | op_AND | op_BIT |
        op_JSR | op_RJS | op_SVC |
        op_BRN | op_BRZ | op_BRV | op_BRC |
        op_RBN | op_RBZ | op_RBV | op_RBC |
        op_MUL |
        IT0 | IT2 |
        MUL1 | MUL2_1 | MUL2_2 | MUL3 | MUL4;

    assign MREQ_N =
        IF0 | FF0 | IF1 | FF2 | TF0 |
        op_HLT |
        op_CLR | op_ASL | op_ASR | op_LSL | op_LSR | op_ROL | op_ROR | op_RLC | op_RRC |
        op_MOV | op_JMP | op_RET | op_RIT |
        op_ADD | op_ADC | op_RJP | op_SUB | op_SBC | op_CMP |
        op_NOP |
        op_OR  | op_XOR | op_AND | op_BIT |
        op_JSR | op_RJS | op_SVC |
        op_BRN | op_BRZ | op_BRV | op_BRC |
        op_RBN | op_RBZ | op_RBV | op_RBC |
        op_MUL |
        EX1 | IT0 | IT2 |
        MUL1 | MUL2_1 | MUL2_2 | MUL3 | MUL4;

    assign MIRQ_N =
        IF0 | IF1 | FF0 | FF2 | TF0 | TF1 |
        op_HLT |
        op_CLR | op_ASL | op_ASR | op_LSL | op_LSR | op_ROL | op_ROR | op_RLC | op_RRC |
        op_MOV | op_JMP | op_RET | op_RIT |
        op_ADD | op_ADC | op_RJP | op_SUB | op_SBC | op_CMP |
        op_NOP |
        op_OR  | op_XOR | op_AND | op_BIT |
        op_JSR | op_RJS | op_SVC |
        op_BRN | op_BRZ | op_BRV | op_BRC |
        op_RBN | op_RBZ | op_RBV | op_RBC |
        op_MUL |
        IT0 | IT2 |
        MUL1 | MUL2_1 | MUL2_2 | MUL3 | MUL4;

    assign MIS = IF1;

    assign MMD = IF1 | TF1;

    assign MDM = EX1 | IT0;

    assign EIT_gate = IT2 & EIT;

    assign OIT_gate = IT2 & ~EIT & OIT;

    assign is_T_DFive  = is_T_five  & t_is_D;
    assign is_T_DSeven = is_T_seven & t_is_D;

    // MUL関連の制御信号
    assign BUS_A_to_AND_one = MUL1;
    assign BUS_B_to_AND_one = MUL2_1 | MUL2_2;
    assign REG_A_to_BUS_S = MUL4;
    assign REG_B_to_BUS_S = MUL3;

    // MUL_ctrl[2:0]
    assign MUL_ctrl[0] = MUL2_1 | MUL2_2 | MUL3 | MUL4;
    assign MUL_ctrl[1] = op_MUL | MUL2_1 | MUL2_2 | MUL3 | MUL4;
    assign MUL_ctrl[2] = MUL1 | MUL3 | MUL4;

    // 命令種別出力
    assign CLR_inst = op_CLR;
    assign MOV      = op_MOV;
    assign ADD      = op_ADD;
    assign ADC      = op_ADC;
    assign SUB      = op_SUB;
    assign SBC      = op_SBC;
    assign CMP      = op_CMP;

    assign ASL      = op_ASL;
    assign ASR      = op_ASR;
    assign ROL      = op_ROL;
    assign ROR      = op_ROR;
    assign RLC      = op_RLC;
    assign RRC      = op_RRC;
    assign LSL      = op_LSL;
    assign LSR      = op_LSR;

    assign OR_inst  = op_OR;
    assign XOR_inst = op_XOR;
    assign AND_inst = op_AND;
    assign BIT_inst = op_BIT;

endmodule
