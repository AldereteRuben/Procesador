library IEEE;
use IEEE.STD_LOGIC_1164.all;	
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity SegID is
	port(
		 Chip_E: in std_logic;
		 RST : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 --control
		 InSF : in STD_LOGIC;
		 InAddi : in STD_LOGIC;
		-- InBranchN : in STD_LOGIC;
		 InMemToReg : in STD_LOGIC;
		 --InBl : in STD_LOGIC;
		 --InBr : in STD_LOGIC;
		 --InB : in STD_LOGIC;
		 inMemWrite : in STD_LOGIC;
		 InRegWrite	: in STD_LOGIC;
		 inMemRead : in STD_LOGIC;
		 --inBranch : in STD_LOGIC;
		 inALUSrc : in STD_LOGIC;
		 InALUop : in STD_LOGIC_VECTOR(3 downto 0);
		 
		 Inread1 : in STD_LOGIC_VECTOR(63 downto 0);
		 Inread2 : in STD_LOGIC_VECTOR(63 downto 0);
		 inRdout : in STD_LOGIC_VECTOR(4 downto 0);
		 InMemout : in STD_LOGIC_VECTOR(8 downto 0);
		 InInmeout : in STD_LOGIC_VECTOR(10 downto 0);
		 --InBnzout : in STD_LOGIC_VECTOR(18 downto 0);
		-- inBout : in STD_LOGIC_VECTOR(25 downto 0);	 	
		 
		 --salidas	  
		 --control
		 outSF : out STD_LOGIC;
		 outAddi : out STD_LOGIC;
		 --outBranchN : out STD_LOGIC;
		 outMemToReg : out STD_LOGIC;
		-- outBl : out STD_LOGIC;
		 outBr : out STD_LOGIC;
		 outB : out STD_LOGIC;
		 outMemWrite : out STD_LOGIC;
		 outRegWrite : out STD_LOGIC;
		 outMemRead : out STD_LOGIC;
		 --outBranch : out STD_LOGIC;
		 outALUSrc : out STD_LOGIC;
		 outALUop : out STD_LOGIC_VECTOR(3 downto 0);  
		 
		 
		 outread1 : out STD_LOGIC_VECTOR(63 downto 0);
		 outread2 : out STD_LOGIC_VECTOR(63 downto 0);
		 outRdout : out STD_LOGIC_VECTOR(4 downto 0);
		 outMemout : out STD_LOGIC_VECTOR(63 downto 0);
		 outInmeout : out STD_LOGIC_VECTOR(63 downto 0)
		 --outBnzout : out STD_LOGIC_VECTOR(63 downto 0);
		-- outBout : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end SegID;

--}} End of automatically maintained section

architecture SegID of SegID is
begin
	process(rst,clk)
	variable a,b : STD_LOGIC_VECTOR(51 downto 0);
	
	begin  
		a:=x"0000000000000";	
		b:=x"fffffffffffff"; 
	if (Chip_E = '1') then
		if rst='1' then 
			outSF <= '0'; 
			outAddi <='0'; 
		--	outBranchN <= '0';	 
			outMemToReg <='0';	
			--outBl <= '0';	  
			---outBr <='0'; 
			--outB <='0';	
			outMemWrite <='0';
			outRegWrite	<='0';
			outMemRead <= '0'; 
		--	outBranch <='0'; 
			outALUSrc <='0'; 
			outALUop <= x"0";
			outread1<= x"0000000000000000";
			outread2<= x"0000000000000000";			
			outRdout <= x"0"&'0';
			outMemout <=x"0000000000000000";--00"&'0'; 
			outInmeout <=x"0000000000000000";--x"00"&"000";  
			--outBnzout <= x"0000"&"000";	 
			--outBout <= x"0000000000000000";--x"000000"&"00";
			
			

		elsif falling_edge(clk) then 
			
			outSF <= InSF; 
			outAddi <=InAddi; 
			--outBranchN <=InBranchN;	 
			outMemToReg <=InMemToReg;	
		--	outBl <= InBl;	  
		--	outBr <=InBr; 
		--	outB <=InB;	
			outMemWrite <=InMemWrite;
			outRegWrite<= InRegWrite;
			outMemRead <= InMemRead; 
			--outBranch <=InBranch; 
			outALUSrc <=InALUSrc; 
			outALUop <=InALUop;
			outread1<= Inread1;
			outread2<= Inread2;	 
			outRdout <= InRdout; 
			
			
			if (InMemout(8)='1' ) then
				outMemout<= b & "111" & InMemout;
			else
				outMemout<= a & "000" & InMemout;	
			end if;	   
			
			
			
			if (InInmeout(10)='1' ) then
				outInmeout<= b & '1' & InInmeout;
			else
				outInmeout<= a & '0' & InInmeout;	
			end if;	 
			
			--if (InBnzout(18)='1' ) then
			--	outBnzout<= b&InBnzout&"00";
			--else
			--	outBnzout<= a&InBnzout&"00";	
			--end if;		
			
			 
			--outBout <= X"000000000" & InBout & "00";
			
		
		end if;
	end if;		
		
	end process;


end SegID;
