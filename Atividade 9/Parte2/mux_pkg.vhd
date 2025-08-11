
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package mux_pkg is
    component mux2to1
        Port (
            A, B : in STD_LOGIC;
            S : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;
end package mux_pkg;