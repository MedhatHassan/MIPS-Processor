
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity sc_counter is
port(
clk, clr, inc: in std_logic;
sc_out: out std_logic_vector(6 downto 0)
);
end sc_counter;

architecture Behavioral of sc_counter is
signal temp: std_logic_vector(6 downto 0);

begin

PROCESS(clk)
	BEGIN
	IF(rising_edge(clk))THEN
		IF (INC='1')THEN
			temp <= temp + 1;
		ELSIF(CLR='1') THEN
			temp <=(others =>'0'); --sets all items to 0s
		END IF;
	END IF;
	END PROCESS;
	sc_out <= temp;

end Behavioral;

