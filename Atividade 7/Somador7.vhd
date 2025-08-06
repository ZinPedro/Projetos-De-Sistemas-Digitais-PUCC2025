library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity somador is

port (

	a, b, carryin: in std_logic;
	soma, carryout: out std_logic
	);
	
end somador;

architecture logica of somador is

begin

	soma <= a XOR b XOR carryin;
	carryout <= (a AND b) OR (a AND carryin) OR (b AND carryin);
	
end logica;