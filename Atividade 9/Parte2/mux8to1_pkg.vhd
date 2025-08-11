
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package mux8to1_pkg is
    component mux8to1
        Port (
            D : in STD_LOGIC_VECTOR(7 downto 0);
            S : in STD_LOGIC_VECTOR(2 downto 0);
            Y : out STD_LOGIC
        );
    end component;
end package mux8to1_pkg;