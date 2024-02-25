library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity led_test is
	port(
		clk: in std_logic;
		salida1: out std_logic;
		salida2: out std_logic;
		a: in std_logic;
		b: in std_logic
	);
end led_test;

architecture Behavioral of led_test is

begin
	process(clk)
		begin
			if(rising_edge(clk))then
				if(a='1')then
					salida1<='1';
				end if;
				if(a='0')then
					salida1<='0';
				end if;
				if(b='1')then
					salida2<='1';
				end if;
				if(b='0')then
					salida2<='0';
				end if;
			end if;
	end process;

end Behavioral;

