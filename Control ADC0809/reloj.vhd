library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reloj is
	port(
		clk: in std_logic;
		OSC: out std_logic
	);
end reloj;

architecture Behavioral of reloj is
	signal cambio: integer range 0 to 11999999:=0;
	signal ciclo: integer range 0 to 1:=0;
begin
	process(clk)
		begin
			if(rising_edge(clk))then
				if(cambio=2999999)then
					cambio<=0;
					ciclo<=ciclo+1;
					if(ciclo=1)then
						ciclo<=0;
					end if;
				else
					cambio<=cambio+1;
				end if;
				case ciclo is
					when 0=>OSC<='0';
					when 1=>OSC<='1';
				end case;
			end if;
	end process;
end Behavioral;

