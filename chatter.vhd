library ieee;
use ieee.std_logic_1164.all;

entity CHATTER is
	port(	SSW:			out 	std_logic;
			clock, SW:	in	std_logic);
end CHATTER;

architecture RTL of CHATTER is
	signal CHATT:	std_logic_vector(3 downto 0);
	signal CNT1ms:	integer range 0 to (50000-1);
begin
process (clock)
begin
	if(clock'event and clock='1') then
		if(CNT1ms = (50000-1)) then  -- 1m sec
			CNT1ms <=0;
			CHATT <= CHATT(2 downto 0) & SW;
		else
			CNT1ms <= CNT1ms+1;
		end if;
	end if;
end process;

SSW <= CHATT(3) or CHATT(2) or CHATT(1) or CHATT(0);

end RTL;
			