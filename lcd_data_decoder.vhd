LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all;

ENTITY lcd_data_decoder IS
--GENERIC ( n : INTEGER := 16 ) ;
PORT(R0, R1, R2, R3, R4, R5, R6, R7 : IN STD_LOGIC_VECTOR(15 DOWNTO 0) ;
		iCLK, iReset_N, iDone : IN STD_LOGIC ;
		oDATA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		oRS, oStart, oCLK, oReset_N : OUT STD_LOGIC
		);
END lcd_data_decoder;

ARCHITECTURE RTL OF lcd_data_decoder IS

SIGNAL LUT_INDEX: INTEGER RANGE 0 TO 63;
SIGNAL LUT_DATA: STD_LOGIC_VECTOR (8 DOWNTO 0);
SIGNAL mLCD_ST: STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL mDLY: INTEGER RANGE 0 TO 262143;
SIGNAL mLCD_Start: STD_LOGIC;
SIGNAL mLCD_DATA: STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL mLCD_RS: STD_LOGIC;
SIGNAL mLCD_Done: STD_LOGIC;

SIGNAL DC_Flag: STD_LOGIC;
SIGNAL COUNT: STD_LOGIC_VECTOR (4 DOWNTO 0);
SIGNAL SR: STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL SB: STD_LOGIC_VECTOR (1 DOWNTO 0);
SIGNAL QR: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL DB: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL CH: STD_LOGIC_VECTOR (7 DOWNTO 0);

CONSTANT LCD_INTIAL: INTEGER RANGE 0 TO 63 := 0;
CONSTANT LCD_LINE1:  INTEGER RANGE 0 TO 63 := 5;
CONSTANT LCD_CH_LINE:  INTEGER RANGE 0 TO 63 := 21;
CONSTANT LCD_LINE2:  INTEGER RANGE 0 TO 63 := 22;
CONSTANT LUT_SIZE:  INTEGER RANGE 0 TO 63 := 38;

