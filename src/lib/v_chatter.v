// CHATTER (VHDL) -> Verilog
// - 50,000 clocks = 1ms (assuming 50MHz clock)
// - Every 1ms: shift in SW into 4-bit CHATT
// - Output SSW = OR-reduction of CHATT
// Notes:
// - VHDL integer range 0..49999 is modeled as a 16-bit reg here.
// - CHATT has no reset in the original, so it powers up as X/unknown in simulation.

module v_chatter (
    input  wire clock,
    input  wire SW,
    output wire SSW
);

    reg [3:0]  CHATT;
    reg [15:0] CNT1ms;   // enough to count up to 49999

    always @(posedge clock) begin
        if (CNT1ms == 16'd49999) begin
            CNT1ms <= 16'd0;
            CHATT  <= {CHATT[2:0], SW};
        end else begin
            CNT1ms <= CNT1ms + 16'd1;
        end
    end

    assign SSW = |CHATT; // OR-reduction (CHATT[3] | CHATT[2] | CHATT[1] | CHATT[0])

endmodule
