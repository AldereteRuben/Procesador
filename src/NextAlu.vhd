library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity NextAlu is
	 port(
		 entrada : in STD_LOGIC_VECTOR(64 downto 0);
		 sf: in std_logic;
		 Salida : out STD_LOGIC_VECTOR(63 downto 0);
		 Zero : out STD_LOGIC;					   
	     carry: out STD_LOGIC;
		 N : out STD_LOGIC
		 );
end NextAlu;																		   

architecture NextAlu of NextAlu is
begin	
	process(sf,entrada)
	begin
		if sf='1' then 
			if entrada='0' & x"0000000000000000" then
				Zero<='1';
			else 
				Zero<='0';
			end if;		  
			carry<=entrada(64);
			N<=entrada(63);
		end if;		   
		salida<=entrada(63 downto 0);
	end process;
end NextAlu;
