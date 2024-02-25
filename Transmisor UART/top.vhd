
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top is
		port(
				clk: in std_logic;
				entrada: in std_logic_vector(7 downto 0);
				salida: out std_logic
				); 
end top;

architecture Behavioral of top is

begin
transmisor: entity work.transmisor port map(
		clk=>clk,
		entrada=>entrada,
		salida=>salida
		);

end Behavioral;

