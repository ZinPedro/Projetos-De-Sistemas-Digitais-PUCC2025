library ieee;
use ieee.std_logic_1164.all;

entity lab04 is
port (
	SW: in std_logic_vector (2 downto 0);
	LEDR: OUT std_logic_vector (1 downto 0)
	);
end entity lab04;
	
architecture bhv of lab04 is
begin

	LEDR(0) <= SW(0) XOR SW(1) XOR SW(2);
	LEDR(1) <= (SW(1) AND SW(2)) OR (SW(0) AND SW(2)) OR (SW(0) AND SW(1));
	
end architecture bhv;