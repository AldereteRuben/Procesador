library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity Zero is
	 port(
		 dato : in STD_LOGIC_VECTOR(63 downto 0);
		 band : out STD_LOGIC
	     );
end Zero;
architecture Zero of Zero is
begin
	process	(dato)	
	begin 
		if dato=x"0000000000000000" then
			band<='1';
		else
			band<='0';
		end if;
	end process;
end Zero;
