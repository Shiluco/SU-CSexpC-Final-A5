// ============================================================
// Interface for H6_module (Multiplier) Test
// DE2-115 board (negative logic)
// Test patterns selected by KEY[3:1] multiplexer
// KEY[0] is used as clock/step
// ============================================================

module if_H6 (
    // Push buttons (KEY)
    input  wire [3:0] KEY,          // KEY[0]: Clock/Step button
                                    // KEY[3:1]: Test pattern select (3-bit = 8 patterns)

    // Slide switches (SW)
    input  wire [17:0] SW,          // SW[7:0]: A_bus[7:0] (lower 8-bit)
                                    // SW[15:8]: B_bus[7:0] (lower 8-bit)
                                    // SW[16]: MUL_input_sel (0=A_bus, 1=B_bus)
                                    // SW[17]: Output enable

    // Clock input
    input  wire        CLOCK_50,    // 50MHz system clock

    // LED outputs
    output wire [15:0] LEDR,        // LEDR[7:0]: A_mul_bus[7:0]
                                    // LEDR[15:8]: Q_mul_bus[7:0]
    output wire [7:0] LEDG          // LEDG[0]: carry flag
                                    // LEDG[1]: overflow flag
                                    // LEDG[4:2]: test pattern display
                                    // LEDG[5]: MUL1 active
                                    // LEDG[6]: MUL2 active
                                    // LEDG[7]: Rst active
);

    // =========================
    // Internal signals
    // =========================

    // Test pattern select
    reg [2:0] pattern_sel;
    reg [2:0] pattern_sel_prev;

    // H6 control signals
    reg rst;
    reg inTWO, inTHREE, inFOUR;
    reg MUL1, MUL2_1, MUL2_2;
    reg ALS_H6_a, ALS_H6_q;

    // Clock signals
    wire key_clk;           // Key[0] as clock
    reg inQLK;              // Clock to H6
    reg clk_step;

    // Bus signals (16-bit with upper 8-bit tied to 0)
    wire [15:0] a_bus_in;
    wire [15:0] b_bus_in;

    // H6 outputs
    wire [15:0] h6_a_out;
    wire [15:0] h6_q_out;
    wire [15:0] a_mul_bus;
    wire [15:0] q_mul_bus;
    wire alu_carryOut;
    wire alu_overflowOut;

    // =========================
    // Clock generation from KEY[0]
    // =========================
    // KEY is negative logic (pressed=0, released=1)
    // Generate clock pulse on KEY press
    reg key0_prev;

    always @(posedge CLOCK_50) begin
        key0_prev <= KEY[0];
    end

    // Rising edge detection (button release in negative logic)
    assign key_clk = key0_prev & ~KEY[0];

    // =========================
    // Pattern select from KEY[3:1]
    // =========================
    // KEY is negative logic: invert to get positive logic
    always @(posedge CLOCK_50) begin
        pattern_sel <= ~KEY[3:1];
    end

    // =========================
    // Test pattern state machine
    // =========================
    /*
    Test patterns (pattern_sel = KEY[3:1] inverted):
    Pattern | rst | inTWO | inTHREE | inFOUR | Description
    --------+-----+-------+---------+--------+------------------
       0    |  1  |   -   |    -    |   -    | リセット (Reset)
       1    |  0  |   0   |    0    |   0    | セットA (Set A)
       2    |  0  |   0   |    0    |   1    | セットQ (Set Q)
       3    |  0  |   0   |    1    |   0    | クリアA (Clear A)
       4    |  0  |   0   |    1    |   1    | クリアQ (Clear Q)
       5    |  0  |   1   |    0    |   0    | 加算 (Add)
       6    |  0  |   1   |    0    |   1    | 減算 (Sub)
       7    |  0  |   1   |    1    |   0    | 乗算 (Mul)
    */

    // Input multiplexer control
    wire mul_input_sel;
    assign mul_input_sel = ~SW[16];  // Negative logic

    // Output enable control
    wire output_enable;
    assign output_enable = ~SW[17];  // Negative logic

    // Control signal generation based on pattern
    always @(posedge CLOCK_50) begin
        case (pattern_sel)
            3'd0: begin  // Reset
                rst <= 1'b1;
                inTWO <= 1'b0;
                inTHREE <= 1'b0;
                inFOUR <= 1'b0;
                MUL1 <= 1'b0;
                MUL2_1 <= 1'b0;
                MUL2_2 <= 1'b0;
                ALS_H6_a <= 1'b0;
                ALS_H6_q <= 1'b0;
            end

            3'd1: begin  // Set A (load value to A register)
                rst <= 1'b0;
                inTWO <= 1'b0;
                inTHREE <= 1'b0;
                inFOUR <= 1'b0;
                // Input from selected bus
                MUL1 <= mul_input_sel ? 1'b0 : 1'b1;  // A_bus
                MUL2_1 <= mul_input_sel ? 1'b1 : 1'b0;  // B_bus option 1
                MUL2_2 <= 1'b0;
                ALS_H6_a <= output_enable;
                ALS_H6_q <= 1'b0;
            end

            3'd2: begin  // Set Q (load value to Q register)
                rst <= 1'b0;
                inTWO <= 1'b0;
                inTHREE <= 1'b0;
                inFOUR <= 1'b1;
                MUL1 <= mul_input_sel ? 1'b0 : 1'b1;
                MUL2_1 <= mul_input_sel ? 1'b1 : 1'b0;
                MUL2_2 <= 1'b0;
                ALS_H6_a <= 1'b0;
                ALS_H6_q <= output_enable;
            end

            3'd3: begin  // Clear A
                rst <= 1'b0;
                inTWO <= 1'b0;
                inTHREE <= 1'b1;
                inFOUR <= 1'b0;
                MUL1 <= 1'b0;
                MUL2_1 <= 1'b0;
                MUL2_2 <= 1'b0;
                ALS_H6_a <= output_enable;
                ALS_H6_q <= 1'b0;
            end

            3'd4: begin  // Clear Q
                rst <= 1'b0;
                inTWO <= 1'b0;
                inTHREE <= 1'b1;
                inFOUR <= 1'b1;
                MUL1 <= 1'b0;
                MUL2_1 <= 1'b0;
                MUL2_2 <= 1'b0;
                ALS_H6_a <= 1'b0;
                ALS_H6_q <= output_enable;
            end

            3'd5: begin  // Add
                rst <= 1'b0;
                inTWO <= 1'b1;
                inTHREE <= 1'b0;
                inFOUR <= 1'b0;
                MUL1 <= 1'b0;
                MUL2_1 <= 1'b0;
                MUL2_2 <= 1'b0;
                ALS_H6_a <= output_enable;
                ALS_H6_q <= output_enable;
            end

            3'd6: begin  // Sub
                rst <= 1'b0;
                inTWO <= 1'b1;
                inTHREE <= 1'b0;
                inFOUR <= 1'b1;
                MUL1 <= 1'b0;
                MUL2_1 <= 1'b0;
                MUL2_2 <= 1'b0;
                ALS_H6_a <= output_enable;
                ALS_H6_q <= output_enable;
            end

            3'd7: begin  // Multiply
                rst <= 1'b0;
                inTWO <= 1'b1;
                inTHREE <= 1'b1;
                inFOUR <= 1'b0;
                MUL1 <= 1'b0;
                MUL2_1 <= 1'b0;
                MUL2_2 <= 1'b0;
                ALS_H6_a <= output_enable;
                ALS_H6_q <= output_enable;
            end

            default: begin
                rst <= 1'b1;
                inTWO <= 1'b0;
                inTHREE <= 1'b0;
                inFOUR <= 1'b0;
                MUL1 <= 1'b0;
                MUL2_1 <= 1'b0;
                MUL2_2 <= 1'b0;
                ALS_H6_a <= 1'b0;
                ALS_H6_q <= 1'b0;
            end
        endcase
    end

    // Clock generation for H6
    always @(posedge CLOCK_50) begin
        if (key_clk) begin
            clk_step <= ~clk_step;
        end
    end

    always @(posedge CLOCK_50) begin
        inQLK <= clk_step;
    end

    // =========================
    // A_bus and B_bus assignment
    // =========================
    // Negative logic: invert SW inputs
    // Use lower 8-bit (bits 7:0), upper 8-bit = 0
    assign a_bus_in[7:0] = ~SW[7:0];
    assign a_bus_in[15:8] = 8'b0;

    assign b_bus_in[7:0] = ~SW[15:8];
    assign b_bus_in[15:8] = 8'b0;

    // =========================
    // H6_module instance
    // =========================
    H6_module u_h6 (
        .A_bus_in(a_bus_in),
        .B_bus_in(b_bus_in),
        .MUL1(MUL1),
        .MUL2_1(MUL2_1),
        .MUL2_2(MUL2_2),
        .Rst(rst),
        .inQLK(inQLK),
        .inTWO(inTWO),
        .inTHREE(inTHREE),
        .inFOUR(inFOUR),
        .CLK_50(clk_step),
        .ALS_H6_a(ALS_H6_a),
        .ALS_H6_q(ALS_H6_q),
        .H6_a_out(h6_a_out),
        .H6_q_out(h6_q_out),
        .A_mul_bus(a_mul_bus),
        .Q_mul_bus(q_mul_bus),
        .alu_carryOut(alu_carryOut),
        .alu_overflowOut(alu_overflowOut)
    );

    // =========================
    // LED output assignment
    // =========================
    // A_mul_bus lower 8-bit to LEDR[7:0]
    assign LEDR[7:0] = a_mul_bus[7:0];

    // Q_mul_bus lower 8-bit to LEDR[15:8]
    assign LEDR[15:8] = q_mul_bus[7:0];

    // Status flags and control display to LEDG
    assign LEDG[0] = alu_carryOut;
    assign LEDG[1] = alu_overflowOut;
    assign LEDG[4:2] = pattern_sel;
    assign LEDG[5] = MUL1 | MUL2_1 | MUL2_2;  // Input active
    assign LEDG[6] = inTWO | inTHREE | inFOUR;  // Operation active
    assign LEDG[7] = rst;                       // Reset active

endmodule
