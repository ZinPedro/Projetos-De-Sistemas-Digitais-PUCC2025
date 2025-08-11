library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package dec_pkg is
    component dec2to4
        Port ( 
            A : in STD_LOGIC_VECTOR(1 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
end package dec_pkg;