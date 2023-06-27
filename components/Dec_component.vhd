
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Dec_component is
port( ir: in Std_logic_vector(31 downto 0);
Clk: in Std_logic;
dec_r1,dec_r2,dec_r3,opcode: out Std_logic_vector(3 downto 0);
dec_i: out Std_logic_vector(18 downto 0);
dec_c: out std_logic
);
end Dec_component;

architecture Behavioral of Dec_component is
Signal IR_I: Std_logic_vector(31 downto 0);
--signal I_signal:Std_logic_vector(18 downto 0);
Signal C_signal: std_logic;
begin
IR_I<=Ir;
C_signal<=IR_I(31);
--I_signal <=IR_In(18 downto 0);
process(clk)
begin 
if(rising_edge(Clk)) then

	if (C_signal='0') then
	opcode<=IR_I(30 downto 27);
	dec_r1<=IR_I(26 downto 23);
	dec_r2<=IR_I(22 downto 19);
	dec_r3<=IR_I(18 downto 15);
	
	else
	opcode<=IR_I(30 downto 27);
	dec_r1<=IR_I(26 downto 23);
	dec_r2<=IR_I(22 downto 19);
	dec_i<=IR_I(18 downto 0);
	end if;
end if;
end process;
dec_c<=c_signal;
end Behavioral;

