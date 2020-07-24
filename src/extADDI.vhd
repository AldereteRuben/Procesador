
library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity extADDI is
	 port(
		 ins : in STD_LOGIC_VECTOR(10 downto 0);
		 salida : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end extADDI;

--}} End of automatically maintained section

architecture extADDI of extADDI is
begin
	process(ins) 
	begin
		if ins(10)='1' then
			salida <= "11111111111111111111111111111111111111111111111111111" & ins;
		else
			salida <= "00000000000000000000000000000000000000000000000000000" &ins;
		end if;	
	end process;

end extADDI;
