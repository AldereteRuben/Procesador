library IEEE;
use IEEE.STD_LOGIC_1164.all;	 
use IEEE.STD_LOGIC_unsigned.all;
entity Corrimiento is
	 port(
		 ent : in STD_LOGIC_VECTOR(63 downto 0);
		 sal : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end Corrimiento;

architecture Corrimiento of Corrimiento is
begin
	process(ent)
	begin
		sal<=ent(61 downto 0) & "00";	
	end process;
end Corrimiento;
