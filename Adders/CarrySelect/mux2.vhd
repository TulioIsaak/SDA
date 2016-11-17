library ieee;
use ieee.std_logic_1164.all;

entity mux2 is
	generic (
		M 	: integer := 16);
	
	port (
		sel: in std_logic;
		a, b: in std_logic_vector((M-1) downto 0);
		saida: out std_logic_vector((M-1) downto 0)
	);
end mux2;

architecture behv_mux2 of mux2 is
begin
	with sel select
		saida <=	a when '0',
					b when '1',
					"XXXXXXXXXXXXXXXX" when others;
end behv_mux2;
