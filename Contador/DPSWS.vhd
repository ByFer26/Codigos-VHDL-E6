
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DPSWS is
	port(
			DPSwitch0: in std_logic;
			DPSwitch1: in std_logic;
			a: out std_logic:='1'
			); 
end DPSWS;

architecture Behavioral of DPSWS is

begin

a<=DPSwitch0 and DPSwitch1; 
end Behavioral;

