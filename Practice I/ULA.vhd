-- ULA

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity ULA is
	generic	(
		SIZE : integer := 32 
	);

	port 	(
		inA		: in std_logic_vector((SIZE-1) downto 0);
		inB		: in std_logic_vector ((SIZE-1) downto 0);
		control	: in std_logic_vector((SIZE-1) downto 0);
		ulaOut	: out std_logic_vector ((SIZE-1) downto 0)
	);
end ULA;

architecture behv_ULA of ULA is
signal rs, rt, rd	: std_logic_vector(4 downto 0);
signal opcode,funct	: std_logic_vector(5 downto 0);

begin

	case control(5 downto 0) is
		when "" => ulaOut <= inA + inB;
		when "" => ulaOut <= inA - inB;
		when "" => ulaOut <= inA * inB;
		when "" => ulaOut <= inA and inB;
		when "" => ulaOut <= inA or inB;
		when "" => ulaOut <= not inA;


end behv_ULA;
