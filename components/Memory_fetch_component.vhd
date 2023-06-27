
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memory_fetch_component is
port(datain : in STD_LOGIC_VECTOR(31 downto 0);
    dataout : out STD_LOGIC_VECTOR(31 downto 0);
    --address : in STD_LOGIC_VECTOR(6 downto 0);
    wr_en : in std_logic;
    reset : in std_logic;
    clk : in std_logic; 
	  
	 ar : out STD_LOGIC_VECTOR(6 DOWNTO 0);
    pc : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    ir : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
	
end Memory_fetch_component;

architecture Behavioral of Memory_fetch_component is
  signal sar , spc,address_signal : STD_LOGIC_VECTOR(6 DOWNTO 0);
 signal dataoutS : STD_LOGIC_VECTOR(31 DOWNTO 0);
type ram1 IS ARRAY (0 to 127) OF STD_LOGIC_VECTOR (31 downto 0);
signal Memory : ram1 :=  (others => (others => '0'));
begin
clk_process: process(clk,wr_en,datain,reset,address_signal)
begin
if ( rising_edge(clk)) then 
	 if (reset = '1') then
        
		  for j in 0 to 127 loop
			Memory(j) <= "00000000000000000000000000000000";
		  end loop;
    elsif ( wr_en ='0') then
        dataoutS <= Memory( to_integer(unsigned(address_signal)));
		  dataout <= dataoutS;
    else
        dataoutS <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
        if (clk'event and clk = '1') then
            Memory(to_integer(unsigned(address_signal))) <= datain;
        end if;
    end if; 
end if;
end process;
process(clk,pc)
begin
if(rising_edge(clk)) then
	ar<= pc;
  spc <= pc;
  
  sar <= spc; -- AR <= PC
  address_signal<= sar;
 -- mem<=dataout;
  ir<=dataoutS;
  
  --ir <= M[sar]; -- IR <= M[AR]
end if;
end process;
end Behavioral;

