library ieee;
use ieee.std_logic_1164.all;

entity fulladd is

port(
		a,b : in std_logic_vector(3 downto 0);
		grt, equ, lst : out std_logic
		);
		
end fulladd;

architecture logicfunc of fulladd is

	signal i: std_logic_vector(3 downto 0);
	signal j: std_logic_vector(1 downto 0);

begin

	i(3) <= a(3) XNOR b(3);
	i(2) <= a(2) XNOR b(2);
	i(1) <= a(1) XNOR b(1);
	i(0) <= a(0) XNOR b(0);
	
	equ <= i(3) and i(2) and i(1) and i(0);
	
	grt <= (a(3) and not b(3)) or (i(3) and a(2) and not b(2)) or (i(3) and i(2) and a(1) and not b(1)) or (i(3) and i(2) and a(0) and not b(0));
	
	j(0) <= grt;
	
	j(1) <= equ;
	
	lst <= j(0) NOR j(1);
	
end logicfunc;