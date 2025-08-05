LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Lab02_02 IS
PORT(
	x1, x2 : IN STD_LOGIC;
	f, g : OUT STD_LOGIC
);
END Lab02_02;

ARCHITECTURE LogicFunction OF Lab02_02 IS
BEGIN
	f <= ((x1 AND x2) OR (NOT x1 AND NOT x2)) OR ((x1 AND NOT x2) OR (NOT x1 AND x2));
	g <= (x1 XNOR x2) OR (x1 XOR x2);
END LogicFunction;