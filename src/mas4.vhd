library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;


entity mas4 is
	 port(
		 in0 : in STD_LOGIC_VECTOR(63 downto 0);
		 out0 : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end mas4;
architecture mas4 of mas4 is
begin
	out0<= in0 + x"00000000000004";
end mas4;
