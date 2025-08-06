library ieee;
use ieee.std_logic_1164.all;
use work.all;
--use work.somador_package.all;

entity Lab08 is

port(

	SW: in std_logic_vector(3 downto 0);
	HEX7,HEX5, HEX3: out std_logic_vector (0 to 6)
);

end Lab08;

architecture logica of Lab08 is

	signal a,b: std_logic_vector(1 downto 0);
	signal produto: std_logic_vector (3 downto 0);
	signal carry: std_logic;
	signal operacao: std_logic_vector(2 downto 0);
	
begin 

	a <= SW(3 downto 2);
	b <= SW(1 downto 0);
	
	produto(0) <= SW(0) AND SW(2);
	
	operacao(0) <= SW(0) AND SW(3);
	operacao(1) <= SW(1) AND SW(2);
	operacao(2) <= SW(1) AND SW(3);
	
	
	stage0: somador PORT MAP(operacao(0),operacao(1),'0',produto(1),carry);
	stage1: somador PORT MAP(operacao(2),carry,'0',produto(2),produto(3));
	
with b select 
	HEX3 <= "0000001" when "00",
			  "1001111" when "01",
			  "0010010" when "10",
			  "0000110" when "11",
			  "1111111" when others;
			  
with a select 
	HEX5 <= "0000001" when "00",
			  "1001111" when "01",
			  "0010010" when "10",
			  "0000110" when "11",
			  "1111111" when others;
			  
with produto select 
	HEX7 <= "0000001" when "0000",
			  "1001111" when "0001",
			  "0010010" when "0010",
			  "0000110" when "0011",
			  "1001100" when "0100",
			  "0100100" when "0101",
			  "0100000" when "0110",
			  "0001111" when "0111",
			  "0000000" when "1000",
			  "0001100" when "1001",
			  "1111111" when others;
			  
end logica;