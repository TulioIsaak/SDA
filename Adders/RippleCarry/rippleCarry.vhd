-- rippleCarry

library ieee;
use ieee.std_logic_1164.all;

entity rippleCarry is

generic (
	N 	: integer);

port (
	x 	 : in std_logic_vector((N-1) downto 0);
	y 	 : in std_logic_vector((N-1) downto 0);
	cin : in std_logic;
	s   : out std_logic_vector((N-1) downto 0);
	cout: out std_logic
);
end rippleCarry;

architecture behv_rippleCarry of rippleCarry is

-- fullAdder (1 bit)
component fullAdder
port(
	a	 : in std_logic;
	b	 : in std_logic;
	cin : in std_logic;
	s	 : out std_logic;
	cout: out std_logic
);
end component

begin
adder32: fullAdder
	N => 32
	GEN_REG:
	for  i in 0 to N-1 generate

end behv_rippleCarry;