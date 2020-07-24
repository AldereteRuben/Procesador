
library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity segReg is
	port(
		 Chip_E: 	in std_logic;
		 clk : 		in STD_LOGIC;   
		 BSout : 	out STD_LOGIC;
		 BSin : 	in STD_LOGIC;
		 rst : 		in STD_LOGIC;
		 Stop : 	in std_logic;
		 pc : 		in STD_LOGIC_VECTOR(63 downto 0);
		 pc4 : 		in STD_LOGIC_VECTOR(63 downto 0);
		 inst : 	in STD_LOGIC_VECTOR(31 downto 0);
		 inCont : 	in STD_LOGIC_vector(1 downto 0);
		 outCont : 	out STD_LOGIC_vector(1 downto 0);
		 pcout : 	out STD_LOGIC_VECTOR(63 downto 0);
		 pc4out : 	out STD_LOGIC_VECTOR(63 downto 0);
		 reg1out : 	out STD_LOGIC_VECTOR(4 downto 0);  --salida para el registro (Rn)
		 rdout : 	out STD_LOGIC_VECTOR(4 downto 0);	  --salida para el registro salida
		 reg2out : 	out STD_LOGIC_VECTOR(4 downto 0);  --salida para el registro (Rm)
		 inmeout : 	out STD_LOGIC_VECTOR(10 downto 0);  --Salida para operaciones inmediatas
		 bout : 	out STD_LOGIC_VECTOR(25 downto 0);	   --salida para saltos no condicionados
		 bnzout : 	out STD_LOGIC_VECTOR(18 downto 0);
		 Memout : 	out STD_LOGIC_VECTOR(8 downto 0);	-- Salida para el calculo de la direccion [x28,#0]	 
 		 opout : 	out STD_LOGIC_VECTOR(10 downto 0) --opcode
	     );
end segReg;


architecture segReg of segReg is
begin
	process(rst,clk,Chip_E)
	begin
	
		if rst='1' then 			
			BSout<='0';
			pcout 	<= x"0000000000000000";	
			pc4out 	<= x"0000000000000000";
			reg1out <=x"0"&'0';	   
			reg1out <=x"0"&'0';
			reg2out <=x"0"&'0';	
			inmeout <=x"00"&"000";
			bout 	<=x"000000"&"00";
			bnzout 	<=x"0000"&"000";
			memout 	<=x"00"&'0';	
			opout 	<= x"00"&"000";
			rdout 	<= "00000"; 
			outCont <= "00";
		elsif (falling_edge(clk) and stop = '0' and Chip_E = '1') then
			pcout <= pc;
			pc4out <= pc4;
			reg1out <= inst(9 downto 5);
			rdout <= inst(4 downto 0);	
			reg2out <= inst(20 downto 16); 
			inmeout <= inst(20 downto 10 );
			bout <= inst(25 downto 0);
			bnzout <= inst(23 downto 5);
			memout <= inst(20 downto 12);
			opout <= inst(31 downto 21); 
			outCont <= inCont;
			BSout<=BSin;			
		end if;
		
		
	end process;

end segReg;
