
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.dec_pkg.all;

entity dec4to16 is
    Port (
        A : in STD_LOGIC_VECTOR(3 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR(15 downto 0)
    );
end dec4to16;

architecture Behavioral of dec4to16 is
    signal EN_internal: STD_LOGIC_VECTOR(3 downto 0);
begin
    
    DEC_MSB: dec2to4 port map(
        A => A(3 downto 2),
        EN => EN,
        Y => EN_internal
    );
    
    
    DEC_LSB0: dec2to4 port map(
        A => A(1 downto 0),
        EN => EN_internal(0),
        Y => Y(3 downto 0)
    );
    
    DEC_LSB1: dec2to4 port map(
        A => A(1 downto 0),
        EN => EN_internal(1),
        Y => Y(7 downto 4)
    );
    
    DEC_LSB2: dec2to4 port map(
        A => A(1 downto 0),
        EN => EN_internal(2),
        Y => Y(11 downto 8)
    );
    
    DEC_LSB3: dec2to4 port map(
        A => A(1 downto 0),
        EN => EN_internal(3),
        Y => Y(15 downto 12)
    );
end Behavioral;