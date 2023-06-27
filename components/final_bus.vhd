
library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;


entity final_bus is
Port (  E1, E2 : in  STD_LOGIC;
        Memory_out : out  STD_LOGIC_VECTOR(31 downto 0);
        AR_out : out STD_LOGIC_VECTOR(6 downto 0);
        S0_out : out STD_LOGIC_VECTOR(31 downto 0);
        S1_out : out STD_LOGIC_VECTOR(31 downto 0);
        S2_out : out STD_LOGIC_VECTOR(31 downto 0);
        S3_out : out  STD_LOGIC_VECTOR(31 downto 0);
        t0_out : out  STD_LOGIC_VECTOR(31 downto 0);
        t1_out : out  STD_LOGIC_VECTOR(31 downto 0);
        t2_out : out  STD_LOGIC_VECTOR(31 downto 0);
        t3_out : out  STD_LOGIC_VECTOR(31 downto 0);
        t4_out : out  STD_LOGIC_VECTOR(31 downto 0);
        PC_out : out  STD_LOGIC_VECTOR(6 downto 0);
        IR_out : out  STD_LOGIC_VECTOR(31 downto 0);
        a0_out : out  STD_LOGIC_VECTOR(31 downto 0);
        v0_out : out  STD_LOGIC_VECTOR(31 downto 0);
		  
		  alu_in: in STD_LOGIC_VECTOR(31 downto 0);
        Memory_in : in STD_LOGIC_VECTOR(31 downto 0);
        AR_in  : in  STD_LOGIC_VECTOR(6 downto 0);
        S0_in : in  STD_LOGIC_VECTOR(31 downto 0);
        S1_in : in STD_LOGIC_VECTOR(31 downto 0);
        S2_in : in STD_LOGIC_VECTOR(31 downto 0);
        S3_in : in  STD_LOGIC_VECTOR(31 downto 0);
        t0_in : in  STD_LOGIC_VECTOR(31 downto 0);
        t1_in : in  STD_LOGIC_VECTOR(31 downto 0);
        t2_in : in  STD_LOGIC_VECTOR(31 downto 0);
        t3_in : in  STD_LOGIC_VECTOR(31 downto 0);
        t4_in : in  STD_LOGIC_VECTOR(31 downto 0);
        PC_in : in  STD_LOGIC_VECTOR(6 downto 0);
        IR_in : in STD_LOGIC_VECTOR(31 downto 0);
        a0_in : in  STD_LOGIC_VECTOR(31 downto 0);
        v0_in : in STD_LOGIC_VECTOR(31 downto 0);
		  ar_load : in  STD_LOGIC;
        S0_load : in  STD_LOGIC;
        S1_load : in  STD_LOGIC;
        S2_load : in  STD_LOGIC;
        S3_load : in  STD_LOGIC;
        t0_load : in  STD_LOGIC;
        t1_load : in  STD_LOGIC;
        t2_load : in  STD_LOGIC;
        t3_load : in  STD_LOGIC;
        t4_load : in  STD_LOGIC;
        PC_load : in  STD_LOGIC;
        IR_load : in  STD_LOGIC;
        a0_load : in  STD_LOGIC;
        v0_load : in  STD_LOGIC;
        S : in  STD_LOGIC_VECTOR (3 downto 0);
        clk : in STD_LOGIC
          );
end final_bus;

architecture Behavioral of final_bus is
signal Bout, Bin : STD_LOGIC_VECTOR(31 downto 0);
begin
    process(clk)
    BEGIN
	 if ( rising_edge (clk) ) then
	   if ( E1 = '1' ) then
        IF(S="0000") THEN
            Bin<=S0_in;
        ELSIF(S="0001") THEN
            Bin<=S1_in;
        ELSIF(S="0010") THEN
            Bin<=S2_in;
        ELSIF(S="0011") THEN
            Bin<=S3_in;
        ELSIF(S="0100") THEN
            Bin<=t0_in;
        ELSIF(S="0101") THEN
            Bin<=t1_in;
        ELSIF(S="0110") THEN
            Bin<=t2_in;
        ELSIF(S="0111") THEN
            Bin<=t3_in;
        ELSIF(S="1000") THEN
            Bin<=t4_in;
        ELSIF(S="1001") THEN
           Bin(6 downto 0)<=PC_in;
        ELSIF(S="1010")THEN
            Bin<=IR_in;
        ELSIF(S="1011") THEN
            Bin<=a0_in;
        ELSIF(S="1100") THEN
            Bin(6 downto 0)<=AR_in;
        elsif(S="1101") THEN
            Bin<=Memory_in;
			elsif(S = "1110") then
				Bin<= alu_in;
        end if;
		 end if;
    end if;
	 Bout <= Bin;
    end process;
    
	 
	 
    process(clk)
    BEGIN
    if ( rising_edge (clk) ) then
    IF(E2 ='1') THEN
    IF(S="0000") THEN
		if (s0_load = '1') then
			S0_out <=Bout;
		END IF;
    ELSIF(S="0001") THEN
		if (s1_load = '1') then
			S1_out<=Bout;
		END IF;
    
    ELSIF(S="0010") THEN
    if (s2_load = '1') then
			S2_out<=Bout;
		END IF;
    ELSIF(S="0011") THEN
    if (s3_load = '1') then
			S3_out<=Bout;
		END IF;		
    ELSIF(S="0100") THEN
    if (t0_load = '1') then
			t0_out<=Bout;
		END IF;
    ELSIF(S="0101") THEN
    if (t1_load = '1') then
			t1_out<=Bout;
		END IF;
    ELSIF(S="0110") THEN
    if (t2_load = '1') then
			t2_out<=Bout;
		END IF;
    ELSIF(S="0111") THEN
    if (t3_load = '1') then
			t3_out<=Bout;
		END IF;
    ELSIF(S="1000") THEN
    if (t4_load = '1') then
			t4_out<=Bout;
		END IF;
    ELSIF(S="1001") THEN
    if (PC_load = '1') then
			PC_out<=Bout(6 downto 0);
		END IF;
    ELSIF(S="1010")THEN
    if (IR_load = '1') then
			IR_out<=Bout;
		END IF;
    ELSIF(S="1011") THEN
    if (v0_load = '1') then
			v0_out<=Bout;
		END IF;
		 ELSIF(S="1100") THEN
    if (a0_load = '1') then
			a0_out<=Bout;
		END IF;
    ELSIF(S="1101") THEN
    if (AR_load = '1') then
			AR_out<=Bout(6 downto 0);
		END IF;
    ELSIF(S="1110") THEN
    Memory_out<=Bout;
    end if;
	 end if;
   end if;
		 
	
    end process;	
end Behavioral;