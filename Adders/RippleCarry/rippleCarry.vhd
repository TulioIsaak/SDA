-- rippleCarry

library ieee;
use ieee.std_logic_1164.all;

entity rippleCarry is

generic (
	N 	: integer := 32);

port (
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

begin
	adder0: fullAdder port map
			(a=>x(0), b=>y(0), cin=>cin, s=>s(0), cout=>c(1));
	
	GEN_ADD:
	for  i in 1 to N-2 generate
		adderI: fullAdder port map
			(a=>x(i), b=>y(i), cin=>c(i), s=>s(i), cout=>c(i+1));
	end generate GEN_ADD;
	
	adder31: fullAdder port map
			(a=>x(31), b=>y(31), cin=>c(31), s=>s(31), cout=>cout);
		
end behv_rippleCarry;
