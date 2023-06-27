library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity controlUnit_component is
	port( ss0, ss1, ss2 , ss3 ,st0 , st1 , st2 , st3 , st4 , sv0 , sa0 , sar , spc , sir, ssc: IN STD_LOGIC_VECTOR (1 downto 0);
		ALU_out : IN STD_LOGIC_VECTOR(31 downto 0);
		Opcode : IN STD_LOGIC_VECTOR(3 downto 0);
		add_out , addi_out : OUT STD_LOGIC_VECTOR(3 downto 0);
		
		s0_in, s1_in, s2_in, s3_in, t0_in ,t1_in ,t2_in ,t3_in ,t4_in ,ir_in,v0_in ,a0_in: IN STD_LOGIC_VECTOR (31 downto 0);
		pc_in, ar_in : IN STD_LOGIC_VECTOR (6 downto 0);
		
		s0_out, s1_out, s2_out, s3_out, t0_out ,t1_out ,t2_out ,t3_out ,t4_out ,ir_out ,v0_out ,a0_out: OUT STD_LOGIC_VECTOR (31 downto 0);
		pc_out, ar_out : OUT STD_LOGIC_VECTOR (6 downto 0);

      clear_s0, clear_s1, clear_s2, clear_s3, clear_t0 ,clear_t1 ,clear_t2 ,clear_t3 ,clear_t4 ,clear_pc ,clear_ir ,clear_sc ,clear_v0 ,clear_a0 ,clear_ar: OUT STD_LOGIC;

      inc_s0, inc_s1, inc_s2, inc_s3, inc_t0 ,inc_t1 ,inc_t2 ,inc_t3 ,inc_t4 ,inc_pc ,inc_ir ,inc_sc ,inc_v0 ,inc_a0 : OUT STD_LOGIC ;
		
		clk : in STD_LOGIC;
		
		--test
		cu_opcode, result : OUT STD_LOGIC
	);
end controlUnit_component;

architecture Behavioral of controlUnit_component is

begin
process(clk)
	begin
	if(rising_edge(clk)) then
		if (opcode = "0000" or opcode = "0001") then --add and addi
			if (ss0 = "01")then
				add_out <= "0000";
				s0_out <= alu_out;
				result <= '1';
            elsif(ss1 = "01")then
                add_out <= "0001";
                s1_out <= alu_out;
            elsif(ss2 = "01")then
                add_out <= "0010";
                s2_out <= alu_out;
            elsif(ss3 = "01")then
                add_out <= "0011";
                s3_out <= alu_out;
            elsif(st0 = "01")then
                add_out <= "0100";
                t0_out <= alu_out;
            elsif(st1 = "01")then
                add_out <= "0101";
                t1_out <= alu_out;
            elsif(st2 ="01")then
                add_out <= "0110";
                t2_out <= alu_out;
            elsif(st3 = "01")then
                add_out <= "0111";
                t3_out <= alu_out;
            elsif(st4 = "01")then
                add_out <= "1000";
                t4_out <= alu_out;
            elsif(spc = "01")then
                add_out <= "1001";
                --pc_out <= alu_out;
                --value_pc <= alu_r1(7 downto 0);
            elsif(sir = "01")then
                add_out <= "1010";
                ir_out <= alu_out;
            elsif(sv0 = "01")then
                add_out <= "1011";
                v0_out <= alu_out;
            elsif(sar = "01")then
                add_out <= "1100";
                -- ar_out <= alu_out;
            --elsif(sar = "01")then
                --add_out <= "1101";
                --value_ar <= alu_r1(7 downto 0);
            end if;

        elsif (opcode = "1010") then --clear
			if (ss0 = "01")then
                clear_s0 <= '1';
            elsif(ss1 = "01")then
               clear_s1  <= '1';
            elsif(ss2 = "01")then
               clear_s2  <= '1';
            elsif(ss3 = "01")then
                clear_s3  <= '1';
            elsif(st0 = "01")then
                clear_t0  <= '1';
            elsif(st1 = "01")then
                clear_t1 <= '1';
            elsif(st2 ="01")then
                clear_t2 <= '1';
            elsif(st3 = "01")then
                clear_t3 <= '1';
            elsif(st4 = "01")then
                clear_t4 <= '1';
            elsif(spc = "01")then
                clear_pc <= '1';
            elsif(sir = "01")then
                clear_ir <= '1';
            elsif(ssc = "01")then
                clear_sc <= '1';
            elsif(sv0 = "01")then
                clear_v0 <= '1';
            elsif(sa0 = "01")then
                clear_a0 <= '1';
            elsif(sar = "01")then
                clear_ar <= '1';
            end if;
            
        elsif(opcode = "1011") then --increment
            if (ss0 = "01")then
                inc_s0 <= '1';
            elsif(ss1 = "01")then
                inc_s1  <= '1';
            elsif(ss2 = "01")then
                inc_s2  <= '1';
            elsif(ss3 = "01")then
                inc_s3  <= '1';
            elsif(st0 = "01")then
                inc_t0  <= '1';
            elsif(st1 = "01")then
                inc_t1 <= '1';
            elsif(st2 ="01")then
                inc_t2 <= '1';
            elsif(st3 = "01")then
                inc_t3 <= '1';
            elsif(st4 = "01")then
                inc_t4 <= '1';
            elsif(spc = "01")then
                inc_pc <= '1';
            elsif(sir = "01")then
                inc_ir <= '1';
            elsif(ssc = "01")then
                inc_sc <= '1';
            elsif(sv0 = "01")then
                inc_v0 <= '1';
            elsif(sa0 = "01")then
                inc_a0 <= '1';
            end if;
		end if;
    end if;
                    
    end process ; -- add_process
end Behavioral;

