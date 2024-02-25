
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity transmisor is
		port(
				clk: in std_logic;
				entrada: in std_logic_vector(7 downto 0);
				salida: out std_logic
				); 
end transmisor;

architecture Behavioral of transmisor is
			signal delay_cambio: integer range 0 to 11999999:=0;
			signal estado: integer range 0 to 99999:=0;
			signal ciclo: integer range 0 to 12:=0;

begin
	process(clk)
		begin
			if(rising_edge(clk))then
				if(delay_cambio=1249)then
				delay_cambio<=0;
				estado<=estado+1;
				if(estado=4799)then
					ciclo<=ciclo+1;
					estado<=0;
				end if;
				if(ciclo=12)then
					ciclo<=0;
				end if;
				else
					delay_cambio<=delay_cambio+1;
				end if;

				case estado is
					when 0=>salida<='1';
					when 4320=>salida<='0';
					when 4321=>salida<=entrada(0);
					when 4322=>salida<=entrada(1);
					when 4323=>salida<=entrada(2);
					when 4324=>salida<=entrada(3);
					when 4325=>salida<=entrada(4);
					when 4326=>salida<=entrada(5);
					when 4327=>salida<=entrada(6);
					when 4328=>salida<=entrada(7);
					when others=>salida<='1';
				end case;
			end if;
		end process;
end Behavioral;

