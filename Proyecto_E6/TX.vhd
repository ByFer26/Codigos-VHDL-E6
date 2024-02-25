library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TX is
		port(
				clk: in std_logic;
				ADC: in std_logic_vector(7 downto 0);
				TX_01: out std_logic;
				EOC1: in std_logic;
				EOC2: in std_logic
				); 
end TX;

architecture Behavioral of TX is
			signal delay_cambio: integer range 0 to 11999999:=0;
			signal estado: integer range 0 to 99999:=0;
			signal ciclo: integer range 0 to 12:=0;

begin
	process(clk)
		begin
			if(rising_edge(clk))then
				if(EOC1='0' or EOC2='0')then
					if(delay_cambio=1249)then
					delay_cambio<=0;
					estado<=estado+1;
					if(estado=4799)then
						ciclo<=ciclo+1;
						estado<=0;
					end if;
					if(ciclo=24)then
						ciclo<=0;
					end if;
					else
						delay_cambio<=delay_cambio+1;
					end if;

					case estado is
						when 0=>TX_01<='1';
						when 1=>TX_01<='0';
						when 2=>TX_01<=ADC(0);
						when 3=>TX_01<=ADC(1);
						when 4=>TX_01<=ADC(2);
						when 5=>TX_01<=ADC(3);
						when 6=>TX_01<=ADC(4);
						when 7=>TX_01<=ADC(5);
						when 8=>TX_01<=ADC(6);
						when 9=>TX_01<=ADC(7);
						when others=>TX_01<='1';
					end case;
				else
					TX_01<='1';
				end if;
			end if;
		end process;
end Behavioral;