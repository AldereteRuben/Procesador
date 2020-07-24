---------------------------------------------------------------------------------------------------
--
-- Title       : procesador
-- Design      : procesador
-- Author      : Alumnos
-- Company     : utm
--
---------------------------------------------------------------------------------------------------
--
-- File        : procesador.vhd
-- Generated   : Fri Nov  9 08:37:04 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {procesador} architecture {procesador}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity PC is
	 port(
		 rst : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 inPC : in STD_LOGIC_VECTOR(63 downto 0);
		 outPC : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end PC;

--}} End of automatically maintained section

architecture PC of PC is
begin

	process(rst,clk)
	begin
		if rst='1' then 
			outPC<=x"00000000";
		elsif rising_edge(clk) then
			outPC<=inPC;
			
	end process;
end PC;
