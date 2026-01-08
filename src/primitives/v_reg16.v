module v_reg16 (
    input  wire        CLK,
    input  wire        CLR,
    input  wire        R_W,
    input  wire        Ea,
    input  wire [15:0] D,
    output wire [15:0] Q,
    output wire [15:0] Qa
);
    reg [15:0] q;

    always @(posedge CLK or negedge CLR) begin
        if (!CLR)        q <= 16'b0;
        else q <= ( {16{~R_W}} & D ) | ( {16{R_W}} & q );
    end
	 
    assign Q  = q;
    assign Qa = {16{Ea}} & q;
endmodule
