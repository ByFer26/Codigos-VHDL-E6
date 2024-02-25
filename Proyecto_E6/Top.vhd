library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top is
	port(
		clk: in std_logic;
		RX_01: in std_logic;
		TX_01: out std_logic;
		ADC: in std_logic_vector(7 downto 0);
		Canales: out std_logic_vector(2 downto 0);
		OE: out std_logic_vector(1 downto 0);
		OSC: out std_logic;
		pulso: out std_logic;
		EOC1: in std_logic;
		EOC2: in std_logic;
		attach: out std_logic
		);
end Top;

architecture Behavioral of Top is
--	signal c: std_logic;
	signal d: std_logic;
	signal control1: std_logic_vector(3 downto 0);
begin
	RX: entity work.RX port map(
		clk=>clk,
		RX_01=>RX_01,
		b=>d,
		control=>control1
	);
	Multiplexor: entity work.Multiplexor port map(
		clk=>clk,
		Canales=>Canales,
		OE=>OE,
		b=>d
	);
	Reloj: entity work.Reloj port map(
		clk=>clk,
		OSC=>OSC,
		b=>d
	);
	
	TX: entity work.TX port map(
		clk=>clk,
		TX_01=>TX_01,
		ADC=>ADC,
		EOC1=>EOC1,
		EOC2=>EOC2
	);
	
	Servomotor: entity work.Servomotor port map(
		clk=>clk,
		attach=>attach,
		control=>control1
	);
	
	Reloj_ADC: entity work.Reloj_ADC port map(
		clk=>clk,
		pulso=>pulso
	);

end Behavioral;

