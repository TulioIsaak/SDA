-- rippleCarry

library ieee;
use ieee.std_logic_1164.all;

entity rippleCarry is

generic (
	N 	: integer := 32);

port (
	clk : in std_logic;
	x 	 : in std_logic_vector((N-1) downto 0);
	y 	 : in std_logic_vector((N-1) downto 0);
	cin : in std_logic;
	s   : out std_logic_vector((N-1) downto 0);
	cout: out std_logic
);
end rippleCarry;

architecture behv_rippleCarry of rippleCarry is
signal c: std_logic_vector((N-1) downto 1);

-- fullAdder (1 bit)
component fullAdder
port(
	a	 : in std_logic;
	b	 : in std_logic;
	cin : in std_logic;
	s	 : out std_logic;
	cout: out std_logic
);
end component;

	signal xtemp, ytemp, stemp: std_logic_vector((N-1) downto 0);

begin

process(clk)
	begin	
			if(rising_edge(clk)) then
				s <= stemp;
				xtemp <= x;
				ytemp <= y;
			end if;
	end process;

	adder0: fullAdder port map
			(a=>xtemp(0), b=>ytemp(0), cin=>cin, s=>stemp(0), cout=>c(1));
	
	GEN_ADD:
	for  i in 1 to N-2 generate
		adderI: fullAdder port map
			(a=>xtemp(i), b=>ytemp(i), cin=>c(i), s=>stemp(i), cout=>c(i+1));
	end generate GEN_ADD;
	
	adder31: fullAdder port map
			(a=>xtemp(N-1), b=>ytemp(N-1), cin=>c(N-1), s=>stemp(N-1), cout=>cout);
		
end behv_rippleCarry;