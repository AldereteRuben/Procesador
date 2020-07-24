library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity hazard is
	 port(
		 exrw       : in STD_LOGIC_VECTOR (4 downto 0);
		 exmemread  : in STD_LOGIC;	
		 r1         : in STD_LOGIC_VECTOR (4 downto 0);
		 r2         : in STD_LOGIC_VECTOR (4 downto 0);
		 ctrl       : out STD_LOGIC; 
		 stopPC     : out STD_LOGIC;
		 stopID     : out STD_LOGIC
	     );
end hazard;					
architecture hazard of hazard is					
begin						  
	process	(exmemread,r1,r2,exrw)   
	begin	 				
		if ((r1=exrw or r2=exrw) and exmemread = '1') then
			stopPC 	<= '1' ;
			stopID 	<= '1' ;
			ctrl 	<= '1' ;
			
		else 
			stopPC <= '0' ;
			stopID <= '0' ;
			ctrl   <= '0' ;
		end if;							  
	end process;
	
	
end hazard;
