--full adder 16 bits

library ieee;
use ieee.std_logic_1164.all;

entity adder16 is
	generic (
		M 	: integer := 16);
	
	port (
		c0: in std_logic;
		a, b: in std_logic_vector((M-1) downto 0);
		c16: out std_logic;
		s: out std_logic_vector((M-1) downto 0)
	);
end adder16;

architecture behv_adder16 of adder16 is
	signal caux: std_logic;
	signal saux: std_logic_vector((M-1) downto 0);

component adder8 
	port (
		c0: in std_logic;
		a, b: in std_logic_vector(7 downto 0);
		c8: out std_logic;
		s: out std_logic_vector(7 downto 0));
end component;

begin

	SC0: adder8 port map(c0=> c0, a=> a(7 downto 0), b=> b(7 downto 0), s=> saux(7 downto 0), c8=> caux);
	SC1: adder8 port map(c0=> caux, a=> a(15 downto 8), b=> b(15 downto 8), s=> saux(15 downto 8), c8=> c16);
						
	s <= saux;
	
end behv_adder16;	