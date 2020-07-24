library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity PC is
	 port(
		 rst : in STD_LOGIC;
		 clk : in STD_LOGIC;	   
		 stop: in std_logic;
		 inPC : in STD_LOGIC_VECTOR(63 downto 0);
		 outPC : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end PC;						
architecture PC of PC is
begin

	process(rst,clk)
	begin
		if rst='1' then 
			outPC<=x"0000000000000000";
		elsif (falling_edge(clk) and stop = '0') then
			outPC<=inPC;
		end if;	
	end process;
end PC;
