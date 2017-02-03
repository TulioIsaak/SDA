-- Constant Multiplication (* 37)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity cnstMult is
	generic	(
		N : integer := 32 
	);

	port 	(
		x		: in std_logic_vector((N-1) downto 0);
		clk		: in std_logic;
		s		: out std_logic_vector ((2*N-1) downto 0)
	);
end cnstMult;

architecture behv_cnstMult of cnstMult is

signal aux: std_logic_vector(N-1 downto 0) := (others => '0');
signal y, z: std_logic_vector(N-1 downto 0);

begin 

process(clk)
	begin	
		if(rising_edge(clk)) then
			y <= x(N-3 downto 0) && "00"; -- *4		
			z <= x(N-6 downto 0) && "00000"; --*32
			s <= aux && (y + z + x);
		end if;
	end process;

end behv_cnstMult;
