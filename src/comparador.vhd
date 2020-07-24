
library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity comparador is
	port(
		branch : in STD_LOGIC;
		cbz	 : in STD_LOGIC;
   		cbnz : in STD_LOGIC;
		b	 : in STD_LOGIC;
		bl  : in STD_LOGIC;
		br	: in STD_LOGIC;
		dir2 : in STD_LOGIC_VECTOR(63 downto 0);
		dir1 : in STD_LOGIC_VECTOR(63 downto 0);
		enableOut : out STD_LOGIC
	);
end comparador;									 

architecture comparador of comparador is
begin
	process(dir1,dir2,cbz,cbnz,b,bl,br,branch)
	begin	   
		if ( b='1' or bl='1' or br='1' or branch = '1') then
			if (dir1 = dir2) then
				enableOut<= '0';		
			else
				enableOut<='1';	
			end if;	
		elsif (branch = '0' and (cbz = '1' or cbnz = '1')) then
			 if (dir1 = dir2) then
				enableOut<= '1';		
			else
				enableOut<='0';	
			end if;
	    else 
			enableOut<='0';
		end if;
		
	end process;											 
	
end comparador;
