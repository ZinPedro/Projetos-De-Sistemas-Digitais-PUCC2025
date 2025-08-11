library ieee;
use ieee.std_logic_1164.all;
use work.pacoteGeral.all;  --Pacote com todos os componentes

Entity Projeto is 

PORT (

	SW: in std_logic_vector (10 downto 0);  --Entradas (Placa)
	HEX0, HEX2, HEX4, HEX6: out std_logic_vector (0 to 6); --Saídas (Placa) (Visores 7-segmentos)
	LEDR: out std_logic_vector (5 downto 0) --Saídas (Placa)(LEDS)
);

end Projeto;

Architecture Logica of Projeto is 

	signal a,b,result: std_logic_vector (3 downto 0); --Sinais que definem a,b e resultado e o número de bits
	signal AluOp: std_logic_vector (2 downto 0); --Sinal que define o operador da ULA, definindo qual operação será realizada
	signal cout,cout0,cout1,zero,overflow, overflowsoma, overflowsub,equ,grt,lst,nzero,m7,nof: std_logic; --sinais para saídas de LED e auxiliares
	signal nop, AandB, AorB, notB, AmaisB, AmenosB, AmultB, AcompB: std_logic_vector (3 downto 0); --sinais para o resultado de cada operação

begin 

	a <= SW(10 downto 7);		--Definição das entradas da placa que correspondem a entrada 'a'
	b <= SW(6 downto 3);		--Definição das entradas da placa que correspondem a entrada 'b'
	AluOp <= SW(2 downto 0);	--Definição das entradas da placa que correspondem a entrada 'AluOP'
	
	AandB <= a AND b;	--Operação 'a' AND 'b'
	
	AorB <= a OR b;		--Operação 'a' OR 'b'
	
	notB <= NOT b;		--Operação NOT 'b'
	
	stage0: Somador4Bits port map (a,b,'0',AmaisB,cout0);		--Operação de SOMA entre 'a' e 'b'
	
	stage1: somador4Bits port map (a,notB,'1',AmenosB,cout1);	--Operação de SUBTRAÇÃO entre 'a' e 'b'
	
	stage2: Mult2Num2Bits port map (a(0),a(1),b(0),b(1),AmultB);	--Operação de MULTIPLICAÇÃO entre 'a' e 'b' (apenas os dois bits MENOS significativos)
	
	stage3: Comparador2Num4Bits port map (a,b,grt,equ,lst);		--Operação de COMPARAÇÃO entre 'a' e 'b'
	
	AcompB <= "0000";		--Define o resultado como 0 quando estiver selecionado a operação de comparação (resultados estão representados no LED)
	
	stage4: Mux81 port map (nop, AandB, AorB, notB, AmaisB, AmenosB, AmultB, AcompB, AluOp, result); --MUX 8:1 de 4 bits para escolha da operação na ULA
	
	stage5: Comparador2Num4Bits port map (result, AcompB, nzero, zero, nzero); 	--Compara resultado com 0 para possível ativação da 'ZERO FLAG'
	
	overflowsoma <= (a(3) AND b(3) AND NOT result(3)) OR (NOT a(3) AND notb(3) AND result(3));	--Define o overflow quando a operação é uma SOMA
	overflowsub <= (a(3) AND notb(3) AND NOT result(3)) OR (NOT a(3) AND b(3) AND result(3));	--Define o overflow quando a operação é uma SUBTRAÇÃO
	
	LEDR(0) <= cout;		--Define saída que representa o Cout
	LEDR(1) <= zero AND nop(0);	--Define saída que representa a ZERO FLAG (Caso a operação seja NOP, ZERO FLAG é desligada independente do resultado)
	LEDR(2) <= overflow;		--Define saída que representa o Overflow
	
	with AluOp select		--Define Resultado do Overflow dependendo da operação (soma ou subtração)(Caso outra, não existe overflow)
	
	 overflow <= overflowsoma when "100",
					 overflowsub when "101",
					 '0' when others;
	
	with AluOp select		--Define resultado para "0000" quando selecionado a operação NOP (caso contrário, nop(0) é 1 para operação com a ZERO FLAG
	
	 nop <= "0000" when "000",
			  "1111" when others;
 
	with AluOp select		--Saída que mostra, na placa, o número da operação que está sendo realizada na ULA
	
    HEX0 <=     "0000001" when "000",
                "1001111" when "001",
                "0010010" when "010",
                "0000110" when "011",
                "1001100" when "100",
                "0100100" when "101",
                "0100000" when "110",
                "0001111" when "111",
                "1111111" when others;
					 
	with AluOp select		--Define Resultado do Cout dependendo da operação (soma ou subtração)(Caso outra, não existe Cout)
	
		cout <= cout0 when "100",
				  cout1 when "101",
				  '0' when others; 
				  
	with AluOp select		--Caso selecionado a operação de comparação, liga se 'a' e 'b' forem iguais (resultado comparação)
	
		LEDR(3) <= equ when "111",
					 '0' when others; 
					 
	with AluOp select		--Caso selecionado a operação de comparação, liga se 'a' for maior que 'b' (resultado comparação)
	
		LEDR(4) <= grt when "111",
					 '0' when others; 
					 
	with AluOp select		--Caso selecionado a operação de comparação, liga se 'a' for menor que 'b' (resultado comparação)
	
		LEDR(5) <= lst when "111",
					 '0' when others; 
	
	with a select			--Saída que mostra, na placa, o número de 'a' correspondente


    HEX4 <=     "0000001" when "0000",
                "1001111" when "0001",
                "0010010" when "0010",
                "0000110" when "0011",
                "1001100" when "0100",
                "0100100" when "0101",
                "0100000" when "0110",
                "0001111" when "0111",
                "0000000" when "1000",
                "0001100" when "1001",
                "0001000" when "1010",
                "1100000" when "1011",
                "0110001" when "1100",
                "1000010" when "1101",
                "0110000" when "1110",
                "0111000" when "1111",
                "1111111" when others;
				 
	with b select			--Saída que mostra, na placa, o número de 'b' correspondente

    HEX2 <=     "0000001" when "0000",
                "1001111" when "0001",
                "0010010" when "0010",
                "0000110" when "0011",
                "1001100" when "0100",
                "0100100" when "0101",
                "0100000" when "0110",
                "0001111" when "0111",
                "0000000" when "1000",
                "0001100" when "1001",
                "0001000" when "1010",
                "1100000" when "1011",
                "0110001" when "1100",
                "1000010" when "1101",
                "0110000" when "1110",
                "0111000" when "1111",
                "1111111" when others;
					 
	with result select		--Saída que mostra, na placa, o número do Resultado correspondente

    HEX6 <=     "0000001" when "0000",
                "1001111" when "0001",
                "0010010" when "0010",
                "0000110" when "0011",
                "1001100" when "0100",
                "0100100" when "0101",
                "0100000" when "0110",
                "0001111" when "0111",
                "0000000" when "1000",
                "0001100" when "1001",
                "0001000" when "1010",
                "1100000" when "1011",
                "0110001" when "1100",
                "1000010" when "1101",
                "0110000" when "1110",
                "0111000" when "1111",
                "1111111" when others;				 
	
end Logica;