
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package dec4to16_pkg is
    component dec4to16
        Port (
            A : in STD_LOGIC_VECTOR(3 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
end package dec4to16_pkg;