LIBRARY ieee ;
use ieee.std_logic_1164.all;


ENTITY Comparador2Num4Bits IS 	-- Programa do comparador de 2 numeros de 4 bits

PORT ( 

    a,b : IN STD_LOGIC_vector(3 downto 0) ; 		-- Entradas 'a' e 'b' (4 bits)
    grt,equ,lst : OUT STD_LOGIC                 -- Saidas grt (a > b), equ (a = b) e lst (a < b)
    ) ;


END Comparador2Num4Bits ;


ARCHITECTURE LogicFunc OF Comparador2Num4Bits IS

    signal i: std_logic_vector(3 downto 0); -- Sinal 'i' para calcular o resultado do xnor entre cada bit de 'a' e 'b' e assim realzar a operacao do grt
    signal j: std_logic_vector(1 downto 0); -- Sinal 'j' para calcular o resultado 'grt' e 'equ' para que possa calcular o 'lst'

BEGIN

     i <= a xnor b; -- Operacao para obter cada 'i'
	  
		--Utilização do Sinal 'j' para funcionar como operador na saída 'lst'
     j(0) <= ((a(3) and not b(3)) or (i(3) and a(2) and not b(2)) or (i(3) and i(2) and a(1) and not b(1)) or (i(3) and i(2) and i(1) and a(0) and not b(0))); -- Operacao para obter o 'grt'
     j(1) <= i(3) and i(2) and i(1) and i(0); -- Operacao para obter o 'equ'

     grt <= j(0); -- resultado de 'j(0)' move para a saida 'grt'
     equ <=j(1);  -- resultado de 'j(1)' move para a saida 'equ'
	  lst <= j(1) nor j(0); -- nor entre 'grt' e 'equ' para calcular o 'lst'


END LogicFunc ;