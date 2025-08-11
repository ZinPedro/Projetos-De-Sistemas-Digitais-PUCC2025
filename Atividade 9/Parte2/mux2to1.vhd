
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
    Port (
        A, B : in STD_LOGIC;
        S : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end mux2to1;

architecture Behavioral of mux2to1 is
begin
    Y <= (A and not S) or (B and S);
end Behavioral;