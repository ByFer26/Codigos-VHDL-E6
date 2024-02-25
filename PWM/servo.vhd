library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity servo is
	port(
		clk:in std_logic;
		attach: out std_logic;
		control: in std_logic_vector(3 downto 0)
		);
end servo;

architecture Behavioral of servo is
	signal delay: integer  range 0 to 3000:=0;
	signal estado: integer range 0 to 10:=0;
	signal milis: integer range 0 to 12000:=0;
	signal ciclo: integer range 0 to 250:=0;
	signal alto: std_logic_vector(24 downto 0):="0000000000000000000000000";
begin
	process(clk)
		begin
			if(rising_edge(clk))then
						if(delay=1200)then
							delay<=0;
							milis<=milis+1;
							ciclo<=ciclo+1;
							if(ciclo=249)then
								ciclo<=0;
							end if;
							if(milis=7000)then
								milis<=0;
							end if;
						else
							delay<=delay+1;
						end if;
						case control is
							when "0000"=>estado<=0;
							when "0001"=>estado<=1;		
							when "0010"=>estado<=2;			
							when "0011"=>estado<=3;		
							when "0100"=>estado<=4;		
							when "0101"=>estado<=5;
							when "0110"=>estado<=6;	
							when "0111"=>estado<=7;	
							when "1000"=>estado<=8;			
							when "1001"=>estado<=9;
							when others=>estado<=0;
						end case;
						case estado is
							when 0=>alto<="1111100000000000000000000";
							when 1=>alto<="1111111000000000000000000";
							when 2=>alto<="1111111110000000000000000";
							when 3=>alto<="1111111111110000000000000";
							when 4=>alto<="1111111111111100000000000";
							when 5=>alto<="1111111111111111000000000";
							when 6=>alto<="1111111111111111110000000";
							when 7=>alto<="1111111111111111111110000";
							when 8=>alto<="1111111111111111111111100";
							when 9=>alto<="1111111111111111111111111";
							when others=>alto<="0000000000000000000000000";
						end case;
						case ciclo is
							when 0=>attach<=alto(0);
							when 1=>attach<=alto(1);
							when 2=>attach<=alto(2);
							when 3=>attach<=alto(3);
							when 4=>attach<=alto(4);
							when 5=>attach<=alto(5);
							when 6=>attach<=alto(6);
							when 7=>attach<=alto(7);
							when 8=>attach<=alto(8);
							when 9=>attach<=alto(9);
							when 10=>attach<=alto(10);
							when 11=>attach<=alto(11);
							when 12=>attach<=alto(12);
							when 13=>attach<=alto(13);
							when 14=>attach<=alto(14);
							when 15=>attach<=alto(15);
							when 16=>attach<=alto(16);
							when 17=>attach<=alto(17);
							when 18=>attach<=alto(18);
							when 19=>attach<=alto(19);
							when 20=>attach<=alto(20);
							when 21=>attach<=alto(21);
							when 22=>attach<=alto(22);
							when 23=>attach<=alto(23);
							when 24=>attach<=alto(24);
							when others=>attach<='0';
						end case;
			end if;
	end process;
end Behavioral;

