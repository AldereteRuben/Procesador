library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity control is
	port(
	 	 opcode : in STD_LOGIC_VECTOR(10 downto 0);	   
		 stop	: in std_logic;
		 memRead : out STD_LOGIC;				  
		 memWrite : out STD_LOGIC;				  
		 regWrite : out STD_LOGIC;				  
		 ALUop : out STD_LOGIC_VECTOR(3 downto 0);
		 ALUSrc : out STD_LOGIC;
		 branch : out STD_LOGIC;
		 MemToReg: out STD_LOGIC;
		 Reg2Loc: out STD_LOGIC;
		 branchN : out STD_LOGIC;
		 B: out STD_LOGIC;
		 BR: out STD_LOGIC;
		 BL: out STD_LOGIC;
		 ADDI: OUT STD_LOGIC;
		 sf : out std_logic
	     );
end control;

architecture control of control is	  
begin
	
	process(opcode,stop)	  
	begin
	--ldur	1986	   
	if (stop = '0') then 
		if(opcode="11111000010")then
			memRead<='1'; 
			memWrite<='0';
			regWrite<='1';
			ALUop<="0010";
			ALUSrc<='1';
			branch<='0';	  
			MemToReg<='0';
		    Reg2Loc	<= '0';	 
			branchN <='0';
			B <= '0';		 
			BL<='0';
			BR<='0';		
			ADDI<='0';
			sf <='0';
		--add	
		elsif(opcode="10001011000")then
			memRead<='0'; 
			memWrite<='0';
			regWrite<='1';
			ALUop<="0010";
			ALUSrc<='0';
			branch<='0';	  
			MemToReg<='1';
		    Reg2Loc	<= '0';		 
			branchN <='0';
			B <= '0';	 
			BL<='0';
			BR<='0';		
			ADDI<='0';		
			sf <='0';
		--subs	
		elsif(opcode="11101011000")then
			memRead<='0'; 
			memWrite<='0';
			regWrite<='1';
			ALUop<="0110";
			ALUSrc<='0';
			branch<='0';	  
			MemToReg<='1';
		    Reg2Loc	<= '0';		 
			branchN <='0';
			B <= '0';	 
			BL<='0';
			BR<='0';		
			ADDI<='0';
			sf <='1';
		--sub	
		elsif(opcode="11001011000")then
			memRead<='0'; 
			memWrite<='0';
			regWrite<='1';
			ALUop<="0110";
			ALUSrc<='0';
			branch<='0';	  
			MemToReg<='1';
		    Reg2Loc	<= '0';		 
			branchN <='0';
			B <= '0';	 
			BL<='0';
			BR<='0';		
			ADDI<='0';
			sf <='0';
		--stur
		elsif(opcode="11111000000") then
			memRead<='0'; 
			memWrite<='1';
			regWrite<='0';
			ALUop<="0010";
			ALUSrc<='1';
			branch<='0';  
			MemToReg<='0';
		    Reg2Loc	<= '1';	 
			branchN <='0';
			B <= '0';	 
			BL<='0';
			BR<='0';		
			ADDI<='0';
			sf <='0';
		--br
		elsif (opcode="11010110000") then
			memRead<='0'; 
			memWrite<='0';
			regWrite<='0';
			ALUop<="1111";
			ALUSrc<='0';
			branch<='0';  
			MemToReg<='0';
		    Reg2Loc	<= '1';	 
			branchN <='0';
			B <= '0';	 
			BL<='0';
			BR<='1'; 		
			ADDI<='0';
			sf <='0';
		--beq	
		elsif(opcode="11111111110") then
			memRead<='0'; 
			memWrite<='0';
			regWrite<='0';
			ALUop<="1000";
			ALUSrc<='0';
			branch<='0';  
			MemToReg<='0';
		    Reg2Loc	<= '0';	 
			branchN <='0';
			B <= '0';	 
			BL<='0';
			BR<='0';		
			ADDI<='0';
			sf <='0';
		--blt	
		elsif(opcode="11111111101") then
			memRead<='0'; 
			memWrite<='0';
			regWrite<='0';
			ALUop<="1000";
			ALUSrc<='0';
			branch<='0';  
			MemToReg<='0';
		    Reg2Loc	<='0';	 
			branchN <='0';
			B <= '0';	 
			BL<='0';
			BR<='0';		
			ADDI<='0';
			sf <='0';
		--bgt	
		elsif(opcode="11111111011") then
			memRead<='0'; 
			memWrite<='0';
			regWrite<='0';
			ALUop<="1000";
			ALUSrc<='0';
			branch<='0';  
			MemToReg<='0';
		    Reg2Loc	<= '0';	 
			branchN <='0';
			B <= '0';	 
			BL<='0';
			BR<='0';		
			ADDI<='0';
			sf <='0';
		--addi
		elsif(opcode(10 downto 1)="1001000100") then
			memRead<='0'; 
			memWrite<='0';
			regWrite<='1';
			ALUop<="0010";
			ALUSrc<='0';
			branch<='0';  
			MemToReg<='1';
		    Reg2Loc	<= '0';	 
			branchN <='0';
			B <= '0';	 
			BL<='0';
			BR<='0';		
			ADDI<='1';
			sf <='0';
		--subis
		elsif(opcode(10 downto 1)="1111000100") then
			memRead<='0'; 
			memWrite<='0';
			regWrite<='1';
			ALUop<="0110";
			ALUSrc<='0';
			branch<='0';  
			MemToReg<='1';
		    Reg2Loc	<= '0';	 
			branchN <='0';
			B <= '0';	 
			BL<='0';
			BR<='0';		
			ADDI<='1';
			sf <='1';
		--cbz
		elsif (opcode(10 downto 3)="10110100") then
			memRead<='0'; 
			memWrite<='0';
			regWrite<='0';
			ALUop<="0111";
			ALUSrc<='0';
			branch<='1';  
			MemToReg<='0';
		    Reg2Loc	<= '1';	 
			branchN <='0';
			B <= '0';	 
			BL<='0';
			BR<='0'; 		
			ADDI<='0';
			sf <='1';
		--cbnz
		elsif (opcode(10 downto 3)="10110101") then
			memRead<='0'; 
			memWrite<='0';
			regWrite<='0';
			ALUop<="0111";
			ALUSrc<='0';
			branch<='0';  
			MemToReg<='0';
		    Reg2Loc	<= '1';	 
			branchN <='1';
			B <= '0';	 
			BL<='0';
			BR<='0';		
			ADDI<='0';
			sf <='1';
		--b
		elsif (opcode(10 downto 5)="000101") then
			memRead<='0'; 
			memWrite<='0';
			regWrite<='0';
			ALUop<="1111";
			ALUSrc<='0';
			branch<='0';  
			MemToReg<='0';
		    Reg2Loc	<= '0';	 
			branchN <='0';
			B <= '1';	 
			BL<='0';
			BR<='0';		
			ADDI<='0';
			sf <='0';
		--bl
		elsif (opcode(10 downto 5)="100101") then
			memRead<='0'; 
			memWrite<='0';
			regWrite<='0';
			ALUop<="1111";
			ALUSrc<='0';
			branch<='0';  
			MemToReg<='0';
		    Reg2Loc	<= '0';	 
			branchN <='0';
			B <= '1';	 
			BL<='1';
			BR<='0';		
			ADDI<='0';	
			sf <='0';
		else
			memRead<='0'; 
			memWrite<='0';
			regWrite<='0';
			ALUop<="1111";
			ALUSrc<='0';
			branch<='0';  
			MemToReg<='0';
		    Reg2Loc	<= '0';	 
			branchN <='0';
			B <= '0';	 
			BL<='0';
			BR<='0'; 
			addi<='0';
			sf <='0';
		end if;		  
		
		---burbuja
	else
		memRead<='0'; 
		memWrite<='0';
		regWrite<='0';
		ALUop<="1111";
		ALUSrc<='0';
		branch<='0';  
		MemToReg<='0';
	    Reg2Loc	<= '0';	 
		branchN <='0';
		B <= '0';	 
		BL<='0';
		BR<='0'; 
		addi<='0';
		sf <='0';
	end if;
	end process;
end control;
		