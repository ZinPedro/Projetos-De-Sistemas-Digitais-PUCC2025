library ieee;
use ieee.std_logic_1164.all;
USE work.fulladd_package.all;


entity lab09 is
port(
		SW: in std_logic_vector(10 downto 3);
		HEX1: in std_logic_vector(0 to 6);
		HEX2: in std_logic_vector(0 to 6);
		LEDR: out std_logic_vector(3 to 5)
		);
end lab09;

architecture logica of lab09 is

signal a,b : std_logic_vector(3 downto 0);
signal grt, equ, lst : std_logic;

begin
	a <= SW(10 downto 7);
	b <= SW(6 downto 3);
	
	
	stage0: full_equ PORT MAP (a, b, grt, equ, lst);
	
	LEDR(3) <= equ;
	
	LEDR(4) <= grt;
	
	LEDR(5) <= lst;


with b select
	HEX1 <= 	"0000001" when "0000", 
				"1001111" when "0001", 
				"0010010" when "0010",
				"0000110" when "0011",
				"1001100" when "0100",
				"0100100" when "0101",
				"0100000" when "0110",
				"0001111" when "0111",
				"0000000" when "1000",
				"0001100" when "1001",
				"0001000" when "1010",
				"1100000" when "1011",
				"0110001" when "1100",
				"1000010" when "1101",
				"0110000" when "1110",
				"0111000" when "1111",
				"1111111" when others;
				
with a select
	HEX2 <= 	"0000001" when "0000", 
				"1001111" when "0001", 
				"0010010" when "0010",
				"0000110" when "0011",
				"1001100" when "0100",
				"0100100" when "0101",
				"0100000" when "0110",
				"0001111" when "0111",
				"0000000" when "1000",
				"0001100" when "1001",
				"0001000" when "1010",
				"1100000" when "1011",
				"0110001" when "1100",
				"1000010" when "1101",
				"0110000" when "1110",
				"0111000" when "1111",
				"1111111" when others;
				
end logica;