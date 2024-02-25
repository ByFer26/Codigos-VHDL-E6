library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Top is
		port(
				clk: in std_logic;
				display: out std_logic_vector(7 downto 0);
				enable: out std_logic_vector(2 downto 0)
				);
end Top;

architecture Behavioral of Top is

begin
		contador: entity work.contador port map(
			clk=>clk,
			display=>display,
			enable=>enable
			); 
			
end Behavioral;