BEGIN

	mLCD_Done <= iDone;
	
	process(iCLK,iReset_N)
	begin
	
	if(iReset_N = '0')then
			LUT_INDEX <= 0;
			mLCD_ST <= "000";
			mDLY		<=	0;
			mLCD_Start	<=	'0';
			mLCD_DATA	<=	"00000000";
			mLCD_RS		<=	'0';
			
	elsif(iCLK'event and iCLK = '1')then
	
			case LUT_INDEX is
			--Initialization
			when LCD_INTIAL+0 => LUT_DATA <= '0'&X"38";
										DC_Flag <= '0';
			when LCD_INTIAL+1 => LUT_DATA <= '0'&X"0C";
										DC_Flag <= '0';
			when LCD_INTIAL+2 => LUT_DATA <= '0'&X"01";
										DC_Flag <= '0';
			when LCD_INTIAL+3 => LUT_DATA <= '0'&X"06";
										DC_Flag <= '0';
			when LCD_INTIAL+4 => LUT_DATA <= '0'&X"80";
										DC_Flag <= '0';
			--Line 1
			when LCD_LINE1+0 => 	COUNT <= "00000"; --0
										DC_Flag <= '1';
			when LCD_LINE1+1 => 	COUNT <= "00001"; --1
										DC_Flag <= '1';
			when LCD_LINE1+2 => 	COUNT <= "00010"; --2
										DC_Flag <= '1';
			when LCD_LINE1+3 => 	COUNT <= "00011"; --3
										DC_Flag <= '1';
			when LCD_LINE1+4 => 	COUNT <= "00100"; --4
										DC_Flag <= '1';
			when LCD_LINE1+5 => 	COUNT <= "00101"; --5
										DC_Flag <= '1';
			when LCD_LINE1+6 => 	COUNT <= "00110"; --6
										DC_Flag <= '1';
			when LCD_LINE1+7 => 	COUNT <= "00111"; --7
										DC_Flag <= '1';
			when LCD_LINE1+8 => 	COUNT <= "01000"; --8
										DC_Flag <= '1';
			when LCD_LINE1+9 => 	COUNT <= "01001"; --9
										DC_Flag <= '1';
			when LCD_LINE1+10 => 	COUNT <= "01010"; --10
										DC_Flag <= '1';
			when LCD_LINE1+11 => 	COUNT <= "01011"; --11
										DC_Flag <= '1';
			when LCD_LINE1+12 => 	COUNT <= "01100"; --12
										DC_Flag <= '1';
			when LCD_LINE1+13 => 	COUNT <= "01101"; --13
										DC_Flag <= '1';
			when LCD_LINE1+14 => 	COUNT <= "01110"; --14
										DC_Flag <= '1';
			when LCD_LINE1+15 => 	COUNT <= "01111"; --15
										DC_Flag <= '1';
			--Change Line
			when LCD_CH_LINE => LUT_DATA <= '0'&X"C0";
										DC_Flag <= '0';
			--Line2
			when LCD_LINE2+0 => 	COUNT <= "10000"; --16
										DC_Flag <= '1';
			when LCD_LINE2+1 => 	COUNT <= "10001"; --17
										DC_Flag <= '1';
			when LCD_LINE2+2 => 	COUNT <= "10010"; --18
										DC_Flag <= '1';
			when LCD_LINE2+3 => 	COUNT <= "10011"; --19
										DC_Flag <= '1';
			when LCD_LINE2+4 => 	COUNT <= "10100"; --20
										DC_Flag <= '1';
			when LCD_LINE2+5 => 	COUNT <= "10101"; --21
										DC_Flag <= '1';
			when LCD_LINE2+6 => 	COUNT <= "10110"; --22
										DC_Flag <= '1';
			when LCD_LINE2+7 => 	COUNT <= "10111"; --23
										DC_Flag <= '1';
			when LCD_LINE2+8 => 	COUNT <= "11000"; --24
										DC_Flag <= '1';
			when LCD_LINE2+9 => 	COUNT <= "11001"; --25
										DC_Flag <= '1';
			when LCD_LINE2+10 => COUNT <= "11010"; --26
										DC_Flag <= '1';
			when LCD_LINE2+11 => COUNT <= "11011"; --27
										DC_Flag <= '1';
			when LCD_LINE2+12 => COUNT <= "11100"; --28
										DC_Flag <= '1';
			when LCD_LINE2+13 => COUNT <= "11101"; --29
										DC_Flag <= '1';
			when LCD_LINE2+14 => COUNT <= "11110"; --30
										DC_Flag <= '1';
			when LCD_LINE2+15 => COUNT <= "11111"; --31
										DC_Flag <= '1';
			when others => LUT_DATA <= '1'&X"20";
								DC_Flag <= '0';
		end case;
			
		if(DC_Flag = '1')then
			SR <= COUNT(4 downto 2);
			SB <= COUNT(1 downto 0);

			case SR is
				when "000" => QR <= R0;
				when "001" => QR <= R1;
				when "010" => QR <= R2;
				when "011" => QR <= R3;
				when "100" => QR <= R4;
				when "101" => QR <= R5;
				when "110" => QR <= R6;
				when "111" => QR <= R7;
			end case;
								
			case SB is
				when "00" => DB <= QR(15 downto 12);
				when "01" => DB <= QR(11 downto 8);
				when "10" => DB <= QR(7 downto 4);
				when "11" => DB <= QR(3 downto 0);
			end case;
							
			case DB is
				when "0000" => CH <= X"30";
				when "0001" => CH <= X"31";
				when "0010" => CH <= X"32";
				when "0011" => CH <= X"33";
				when "0100" => CH <= X"34";
				when "0101" => CH <= X"35";
				when "0110" => CH <= X"36";
				when "0111" => CH <= X"37";
				when "1000" => CH <= X"38";
				when "1001" => CH <= X"39";
				when "1010" => CH <= X"41";
				when "1011" => CH <= X"42";
				when "1100" => CH <= X"43";
				when "1101" => CH <= X"44";
				when "1110" => CH <= X"45";
				when "1111" => CH <= X"46";
			end case;
			LUT_DATA <= '1'&CH;
		end if;
	
		case mLCD_ST is
			when "000" => 
				mLCD_DATA	<=	LUT_DATA(7 DOWNTO 0);
				mLCD_RS		<=	LUT_DATA(8);
				mLCD_Start	<=	'1';
				mLCD_ST		<=	"001";
			when "001" =>
				if(mLCD_Done = '1')then
					mLCD_Start	<=	'0';
					mLCD_ST		<=	"010";
				end if;
			when "010" =>
				if(mDLY = 250000)then	--before262143
					mDLY <= 0;
					mLCD_ST <= "011";
				else
					mDLY <= mDLY + 1;
				end if;
			when "011" =>
				if(LUT_INDEX = LUT_SIZE+1)then
					LUT_INDEX <= 4;
				else
					LUT_INDEX <= LUT_INDEX + 1;
				end if;
				mLCD_ST <= "000";
			when others =>
				mLCD_ST <= "000";
		end case;				
	end if;

	end process;

		oCLK <= iCLK;
		oReset_N <= iReset_N;
		oDATA <= mLCD_DATA;
		oRS <= mLCD_RS;
		oStart <= mLCD_Start;
		
END RTL;