LIBRARY IEEE;

use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


ENTITY reg_component IS
	--GENERIC(n:NATURAL :=32);
	PORT (
	I: IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	CLK, load, INC, CLR: IN STD_LOGIC; 
	O: OUT  STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END reg_component;

ARCHITECTURE Behavioral OF reg_component IS
	SIGNAL temp: STD_LOGIC_VECTOR (31 DOWNTO 0);
BEGIN
	PROCESS(clk)
	BEGIN
	IF(rising_edge(clk))THEN
		IF(load ='1') THEN
			temp <= I;
		ELSIF (INC='1')THEN
			temp <= temp +1;
		ELSIF(CLR='1') THEN
			temp <=(others =>'0'); --sets all items to 0s
		END IF;
	END IF;
	END PROCESS;
	O <= temp;
END Behavioral;