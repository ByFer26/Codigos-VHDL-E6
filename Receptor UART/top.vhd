----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:12:20 03/24/2023 
-- Design Name: 
-- Module Name:    top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
	port(
			clk: in std_logic;
			RX_01: in std_logic;
		   salida1: out std_logic;
		   salida2: out std_logic	
	);
end top;

architecture Behavioral of top is
	signal c: std_logic;
	signal d: std_logic;
begin
	RX: entity work.RX port map(
		clk=>clk,
		RX_01=>RX_01,
		a=>c,
		b=>d
	);

	led_test: entity work.led_test port map(
		clk=>clk,
		salida1=>salida1,
		salida2=>salida2,
		a=>c,
		b=>d
	);
end Behavioral;

