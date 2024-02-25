library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexor is
	port(
		clk: in std_logic;
		Canales: out std_logic_vector(2 downto 0);
		OE: out std_logic_vector(1 downto 0)	
	);
end multiplexor;

architecture Behavioral of multiplexor is
	signal cambio: integer range 0 to 11999999:=0;
	signal ciclo: integer range 0 to 23:=0;
begin
	process(clk)
		begin
			if(rising_edge(clk))then
				if(cambio=5999999)then
				cambio<=0;
				ciclo<=ciclo+1;
				if(ciclo=23)then
					ciclo<=0;
				end if;
				else
					cambio<=cambio+1;
				end if;
				case ciclo is
					when 0=>Canales<="000";OE<="10";
					when 1=>Canales<="001";OE<="10";
					when 2=>Canales<="010";OE<="10";
					when 3=>Canales<="011";OE<="10";
					when 4=>Canales<="100";OE<="10";
					when 5=>Canales<="101";OE<="10";
					when 6=>Canales<="110";OE<="10";
					when 7=>Canales<="111";OE<="10";
					when 8=>Canales<="000";OE<="01";
					when 9=>Canales<="001";OE<="01";
					when 10=>Canales<="010";OE<="01";
					when 11=>Canales<="011";OE<="01";
					when others=>Canales<="000";OE<="00";
				end case;
			end if;
	end process;
end Behavioral;

