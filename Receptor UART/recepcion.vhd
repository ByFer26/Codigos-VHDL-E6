--Autor: Byron Fernando Montenegro Lucero 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity RX is
	port(
			clk: in std_logic;
			RX_01: in std_logic;
			a: out std_logic;
			b: out std_logic
			);
end RX;

architecture Behavioral of RX is
			signal bandera: integer range 0 to 2:=0;
			signal delay_cambio:integer range 0 to 11999999:=0;
			signal estados: integer range 0 to 99999:=0;
			signal caracter: std_logic_vector(7 downto 0);
begin
	process(clk)
		begin
			if(rising_edge(clk))then
				if(RX_01='0')then
					bandera<=1;
				end if;
			case bandera is
				when 1=>	
					if(delay_cambio=1249)then
						delay_cambio<=0;
						estados<=estados+1;
						if(estados=0)then
						caracter(0)<=RX_01;
						end if;
						if(estados=1)then
						caracter(1)<=RX_01;
						end if;
						if(estados=2)then
						caracter(2)<=RX_01;
						end if;
						if(estados=3)then
						caracter(3)<=RX_01;
						end if;
						if(estados=4)then
						caracter(4)<=RX_01;
						end if;
						if(estados=5)then
						caracter(5)<=RX_01;
						end if;
						if(estados=6)then
						caracter(6)<=RX_01;
						end if;
						if(estados=7)then
						caracter(7)<=RX_01;
						end if;
						if(caracter="01000001")then
							a<='1';
						end if;
						if(caracter="01011010")then
							a<='0';
						end if;
						if(caracter="01001101")then
							b<='1';
						end if;
						if(caracter="01010100")then
							b<='0';
						end if;
						if(estados=9599)then
							if(RX_01='1')then
								bandera<=0;
								estados<=0;
							end if;
						end if;
					else
						delay_cambio<=delay_cambio+1;
					end if;
			when others=> 
					if(RX_01='0')then 
						bandera<=1;
				   end if;
			end case;
			end if;
	end process;
end Behavioral;