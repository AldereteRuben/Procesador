
library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity muxMachine is
	port(	 
		ctrlbs : in STD_LOGIC;
		 we2 : in STD_LOGIC;
		 we4 : in STD_LOGIC;
		 cont2 : in STD_LOGIC_VECTOR(1 downto 0);
		 cont4 : in STD_LOGIC_VECTOR(1 downto 0);
		 pcw2 : in STD_LOGIC_VECTOR(63 downto 0);
		 pcw4 : in STD_LOGIC_VECTOR(63 downto 0);
		 target2 : in STD_LOGIC_VECTOR(63 downto 0);
		 target4 : in STD_LOGIC_VECTOR(63 downto 0);
		 we : out STD_LOGIC;
		 target : out STD_LOGIC_VECTOR(63 downto 0);
		 pcw : out STD_LOGIC_VECTOR(63 downto 0);
		 contbtb : out STD_LOGIC_VECTOR(1 downto 0)
	     );
end muxMachine;

architecture muxMachine of muxMachine is
begin
	process (ctrlbs,we2,we4,cont2,cont4,pcw2,pcw4,target2,target4)
	begin														 
		case ctrlbs is	  
			when '1' =>   
				we <=  we2;
				target <=  target2;
		 		pcw <= pcw2;
		 		contbtb <= cont2;  
			when '0' =>
				we <=  we4;
				target <=  target4;
		 		pcw <= pcw4;
		 		contbtb <= cont4;
			when others =>
				we <=  '0';
				target <= x"0000000000000000";
		 		pcw <= x"0000000000000000";
		 		contbtb <= "00";
		end case;
	end process;
end muxMachine;
