
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity segreg4 is
	port(	 
		 Chip_E			: in std_logic;
		 clk 			: in STD_LOGIC;
		 rst			: in STD_LOGIC;
		 rd				: in STD_LOGIC_VECTOR(4 downto 0);
		 regw			: in STD_LOGIC;
		 inmux			: in STD_LOGIC_VECTOR(63 downto 0);
		 outmux     	: out STD_LOGIC_VECTOR(63 downto 0);
		 outrd		  	: out STD_LOGIC_VECTOR(4 downto 0);
		 outregw		: out  STD_LOGIC
	     );
end segreg4;

architecture segreg4 of segreg4 is
begin
		process(rst,clk,rd,Chip_E,regw, inmux)
	begin  
		
		if rst='1' then   
		 	outrd	 <="00000";
		 	outregw	 <='0';
			
		elsif ( falling_edge(clk) and Chip_E = '1' ) then 
		 	outrd	 <= rd;
		 	outregw	 <= regw;
			outmux   <=inmux;
		
		end if;
		
	end process;
end segreg4;
