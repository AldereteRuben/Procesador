library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
entity MemDatos is
	port(		   
		-- Read: 		in std_logic;  						--nueva
		 clk: 		in STD_LOGIC;
		 MemWrite: 	in STD_LOGIC;
--		 MemRead: 	in STD_LOGIC;
		 addres: 	in STD_LOGIC_VECTOR(63 downto 0);
		 WData: 	in STD_LOGIC_VECTOR(63 downto 0);
		 Dato:	 	out STD_LOGIC_VECTOR(63 downto 0);
		 tagg:		out std_logic_vector(2 downto 0); 	--nueva
		 bit_val:	out std_logic						--nueva

	     );
end MemDatos;
architecture MemDatos of MemDatos is
type MemDatos is array (0 to 31) of std_logic_vector(63 downto 0);
type tag is array (0 to 31) of std_logic_vector (2 downto 0);
type bit_valida is array(0 to 31) of std_logic;
signal bit_validacion: bit_valida :=(

	'0','0','0','0',			'0','0','0','0',
	'0','0','0','0',			'0','0','0','0',

	'0','0','0','0',			'0','0','0','0',
	'0','0','0','0',			'0','0','0','0'

);
signal taag: tag :=(
	"000","000","000","000",	"000","000","000","000",
	"000","000","000","000",	"000","000","000","000",

	"000","000","000","000",	"000","000","000","000",
	"000","000","000","000",	"000","000","000","000"
);
signal memoriadatos: MemDatos:=
(
	x"0000000000000000",
	x"0000000000000000",
	x"0000000000000000", 
	x"0000000000000000",
	
	x"0000000000000000",
	x"0000000000000000",
	x"0000000000000000", 
	x"0000000000000000",
	
	x"0000000000000000",
	x"0000000000000000",
	x"0000000000000000", 
	x"0000000000000000",
	
	x"0000000000000000",
	x"0000000000000000",
	x"0000000000000000", 
	x"0000000000000000",

	x"0000000000000000",
	x"0000000000000000",
	x"0000000000000000", 
	x"0000000000000000",
	
	x"0000000000000000",
	x"0000000000000000",
	x"0000000000000000", 
	x"0000000000000000",
	
	x"0000000000000000",
	x"0000000000000000",
	x"0000000000000000", 
	x"0000000000000000",
	
	x"0000000000000000",
	x"0000000000000000",
	x"0000000000000000", 
	x"0000000000000000"
);
begin
	process (addres,clk,MemWrite,Wdata)
	begin
		if (MemWrite='1' and falling_edge(clk)) then
			memoriadatos(conv_integer(addres(7 downto 3)))	<=WData ;	
			taag(conv_integer(addres(7 downto 3)))			<=addres(10 downto 8);
			bit_validacion(conv_integer (addres(7 downto 3)))		<='1';
			
		end if;
			Dato	<=memoriadatos(conv_integer(addres(7 downto 3)));
			tagg	<=taag(conv_integer(addres(7 downto 3)));
			bit_val	<=bit_validacion(conv_integer(addres(7 downto 3)));
		
	end process;
end MemDatos;
