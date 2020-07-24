library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
entity aluB is
	 port(
		 pc4 : in STD_LOGIC_VECTOR(63 downto 0);
		 numext : in STD_LOGIC_VECTOR(63 downto 0);
		 salida : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end aluB;					  
architecture aluB of aluB is
begin
	process(pc4,numext)
	begin
		salida<= pc4 + numext;
	end process;
end aluB;
