-- Carry Look Ahead Adder

library ieee;
use ieee.std_logic_1164.all;

--declaraçao dos componentes
entity CarryLookAhead is
	generic (
		N 	: integer := 32);
	
	port(
		clk: in std_logic;
		a, b: in std_logic_vector((N-1) downto 0);
		cin: in std_logic;
		cout: out std_logic;
		s: out std_logic_vector((N-1) downto 0)
	);
end CarryLookAhead;

--comportamento
architecture behv_CarryLookAhead of CarryLookAhead is

	signal g, p, c: std_logic_vector((N-1) downto 0); --sinais para generate, propagate e carry
	signal atemp, btemp, stemp: std_logic_vector((N-1) downto 0);
begin	

process(clk)
	begin	
			if(rising_edge(clk)) then
				s <= stemp;
				atemp <= a;
				btemp <= b;
			end if;
	end process;
	
	p <= atemp xor btemp;
	g <= atemp and btemp;
	
	c(0) <= cin;
	GEN_CARRY:
	for  i in 1 to N-2 generate
		c(i) <= g(i-1) or (p(i-1) and c(i-1));
	end generate GEN_CARRY;
	cout <= g(N-1) or (p(N-1) and c(N-1));
	
	stemp <= c xor p;
end behv_CarryLookAhead;
