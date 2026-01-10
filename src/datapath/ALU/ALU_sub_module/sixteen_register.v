// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 Patches 1.02i SJ Lite Edition"
// CREATED		"Sat Jan 10 20:21:49 2026"

module sixteen_register(
	R_W,
	D0,
	D1,
	D13,
	D12,
	D11,
	D10,
	D9,
	D8,
	D7,
	D6,
	D5,
	D3,
	D2,
	D15,
	D14,
	Ea,
	CLK,
	CLR,
	D4,
	Q9,
	Q15,
	Qa15,
	Q14,
	Qa14,
	Q13,
	Qa13,
	Q12,
	Qa12,
	Q11,
	Qa11,
	Q10,
	Qa10,
	Qa9,
	Q8,
	Qa8,
	Q7,
	Qa7,
	Q6,
	Qa6,
	Q5,
	Qa5,
	Q4,
	Qa4,
	Q3,
	Qa3,
	Q2,
	Qa2,
	Q1,
	Qa1,
	Q0,
	Qa0
);


input wire	R_W;
input wire	D0;
input wire	D1;
input wire	D13;
input wire	D12;
input wire	D11;
input wire	D10;
input wire	D9;
input wire	D8;
input wire	D7;
input wire	D6;
input wire	D5;
input wire	D3;
input wire	D2;
input wire	D15;
input wire	D14;
input wire	Ea;
input wire	CLK;
input wire	CLR;
input wire	D4;
output wire	Q9;
output wire	Q15;
output wire	Qa15;
output wire	Q14;
output wire	Qa14;
output wire	Q13;
output wire	Qa13;
output wire	Q12;
output wire	Qa12;
output wire	Q11;
output wire	Qa11;
output wire	Q10;
output wire	Qa10;
output wire	Qa9;
output wire	Q8;
output wire	Qa8;
output wire	Q7;
output wire	Qa7;
output wire	Q6;
output wire	Qa6;
output wire	Q5;
output wire	Qa5;
output wire	Q4;
output wire	Qa4;
output wire	Q3;
output wire	Qa3;
output wire	Q2;
output wire	Qa2;
output wire	Q1;
output wire	Qa1;
output wire	Q0;
output wire	Qa0;

wire	[15:0] input;
reg	[15:0] output;
wire	[0:15] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;

assign	SYNTHESIZED_WIRE_0 = 1;



assign	Qa15 = output[15] & Ea;


always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[0])
begin
if (!CLR)
	begin
	output[15] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[0])
	begin
	output[15] <= 1;
	end
else
	begin
	output[15] <= input[15];
	end
end

always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[1])
begin
if (!CLR)
	begin
	output[14] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[1])
	begin
	output[14] <= 1;
	end
else
	begin
	output[14] <= input[14];
	end
end

always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[2])
begin
if (!CLR)
	begin
	output[13] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[2])
	begin
	output[13] <= 1;
	end
else
	begin
	output[13] <= input[13];
	end
end

always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[3])
begin
if (!CLR)
	begin
	output[12] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[3])
	begin
	output[12] <= 1;
	end
else
	begin
	output[12] <= input[12];
	end
end

always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[4])
begin
if (!CLR)
	begin
	output[11] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[4])
	begin
	output[11] <= 1;
	end
else
	begin
	output[11] <= input[11];
	end
end

always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[5])
begin
if (!CLR)
	begin
	output[10] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[5])
	begin
	output[10] <= 1;
	end
else
	begin
	output[10] <= input[10];
	end
end

always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[6])
begin
if (!CLR)
	begin
	output[9] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[6])
	begin
	output[9] <= 1;
	end
else
	begin
	output[9] <= input[9];
	end
end

always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[7])
begin
if (!CLR)
	begin
	output[8] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[7])
	begin
	output[8] <= 1;
	end
else
	begin
	output[8] <= input[8];
	end
end

always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[8])
begin
if (!CLR)
	begin
	output[7] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[8])
	begin
	output[7] <= 1;
	end
else
	begin
	output[7] <= input[7];
	end
end

always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[9])
begin
if (!CLR)
	begin
	output[6] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[9])
	begin
	output[6] <= 1;
	end
else
	begin
	output[6] <= input[6];
	end
end

always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[10])
begin
if (!CLR)
	begin
	output[5] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[10])
	begin
	output[5] <= 1;
	end
else
	begin
	output[5] <= input[5];
	end
end

always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[11])
begin
if (!CLR)
	begin
	output[4] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[11])
	begin
	output[4] <= 1;
	end
else
	begin
	output[4] <= input[4];
	end
end

always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[12])
begin
if (!CLR)
	begin
	output[3] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[12])
	begin
	output[3] <= 1;
	end
else
	begin
	output[3] <= input[3];
	end
end

always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[13])
begin
if (!CLR)
	begin
	output[2] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[13])
	begin
	output[2] <= 1;
	end
else
	begin
	output[2] <= input[2];
	end
end

always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[14])
begin
if (!CLR)
	begin
	output[1] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[14])
	begin
	output[1] <= 1;
	end
else
	begin
	output[1] <= input[1];
	end
end

always@(posedge CLK or negedge CLR or negedge SYNTHESIZED_WIRE_0[15])
begin
if (!CLR)
	begin
	output[0] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_0[15])
	begin
	output[0] <= 1;
	end
else
	begin
	output[0] <= input[0];
	end
end


assign	SYNTHESIZED_WIRE_1 = R_W & output[13];

assign	input[13] = SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_48 =  ~R_W;

assign	SYNTHESIZED_WIRE_5 = D12 & SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_4 = R_W & output[12];

assign	input[12] = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_3 =  ~R_W;

assign	SYNTHESIZED_WIRE_8 = D11 & SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_7 = R_W & output[11];

