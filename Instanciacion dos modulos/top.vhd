library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
	generic(
		clk:  std_logic;
		boton: in std_logic;
		salida: out std_logic	
		
	);
	
end top;

architecture Behavioral of top is
	--signal a: std_logic;
	signal b: std_logic;
begin
	switch: entity work.switch port map(
		clk=>clk,
		boton=>boton,
		a=>b
	);
	
	led: entity work.led port map(
		clk=>clk,
		salida=>salida,
		a=>b
	);

end Behavioral;

