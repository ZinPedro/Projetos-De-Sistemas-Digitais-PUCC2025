library ieee;
use ieee.std_logic_1164.all;

entity lab04_tb is

end entity lab04_tb;
	
architecture tb of lab04_tb is
begin

	signal sw: std_logic_vector (2 downto 0);
	signal ledr: std_logic_vector (1 downto 0);
	
	begin
	uut: entity work.lab04 port map (SW => sw, LEDR => ledr);
end architecture tb;