library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity mux64 is
	 port(
		 opc : in STD_LOGIC;
		 inst1 : in STD_LOGIC_VECTOR(63 downto 0);
		 instr2 : in STD_LOGIC_VECTOR(63 downto 0);
		 salida : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end mux64;
architecture mux64 of mux64 is
begin
	 
	process(opc,inst1,instr2)
	begin
		if opc='0' then
			salida <= inst1;
		else
			salida <= instr2;
		end if;
	end process;

end mux64;
