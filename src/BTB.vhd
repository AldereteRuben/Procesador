library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_unsigned.all;

entity BTB is
	port(
	clk : in STD_LOGIC;
	pc : in STD_LOGIC_VECTOR (63 downto 0);
	pcw : in STD_LOGIC_VECTOR (63 downto 0);
	contin : in STD_LOGIC_VECTOR (1 downto 0);	
	targetin : in STD_LOGIC_VECTOR (63 downto 0);
	we : in STD_LOGIC;
	targetout : out STD_LOGIC_VECTOR (63 downto 0);
	contout : out STD_LOGIC_VECTOR (1 downto 0);
	ctrl : out STD_LOGIC
	);
end BTB;

architecture BTB of BTB is	 

type BTB is array (0 to 31) of std_logic_vector(67 downto 0);
signal branch: BTB :=
(
	x"00000000000000000",
	x"00000000000000000",
	x"00000000000000000", 
	x"00000000000000000",
	
	x"00000000000000000",
	x"00000000000000000",
	x"00000000000000000", 
	x"00000000000000000",
	
	x"00000000000000000",
	x"00000000000000000",
	x"00000000000000000", 
	x"00000000000000000",
				
	x"00000000000000000",
	x"00000000000000000",
	x"00000000000000000", 
	x"00000000000000000",
	
	x"00000000000000000",
	x"00000000000000000",
	x"00000000000000000", 
	x"00000000000000000",
	
	x"00000000000000000",
	x"00000000000000000",
	x"00000000000000000", 
	x"00000000000000000",
	
	x"00000000000000000",
	x"00000000000000000",
	x"00000000000000000", 
	x"00000000000000000",
	
	x"00000000000000000",
	x"00000000000000000",
	x"00000000000000000", 
	x"00000000000000000"
);

begin
	process (pcw,pc,clk)
	begin
		if (we='1' and rising_edge(clk)) then
			branch(conv_integer(pcw(6 downto 2)))<= "00" & contin & targetin ;
		end if;
		targetout <= branch(conv_integer(pc(6 downto 2)))(63 downto 0);
		contout <= branch(conv_integer(pc(6 downto 2)))(65 downto 64);	
		ctrl <= branch (conv_integer(pc(6 downto 2)))(65);
	end process;
end BTB; 

