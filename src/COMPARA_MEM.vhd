
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity COMPARA_MEM is
	 port(
		 bit_val : 		in STD_LOGIC;
		 Mem_R : in STD_LOGIC;
		 tag : 		in STD_LOGIC_VECTOR(2 downto 0);
		 dir1 : 	in STD_LOGIC_VECTOR(4 downto 0); 
		 dir2 : 	in STD_LOGIC_VECTOR(7 downto 0);
		 Comp: 		out STD_LOGIC
	     );
end COMPARA_MEM;

architecture COMPARA_MEM of COMPARA_MEM is 

	signal aux: STD_LOGIC_VECTOR(7 downto 0);

begin
	process(bit_val,Mem_R,tag,dir1)
		begin 
			aux <= tag & dir1;	
			if(Mem_R ='1' and bit_val='1') then
				if(dir2 = aux) then
					Comp<='0';
				end if;
			elsif(Mem_R ='1' and bit_val='0') then	
				Comp <='1';					  
			else 
				Comp <='0';
			end if;
	end process;

end COMPARA_MEM;
