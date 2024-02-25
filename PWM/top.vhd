library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
	port(
			clk: in std_logic;
			attach: out std_logic;
			control: in std_logic_vector(3 downto 0)
			);			
end top;

architecture Behavioral of top is

begin
servo: entity work.servo port map(
			clk=>clk,
			attach=>attach,
			control=>control
			);

end Behavioral;

