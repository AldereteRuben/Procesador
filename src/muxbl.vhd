library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity muxbl is
	port(	
		 bl :in STD_LOGIC;
		 instruccion : in STD_LOGIC_VECTOR(4 downto 0);
		 salida : out STD_LOGIC_VECTOR(4 downto 0)
	     );
end muxbl;							
architecture muxbl of muxbl is
begin	
	process(bl,instruccion)	
	begin
		case bl is
			when '0' => salida<=instruccion;
			when '1' => salida<="11110";	
			when others => salida<="00000";
		end case;
	end process;
end muxbl;
