
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.mux_pkg.all;

entity mux8to1 is
    Port (
        D : in STD_LOGIC_VECTOR(7 downto 0);
        S : in STD_LOGIC_VECTOR(2 downto 0);
        Y : out STD_LOGIC
    );
end mux8to1;

architecture Behavioral of mux8to1 is
    signal stage1: STD_LOGIC_VECTOR(3 downto 0);
    signal stage2: STD_LOGIC_VECTOR(1 downto 0);
begin
    
    MUX1_0: mux2to1 port map(A => D(0), B => D(1), S => S(0), Y => stage1(0));
    MUX1_1: mux2to1 port map(A => D(2), B => D(3), S => S(0), Y => stage1(1));
    MUX1_2: mux2to1 port map(A => D(4), B => D(5), S => S(0), Y => stage1(2));
    MUX1_3: mux2to1 port map(A => D(6), B => D(7), S => S(0), Y => stage1(3));
    
    
    MUX2_0: mux2to1 port map(A => stage1(0), B => stage1(1), S => S(1), Y => stage2(0));
    MUX2_1: mux2to1 port map(A => stage1(2), B => stage1(3), S => S(1), Y => stage2(1));
    
    
    MUX3: mux2to1 port map(A => stage2(0), B => stage2(1), S => S(2), Y => Y);
end Behavioral;