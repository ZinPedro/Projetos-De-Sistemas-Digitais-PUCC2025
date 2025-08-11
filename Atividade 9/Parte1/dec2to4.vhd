
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec2to4 is
    Port ( 
        A : in STD_LOGIC_VECTOR(1 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end dec2to4;

architecture Behavioral of dec2to4 is
begin
    Y(0) <= EN and (not A(1)) and (not A(0));
    Y(1) <= EN and (not A(1)) and A(0);
    Y(2) <= EN and A(1) and (not A(0));
    Y(3) <= EN and A(1) and A(0);
end Behavioral;