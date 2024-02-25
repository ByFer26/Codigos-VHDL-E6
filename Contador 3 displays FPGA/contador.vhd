
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador is
	port(
			clk: in std_logic;
			display: out std_logic_vector(7 downto 0);
			enable: out std_logic_vector(2 downto 0)
			); 
			
end contador;

architecture Behavioral of contador is
		signal delay_mux: integer range 0 to 35999:=0;
		signal delay_cambio: integer range 0 to 11999999:=0;
		signal unidades: integer range 0 to 10:=0;
		signal decenas: integer range 0 to 10:=0;
		signal centenas: integer range 0 to 10:=0;
begin
	process(clk)
		begin
				if(rising_edge(clk))then
					if(delay_cambio=11999999)then
						unidades<=unidades+1;
						delay_cambio<=0;
						if(unidades=9)then
							unidades<=0;
							decenas<=decenas+1;
						end if;
						if(decenas=9)then
							decenas<=0;
							centenas<=centenas+1;
						end if;
						if(centenas=9)then
						centenas<=0;
						end if;
						
						enable<="101";
					else
						delay_cambio<=delay_cambio+1;
						
					end if;
					
					if(delay_mux=0)then
						enable<="110";
						case unidades is
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
						end if;
					if(delay_mux=11999)then
						enable<="101";
						case decenas is
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
					end if;
					if(delay_mux=23999)then
						enable<="011";
						case centenas is
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
					end if;
					if(delay_mux=35999)then
						delay_mux<=0;
					else
						delay_mux<=delay_mux+1;
					end if;
 
				end if;
	end process;	
end Behavioral;