assign	input[11] = SYNTHESIZED_WIRE_7 | SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_6 =  ~R_W;

assign	SYNTHESIZED_WIRE_11 = D10 & SYNTHESIZED_WIRE_9;

assign	SYNTHESIZED_WIRE_10 = R_W & output[10];

assign	input[10] = SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_11;

assign	SYNTHESIZED_WIRE_9 =  ~R_W;

assign	SYNTHESIZED_WIRE_14 = D9 & SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_13 = R_W & output[9];

assign	input[9] = SYNTHESIZED_WIRE_13 | SYNTHESIZED_WIRE_14;

assign	SYNTHESIZED_WIRE_40 = D15 & SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_12 =  ~R_W;

assign	SYNTHESIZED_WIRE_18 = D8 & SYNTHESIZED_WIRE_16;

assign	SYNTHESIZED_WIRE_17 = R_W & output[8];

assign	input[8] = SYNTHESIZED_WIRE_17 | SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_16 =  ~R_W;

assign	SYNTHESIZED_WIRE_21 = D7 & SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_20 = R_W & output[7];

assign	input[7] = SYNTHESIZED_WIRE_20 | SYNTHESIZED_WIRE_21;

assign	SYNTHESIZED_WIRE_19 =  ~R_W;

assign	SYNTHESIZED_WIRE_25 = D6 & SYNTHESIZED_WIRE_22;

assign	SYNTHESIZED_WIRE_47 = D14 & SYNTHESIZED_WIRE_23;

assign	SYNTHESIZED_WIRE_24 = R_W & output[6];

assign	input[6] = SYNTHESIZED_WIRE_24 | SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_22 =  ~R_W;

assign	SYNTHESIZED_WIRE_28 = D5 & SYNTHESIZED_WIRE_26;

assign	SYNTHESIZED_WIRE_27 = R_W & output[5];

assign	input[5] = SYNTHESIZED_WIRE_27 | SYNTHESIZED_WIRE_28;

assign	SYNTHESIZED_WIRE_26 =  ~R_W;

assign	SYNTHESIZED_WIRE_31 = D4 & SYNTHESIZED_WIRE_29;

assign	SYNTHESIZED_WIRE_30 = R_W & output[4];

assign	input[4] = SYNTHESIZED_WIRE_30 | SYNTHESIZED_WIRE_31;

assign	SYNTHESIZED_WIRE_39 = R_W & output[15];

assign	SYNTHESIZED_WIRE_29 =  ~R_W;

assign	SYNTHESIZED_WIRE_34 = D3 & SYNTHESIZED_WIRE_32;

assign	SYNTHESIZED_WIRE_33 = R_W & output[3];

assign	input[3] = SYNTHESIZED_WIRE_33 | SYNTHESIZED_WIRE_34;

assign	SYNTHESIZED_WIRE_32 =  ~R_W;

assign	SYNTHESIZED_WIRE_37 = D2 & SYNTHESIZED_WIRE_35;

assign	SYNTHESIZED_WIRE_36 = R_W & output[2];

assign	input[2] = SYNTHESIZED_WIRE_36 | SYNTHESIZED_WIRE_37;

assign	SYNTHESIZED_WIRE_35 =  ~R_W;

assign	SYNTHESIZED_WIRE_42 = D1 & SYNTHESIZED_WIRE_38;

assign	input[15] = SYNTHESIZED_WIRE_39 | SYNTHESIZED_WIRE_40;

assign	SYNTHESIZED_WIRE_41 = R_W & output[1];

assign	input[1] = SYNTHESIZED_WIRE_41 | SYNTHESIZED_WIRE_42;

assign	SYNTHESIZED_WIRE_38 =  ~R_W;

assign	SYNTHESIZED_WIRE_45 = D0 & SYNTHESIZED_WIRE_43;

assign	SYNTHESIZED_WIRE_44 = R_W & output[0];

assign	input[0] = SYNTHESIZED_WIRE_44 | SYNTHESIZED_WIRE_45;

assign	SYNTHESIZED_WIRE_43 =  ~R_W;

assign	Qa14 = output[14] & Ea;

assign	SYNTHESIZED_WIRE_15 =  ~R_W;

assign	Qa13 = output[13] & Ea;

assign	Qa12 = output[12] & Ea;

assign	Qa11 = output[11] & Ea;

assign	Qa10 = output[10] & Ea;

assign	Qa9 = output[9] & Ea;

assign	SYNTHESIZED_WIRE_46 = R_W & output[14];

assign	Qa8 = output[8] & Ea;

assign	Qa7 = output[7] & Ea;

assign	Qa2 = output[2] & Ea;

assign	Qa6 = output[6] & Ea;

assign	Qa5 = output[5] & Ea;

assign	Qa4 = output[4] & Ea;

assign	Qa3 = output[3] & Ea;

assign	Qa1 = output[1] & Ea;

assign	input[14] = SYNTHESIZED_WIRE_46 | SYNTHESIZED_WIRE_47;

assign	Qa0 = output[0] & Ea;

assign	SYNTHESIZED_WIRE_2 = D13 & SYNTHESIZED_WIRE_48;

assign	SYNTHESIZED_WIRE_23 =  ~R_W;

assign	Q9 = output[9];
assign	Q15 = output[15];
assign	Q14 = output[14];
assign	Q13 = output[13];
assign	Q12 = output[12];
assign	Q11 = output[11];
assign	Q10 = output[10];
assign	Q8 = output[8];
assign	Q7 = output[7];
assign	Q6 = output[6];
assign	Q5 = output[5];
assign	Q4 = output[4];
assign	Q3 = output[3];
assign	Q2 = output[2];
assign	Q1 = output[1];
assign	Q0 = output[0];

endmodule
