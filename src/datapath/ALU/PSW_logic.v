// ============================================================
// PSW Logic Module
// Computes J/K inputs for PSW flags (NZVC) based on chapter 7 formulas
// ============================================================

module PSW_logic(
    // Instruction decode signals
    input  wire EX0,                 // Execute state 0
    input  wire CLR_inst,            // Clear instruction
    input  wire SFTs,                // Shift instructions group
    input  wire MOV,                 // Move instruction
    input  wire ADD,                 // Add instruction
    input  wire SUB,                 // Subtract instruction
    input  wire CMP,                 // Compare instruction
    input  wire BITs,                // Bit instructions group
    input  wire ASL,                 // Arithmetic shift left
    input  wire ASR,                 // Arithmetic shift right
    input  wire ROL,                 // Rotate left
    input  wire ROR,                 // Rotate right
    input  wire LSL,                 // Logical shift left
    input  wire LSR,                 // Logical shift right
    input  wire OR_inst,             // OR instruction
    input  wire XOR_inst,            // XOR instruction
    input  wire AND_inst,            // AND instruction
    input  wire BIT_inst,            // BIT instruction

    // ALU outputs from H4
    input  wire [15:0] ALU_result_bus,  // 16-bit ALU result
    input  wire ALU_carry,               // Carry output from ALU
    input  wire ALU_overflow,            // Overflow output from ALU

    // Shifter output
    input  wire shifter_Cf,              // Carry flag from shifter

    // Data path control signals
    input  wire D5,                      // Data path control D5
    input  wire D7,                      // Data path control D7

    // Operand signals (for overflow detection)
    input  wire af,                      // A operand bit 15 (sign bit)
    input  wire ae,                      // A operand bit 14
    input  wire bf,                      // B operand bit 15 (sign bit)
    input  wire be,                      // B operand bit 14
    input  wire ce,                      // C (carry in) bit 14
    input  wire a0,                      // A operand bit 0

    // Current PSW C flag (for some operations)
    input  wire current_C,               // Current C flag from PSW

    // Output J/K signals for PSW flags
    output wire J_N,                     // N flag J input
    output wire K_N,                     // N flag K input
    output wire J_Z,                     // Z flag J input
    output wire K_Z,                     // Z flag K input
    output wire J_V,                     // V flag J input
    output wire K_V,                     // V flag K input
    output wire J_C,                     // C flag J input
    output wire K_C                      // C flag K input
);

    // =========================
    // N Flag Logic (Negative)
    // =========================
    // Set N if result bit 15 is 1
    // Reset N if result bit 15 is 0
    // Update on: ADD, SUB, CMP, OR, XOR, AND, BIT, Shifts, MOV

    assign J_N = EX0 & (ADD | SUB | CMP | OR_inst | XOR_inst | AND_inst | BIT_inst | SFTs | MOV) & ALU_result_bus[15];
    assign K_N = EX0 & (ADD | SUB | CMP | OR_inst | XOR_inst | AND_inst | BIT_inst | SFTs | MOV) & ~ALU_result_bus[15];

    // =========================
    // Z Flag Logic (Zero)
    // =========================
    // Set Z if result is all zeros
    // Reset Z if result is not zero
    // Update on: ADD, SUB, CMP, OR, XOR, AND, BIT, Shifts, MOV

    assign J_Z = EX0 & (ADD | SUB | CMP | OR_inst | XOR_inst | AND_inst | BIT_inst | SFTs | MOV) & (ALU_result_bus == 16'b0);
    assign K_Z = EX0 & (ADD | SUB | CMP | OR_inst | XOR_inst | AND_inst | BIT_inst | SFTs | MOV) & (ALU_result_bus != 16'b0);

    // =========================
    // V Flag Logic (Overflow)
    // =========================
    // Set V for:
    //   - ADD/SUB/CMP with overflow
    //   - ASL with sign change
    // Clear V for:
    //   - ADD/SUB/CMP without overflow
    //   - Logic operations (OR, XOR, AND, BIT)
    //   - Other shifts (ASR, ROL, ROR, LSL, LSR)

    assign J_V = EX0 & ((ADD | SUB | CMP) & ALU_overflow | ASL & (af ^ ALU_result_bus[15]));
    assign K_V = EX0 & ((ADD | SUB | CMP) & ~ALU_overflow | OR_inst | XOR_inst | AND_inst | BIT_inst | ASR | ROL | ROR | LSL | LSR);

    // =========================
    // C Flag Logic (Carry)
    // =========================
    // Set C for:
    //   - ADD/SUB/CMP with carry
    //   - Shifts/Rotates with shift-out bit (shifter_Cf)
    // Clear C for:
    //   - ADD/SUB/CMP without carry
    //   - Logic operations (OR, XOR, AND, BIT)
    //   - Shifts without shift-out

    assign J_C = EX0 & ((ADD | SUB | CMP) & ALU_carry | SFTs & shifter_Cf);
    assign K_C = EX0 & ((ADD | SUB | CMP) & ~ALU_carry | OR_inst | XOR_inst | AND_inst | BIT_inst | SFTs & ~shifter_Cf);

    // =========================
    // Clear instruction handling
    // =========================
    // Note: CLR instruction is handled separately if needed
    // For now, it follows the normal logic path with result = 0

endmodule
