library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity RegFile is
	 port(
		 w : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 r1 : in STD_LOGIC_VECTOR(4 downto 0);
		 r2 : in STD_LOGIC_VECTOR(4 downto 0);
		 rw : in STD_LOGIC_VECTOR(4 downto 0);
		 wData : in STD_LOGIC_VECTOR(63 downto 0);
		 read1 : out STD_LOGIC_VECTOR(63 downto 0);
		 read2 : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end RegFile;

architecture RegFile of RegFile is
type memoriains is array (0 to 31) of std_logic_vector(63 downto 0);
signal registros: memoriains:=
(
	x"0000000000000280",x"0000000000000001",x"0000000000000000",x"0000000000000002",
	x"0000000000000004",x"0000000000000005",x"0000000000000006",x"0000000000000007",
	x"0000000000000008",x"0000000000000003",x"0000000000000002",x"000000000000000b",
	x"000000000000000d",x"000000000000000c",x"000000000000000e",x"000000000000000f", 
	
	x"0000000000000010",x"0000000000000011",x"0000000000000012",x"0000000000000013",
	x"0000000000000000",x"0000000000000015",x"0000000000000016",x"0000000000000017",
	x"0000000000000018",x"0000000000000010",x"000000000000001a",x"000000000000001f",
	x"0000000000000000",x"000000000000001d",x"000000000000001e",x"000000000000001f"
);
begin
	process(clk,r1,r2,rw)
	begin
		if (w='1' and rising_edge(clk)) then
			registros(conv_integer(rw)) <= wData;
		end if;	 
		if (w = '1') then
			if (r1 = rw and r2 = rw ) then 
				read1 <= wData;
				read1 <= wData;
			elsif (r1 = rw and r2 /= rw) then
				read1 <= wData;	
				read2 <=registros(conv_integer(r2));
			elsif (r1 /= rw and r2 = rw) then
				read1 <= registros(conv_integer(r1));	
				read2 <= wData;
			else
				read1 <= registros(conv_integer(r1));	
				read2 <= registros(conv_integer(r2));
			end if;
		else 
			read1 <= registros(conv_integer(r1));	
			read2 <= registros(conv_integer(r2));
		end if;
	end process;

end RegFile;
