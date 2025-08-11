library ieee;
use ieee.std_logic_1164.all;
use work.pacoteGeral.all;

entity Somador4Bits is  -- Programa somador ripple carry de 4 bits


port ( 

    a,b: in std_logic_vector(3 downto 0);    	-- Numeros de 4 bits
    cin: in std_logic;                          -- Carry in da Soma = 0
    soma: out std_logic_vector(3 downto 0);     -- Resultado da operacao da Soma
    cout: out std_logic                         -- Carry out final da Soma
    );


end Somador4Bits;

architecture logica of Somador4Bits is

    signal carry: std_logic_vector (3 downto 1); -- Sinal carry

begin 

    -- Soma bit a bit de a e b usando o Port map do somador compelto (fulladd)

     stage0: fulladd PORT MAP (a(0), b(0), cin, soma(0), carry(1)); 
     stage1: fulladd PORT MAP (a(1), b(1), carry(1), soma(1), carry(2)); 
     stage2: fulladd PORT MAP (a(2), b(2), carry(2), soma(2), carry(3));
     stage3: fulladd PORT MAP (a(3), b(3), carry(3), soma(3), cout);

end logica;