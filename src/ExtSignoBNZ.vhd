library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity ExtSignoBNZ is
	 port(
		 Ent : in STD_LOGIC_VECTOR(18 downto 0);
		 Sal : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end ExtSignoBNZ;
architecture ExtSignoBNZ of ExtSignoBNZ is
begin	
	process(Ent) 
	begin
		if Ent(18)='1' then
			Sal <= "111111111111111111111111111111111111111111111" &Ent;
		else
			Sal <= "000000000000000000000000000000000000000000000" &Ent;
		end if;	
	end process;

end ExtSignoBNZ;
