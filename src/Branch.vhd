

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity Branch is
	 port(
		 bandCero : in STD_LOGIC;
		 cbnz : in STD_LOGIC;
		 cbz : in STD_LOGIC;
		 Sal : out STD_LOGIC
	     );
end Branch;

architecture Branch of Branch is
begin	
	Sal <= (bandCero and cbz) or (not(bandCero) and cbnz);

end Branch;
