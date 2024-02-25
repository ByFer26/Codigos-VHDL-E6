library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity contador09 is
	port(
			clk: in std_logic;
			enable: out std_logic_vector(2 downto 0);
			display: out std_logic_vector(7 downto 0);
			a: in std_logic
			);
end contador09;

architecture Behavioral of contador09 is
		signal delay_mux: integer range 0 to 119999:=0;
		signal delay_cambio: integer range 0 to 11999999:=0;
		signal contador: integer range 0 to 9:=0;
		
begin
	process(clk)
	begin
		if(rising_edge(clk))then
			if(delay_cambio=11999999)then
				contador<=contador+1;
				delay_cambio<=0;
			if(contador=9)then
				contador<=0;
			end if;
		else 
			delay_cambio<=delay_cambio+1;
		end if;
		
		case contador is
			when 0=>display<="11000000";
			when 1=>display<="11111001";
			when 2=>display<="10100100";
			when 3=>display<="10110000";
			when 4=>display<="10011001";
			when 5=>display<="10010010";
			when 6=>display<="10000011";
			when 7=>display<="11111000";
			when 8=>display<="10000000";
			when 9=>display<="10011000";
			when others=>display<="11111111";
		end case; 
		
		case a is
			when '0'=>enable<="101";
			when '1'=>enable<="011";
			when others=>enable<="111";
			
		end case; 
		end if;
	end process; 

end Behavioral;

