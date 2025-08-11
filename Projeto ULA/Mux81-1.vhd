LIBRARY ieee ;
USE ieee.std_logic_1164.all;
use work.pacoteGeral.all;

ENTITY Mux81 IS 		--Programa para Multiplexador 8:1 com 4 Bits (entrada e saída)

PORT ( 

    a,b,c,d,e,f,g,h : IN STD_LOGIC_VECTOR (3 downto 0) ;		--8 Entradas (4 Bits)
	 y : IN STD_LOGIC_VECTOR (2 downto 0) ;						--Seletor (3 Bits)
	 s: OUT STD_LOGIC_VECTOR (3 downto 0)							--Saída (4 Bits)
    ) ;


END Mux81 ;


ARCHITECTURE LogicFunc OF Mux81 IS

	signal mux1,mux2,mux3,mux4,mux5,mux6: std_logic_vector(3 downto 0); --Sinais para Operações nos MUX 2:1

BEGIN

    stage0: Mux21 PORT MAP(a,b,y(0),mux1);			--4 MUX 2:1 com as 8 entradas e o Bit Menos significativo do seletor
	 stage1: Mux21 PORT MAP(c,d,y(0),mux2);
	 stage2: Mux21 PORT MAP(e,f,y(0),mux3);
	 stage3: Mux21 PORT MAP(g,h,y(0),mux4);
	 
	 stage4: Mux21 PORT MAP(mux1,mux2,y(1),mux5);	--2 MUX 2:1 com as 4 saídas dos 4 MUX anteriores e o Segundo Bit Menos significativo do seletor
	 stage5: Mux21 PORT MAP(mux3,mux4,y(1),mux6);
	 
	 stage6: Mux21 PORT MAP(mux5,mux6,y(2),s);		--1 MUX 2:1 com as 2 saídas dos 2 MUX anteriores e o Bit Mais significativo do seletor
																	--s é a saída final do MUX 8:1
END LogicFunc ;