-- MacroFunction Adder

library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--declaraçao dos componentes
entity MacroFunction is
	generic (
		N 	: integer := 32);
	
	port(
		clk: in std_logic;
		a, b: in std_logic_vector((N-1) downto 0);
		cin: in std_logic;
		--cout: out std_logic;
		s: out std_logic_vector((N-1) downto 0)
	);
end MacroFunction;

--comportamento
architecture behv_MacroFunction of MacroFunction is
	signal atemp, btemp, stemp: std_logic_vector((N-1) downto 0);
begin	

process(clk)
	begin	
		if(rising_edge(clk)) then
			atemp <= a;
			btemp <= b;
			s <= atemp + btemp + cin;
		end if;
	end process;
	
end behv_MacroFunction;
