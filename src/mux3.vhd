library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity mux3 is
	 port(
		 ctrl : in STD_LOGIC_VECTOR(1 downto 0);
		 entrada1 : in STD_LOGIC_VECTOR(63 downto 0);
		 entrada2 : in STD_LOGIC_VECTOR(63 downto 0);
		 entrada3 : in STD_LOGIC_VECTOR(63 downto 0);
		 salida : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end mux3;

architecture mux3 of mux3 is
begin
	process(ctrl,entrada1,entrada2,entrada3)
	begin
		if ctrl="00" then
			salida <= entrada1;
		elsif ctrl="01"	then 
			salida <= entrada2;
		elsif ctrl="10"	then
			salida <= entrada3;
		elsif ctrl="11" then
			salida <= x"0000000000000000";
		end if;
	end process;
end mux3;
