// ============================================================
// PSW Logic Module
// Computes J/K inputs for PSW flags (NZVC) based on operation type
// ============================================================

module PSW_logic(
    // Instruction decode signals
    input  wire        EX0,             // Execute state 0
    input  wire        CLR,             // Clear instruction
    input  wire        MOV,             // Move instruction
    input  wire        ADD,             // Add instruction
    input  wire        ADC,             // Add with carry instruction
    input  wire        SUB,             // Subtract instruction
    input  wire        SBC,             // Subtract with carry instruction
    input  wire        CMP,             // Compare instruction
    input  wire        ASL,             // Arithmetic shift left
    input  wire        ASR,             // Arithmetic shift right
    input  wire        ROL,             // Rotate left
    input  wire        ROR,             // Rotate right
    input  wire        RLC,             // Rotate left through carry
    input  wire        RRC,             // Rotate right through carry
    input  wire        LSL,             // Logical shift left
    input  wire        LSR,             // Logical shift right
    input  wire        OR_inst,         // OR instruction
    input  wire        XOR_inst,        // XOR instruction
    input  wire        AND_inst,        // AND instruction
    input  wire        BIT_inst,        // BIT instruction
    input  wire        MUL3,            // Multiply instruction (H6 result selection)

    // Shifter outputs
    input  wire [15:0] shifter_out,     // 16-bit shifter result
    input  wire        shifter_Cf,      // Carry flag from shifter

    // H4 ALU outputs
    input  wire [15:0] H4_out,          // 16-bit H4 ALU result
    input  wire        ALU_carry,       // Carry output from H4 ALU
    input  wire        ALU_overflow,    // Overflow output from H4 ALU

    // H6 Multiplier outputs
    input  wire [15:0] H6_a_out,        // H6 A register output
    input  wire [15:0] H6_q_out,        // H6 Q register output

    // Data path control signals
    input  wire        D5,              // Data path control D5
    input  wire        D7,              // Data path control D7

    // Output J/K signals for PSW flags
    output wire        J_N,             // N flag J input
    output wire        K_N,             // N flag K input
    output wire        J_Z,             // Z flag J input
    output wire        K_Z,             // Z flag K input
    output wire        J_V,             // V flag J input
    output wire        K_V,             // V flag K input
    output wire        J_C,             // C flag J input
    output wire        K_C              // C flag K input
);

    // =========================================
    // Internal signals for result selection
    // =========================================
    wire shift_ops;
    wire alu_ops;
    wire mul_ops;

    assign shift_ops = ASL | ASR | LSL | LSR | ROL | ROR | RLC | RRC;
    assign alu_ops   = MOV | ADD | ADC | SUB | SBC | CMP | OR_inst | XOR_inst | AND_inst | BIT_inst;
    assign mul_ops   = MUL3;

    // =========================================
    // N Flag Logic (Negative)
    // =========================================
    // Set N based on MSB of result:
    //   - For shift operations: use shifter_Cf
    //   - For ALU operations: use H4_out[15]
    //   - For MUL3 operations: use H6_a_out[15]
    //   - Special: CLR and LSR always clear N flag (K_N only)

    assign J_N = EX0 & ~(CLR | LSR) &
                 ((shift_ops & shifter_Cf) |
                  (alu_ops & H4_out[15]) |
                  (mul_ops & H6_a_out[15])) &
                 ~(D5 | D7) |
                 EX0 & H4_out[3] & MOV & D5;

    assign K_N = EX0 &
                 ((CLR | LSR) |
                  (~((shift_ops & shifter_Cf) |
                     (alu_ops & H4_out[15]) |
                     (mul_ops & H6_a_out[15])))) &
                 ~(D5 | D7) |
                 EX0 & ~H4_out[3] & MOV & D5;

    // =========================================
    // Z Flag Logic (Zero)
    // =========================================
    // Set Z if result is all zeros:
    //   - For CLR instruction: always set Z=1
    //   - For shift operations (ASL, ASR, LSL, LSR, ROL, ROR, RLC, RRC): shifter_out == 0
    //   - For ALU operations (MOV, ADD, ADC, SUB, SBC, CMP, OR, XOR, AND, BIT): H4_out == 0
    //   - For MUL3 operation: both H6_a_out and H6_q_out must be 0

    wire shifter_zero;
    wire h4_zero;
    wire h6_zero;

    assign shifter_zero = (shifter_out == 16'b0);
    assign h4_zero      = ~(|H4_out);
    assign h6_zero      = ~(|H6_a_out) & ~(|H6_q_out);

    assign J_Z = EX0 & (CLR |
                        (shift_ops & shifter_zero) |
                        (alu_ops & h4_zero) |
                        (mul_ops & h6_zero)) &
                 ~(D5 | D7) |
                 EX0 & H4_out[2] & MOV & D5;

    assign K_Z = EX0 & ~CLR & ((shift_ops & ~shifter_zero) |
                                (alu_ops & ~h4_zero) |
                                (mul_ops & ~h6_zero)) &
                 ~(D5 | D7) |
                 EX0 & ~H4_out[2] & MOV & D5;

    // =========================================
    // V Flag Logic (Overflow)
    // =========================================
    // Set V for:
    //   - ASL: when (~af & ae) | (af & ~ae)  (sign bit XOR with bit 14)
    //   - ADD/ADC/SUB/SBC/CMP: with ALU overflow
    // Clear V for:
    //   - ASL: when ~((~af & ae) | (af & ~ae))
    //   - ADD/ADC/SUB/SBC/CMP: without ALU overflow
    //   - Logic operations (OR, XOR, AND, BIT): always 0
    //   - Other shifts (ASR, LSL, LSR, ROL, ROR, RLC, RRC): always 0

    wire asl_overflow;
    assign asl_overflow = ((~shifter_out[14] ^ shifter_out[15]) | (shifter_out[14] ^ ~shifter_out[15]));  // ~af & ae | af & ~ae

    assign J_V = EX0 & ((ADD | ADC | SUB | SBC | CMP) & ALU_overflow |
                        ASL & asl_overflow) &
                 ~(D5 | D7) |
                 EX0 & H4_out[1] & MOV & D5;

    assign K_V = EX0 & ((ADD | ADC | SUB | SBC | CMP) & ~ALU_overflow |
                        ASL & ~asl_overflow |
                        OR_inst | XOR_inst | AND_inst | BIT_inst |
                        ASR | LSL | LSR | ROL | ROR | RLC | RRC) &
                 ~(D5 | D7) |
                 EX0 & ~H4_out[1] & MOV & D5;

    // =========================================
    // C Flag Logic (Carry)
    // =========================================
    // Set C for:
    //   - CLR instruction: always clear C=0
    //   - Shift/Rotate operations: use shifter_Cf
    //   - ADD/ADC/SUB/SBC/CMP: use ALU_carry
    // Clear C for:
    //   - CLR instruction: always clear C=0
    //   - Shift/Rotate operations: when shifter_Cf=0
    //   - ADD/ADC/SUB/SBC/CMP: when ALU_carry=0

    assign J_C = EX0 & ~CLR & ((shift_ops & shifter_Cf) |
                                ((ADD | ADC | SUB | SBC | CMP) & ALU_carry)) &
                 ~(D5 | D7) |
                 EX0 & H4_out[0] & MOV & D5;

    assign K_C = EX0 & (CLR |
                        (shift_ops & ~shifter_Cf) |
                        ((ADD | ADC | SUB | SBC | CMP) & ~ALU_carry)) &
                 ~(D5 | D7) |
                 EX0 & ~H4_out[0] & MOV & D5;

endmodule
