
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
	port(
		clk: in std_logic;
		pulsador: in std_logic;
		mayor:out std_logic_vector(7 downto 0):="00000000"
	);
end top;

architecture Behavioral of top is

begin
	ordenar: entity work.ordenar port map(
		clk=>clk,
		pulsador=>pulsador,
		mayor=>mayor
	);

end Behavioral;

