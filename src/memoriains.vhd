library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity memoriains is
	 port(
		 addr : in STD_LOGIC_VECTOR(63 downto 0);
		 instr : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end memoriains;

architecture memoriains of memoriains is
type memoriains is array (0 to 31) of std_logic_vector(31 downto 0);
signal memInstrucciones: memoriains:=
(																								 									
	x"F840000A", --LDUR x10, [X0,#0]			0
	x"8B0B014B", --ADD X11,X10,X11				1
	x"91010000", --ADDI X0,[X0,#8] 				2
	x"B5FFFF8A", --CBNZ X10,RET					3
												
	x"F800000B", --STUR X11,[X10,#0]			4
	X"00000000", -- XXXXXXXXXXXXXXXX		    5
	X"00000000", -- xxxxxxxxxxxxxxxx 			6
	X"00000000", -- XXXXXXXXXXXXXXXX			7
	
	X"00000000", -- XXXXXXXXXXXXXXXX			8
	X"00000000", -- XXXXXXXXXXXXXXXX    		9
	X"00000000", -- XXXXXXXXXXXXXXXX	 		10	 
	X"00000000", -- XXXXXXXXXXXXXXXX			11 
			   						 	   
	X"F8400334", -- LDUR X20,[X25, #0]			12
	X"8B000280", -- ADD XO, XO, X20				13
	X"14000011", -- B FINFUN					14
	X"8B0A0140", -- ADD X0, X10, X10			15 --cero
	
	X"14000011", -- B FINFUN					16
	X"F840038A", -- LDUR X10,[X28, #0]			17 --finfun
	X"F840839E", -- LDUR X30,[X28, #8]			18
	X"F8410399", -- LDUR X25,[X28, #16]			19
	
	X"9100639C", -- ADDI X28, X28, #24			20
	X"D600001E", -- BR x30						21
	X"00000000", --								22
	X"F8000000", -- STUR X0,[X0,#0]				23 --resultado
	---PRUEBA DE SALTOS CBNZ Y CBZ
	x"B4000062", -- CBZ X2,	28					24
	x"CB020002", --	SUB X2, X2, X0				25
	x"B4FFFFA2", -- CBZ X2, 24					26
	x"00000000", --							    27
	x"8B000042", -- ADD X2, X2, X0 				28
												  
	x"B5FFFF42", --CBNZ X2, 24						29
	x"00000000", --							    30	           		
	x"00000000"  -- 						 	31
);
begin
	
	process (addr)
	begin			 		
		instr<= memInstrucciones(conv_integer(addr(6 downto 2)));
	end process;
end memoriains;
