library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
	port(
		clk: in std_logic;
		Canales: out std_logic_vector(2 downto 0);
		OE: out std_logic_vector(1 downto 0);
		OSC: out std_logic
	);
end top;

architecture Behavioral of top is

begin
	multiplexor: entity work.multiplexor port map(
		clk=>clk,
		Canales=>Canales,
		OE=>OE
	);
	
	reloj: entity work.reloj port map(
		clk=>clk,
		OSC=>OSC
	);

end Behavioral;

