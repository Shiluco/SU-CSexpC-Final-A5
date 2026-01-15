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
// CREATED		"Thu Jan 15 19:33:24 2026"

module hexCounter(
	setZero,
	PulseIn,
	Q3out,
	Q2out,
	Q1out,
	Q0out
);


input wire	setZero;
input wire	PulseIn;
output reg	Q3out;
output wire	Q2out;
output wire	Q1out;
output wire	Q0out;

wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
reg	SYNTHESIZED_WIRE_13;
reg	SYNTHESIZED_WIRE_14;
reg	JKFF_inst1;

assign	Q2out = JKFF_inst1;
assign	Q1out = SYNTHESIZED_WIRE_14;
assign	Q0out = SYNTHESIZED_WIRE_13;
assign	SYNTHESIZED_WIRE_10 = 1;




always@(posedge PulseIn or negedge setZero or negedge SYNTHESIZED_WIRE_10)
begin
if (!setZero)
	begin
	Q3out <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_10)
	begin
	Q3out <= 1;
	end
else
	begin
	Q3out <= ~Q3out & SYNTHESIZED_WIRE_11 | Q3out & ~SYNTHESIZED_WIRE_11;
	end
	end
end


always@(posedge PulseIn or negedge setZero or negedge SYNTHESIZED_WIRE_10)
begin
if (!setZero)
	begin
	JKFF_inst1 <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_10)
	begin
	JKFF_inst1 <= 1;
	end
else
	begin
	JKFF_inst1 <= ~JKFF_inst1 & SYNTHESIZED_WIRE_12 | JKFF_inst1 & ~SYNTHESIZED_WIRE_12;
	end
	end
end


always@(posedge PulseIn or negedge setZero or negedge SYNTHESIZED_WIRE_10)
begin
if (!setZero)
	begin
	SYNTHESIZED_WIRE_14 <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_10)
	begin
	SYNTHESIZED_WIRE_14 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_14 <= ~SYNTHESIZED_WIRE_14 & SYNTHESIZED_WIRE_13 | SYNTHESIZED_WIRE_14 & ~SYNTHESIZED_WIRE_13;
	end
	end
end


always@(posedge PulseIn or negedge setZero or negedge SYNTHESIZED_WIRE_10)
begin
if (!setZero)
	begin
	SYNTHESIZED_WIRE_13 <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_10)
	begin
	SYNTHESIZED_WIRE_13 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_13 <= ~SYNTHESIZED_WIRE_13 & SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_13 & ~SYNTHESIZED_WIRE_10;
	end
	end
end


assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_13 & SYNTHESIZED_WIRE_14 & JKFF_inst1;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_14 & SYNTHESIZED_WIRE_13;


endmodule
