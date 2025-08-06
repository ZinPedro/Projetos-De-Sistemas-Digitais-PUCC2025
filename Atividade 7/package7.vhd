library ieee;
use ieee.std_logic_1164.all;
use work.all;

package somador_package is 
	
	component somador
		port (
			a, b, carryin: in std_logic;
			soma, carryout: out std_logic
		);
	end component ;
	
end somador_package ;