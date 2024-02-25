library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity led is
	port(
		clk:in std_logic;
		salida: out std_logic;
		a: in std_logic
	);
end led;

architecture Behavioral of led is

begin
	process(clk)
		begin
			if(rising_edge(clk))then
				if(a='1')then
					salida<='1';
				else
					salida<='0';
				end if;
			end if;
	end process;

end Behavioral;

