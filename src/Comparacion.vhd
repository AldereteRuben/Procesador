library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity Comparacion is
	 port(
		 n : in STD_LOGIC;
		 c : in STD_LOGIC;
		 z : in STD_LOGIC;
		 ins : in STD_LOGIC_VECTOR(10 downto 0);
		 s : out STD_LOGIC
	     );
end Comparacion;

architecture Comparacion of Comparacion is
begin	
	process(ins,z,n,c)
		begin
		case ins is
			when "11111111110" =>
				if z='1' then
					s<='1';
				else 
					s<='0';
				end if;
			when "11111111101" =>
				if n='1' and z='0' then
					s<='1';
				else 
					s<='0';	
				end if;
			when "11111111011" =>
				if c='1' and n='0' then
					s<='1';
				else 
					s<='0';
				end if;	
			when others =>
				s<='0';
		end case;
	end process;
end Comparacion;
