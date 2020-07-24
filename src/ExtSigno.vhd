library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_unsigned.all;
entity ExtSigno is
	port(
	in1 : in STD_LOGIC_VECTOR(8 downto 0);
	out1 : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end ExtSigno;
architecture ExtSigno of ExtSigno is
begin
	process(in1) 
	begin
		if in1(8)='1' then
			out1 <= "1111111111111111111111111111111111111111111111111111111" & in1;
		else
			out1 <= "0000000000000000000000000000000000000000000000000000000" &in1;
		end if;	
	end process;
end ExtSigno;