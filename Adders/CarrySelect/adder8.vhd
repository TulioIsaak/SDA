library ieee;
use ieee.std_logic_1164.all;

entity adder8 is 
	port (
		c0: in std_logic;
		a, b: in std_logic_vector(7 downto 0);
		c8: out std_logic;
		s: out std_logic_vector(7 downto 0)
	);
end adder8;

architecture behv_adder8 of adder8 is
	signal c1: std_logic_vector(7 downto 1);

component fullAdder
	port(
		a	 : in std_logic;
		b	 : in std_logic;
		cin : in std_logic;
		s	 : out std_logic;
		cout: out std_logic);
end component;

begin

	SC0: fullAdder port map(a(0), b(0), c0, s(0), c1(1));
	
	GEN_ADD:
	for  i in 1 to 6 generate
		SCI: fullAdder port map
			(a(i), b(i), c1(i), s(i), c1(i+1));
	end generate GEN_ADD;

	SC7: fullAdder port map(a(7), b(7), c1(7), s(7), c8);

end behv_adder8;
