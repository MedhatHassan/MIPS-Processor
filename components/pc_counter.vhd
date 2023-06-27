
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity pc_counter is
port(
clk, clr, inc, load: in std_logic;
pc_out: out std_logic_vector(6 downto 0);
pc_in: in std_logic_vector(6 downto 0)
);
end pc_counter;

architecture Behavioral of pc_counter is
signal temp: std_logic_vector(6 downto 0);
begin

PROCESS(clk)
	BEGIN
	IF(CLK'event AND CLK='1')THEN
		IF(LoaD ='1') THEN
			temp <= pc_in;
		ELSIF (INC='1')THEN
			temp <= temp +1;
		ELSIF(CLR='1') THEN
			temp <=(others =>'0'); --sets all items to 0s
		END IF;
	END IF;
	END PROCESS;
	pc_out <= temp;

end Behavioral;

