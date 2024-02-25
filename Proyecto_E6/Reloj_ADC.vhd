library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reloj_ADC is
	port(
		clk: in std_logic;
		pulso: out std_logic
	);
end Reloj_ADC;

architecture Behavioral of Reloj_ADC is
	signal cambio: integer range 0 to 11999999:=0;
	signal estado: integer range 0 to 1:=0;
begin
	process(clk)
		begin
			if(rising_edge(clk))then
				if(cambio=47)then
					cambio<=0;
					estado<=estado+1;
					if(estado=1)then
						estado<=0;
					end if;
				else
					cambio<=cambio+1;
				end if;
				case estado is
					when 0=>pulso<='0';
					when 1=>pulso<='1';
					when others=>null;
				end case;
		end if;
	end process;
end Behavioral;

