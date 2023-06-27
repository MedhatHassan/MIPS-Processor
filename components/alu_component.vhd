
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity alu_component is
port( 
alu_r3,alu_r2:in std_logic_vector(31 downto 0);
alu_i:in std_logic_vector(18 downto 0);
alu_r1:out std_logic_vector(31 downto 0);
op:in std_logic_vector(3 downto 0);
clk:in std_logic;
alu_c : in std_logic;

--test
alu_result: OUT STD_LOGIC
);
end alu_component;

architecture Behavioral of alu_component is
signal temp_sum : std_logic_vector(31 downto 0);
begin

process(clk)

begin
if( rising_edge(clk)) then
  if(alu_c = '0') then
    if  (op= "0000") then
	    temp_sum <= alu_r2 + alu_r3;
        if(temp_sum /= "00000000000000000000000000000000")then
            alu_r1<= temp_sum(31 downto 0);
				alu_result <= '1';
        end if;
    end if;
  else
    if (op = "0001") then 
	     temp_sum <= alu_r2 + alu_i;
        if(temp_sum /= "00000000000000000000000000000000")then
            alu_r1<= temp_sum(31 downto 0);
        end if;
    end if;
  end if;
 end if;
end process;	
end Behavioral;