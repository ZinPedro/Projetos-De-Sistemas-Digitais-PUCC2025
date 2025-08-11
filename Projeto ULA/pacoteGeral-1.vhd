library ieee;
use ieee.std_logic_1164.all;

package pacoteGeral is 	--Pacote com todos os componentes do Projeto
	
	component fulladd		--Componente do Fulladder (Somador Completo)
		port (
			Cin, x, y : IN STD_LOGIC ;
			s, Cout : OUT STD_LOGIC
		);
	end component ;
	
	component Somador4Bits	--Componente do Somador Completo de 4 Bits
		port ( 
			a,b: in std_logic_vector(3 downto 0);
			cin: in std_logic;
			soma: out std_logic_vector(3 downto 0);
			cout: out std_logic
		);
	end component ;
	
	component Mult2Num2Bits	--Componente do Multiplicador de 2 Bits 
		port ( 
			m0,m1,q0,q1: in std_logic;
			prod: out std_logic_vector (3 downto 0)
		);
	end component ;
	
	component Comparador2Num4Bits		--Componente de dois números de 4 Bits 
		PORT ( 
			 a,b : IN STD_LOGIC_vector(3 downto 0) ;
			 grt,equ,lst : OUT STD_LOGIC
		 ) ;
	 
	end component ;
	
	component Mux21	--Multiplexador 2:1 de 4 Bits 
		PORT ( 
			x : IN STD_LOGIC_VECTOR (3 downto 0) ;
			Z : IN STD_LOGIC_VECTOR (3 downto 0) ;
			y : IN STD_LOGIC;
			s: OUT STD_LOGIC_VECTOR (3 downto 0)
		 ) ;
	 
	end component ;
	
	component Mux81	--Multiplexador 8:1 de 4 Bits 
		PORT ( 
			a,b,c,d,e,f,g,h : IN STD_LOGIC_VECTOR (3 downto 0) ;
			y : IN STD_LOGIC_VECTOR (2 downto 0) ;
			s: OUT STD_LOGIC_VECTOR (3 downto 0)
			 ) ;
	end component ;
	
	
end pacoteGeral ;

