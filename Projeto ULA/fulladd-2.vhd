LIBRARY ieee ;
USE ieee.std_logic_1164.all;


ENTITY fulladd IS    -- Programa do somador completo de 2 numeros de 1 bit

PORT ( 

    Cin, x, y : IN STD_LOGIC ; -- Entradas cin ('0') e x e y
    s, Cout : OUT STD_LOGIC    -- Saidas da soma s (resultado) e o cout (carry out)
    ) ;


END fulladd ;


ARCHITECTURE LogicFunc OF fulladd IS

BEGIN

    -- Operacao soma de x e y e o calculo do carry out

    s <= x XOR y XOR Cin ;
    Cout <= (x AND y) OR (Cin AND x) OR (Cin AND y) ;

END LogicFunc ;