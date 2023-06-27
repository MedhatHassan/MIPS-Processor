	library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use ieee.std_logic_unsigned.all;

	entity execute_component IS
		  PORT (
					E1, Er1, Er2, Er3:IN  STD_LOGIC;
				 CLK: IN STD_LOGIC;
				 --Decode
				 c: IN STD_LOGIC;
				 S : IN STD_LOGIC_VECTOR (3 DOWNTO 0); --opcode
				 r1: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				 r2: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				 r3: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				 i : IN STD_LOGIC_VECTOR (18 DOWNTO 0);
				 pc_in : IN STD_LOGIC_VECTOR (6 downto 0);
				 ar_in : IN STD_LOGIC_VECTOR (6 downto 0);
				 pc_out : OUT STD_LOGIC_VECTOR (6 downto 0);
				 ar_out : OUT STD_LOGIC_VECTOR (6 downto 0);
				 -- Memory
				 address : out STD_LOGIC_VECTOR(6 downto 0);
				 dataout : in STD_LOGIC_VECTOR(31 downto 0);
				 datain : out STD_LOGIC_VECTOR(31 downto 0);
				 -- ALU
				 alu_c : out STD_LOGIC ;
				 alu_r2 , alu_r3 , alu_op : out STD_LOGIC_VECTOR(3 downto 0);
				 alu_r1 : in STD_LOGIC_VECTOR(3 downto 0);
				 alu_i : out STD_LOGIC_VECTOR(18 downto  0);
				 --all rig
				 s0_in, s1_in, s2_in, s3_in, t0_in ,t1_in ,t2_in ,t3_in ,t4_in ,ir_in ,sc_in ,v0_in ,a0_in: IN STD_LOGIC_VECTOR (31 downto 0);

				 s0_out, s1_out, s2_out, s3_out, t0_out ,t1_out ,t2_out ,t3_out ,t4_out ,ir_out ,sc_out ,v0_out ,a0_out: OUT STD_LOGIC_VECTOR (31 downto 0);
				 
				 --clear of all rig
				 clear_s0, clear_s1, clear_s2, clear_s3, clear_t0 ,clear_t1 ,clear_t2 ,clear_t3 ,clear_t4 ,clear_pc ,clear_ir ,clear_sc ,clear_v0 ,clear_a0 ,clear_ar: IN STD_LOGIC; 
				 -- increment of all rig not including (AR)
				 inc_s0, inc_s1, inc_s2, inc_s3, inc_t0 ,inc_t1 ,inc_t2 ,inc_t3 ,inc_t4 ,inc_pc ,inc_ir ,inc_sc ,inc_v0 ,inc_a0 : IN STD_LOGIC ;
				 
				 --cntrol section
				 ctrl_out : OUT STD_LOGIC_VECTOR(3 downto 0);
				 
				 
				 ss0_out, ss1_out, ss2_out , ss3_out ,st0_out , st1_out , st2_out , st3_out , st4_out , sv0_out , sa0_out , sar_out , spc_out , sir_out, ssc_out : OUT STD_LOGIC_VECTOR (1 downto 0);
				 
				 
				 --test
				 r1_result, r2_result, r3_result, op_result, move_result, output_result : OUT STD_LOGIC
				 
				 );
	END execute_component;

	ARCHITECTURE Behavioral OF execute_component IS
	SIGNAL add, addi , move , la , lb, sb , inp , outop , bun , endop , clear , increment : STD_LOGIC; --Operations signals
	SIGNAL ss0, ss1, ss2 , ss3 ,st0 , st1 , st2 , st3 , st4 , sv0 , sa0 , sar , spc , sir, ssc: STD_LOGIC_VECTOR (1 downto 0); --Rig signals
	SIGNAL sr1 , sr2 , sr3 : STD_LOGIC_VECTOR (3 downto 0);
	SIGNAL si : STD_LOGIC_VECTOR (18 downto 0);
	SIGNAL sinputa0 , soutputv0  : STD_LOGIC_VECTOR (31 downto 0);
	SIGNAL sbunpc , sarex : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL r1_out , r2_out : STD_LOGIC_VECTOR (31 DOWNTO 0);

	BEGIN

	sr1 <= r1 ; 
	sr2 <= r2 ; 
	sr3 <= sr3;
	sarex <= ar_in;
	si <= i;


				 operation_selection : process(CLK)
				 begin
					 if(rising_edge(clk)) then
						 if (E1 = '1') then -- Enable is on 
								if  (S = "0000") then
									  add <= '1';
										op_result <= '1';

								elsif  (S = "0001") then
									  addi <= '1';
								elsif  (S = "0010") then
									  move <= '1';
								elsif  (S = "0011") then
									  la <= '1';
								elsif  (S = "0100") then
									  lb <= '1';
								elsif  (S = "0101") then
									  sb <= '1';
								elsif  (S = "0110") then
									  inp <= '1';
								elsif  (S = "0111") then
									  outop <= '1';
								elsif  (S = "1000") then
									  bun <= '1';
								elsif  (S = "1001") then
									  endop <= '1';
								elsif  (S = "1010") then
									  clear <= '1';
								elsif  (S = "1011") then
									  increment <= '1';
								end if;
						 end if;
					 end if;  
				 end process; --operation_selection

				 r1_selection : process(CLK) --destination
				 begin
					 if(rising_edge(clk)) then
						 if (Er1 = '1') then
								if (r1 = "0000")then
										r1_result <= '1';
										
									  ss0 <= "01";
									  r1_out <= s0_in;
									  ss0_out <= ss0;
								elsif(r1 = "0001")then
									  ss1 <="01";
									  r1_out <= s1_in;
									  ss1_out <= ss1;
								elsif(r1 = "0010")then
									  ss2 <="01";
									  r1_result <= '1';
									  r1_out <= s2_in;
									  ss2_out <= ss2;
								elsif(r1 = "0011")then
									  ss3 <="01";
									  r1_out <= s3_in;
									  ss3_out <= ss3;
								elsif(r1 = "0100")then
									  st0 <="01";
									  r1_out <= t0_in;
									  st0_out <= st0;
								elsif(r1 = "0101")then
									  st1 <="01";
									  r1_out <= t1_in;
									  st1_out <= st1;
								elsif(r1 ="0110")then
									  st2 <="01";
									  r1_out <= t2_in;
									  st2_out <= st2;
								elsif(r1 = "0111")then
									  st3 <="01";
									  r1_out <= t3_in;
									  st3_out <= st3;
								elsif(r1 = "1000")then
									  st4 <="01";
									  r1_out <= t4_in;
									  st4_out <= st4;
								elsif(r1 = "1001")then
									  spc <="01";
									  r1_out(6 downto 0) <= pc_in;
									  spc_out <= spc;
								elsif(r1 = "1010")then
									  sir <="01";
									  r1_out <= ir_in;
									  sir_out <= sir;
								elsif(r1 = "1011")then
									  ssc <="01";
									  r1_out <= sc_in;
									  ssc_out <= ssc;
								elsif(r1 = "1100")then
									  sv0 <="01"; --output
									  r1_out <= v0_in;
									  sv0_out <= sv0;
								elsif(r1 = "1110")then
									  sar <="01";
									  r1_out(6 downto 0) <= ar_in;
									  sar_out <= sar;
								end if;
						 end if;
					 end if;
				 end process ; -- r1 selection

				 r2_selection : process(CLK) --operand 1
				 begin
					 if(rising_edge(clk)) then
						 if (Er2 = '1') then
								if (r2 = "0000")then
									  ss0 <= "10";
									  r2_out <= s0_in;
								elsif(r2 = "0001")then
									  ss1 <="10";
									  r2_out <= s1_in;
								elsif(r2 = "0010")then
									  ss2 <="10";
									  r2_out <= s2_in;
								elsif(r2 = "0011")then
										r2_result <= '1';
									  ss3 <="10";
									  r2_out <= s3_in;
								elsif(r2 = "0100")then
									  st0 <="10";
									  r2_out <= t0_in;
								elsif(r2 = "0101")then
									  st1 <="10";
									  r2_out <= t1_in;
								elsif(r2 ="0110")then
									  st2 <="10";
									  r2_out <= t2_in;
								elsif(r2 = "0111")then
									  st3 <="10";
									  r2_out <= t3_in;
								elsif(r2 = "1000")then
									  st4 <="10";
									  r2_out <= t4_in;
									  r2_result <= '1';
								elsif(r2 = "1001")then
									  spc <="10";
									  r2_out(6 downto 0) <= pc_in;
								elsif(r2 = "1010")then
									  sir <="10";
									  r2_out <= ir_in;
								elsif(r2 = "1011")then
									  ssc <="10";
									  r2_out <= sc_in;
								elsif(r2 = "1100")then
									  sv0 <="10";
									  r2_out <= v0_in;
								elsif(r2 = "1101")then
									  sa0 <="10";
									   r2_out<= a0_in;
								elsif(r2 = "1110")then
									  sar <="10";
									  r2_out(6 downto 0) <= ar_in;
								end if;
						 end if;
					 end if;
				 end process ; -- r2 selection

				 r3_selection : process(CLK) -- operand 2
				 begin
					 if(rising_edge(clk)) then
						 if (Er3 = '1') then
								if (r3 = "0000")then
									  ss0 <= "11";
								elsif(r3 = "0001")then
									  ss1 <="11";
								elsif(r3 = "0010")then
									  ss2 <="11";
								elsif(r3 = "0011")then
									  ss3 <="11";
								elsif(r3 = "0100")then
									  st0 <="11";
								elsif(r3 = "0101")then
									  st1 <="11";
								elsif(r3 ="0110")then
									  st2 <="11";
									  r3_result <= '1';
								elsif(r3 = "0111")then
									  st3 <="11";
								elsif(r3 = "1000")then
									  st4 <="11";
								elsif(r3 = "1001")then
									  spc <="11";
								elsif(r3 = "1010")then
									  sir <="11";
								elsif(r3 = "1011")then
									  ssc <="11";
								elsif(r3 = "1100")then
									  sv0 <="11";
								elsif(r3 = "1101")then
									  sa0 <="11";
								elsif(r3 = "1110")then
									  sar <="11";
								end if;
						 end if;
					 end if;
				 end process ; -- r3 selection

				 operation_execution : process( CLK )
				 begin
				 if(rising_edge(clk)) then
				 if (c = '0') then --R type operation
						 if (add = '1') then
								-- ALU
								alu_r2 <= sr2;
								alu_r3 <= sr3;
								alu_op <= "0000";
								alu_c <= '0';
								ctrl_out <= "0000";
								output_result <= '1';
						 end if ;
				 else -- i type operation
						 if(addi = '1')then
								-- ALU
								alu_r2 <= sr2;
								alu_i <= si;
								alu_op <= "0001";
								alu_c <= '1';
								ctrl_out <= "0001";
						 elsif(move = '1')then
								-- R1 (32 bits) <= R2 (32 bits); --values
								
								r1_out <= r2_out;
						 elsif(la = '1')then
								--memory
								-- La R1 , R2 === R1 (frist 7 bits {in i part}) <= R2 (frist 7 bits {in i part})
								-- la R1 , R2(0x1234678)
								r1_out(6 downto 0) <= r2_out(6 downto 0);
						 elsif(lb = '1')then
								-- memory
								-- Lb $R1 , 4(R2) 
								sarex <= r2_out(6 downto 0); -- AR <= R2 (6 dowento 0)
								
								sarex <= sarex + si(6 downto 0); -- in test OP - R1 - R2 - i(Write on 7 bits only) ar <= ar + 4
								--R1 (32 bits) <= M[AR]  
								address <= sarex;
								r1_out <= dataout;
						 elsif(sb = '1')then
								--memory
								-- Lb $R1 , 4(R2) 
								sarex <= r2_out(6 downto 0); -- AR <= R2 (6 dowento 0)
								sarex <= sarex + si(6 downto 0); -- in test OP - R1 - R2 - i(Write on 7 bits only) ar <= ar + 4
								-- M[AR] <= R1 (32 bits) 
								address <= sarex;
								datain <= r1_out;
						 elsif(inp = '1')then
								--sinputa0 <=screen 
						 elsif(outop = '1')then
								--screen <= soutputv0 
						 elsif(bun = '1') then
								sbunpc <= si (6 downto 0);
								move_result <= '1';
								pc_out <= sbunpc;
								-- Pc can't take more than 7 bits
						 elsif(endop = '1')then
								--
						 elsif(clear = '1')then
							  ctrl_out <= "1010";	

						 elsif(increment = '1')then
								ctrl_out <= "1011";
						 end if;
				 end if;
				 end if;
		  end process ; -- operation execution


		  output_selection: process(clk)
		  begin
		  if(rising_edge(clk)) then
				 if (ss0 = "01")then
						 s0_out <= r1_out;
				 elsif(ss1 = "01")then
						 s1_out <= r1_out;
				 elsif(ss2 = "01")then
						 s2_out <= r1_out;
						 output_result <= '1';
				 elsif(ss3 = "01")then
						 s3_out <= r1_out;
				 elsif(st0 = "01")then
						 t0_out <= r1_out;
				 elsif(st1 = "01")then
						 t1_out <= r1_out;
				 elsif(st2 ="01")then
						 t2_out <= r1_out;
				 elsif(st3 = "01")then
						 t3_out <= r1_out;
				 elsif(st4 = "01")then
						 t4_out <= r1_out;
				 elsif(spc = "01")then
						 pc_out <= r1_out(6 downto 0);
				 elsif(sir = "01")then
						 ir_out <= r1_out;
				 elsif(sv0 = "01")then
						 v0_out <= r1_out;
				 elsif(sar = "01")then
						 ar_out <= r1_out(6 downto 0);
				 end if;
		  end if;
		  end process;
		  
		  

	END Behavioral;