-- Carry Select Adder

library ieee;
use ieee.std_logic_1164.all;

entity CarrySelect is

generic (
	N 	: integer := 32);

port (
	clk : in std_logic;
	x 	 : in std_logic_vector((N-1) downto 0);
	y 	 : in std_logic_vector((N-1) downto 0);
	--cin : in std_logic;
	s: out std_logic_vector((N-1) downto 0);
	cout: out std_logic
);
end CarrySelect;

architecture behv_CarrySelect of CarrySelect is
	signal xtemp0: std_logic_vector (15 downto 0) := x(15 downto 0);
	signal xtemp1: std_logic_vector (15 downto 0) := x((N-1) downto 16);
	signal ytemp0: std_logic_vector (15 downto 0) := y(15 downto 0);
	signal ytemp1: std_logic_vector (15 downto 0) := y((N-1) downto 16);
	signal s10, s11, s20, s21: std_logic_vector (15 downto 0);
	signal cin: std_logic := '0';
	signal cout10, cout11, cout20, cout21: std_logic;
		
	signal stemp: std_logic_vector((N-1) downto 0);

	
component adder16 is
	generic (
		M 	: integer := 16);
	
	port (
		c0: in std_logic;
		a, b: in std_logic_vector((M-1) downto 0);
		c16: out std_logic;
		s: out std_logic_vector((M-1) downto 0)
	);
end component;
	
component mux2
	generic (
		M 	: integer := 16);
	
	port (
		sel: in std_logic;
		a, b: in std_logic_vector((M-1) downto 0);
		saida: out std_logic_vector((M-1) downto 0)
	);
end component;

begin
	process(clk)
		begin	
			if(rising_edge(clk)) then
				s <= stemp;
				xtemp0 <= x(15 downto 0);
				xtemp1 <= x((N-1) downto 16);
				ytemp0 <= y(15 downto 0);
				ytemp1 <= y((N-1) downto 16);
			end if;
	end process;


	A10: adder16 port map (c0 => cin, a => xtemp0, b => ytemp0, s => s10, c16 =>cout10);
	A11: adder16 port map (c0 => '1', a => xtemp0, b => ytemp0, s => s11, c16 =>cout11);
	muxA: mux2 port map (sel  => cin, a => s10, b => s11, saida => stemp(15 downto 0));
	
	A20: adder16 port map (c0 => cin, a => xtemp1, b => ytemp1, s => s20, c16 => cout20);
	A21: adder16 port map (c0 => '1', a => xtemp1, b => ytemp1, s => s21, c16 => cout21);
	muxB: mux2 port map (sel  => cout10, a => s20, b => s21, saida => stemp(31 downto 16));
	
	with cout10 select
		cout <=	cout20 when '0',
					cout21 when others;
		
end behv_CarrySelect;