
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity segreg3 is
	 port(
	 	 Chip_E		: in std_logic;
	 	 clk 		: in STD_LOGIC;
		 rst 		: in STD_LOGIC;
		 inresult	: in STD_LOGIC_VECTOR(63 downto 0);	
		 inReg2		: in STD_LOGIC_VECTOR(63 DOWNTO 0);
		 inRD		: in STD_LOGIC_VECTOR(4 downto 0);
		 MemR		: in STD_LOGIC;
		 MemW		: in STD_LOGIC;
		 RegW		: in STD_LOGIC;
		 MemTReg	: in STD_LOGIC;
		 ---SALIDAS
		 outresult 	: out STD_LOGIC_VECTOR(63 downto 0); 
		 outReg2		: out STD_LOGIC_VECTOR(63 DOWNTO 0);
		 outRD		: out STD_LOGIC_VECTOR(4 downto 0);
		 outMemR	: out STD_LOGIC;
		 outMemW	: out STD_LOGIC;
		 outRegW	: out STD_LOGIC;
		 outMemTReg	: out STD_LOGIC
	     );
end segreg3;

architecture segreg3 of segreg3 is
begin 
	process(rst,clk)
	begin  
		
		if rst='1' then  
			outresult 	<= x"0000000000000000"; 
			outRD		<= "00000";
			outMemR		<= '0';
			outMemW		<= '0';
			outRegW		<= '0';
			outMemTReg	<= '0';
			outReg2		<= x"0000000000000000"; 
			
		elsif( falling_edge(clk) and Chip_E = '1' ) then
			
			outresult 	<= inresult; 
			outRD		<= inRD;
			outMemR		<= MemR;  
			outMemW		<= MemW;
			outRegW		<= RegW;
			outMemTReg	<= MemTReg;
			outReg2		<= inReg2;
			
		end if;
		
	end process;

end segreg3;
