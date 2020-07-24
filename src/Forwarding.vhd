library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity Forwarding is
	 port(
		 memwrite1 : in STD_LOGIC;
		 memwrite2 : in STD_LOGIC;
		 rm : in STD_LOGIC_VECTOR(4 downto 0);
		 rn : in STD_LOGIC_VECTOR(4 downto 0);
		 rdmem : in STD_LOGIC_VECTOR(4 downto 0);
		 rdwb : in STD_LOGIC_VECTOR(4 downto 0);
		 ForwardA : out STD_LOGIC_VECTOR(1 downto 0);
		 ForwardB : out STD_LOGIC_VECTOR(1 downto 0)
	     );
end Forwarding;
architecture Forwarding of Forwarding is
begin			
	process	(memwrite1,memwrite2,rm,rn,rdmem,rdwb)	
	begin	 
		if (memwrite2 = '0' and memwrite1 = '0') then
			ForwardA <= "00";
			ForwardB <= "00";
	
		elsif (memwrite2 = '1' and memwrite1 = '0') then
				if rdwb = rn and rdwb = rm then
					ForwardA <= "10";
					ForwardB <= "10";
				elsif rdwb = rn and rdwb /= rm then
					ForwardA <= "10";
					ForwardB <= "00";
				elsif rdwb /= rn and rdwb = rm then
					ForwardA <= "00";
					ForwardB <= "10"; 
				elsif rdwb/= rn and rdwb/= rm then
					ForwardA <= "00";
					ForwardB <= "00";
				end if;
		
		elsif	(memwrite2 = '0' and memwrite1 = '1') then
				if rdmem = rn and rdmem = rm then
					ForwardA <= "01";
					ForwardB <= "01";
				elsif rdmem = rn and rdmem /= rm then
					ForwardA <= "01";
					ForwardB <= "00";
				elsif rdmem /= rn and rdmem = rm then
					ForwardA <= "00";
					ForwardB <= "01"; 
				elsif rdmem /= rn and rdmem /= rm then
					ForwardA <= "00";
					ForwardB <= "00"; 
				end if;	
			
		elsif	(memwrite2 = '1' and memwrite1 = '1') then
				if (rdwb = rdmem) then
					if (rdwb = rn and rdwb = rm) then
						ForwardA <= "01";
						ForwardB <= "01";
					elsif (rdmem=rn and rdmem/=rm) then
						ForwardA <= "01";
						ForwardB <= "00";
					elsif (rdmem/=rn and rdmem=rm) then
						ForwardA <= "00";
						ForwardB <= "01";
					end if;		   
					
				elsif (rdwb = rm and rdmem/=rn) then
					ForwardA <= "00";
					ForwardB <= "10";
				elsif (rdwb = rn and rdwb = rm) then
					ForwardA <= "10";	  
					ForwardB <= "10";
				elsif (rdwb = rn and rdmem = rm) then
					ForwardA <= "10";
					ForwardB <= "01";
				elsif (rdwb = rn and rdmem /= rm) then
					ForwardA <= "10";
					ForwardB <= "00";
			
				elsif (rdmem = rn and rdwb = rm) then
					ForwardA <= "01";
					ForwardB <= "10";
				elsif (rdmem = rn and rdmem = rm) then
					ForwardA <= "01";
					ForwardB <= "01";
				elsif (rdwb /= rm and rdmem = rn) then
					ForwardA <= "01";
					ForwardB <= "00";
							
				elsif (rdwb/=rn	and rdmem/=rm) then
					ForwardA <= "00";
					ForwardB <= "00";
				elsif (rdwb/=rn	and rdmem = rm) then
					ForwardA <= "00";
					ForwardB <= "01";  
				end if;
		end if;
	end process;
end Forwarding;				   


		  