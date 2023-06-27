library IEEE;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity hazard_component is
  port (
    opcode1,opcode2 : in  STD_LOGIC_VECTOR (3 downto 0);
    flag : out  STD_LOGIC_VECTOR (1 downto 0);
    clk : in std_logic 
  );
end hazard_component;

architecture arch of hazard_component is
signal data_flag , structural_flag : std_logic;

begin

structural_hazard : process(clk)
begin
    if(opcode1 = "0011" or opcode1 = "0100" or opcode1 = "0101") then -- if opcode1 = la or lb or sb
			if(opcode2 = "0011" or opcode2 = "0100" or opcode2 = "0101") then -- opcode2 = -- lb or la or sb
				structural_flag <= '0';
			else structural_flag <= '1'; -- op2 = add, addi, ...
			end if;
    else -- opcode1 = add, addi, move, ...
	    structural_flag <= '0';
    end if;
end process;--structural_hazard

data_hazard:process(clk)
begin
-- (5,4) --> flag =1
-- (4,5) --> flag =1
-- (4,4) --> flag = 0
-- (5,5) --> flag = 1
if(rising_edge(clk)) then
if(opcode1 /= "0011" and opcode1 /= "0100" and opcode1 /= "0101") then -- op1 = add or addi or move (4)
        if(opcode2 = "0011" or opcode2 = "0100" or opcode2 = "0101") then -- op2 = lb or la or sb (5)
   data_flag<= '1'; --1-RAW
 else data_flag<= '0';
 end if;
end if;
if(opcode1 = "0011" or opcode1 = "0100" or opcode1 = "0101") then -- (5)
       data_flag<= '1';
		end if;
end if;
--end if;
end process; --data_hazard

hazard : process(clk)
begin
--data_flag <= '1';
    if(data_flag = '1' and structural_flag = '1') then
        flag <= "11"; --data & structural hazard
    elsif (structural_flag = '1') then
        flag <= "01";
    elsif (data_flag = '1') then
        flag <= "10";
    else  flag <= "00"; -- No hazard
    end if; 
end process; -- hazard

end architecture;