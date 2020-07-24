
library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_UNSIGNED.all;



entity sumaCBZ is
	 port(
		 in0 : in STD_LOGIC_VECTOR(63 downto 0);
		 in1 : in STD_LOGIC_VECTOR(63 downto 0);
		 s : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end sumaCBZ;


architecture sumaCBZ of sumaCBZ is
begin

	 s <= in0 + in1;

end sumaCBZ;
