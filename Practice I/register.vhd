-- digital register of n bits

library ieee;
use ieee.std_logic_1164.all;

entity register is
	generic	(
		SIZE : integer := 32 --defines the size of the register
	);

	port 	(
		din		: in std_logic_vector((SIZE-1) downto 0);
		clk		: in std_logic;
		reset  	: in std_logic;
		dout	: out std_logic_vector ((SIZE-1) downto 0)
	);
end entity;

architecture behv_register of register is
begin
	process (reset, clk)
	begin
		if (reset = '0') then 
				dout <= (OTHERS => '0');
		elsif clk'event and clk = '1' then
				dout <= din;
		end if;
	end process;
end behv_register;
