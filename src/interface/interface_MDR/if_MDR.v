// ============================================================
// Interface for MDR (Memory Data Register) - 8-bit version
// DE2-115 board (negative logic)
// ============================================================

module if_MDR (
    // Push buttons (KEY)
    input  wire [3:0] KEY,          // KEY[0]: clock input (pressed=0, released=1)
                                    // KEY[1]: clear input (pressed=0, released=1)
                                    // KEY[2]: MDM signal (MDR to M-bus)
                                    // KEY[3]: MDA signal (MDR to A-bus)

    // Slide switches (SW)
    input  wire [17:0] SW,          // SW[7:0]: S_bus[7:0] input
                                    // SW[15:8]: M_bus[7:0] input
                                    // SW[16]: MMD signal (M-bus to MDR)
                                    // SW[17]: SMD signal (S-bus to MDR)

    // LED outputs
    output wire [15:0] LEDR,        // LEDR[7:0]: MDR_to_A[7:0] (MDA output)
                                    // LEDR[15:8]: MDR_to_M[7:0] (MDM output)
    output wire [7:0] LEDG          // LEDG[0]: MMD signal status
                                    // LEDG[1]: SMD signal status
                                    // LEDG[2]: MDM signal status
                                    // LEDG[3]: MDA signal status
                                    // LEDG[7:4]: unused
);

    // =========================
    // Internal signals
    // =========================

    // Clock signal
    wire clk;

    // Clear signal
    wire clr;

    // Control signals
    wire mmd;
    wire smd;
    wire mdm;
    wire mda;

    // Bus signals (16-bit with upper 8-bit tied to 0)
    wire [15:0] s_bus;
    wire [15:0] m_bus;

    // MDR outputs
    wire [15:0] mdr_to_a;
    wire [15:0] mdr_to_m;
    wire [15:0] mdr_q;

    // =========================
    // Clock signal generation
    // =========================
    // KEY[0] is 0 when pressed, 1 when released, so invert for use
    assign clk = ~KEY[0];

    // =========================
    // Clear signal
    // =========================
    // KEY[1] is 0 when pressed, 1 when released
    // MDR.CLR is active low (CLR=0 means clear active)
    // When KEY[1] is pressed (0), we want clear active (CLR=0)
    // So pass KEY[1] directly
    assign clr = KEY[1];

    // =========================
    // Control signals
    // =========================
    // Negative logic: invert SW inputs
    assign mmd = ~SW[16];  // M-bus to MDR
    assign smd = ~SW[17];  // S-bus to MDR

    // KEY signals: pressed (0) means active (1)
    assign mdm = ~KEY[2];  // MDR to M-bus
    assign mda = ~KEY[3];  // MDR to A-bus

    // =========================
    // Bus assignment (8-bit lower, upper 8-bit = 0)
    // =========================
    // Negative logic: invert SW inputs
    assign s_bus[7:0] = ~SW[7:0];
    assign s_bus[15:8] = 8'b0;

    assign m_bus[7:0] = ~SW[15:8];
    assign m_bus[15:8] = 8'b0;

    // =========================
    // MDR instance
    // =========================
    MDR u_mdr (
        .CLK(clk),
        .CLR(clr),
        .M_bus(m_bus),
        .S_bus(s_bus),
        .MMD(mmd),
        .SMD(smd),
        .MDA(mda),
        .MDM(mdm),
        .MDR_to_A(mdr_to_a),
        .MDR_to_M(mdr_to_m),
        .MDR_q(mdr_q)
    );

    // =========================
    // LED output assignment
    // =========================
    // MDA output to LEDR[7:0]
    assign LEDR[7:0] = mdr_to_a[7:0];

    // MDM output to LEDR[15:8]
    assign LEDR[15:8] = mdr_to_m[7:0];

    // Control signal status to LEDG[3:0]
    assign LEDG[0] = mmd;
    assign LEDG[1] = smd;
    assign LEDG[2] = mdm;
    assign LEDG[3] = mda;
    assign LEDG[7:4] = 4'b0;  // Unused

endmodule
