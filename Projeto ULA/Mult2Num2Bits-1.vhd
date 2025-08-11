library ieee;
use ieee.std_logic_1164.all;
use work.pacoteGeral.all;

entity Mult2Num2Bits is			-- Programa para Multiplicador de 2 Números de 2 Bits


port ( 
		
	 m0,m1,q0,q1: in std_logic;					--Entradas do Programa (2 números)
	 prod: out std_logic_vector (3 downto 0)	--Saída do Programa (Produto (4 Bits))
    ) ;


end Mult2Num2Bits;

architecture logica of Mult2Num2Bits is

    signal carry: std_logic;								--Sinal para utilização de um carry out do primeiro fulladd
    signal conta: std_logic_vector (2 downto 0);	--Sinal para realização de operações prévias para utilização

begin
    prod(0) <= q0 AND m0;	--Bit MENOS significativo do Produto

    conta(0) <= q0 AND m1;	--Conta para utilizar no fulladd
    conta(1) <= q1 AND m0;	--Conta para utilizar no fulladd

    stage1: fulladd PORT MAP (conta(1), conta(0), '0' , prod(1),carry);	--Fulladd que tem como resultado, o SEGUNDO bit MENOS significativo do produto e um carry

    conta(2) <= q1 AND m1;	--Conta para utilizar no segundo fulladd

    stage2: fulladd PORT MAP (carry, conta(2), '0' ,prod(2),prod(3));	--Fulladd que tem como resultado, os dois bits MAIS significativo do produto, sendo o carry o mais significativo.

end logica;