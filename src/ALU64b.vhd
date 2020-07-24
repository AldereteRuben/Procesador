library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity ALU64b is
	 port(
		 in0 : in STD_LOGIC_VECTOR(63 downto 0);
		 in1 : in STD_LOGIC_VECTOR(63 downto 0);
		 ctrl : in STD_LOGIC_VECTOR(3 downto 0);  
		 Result : out STD_LOGIC_VECTOR(63 downto 0)
		 );
end ALU64b;
	
architecture ALU64b of ALU64b is
begin 
	process(in0,in1,ctrl)				  
	begin	  										 
		case ctrl is   
			----------------------------and	  ---------------------
			when "0000" => Result <=	in0 and in1;
			-------------------------or	-----------------------
			when "0001" =>  Result <= in0 or in1 ;
						
			----------------------- add /sf	-----------------------
			when "0010" =>  Result <= in0 + in1;	
			-----------------------sub /sf	----------------------
			when "0110" => 	Result <= in0 -in1; 
			------------ pass b --------------
			when "0111" => 	Result <= in1;
			------------ nor --------------
			when "1100" =>  Result <= in0 nor in1;
			when others =>	Result <= x"0000000000000000";	
		end case;					      
	end process;
end ALU64b;
