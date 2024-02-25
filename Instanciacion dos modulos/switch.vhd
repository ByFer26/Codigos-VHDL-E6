library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity switch is
	port(
		clk: in std_logic;
		boton: in std_logic;
		a: out std_logic
	);
end switch;

architecture Behavioral of switch is

begin
	process(clk)
		begin
			if(rising_edge(clk))then 
				if(boton='0')then
					a<='1';
				else
					a<='0';
				end if;
			end if;
	end process;
end Behavioral

