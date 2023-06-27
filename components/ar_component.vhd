
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ar_component is
	Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           load : in  STD_LOGIC;
           ar_in : in  STD_LOGIC_VECTOR (6 downto 0);
           ar_out : out  STD_LOGIC_VECTOR (6 downto 0)
			  );
end Ar_component;

architecture Behavioral of Ar_component is
signal store: std_logic_vector (6 downto 0);
begin
process(clk)
	
begin
   if  (rising_edge(clk)) then
		if (clr = '1') then
			store <= (others => '0');
		elsif load = '1' then
			store <= ar_in;
      end if ;
	end if;
end process;

ar_out <= store ;

end Behavioral;

