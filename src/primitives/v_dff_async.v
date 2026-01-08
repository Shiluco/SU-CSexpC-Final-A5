module v_dff_async (
    input  wire clk,
    input  wire pre,   // async preset (active-high)
    input  wire clr,   // async clear  (active-high)
    input  wire d,
    output reg  q
);
    always @(posedge clk or posedge pre or posedge clr) begin
        if (pre)
            q <= 1'b1;
        else if (clr)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule
