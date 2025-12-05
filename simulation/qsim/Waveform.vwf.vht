-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "10/16/2020 09:20:15"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          reg16_pc_interface
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY reg16_pc_interface_vhd_vec_tst IS
END reg16_pc_interface_vhd_vec_tst;
ARCHITECTURE reg16_pc_interface_arch OF reg16_pc_interface_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL GPIO : STD_LOGIC_VECTOR(35 DOWNTO 0);
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX6 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX7 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL LCD_BLON : STD_LOGIC;
SIGNAL LCD_DATA : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL LCD_EN : STD_LOGIC;
SIGNAL LCD_ON : STD_LOGIC;
SIGNAL LCD_RS : STD_LOGIC;
SIGNAL LCD_RW : STD_LOGIC;
SIGNAL LEDG : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL LEDR : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL SW : STD_LOGIC_VECTOR(17 DOWNTO 0);
COMPONENT reg16_pc_interface
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	GPIO : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX6 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX7 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	LCD_BLON : OUT STD_LOGIC;
	LCD_DATA : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	LCD_EN : OUT STD_LOGIC;
	LCD_ON : OUT STD_LOGIC;
	LCD_RS : OUT STD_LOGIC;
	LCD_RW : OUT STD_LOGIC;
	LEDG : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	LEDR : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : reg16_pc_interface
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	GPIO => GPIO,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	HEX5 => HEX5,
	HEX6 => HEX6,
	HEX7 => HEX7,
	KEY => KEY,
	LCD_BLON => LCD_BLON,
	LCD_DATA => LCD_DATA,
	LCD_EN => LCD_EN,
	LCD_ON => LCD_ON,
	LCD_RS => LCD_RS,
	LCD_RW => LCD_RW,
	LEDG => LEDG,
	LEDR => LEDR,
	SW => SW
	);

-- CLOCK_50
t_prcs_CLOCK_50: PROCESS
BEGIN
LOOP
	CLOCK_50 <= '0';
	WAIT FOR 10000 ps;
	CLOCK_50 <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLOCK_50;
-- GPIO[35]
t_prcs_GPIO_35: PROCESS
BEGIN
	GPIO(35) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_35;
-- GPIO[34]
t_prcs_GPIO_34: PROCESS
BEGIN
	GPIO(34) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_34;
-- GPIO[33]
t_prcs_GPIO_33: PROCESS
BEGIN
	GPIO(33) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_33;
-- GPIO[32]
t_prcs_GPIO_32: PROCESS
BEGIN
	GPIO(32) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_32;
-- GPIO[31]
t_prcs_GPIO_31: PROCESS
BEGIN
	GPIO(31) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_31;
-- GPIO[30]
t_prcs_GPIO_30: PROCESS
BEGIN
	GPIO(30) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_30;
-- GPIO[29]
t_prcs_GPIO_29: PROCESS
BEGIN
	GPIO(29) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_29;
-- GPIO[28]
t_prcs_GPIO_28: PROCESS
BEGIN
	GPIO(28) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_28;
-- GPIO[27]
t_prcs_GPIO_27: PROCESS
BEGIN
	GPIO(27) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_27;
-- GPIO[26]
t_prcs_GPIO_26: PROCESS
BEGIN
	GPIO(26) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_26;
-- GPIO[25]
t_prcs_GPIO_25: PROCESS
BEGIN
	GPIO(25) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_25;
-- GPIO[24]
t_prcs_GPIO_24: PROCESS
BEGIN
	GPIO(24) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_24;
-- GPIO[23]
t_prcs_GPIO_23: PROCESS
BEGIN
	GPIO(23) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_23;
-- GPIO[22]
t_prcs_GPIO_22: PROCESS
BEGIN
	GPIO(22) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_22;
-- GPIO[21]
t_prcs_GPIO_21: PROCESS
BEGIN
	GPIO(21) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_21;
-- GPIO[20]
t_prcs_GPIO_20: PROCESS
BEGIN
	GPIO(20) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_20;
-- GPIO[19]
t_prcs_GPIO_19: PROCESS
BEGIN
	GPIO(19) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_19;
-- GPIO[18]
t_prcs_GPIO_18: PROCESS
BEGIN
	GPIO(18) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_18;
-- GPIO[17]
t_prcs_GPIO_17: PROCESS
BEGIN
	GPIO(17) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_17;
-- GPIO[16]
t_prcs_GPIO_16: PROCESS
BEGIN
	GPIO(16) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_16;
-- GPIO[15]
t_prcs_GPIO_15: PROCESS
BEGIN
	GPIO(15) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_15;
-- GPIO[14]
t_prcs_GPIO_14: PROCESS
BEGIN
	GPIO(14) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_14;
-- GPIO[13]
t_prcs_GPIO_13: PROCESS
BEGIN
	GPIO(13) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_13;
-- GPIO[12]
t_prcs_GPIO_12: PROCESS
BEGIN
	GPIO(12) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_12;
-- GPIO[11]
t_prcs_GPIO_11: PROCESS
BEGIN
	GPIO(11) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_11;
-- GPIO[10]
t_prcs_GPIO_10: PROCESS
BEGIN
	GPIO(10) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_10;
-- GPIO[9]
t_prcs_GPIO_9: PROCESS
BEGIN
	GPIO(9) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_9;
-- GPIO[8]
t_prcs_GPIO_8: PROCESS
BEGIN
	GPIO(8) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_8;
-- GPIO[7]
t_prcs_GPIO_7: PROCESS
BEGIN
	GPIO(7) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_7;
-- GPIO[6]
t_prcs_GPIO_6: PROCESS
BEGIN
	GPIO(6) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_6;
-- GPIO[5]
t_prcs_GPIO_5: PROCESS
BEGIN
	GPIO(5) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_5;
-- GPIO[4]
t_prcs_GPIO_4: PROCESS
BEGIN
	GPIO(4) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_4;
-- GPIO[3]
t_prcs_GPIO_3: PROCESS
BEGIN
	GPIO(3) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_3;
-- GPIO[2]
t_prcs_GPIO_2: PROCESS
BEGIN
	GPIO(2) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_2;
-- GPIO[1]
t_prcs_GPIO_1: PROCESS
BEGIN
	GPIO(1) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_1;
-- GPIO[0]
t_prcs_GPIO_0: PROCESS
BEGIN
	GPIO(0) <= 'Z';
WAIT;
END PROCESS t_prcs_GPIO_0;
-- KEY[3]
t_prcs_KEY_3: PROCESS
BEGIN
	KEY(3) <= '1';
WAIT;
END PROCESS t_prcs_KEY_3;
-- KEY[2]
t_prcs_KEY_2: PROCESS
BEGIN
	KEY(2) <= '1';
WAIT;
END PROCESS t_prcs_KEY_2;
-- KEY[1]
t_prcs_KEY_1: PROCESS
BEGIN
	KEY(1) <= '1';
WAIT;
END PROCESS t_prcs_KEY_1;
-- KEY[0]
t_prcs_KEY_0: PROCESS
BEGIN
	KEY(0) <= '1';
WAIT;
END PROCESS t_prcs_KEY_0;
-- LCD_DATA[7]
t_prcs_LCD_DATA_7: PROCESS
BEGIN
	LCD_DATA(7) <= 'Z';
WAIT;
END PROCESS t_prcs_LCD_DATA_7;
-- LCD_DATA[6]
t_prcs_LCD_DATA_6: PROCESS
BEGIN
	LCD_DATA(6) <= 'Z';
WAIT;
END PROCESS t_prcs_LCD_DATA_6;
-- LCD_DATA[5]
t_prcs_LCD_DATA_5: PROCESS
BEGIN
	LCD_DATA(5) <= 'Z';
WAIT;
END PROCESS t_prcs_LCD_DATA_5;
-- LCD_DATA[4]
t_prcs_LCD_DATA_4: PROCESS
BEGIN
	LCD_DATA(4) <= 'Z';
