library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity mux32 is
	 port(
		 opc : in STD_LOGIC;
		 inst1 : in STD_LOGIC_VECTOR(31 downto 0);
		 salida : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end mux32;
architecture mux32 of mux32 is
begin
	 
	process(opc,inst1)
	begin
		if opc='0' then
			salida <= inst1;
		else
			salida <= x"00000000";
		end if;
	end process;

end mux32;
