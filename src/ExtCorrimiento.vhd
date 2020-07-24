library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity ExtCorrimiento is
	 port(
		 Ent : in STD_LOGIC_VECTOR(25 downto 0);
		 Sal : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end ExtCorrimiento;

architecture ExtCorrimiento of ExtCorrimiento is
begin
	Sal <= "000000000000000000000000000000000000" &Ent &"00";
end ExtCorrimiento;