WAIT;
END PROCESS t_prcs_LCD_DATA_4;
-- LCD_DATA[3]
t_prcs_LCD_DATA_3: PROCESS
BEGIN
	LCD_DATA(3) <= 'Z';
WAIT;
END PROCESS t_prcs_LCD_DATA_3;
-- LCD_DATA[2]
t_prcs_LCD_DATA_2: PROCESS
BEGIN
	LCD_DATA(2) <= 'Z';
WAIT;
END PROCESS t_prcs_LCD_DATA_2;
-- LCD_DATA[1]
t_prcs_LCD_DATA_1: PROCESS
BEGIN
	LCD_DATA(1) <= 'Z';
WAIT;
END PROCESS t_prcs_LCD_DATA_1;
-- LCD_DATA[0]
t_prcs_LCD_DATA_0: PROCESS
BEGIN
	LCD_DATA(0) <= 'Z';
WAIT;
END PROCESS t_prcs_LCD_DATA_0;
-- SW[17]
t_prcs_SW_17: PROCESS
BEGIN
	SW(17) <= '0';
WAIT;
END PROCESS t_prcs_SW_17;
-- SW[16]
t_prcs_SW_16: PROCESS
BEGIN
	SW(16) <= '0';
WAIT;
END PROCESS t_prcs_SW_16;
-- SW[15]
t_prcs_SW_15: PROCESS
BEGIN
	SW(15) <= '0';
WAIT;
END PROCESS t_prcs_SW_15;
-- SW[14]
t_prcs_SW_14: PROCESS
BEGIN
	SW(14) <= '0';
WAIT;
END PROCESS t_prcs_SW_14;
-- SW[13]
t_prcs_SW_13: PROCESS
BEGIN
	SW(13) <= '0';
WAIT;
END PROCESS t_prcs_SW_13;
-- SW[12]
t_prcs_SW_12: PROCESS
BEGIN
	SW(12) <= '0';
WAIT;
END PROCESS t_prcs_SW_12;
-- SW[11]
t_prcs_SW_11: PROCESS
BEGIN
	SW(11) <= '0';
WAIT;
END PROCESS t_prcs_SW_11;
-- SW[10]
t_prcs_SW_10: PROCESS
BEGIN
	SW(10) <= '0';
WAIT;
END PROCESS t_prcs_SW_10;
-- SW[9]
t_prcs_SW_9: PROCESS
BEGIN
	SW(9) <= '0';
WAIT;
END PROCESS t_prcs_SW_9;
-- SW[8]
t_prcs_SW_8: PROCESS
BEGIN
	SW(8) <= '0';
WAIT;
END PROCESS t_prcs_SW_8;
-- SW[7]
t_prcs_SW_7: PROCESS
BEGIN
	SW(7) <= '0';
WAIT;
END PROCESS t_prcs_SW_7;
-- SW[6]
t_prcs_SW_6: PROCESS
BEGIN
	SW(6) <= '0';
WAIT;
END PROCESS t_prcs_SW_6;
-- SW[5]
t_prcs_SW_5: PROCESS
BEGIN
	SW(5) <= '0';
WAIT;
END PROCESS t_prcs_SW_5;
-- SW[4]
t_prcs_SW_4: PROCESS
BEGIN
	SW(4) <= '0';
WAIT;
END PROCESS t_prcs_SW_4;
-- SW[3]
t_prcs_SW_3: PROCESS
BEGIN
	SW(3) <= '0';
WAIT;
END PROCESS t_prcs_SW_3;
-- SW[2]
t_prcs_SW_2: PROCESS
BEGIN
	SW(2) <= '0';
WAIT;
END PROCESS t_prcs_SW_2;
-- SW[1]
t_prcs_SW_1: PROCESS
BEGIN
	SW(1) <= '0';
WAIT;
END PROCESS t_prcs_SW_1;
-- SW[0]
t_prcs_SW_0: PROCESS
BEGIN
	SW(0) <= '0';
WAIT;
END PROCESS t_prcs_SW_0;
END reg16_pc_interface_arch;
