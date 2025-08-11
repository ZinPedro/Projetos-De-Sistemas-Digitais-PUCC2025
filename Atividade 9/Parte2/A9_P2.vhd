
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.mux8to1_pkg.all;

entity LAB10_02 is
    Port (
        SW : in STD_LOGIC_VECTOR(10 downto 0); 
        LEDR : out STD_LOGIC_VECTOR(0 downto 0)
    );
end LAB10_02;

architecture Behavioral of LAB10_02 is
begin
    MUX: mux8to1 port map(
        D => SW(10 downto 3),
        S => SW(2 downto 0),
        Y => LEDR(0)
    );
end Behavioral;