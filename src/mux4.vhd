library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity mux4 is
	 port(
		 opc : in STD_LOGIC;
		 inst1 : in STD_LOGIC_VECTOR(4 downto 0);
		 instr2 : in STD_LOGIC_VECTOR(4 downto 0);
		 salida : out STD_LOGIC_VECTOR(4 downto 0)
	     );
end mux4;
architecture mux4 of mux4 is
begin
	 
	process(opc,inst1,instr2)
	begin
		if opc='0' then
			salida <= inst1;
		else
			salida <= instr2;
		end if;
	end process;

end mux4;
