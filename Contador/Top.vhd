
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Top is
	port(
			clk: in std_logic;
			display: out std_logic_vector(7 downto 0);
			enable: out std_logic_vector(2 downto 0);
			DPSwitch0: in std_logic;
			DPSwitch1: in std_logic
			); 
			
end Top;

architecture Behavioral of Top is
	signal a: std_logic;
	signal b: std_logic;
begin
contador09: entity work.contador09 port map(
	clk=>clk,
	enable=>enable,
	display=>display,
	a=>b
	);
	
DPSWS: entity work.DPSWS port map(
	DPSwitch0=>DPSwitch0,
	DPSwitch1=>DPSwitch1,
	a=>b
	); 
end Behavioral;

