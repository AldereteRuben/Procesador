library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity maquina4 is 
	port(
		cbin					:in STD_LOGIC;	  
		cbz						: in STD_LOGIC;
		cbnz				  	: in STD_LOGIC;
		ce 						: in STD_LOGIC;
		 contin 				: in STD_LOGIC_VECTOR(1 downto 0);
		 targetin 				: in STD_LOGIC_VECTOR(63 downto 0);
		 dirtarget 				: in STD_LOGIC_VECTOR(63 downto 0);	
		 correct				: out STD_LOGIC;
		 dirtargeto 			: out STD_LOGIC_VECTOR(63 downto 0);
		 targetout 				: out STD_LOGIC_VECTOR(63 downto 0);
		 we 					: out STD_LOGIC;
		 contout 				: out STD_LOGIC_VECTOR(1 downto 0)
	     );
	
end maquina4;

architecture maquina4 of maquina4 is
begin	  
	process (contin,targetin,dirtarget,cbin, cbz, cbnz, ce)
	begin  
		if (cbin= '1') then
			if(contin <= "10") then
				contout<= contin+1;
			else
				contout<= "11";
			end if;
			we <='1';
			targetout<=targetin;
			dirtargeto<=dirtarget; 
			correct <= '0';
		else  
			if (cbz = '1' or cbnz='1') then
				if (ce = '1') then 		 
					if ( contin > "00") then
						contout<= contin-1;	
					else 
						contout <= "00";
					end if;
					we <='1'; 
					correct <='1';
					targetout<=dirtarget + 4;
					dirtargeto<=dirtarget;
				else 
					we <='0';
					correct <= '0';
					targetout<= targetin;
					dirtargeto<=dirtarget;
				end if;
			elsif(cbz = '0' and cbnz='0') then 
				we <='0';  
				correct <= '0';
				contout<= contin;  
				targetout<=targetin;
				dirtargeto<=dirtarget;
			end if;
		end if;
		--if (cbnz='1') then	  
		--	if (ce = '0') then 		 
		--		if ( contin > "00") then
		--			contout<= contin-1;	
		--		else 
		--			contout <= "00";
		--		end if;
		--		we <='1';
		--		targetout<=dirtarget + 4;
		--		dirtargeto<=dirtarget;
		--	end if;
	end process;
end maquina4;
