--Autor: Byron Fernando Montenegro Lucero 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity RX is
	port(
			clk: in std_logic;
			RX_01: in std_logic;
--			a: out std_logic:='0';
			b: out std_logic:='0';
			control: out std_logic_vector(3 downto 0):="0000"
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
						delay_cambio<=1;
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
						case caracter is
							when "01001101"=>b<='1';
							when "01010100"=>b<='0';
--							when "01000001"=>a<='1';
--							when "01011010"=>a<='0';
							when "00110000"=>control<="0000";
							when "00110001"=>control<="0001";
							when "00110010"=>control<="0010";
							when "00110011"=>control<="0011";
							when "00110100"=>control<="0100";
							when "00110101"=>control<="0101";
							when "00110110"=>control<="0110";
							when "00110111"=>control<="0111";
							when "00111000"=>control<="1000";
							when "00111001"=>control<="1001";
							when others=>NULL;
						end case;
						if(estados=48)then
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