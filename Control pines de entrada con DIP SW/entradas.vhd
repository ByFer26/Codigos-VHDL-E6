
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity entradas is
	port(
			clk: in std_logic;
			salida: out std_logic_vector(7 downto 0);
			entrada: in std_logic_vector(7 downto 0)
			);
end entradas;

architecture Behavioral of entradas is
	signal delay_cambio: integer range 0 to 11999999:=0;
begin
	process(clk)
		begin
			if(rising_edge(clk))then
				if(delay_cambio=1249)then
					delay_cambio<=0;
					salida<=entrada;
				else
					delay_cambio<=delay_cambio+1;
				end if;
			end if;
	end process;


end Behavioral;

