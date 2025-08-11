LIBRARY ieee ;
USE ieee.std_logic_1164.all;


ENTITY Mux21 IS	--Programa para Multiplexador 2:1 com 4 Bits (entrada e saída)

PORT ( 

    x : IN STD_LOGIC_VECTOR (3 downto 0) ; 	--Primeira Entrada 
	 Z : IN STD_LOGIC_VECTOR (3 downto 0) ;	--Segunda Entrada
	 y : IN STD_LOGIC;								--Seletor
    s: OUT STD_LOGIC_VECTOR (3 downto 0)		--Saída
    ) ;


END Mux21;


ARCHITECTURE LogicFunc OF Mux21 IS

BEGIN

    WITH Y SELECT			--Se O seletor(Y) for 0 seleciona primeira saída(X), caso contrário, seleciona a segunda saída(Z)
		S <= X WHEN '0',	
		     Z WHEN OTHERS;
			
END LogicFunc ;