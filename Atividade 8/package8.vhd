LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE fulladd_package IS

	COMPONENT fulladd

		PORT (a,b : IN std_logic_vector(3 downto 0);
		 grt, equ, lst : OUT STD_LOGIC );
	
	end component;
end fulladd_package;
