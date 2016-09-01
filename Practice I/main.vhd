-- main

library ieee;
use ieee.std_logic_1164.all;
use work.type_package.all;

type bank is array(31 downto 0) of register;

entity main is

	generic	(
		SIZE : integer := 32
	);
	
	port 	(
		bank	: in array;
	);

end main;

architecture behv_main of main is

begin
--
--muxRS:	mux_32
--			port map(banco, sel1, rs);

end behv_main;