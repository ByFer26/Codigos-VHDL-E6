library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
	port(
			clk: in std_logic;
			salida: out std_logic_vector(7 downto 0);
			entrada: in std_logic_vector(7 downto 0)
			);
end top;

architecture Behavioral of top is

begin
entradas: entity work.entradas port map(
	clk=>clk,
	entrada=>entrada,
	salida=>salida
	);

end Behavioral;

