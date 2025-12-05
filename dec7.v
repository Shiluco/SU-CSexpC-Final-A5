//7segment LED decoder (RTL)

module DEC7(DECIN, HEX);
input [3:0] DECIN;
output [6:0] HEX;

reg [6:0] led7_tmp;
wire [3:0] decin_tmp;

assign decin_tmp = DECIN; //If input is negative, invert here.

always @(decin_tmp)
begin
	case (decin_tmp)	//ABCDEFG
		4'h0:led7_tmp <= 7'b0111111;
		4'h1:led7_tmp <= 7'b0000110;
		4'h2:led7_tmp <= 7'b1011011;
		4'h3:led7_tmp <= 7'b1001111;
		4'h4:led7_tmp <= 7'b1100110;
		4'h5:led7_tmp <= 7'b1101101;
		4'h6:led7_tmp <= 7'b1111101;
		4'h7:led7_tmp <= 7'b0100111;
		4'h8:led7_tmp <= 7'b1111111;
		4'h9:led7_tmp <= 7'b1101111;
		4'hA:led7_tmp <= 7'b1110111;
		4'hB:led7_tmp <= 7'b1111100;
		4'hC:led7_tmp <= 7'b0111001;
		4'hD:led7_tmp <= 7'b1011110;
		4'hE:led7_tmp <= 7'b1111001;
		4'hF:led7_tmp <= 7'b1110001;
	default:led7_tmp <= 7'bxxxxxxx;
	endcase
end

assign HEX = ~led7_tmp; //If output is negative, invert here.

endmodule