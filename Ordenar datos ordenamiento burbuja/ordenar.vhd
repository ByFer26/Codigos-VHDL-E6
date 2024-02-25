library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ordenar is
	port(
		clk: in std_logic;
		E0C1: in std_logic;
		ADC: in std_logic_vector(7 downto 0);
		servo_pos: out std_logic_vector(3 downto 0)
	);
end ordenar;

architecture Behavioral of ordenar is
	signal posicion: std_logic_vector(3 downto 0);
	signal dato: std_logic_vector(7 downto 0);
	signal lect1: std_logic_vector(7 downto 0);
	signal lect2: std_logic_vector(7 downto 0);
	signal lect3: std_logic_vector(7 downto 0);
	signal lect4: std_logic_vector(7 downto 0);
	signal lect5: std_logic_vector(7 downto 0);
	signal lect6: std_logic_vector(7 downto 0);
	signal lect7: std_logic_vector(7 downto 0);
	signal lect8: std_logic_vector(7 downto 0);
	signal lect9: std_logic_vector(7 downto 0);
	signal aux1: std_logic_vector(7 downto 0);
	signal aux2: std_logic_vector(7 downto 0);
	signal aux3: std_logic_vector(7 downto 0);
	signal aux4: std_logic_vector(7 downto 0);
	signal aux5: std_logic_vector(7 downto 0);
	signal aux6: std_logic_vector(7 downto 0);
	signal aux7: std_logic_vector(7 downto 0);
	signal aux8: std_logic_vector(7 downto 0);
	signal aux9: std_logic_vector(7 downto 0);
	signal cambio: integer range 0 to 11999999:=0;
	signal ciclo: integer range 0 to 11:=0;
begin
process(clk)
	begin
		if(rising_edge(clk))then
				if(E0C='0')then
					ciclo<=ciclo+1;
					if(ciclo=11)then
						ciclo<=0;
					end if;
				end if;
				case ciclo is
					when 0=>lect1<=ADC;aux1<=lect1;
					when 1=>lect2<=ADC;aux2<=lect2;
					when 2=>lect3<=ADC;aux3<=lect3;
					when 3=>lect4<=ADC;aux4<=lect4;
					when 4=>lect5<=ADC;aux5<=lect5;
					when 5=>lect6<=ADC;aux6<=lect6;
					when 6=>lect7<=ADC;aux7<=lect7;
					when 7=>lect8<=ADC;aux8<=lect8;
					when 8=>null;
					when 9=>
						if(lect1<lect2)then
							dato<=lect1;
							lect1<=lect2;
							lect2<=dato;
						else
							lect1<=lect1;
							lect2<=lect2;
						end if;
						if(lect2<lect3)then
							dato<=lect2;
							lect2<=lect3;
							lect3<=dato;
						else
							lect2<=lect2;
							lect3<=lect3;
						end if;
						if(lect3<lect4)then
							dato<=lect3;
							lect3<=lect4;
							lect4<=dato;
						else
							lect3<=lect3;
							lect4<=lect4;
						end if;
						if(lect4<lect5)then
							dato<=lect4;
							lect4<=lect5;
							lect5<=dato;
						else
							lect4<=lect4;
							lect5<=lect5;
						end if;
						if(lect5<lect6)then
							dato<=lect5;
							lect5<=lect6;
							lect6<=dato;
						else
							lect5<=lect5;
							lect6<=lect6;
						end if;	
						if(lect6<lect7)then
							dato<=lect6;
							lect6<=lect7;
							lect7<=dato;
						else
							lect6<=lect7;
							lect6<=lect7;
						end if;
						if(lect7<lect8)then
							dato<=lect7;
							lect7<=lect8;
							lect8<=dato;
						else
							lect7<=lect7;
							lect8<=lect8;
						end if;	
					--	if(lect8<lect9)then
					--		dato<=lect8;
					--		lect8<=lect9;
					--		lect9<=dato;
					--	else
					--		lect8<=lect8;
					--		lect9<=lect9;
					--	end if;	
					when 10=>
						if(lect1=aux1)then
							posicion<="0000";
						end if;
						if(lect1=aux2)then
							posicion<="0001";
						end if;
						if(lect1=aux3)then
							posicion<="0010";
						end if;
						if(lect1=aux4)then
							posicion<="0011";
						end if;
						if(lect1=aux5)then
							posicion<="0100";
						end if;
						if(lect1=aux6)then
							posicion<="0101";
						end if;
						if(lect1=aux7)then
							posicion<="0110";
						end if;
						if(lect1=aux8)then
							posicion<="0111";
						end if;
					--	if(lect1=aux9)then
					--		posicion<=9;mayor<="00001001";
					--	end if;
					when 11=>servo_pos<=posicion;
				end case;
			end if;
end process;
end Behavioral;

