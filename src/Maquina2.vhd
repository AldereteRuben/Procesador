library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity Maquina2 is
	 port(
		 b    					: in STD_LOGIC;
		 bl 					: in STD_LOGIC;
		 br 					: in STD_LOGIC;
		 contin 				: in STD_LOGIC_VECTOR(1 downto 0);
		 targetin 				: in STD_LOGIC_VECTOR(63 downto 0);
		 dirtarget 				: in STD_LOGIC_VECTOR(63 downto 0);	
		 dirtargeto 			: out STD_LOGIC_VECTOR(63 downto 0);
		 targetout 				: out STD_LOGIC_VECTOR(63 downto 0);
		 we 					: out STD_LOGIC;
		 contout 				: out STD_LOGIC_VECTOR(1 downto 0)
	     );
end Maquina2;
								
architecture Maquina2 of Maquina2 is
begin
	process (b,bl,br,contin,targetin,dirtarget)	
	begin 
		if b='1' or  bl='1' or  br='1' then 
			we<='1';   
			contout<="11";
			targetout<=targetin;
			dirtargeto<=dirtarget;
		else 
			we<='0'; 
			contout<=contin;
			targetout<=targetin;
			dirtargeto<=dirtarget;
		end if;	
	end process;
end Maquina2;
