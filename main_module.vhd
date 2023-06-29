library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity mainModule is
port(
-- pc counter --------------------
clk, pc_clr, pc_inc, pc_load: in std_logic;
counter_pc_out: out std_logic_vector(6 downto 0);
counter_pc_in: in std_logic_vector(6 downto 0);
--------------------------------------------------------
------------------------- sc counter -------------------------------
counter_sc_out: out std_logic_vector(6 downto 0);
sc_clr, sc_inc: in std_logic;
---------------------------------------------------------------------


-------------------- hazard_component -------------------
	opcode1,opcode2 : in  STD_LOGIC_VECTOR (3 downto 0);
    flag : out  STD_LOGIC_VECTOR (1 downto 0);
	------------------------------------
	
	----------------------------- Decode ---------------------------------------------
	dec_Ir_In: in Std_logic_vector(31 downto 0);
	dec_R1,dec_R2,dec_R3,decode_opcode: out Std_logic_vector(3 downto 0);
	dec_I: out Std_logic_vector(18 downto 0);
	dec_C: out std_logic;
	--------------------------------------------------------------------------
	
	
	------------------------------Alu-------------------------------
	alu_comp_r3,alu_comp_r2:in std_logic_vector(31 downto 0);
alu_comp_i:in std_logic_vector(18 downto 0);
alu_comp_r1:out std_logic_vector(31 downto 0);
op:in std_logic_vector(3 downto 0); -----------------------
alu_comp_c : in std_logic;
---------------------------------------------------------------------------------

-------------------------------------- reg_component -----------------------------
		I_s0, I_s1 , I_s2 , I_s3 ,I_t0 ,I_t1 , I_t2 ,I_t3 , I_t4, I_ir , I_a0 ,I_v0 : IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		INC_s0, INC_s1 , INC_s2 , INC_s3 ,INC_t0 ,INC_t1 , INC_t2 ,INC_t3 , INC_t4, INC_ir , INC_a0 ,INC_v0 : IN  STD_LOGIC;
		LOAD_s0, LOAD_s1 , LOAD_s2 , LOAD_s3 ,LOAD_t0 ,LOAD_t1 , LOAD_t2 ,LOAD_t3 , LOAD_t4, LOAD_ir , LOAD_a0 ,LOAD_v0 : IN  STD_LOGIC;
		CLR_s0, CLR_s1 , CLR_s2 , CLR_s3 ,CLR_t0 ,CLR_t1 , CLR_t2 ,CLR_t3 , CLR_t4, CLR_ir , CLR_a0 ,CLR_v0 : IN  STD_LOGIC;
		O_s0, O_s1 , O_s2 , O_s3 ,O_t0 ,O_t1 , O_t2 ,O_t3 , O_t4, O_ir , O_a0 ,O_v0 : OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
--------------------------------------------------------------------------------------------------------
------------------------------------ AR component ----------------------------------------------------- 		
	Ar_clr : in  STD_LOGIC;
   Ar_load : in  STD_LOGIC;
   ar_in : in  STD_LOGIC_VECTOR (6 downto 0);
   ar_out : out  STD_LOGIC_VECTOR (6 downto 0);
------------------------------------------------------------------------------------
--------------------------- memory component -------------------------------------------
	memory_Datain : in STD_LOGIC_VECTOR(31 downto 0);
   memory_Dataout : out STD_LOGIC_VECTOR(31 downto 0);
    --address : in STD_LOGIC_VECTOR(6 downto 0);
    Wr_en : in std_logic;
    Reset : in std_logic;
	 memory_Ar : out STD_LOGIC_VECTOR(6 DOWNTO 0);
    memory_Pc : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    memory_Ir : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	 -----------------------------------------------------
	 
	 
	 ------------------ control unit & execute ------------------------------------------------------------
	
		-- control unit
ss0, ss1, ss2 , ss3 ,st0 , st1 , st2 , st3 , st4 , sv0 , sa0 , sar , spc , sir, ssc: IN STD_LOGIC_VECTOR (1 downto 0);
		ALU_out : IN STD_LOGIC_VECTOR(31 downto 0);
		Opcode : IN STD_LOGIC_VECTOR(3 downto 0);
		add_out , addi_out : OUT STD_LOGIC_VECTOR(3 downto 0);
		
		cu_s0_in, cu_s1_in, cu_s2_in, cu_s3_in, cu_t0_in ,cu_t1_in ,cu_t2_in ,cu_t3_in ,cu_t4_in ,cu_ir_in,cu_v0_in ,cu_a0_in: IN STD_LOGIC_VECTOR (31 downto 0);
		cu_pc_in, cu_ar_in : IN	 STD_LOGIC_VECTOR (6 downto 0);
		
		cu_s0_out, cu_s1_out, cu_s2_out, cu_s3_out, cu_t0_out ,cu_t1_out ,cu_t2_out ,cu_t3_out ,cu_t4_out ,cu_ir_out ,cu_v0_out ,cu_a0_out: OUT STD_LOGIC_VECTOR (31 downto 0);
		cu_pc_out, cu_ar_out : OUT STD_LOGIC_VECTOR (6 downto 0);

      cu_clear_s0, cu_clear_s1, cu_clear_s2, cu_clear_s3, cu_clear_t0 ,cu_clear_t1 ,cu_clear_t2 ,cu_clear_t3 ,cu_clear_t4 ,cu_clear_pc ,cu_clear_ir ,cu_clear_sc ,cu_clear_v0 ,cu_clear_a0 ,cu_clear_ar: OUT STD_LOGIC;

      cu_inc_s0, cu_inc_s1, cu_inc_s2, cu_inc_s3, cu_inc_t0 ,cu_inc_t1 ,cu_inc_t2 ,cu_inc_t3 ,cu_inc_t4 ,cu_inc_pc ,cu_inc_ir ,cu_inc_sc ,cu_inc_v0 ,cu_inc_a0 : OUT STD_LOGIC ;
		
		
		-- execute
		E1, Er1, Er2, Er3:IN  STD_LOGIC;
		
		--Decode
		c: IN STD_LOGIC;
		S : IN STD_LOGIC_VECTOR (3 DOWNTO 0); --opcode
		r1: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		r2: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		r3: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		i : IN STD_LOGIC_VECTOR (18 DOWNTO 0);
		exe_pc_in : IN STD_LOGIC_VECTOR (6 downto 0);
		exe_ar_in : IN STD_LOGIC_VECTOR (6 downto 0);
		exe_pc_out : OUT STD_LOGIC_VECTOR (6 downto 0);
		exe_ar_out : OUT STD_LOGIC_VECTOR (6 downto 0);
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
		exe_s0_in, exe_s1_in, exe_s2_in, exe_s3_in, exe_t0_in ,exe_t1_in ,exe_t2_in ,exe_t3_in ,exe_t4_in ,exe_ir_in ,exe_sc_in ,exe_v0_in ,exe_a0_in: IN STD_LOGIC_VECTOR (31 downto 0);
		exe_s0_out, exe_s1_out, exe_s2_out, exe_s3_out, exe_t0_out ,exe_t1_out ,exe_t2_out ,exe_t3_out ,exe_t4_out ,exe_ir_out ,exe_sc_out ,exe_v0_out ,exe_a0_out: OUT STD_LOGIC_VECTOR (31 downto 0);
		
		--clear of all rig
		exe_clear_s0, exe_clear_s1, exe_clear_s2, exe_clear_s3, exe_clear_t0 ,exe_clear_t1 ,exe_clear_t2 ,exe_clear_t3 ,exe_clear_t4 ,exe_clear_pc ,exe_clear_ir ,exe_clear_sc ,exe_clear_v0 ,exe_clear_a0 ,exe_clear_ar: IN STD_LOGIC; 
		-- increment of all rig not including (AR)
		exe_inc_s0, exe_inc_s1, exe_inc_s2, exe_inc_s3, exe_inc_t0 ,exe_inc_t1 ,exe_inc_t2 ,exe_inc_t3 ,exe_inc_t4 ,exe_inc_pc ,exe_inc_ir ,exe_inc_sc ,exe_inc_v0 ,exe_inc_a0 : IN STD_LOGIC ;
		
		--cntrol section
		ctrl_out : OUT STD_LOGIC_VECTOR(3 downto 0);
		
		ss0_out, ss1_out, ss2_out , ss3_out ,st0_out , st1_out , st2_out , st3_out , st4_out , sv0_out , sa0_out , sar_out , spc_out , sir_out, ssc_out : OUT STD_LOGIC_VECTOR (1 downto 0);
		
		--test
		alu_result, r1_result, r2_result, r3_result, op_result, move_result, output_result, cu_opcode, result: OUT STD_LOGIC;

	 ---------------------------------------------------------------------------------------------------
	 
	 ------------------------------------------- Bus Component --------------------------------------------
		  bus_e1 , bus_E2 : in  STD_LOGIC;
        Memory_out : out  STD_LOGIC_VECTOR(31 downto 0);
        bus_AR_out : out STD_LOGIC_VECTOR(6 downto 0);
        bus_S0_out : out STD_LOGIC_VECTOR(31 downto 0);
        bus_S1_out : out STD_LOGIC_VECTOR(31 downto 0);
        bus_S2_out : out STD_LOGIC_VECTOR(31 downto 0);
        bus_S3_out : out  STD_LOGIC_VECTOR(31 downto 0);
        bus_t0_out : out  STD_LOGIC_VECTOR(31 downto 0);
        bus_t1_out : out  STD_LOGIC_VECTOR(31 downto 0);
        bus_t2_out : out  STD_LOGIC_VECTOR(31 downto 0);
        bus_t3_out : out  STD_LOGIC_VECTOR(31 downto 0);
        bus_t4_out : out  STD_LOGIC_VECTOR(31 downto 0);
        bus_PC_out : out  STD_LOGIC_VECTOR(6 downto 0);
        bus_IR_out : out  STD_LOGIC_VECTOR(31 downto 0);
        bus_a0_out : out  STD_LOGIC_VECTOR(31 downto 0);
        bus_v0_out : out  STD_LOGIC_VECTOR(31 downto 0);
		  
		  bus_alu_in: in STD_LOGIC_VECTOR(31 downto 0);
        Memory_in : in STD_LOGIC_VECTOR(31 downto 0);
        bus_AR_in  : in  STD_LOGIC_VECTOR(6 downto 0);
        bus_S0_in : in  STD_LOGIC_VECTOR(31 downto 0);
        bus_S1_in : in STD_LOGIC_VECTOR(31 downto 0);
        bus_S2_in : in STD_LOGIC_VECTOR(31 downto 0);
        bus_S3_in : in  STD_LOGIC_VECTOR(31 downto 0);
        bus_t0_in : in  STD_LOGIC_VECTOR(31 downto 0);
        bus_t1_in : in  STD_LOGIC_VECTOR(31 downto 0);
        bus_t2_in : in  STD_LOGIC_VECTOR(31 downto 0);
        bus_t3_in : in  STD_LOGIC_VECTOR(31 downto 0);
        bus_t4_in : in  STD_LOGIC_VECTOR(31 downto 0);
        bus_PC_in : in  STD_LOGIC_VECTOR(6 downto 0);
        bus_IR_in : in STD_LOGIC_VECTOR(31 downto 0);
        bus_a0_in : in  STD_LOGIC_VECTOR(31 downto 0);
        bus_v0_in : in STD_LOGIC_VECTOR(31 downto 0);
		  bus_ar_load : in  STD_LOGIC;
        bus_s0_load : in  STD_LOGIC;
        bus_s1_load : in  STD_LOGIC;
        bus_s2_load : in  STD_LOGIC;
        bus_s3_load : in  STD_LOGIC;
        bus_t0_load : in  STD_LOGIC;
        bus_t1_load : in  STD_LOGIC;
        bus_t2_load : in  STD_LOGIC;
        bus_t3_load : in  STD_LOGIC;
        bus_t4_load : in  STD_LOGIC;
        bus_pc_load : in  STD_LOGIC;
        bus_ir_load : in  STD_LOGIC;
        bus_a0_load : in  STD_LOGIC;
        bus_v0_load : in  STD_LOGIC;
        bus_S : in  STD_LOGIC_VECTOR (3 downto 0)
	 -------------------------------------------------------------------------------------------------------------
);
end mainModule;

architecture Behavioral of mainModule is
component sc_counter is
port(
clk, clr, inc: in std_logic;
sc_out: out std_logic_vector(6 downto 0)
);
end component;

component pc_counter is
port(
clk, clr, inc, load: in std_logic;
pc_out: out std_logic_vector(6 downto 0);
pc_in: in std_logic_vector(6 downto 0)
);
end component;

component Hazard_component is
port (
    opcode1,opcode2 : in  STD_LOGIC_VECTOR (3 downto 0);
    flag : out  STD_LOGIC_VECTOR (1 downto 0);
    clk : in std_logic 
  );
end component;

component Dec_component is
port( ir: in Std_logic_vector(31 downto 0);
Clk: in Std_logic;
dec_r1,dec_r2,dec_r3,Opcode: out Std_logic_vector(3 downto 0);
dec_i: out Std_logic_vector(18 downto 0);
dec_c: out std_logic
);
end component;


component alu_component is
port( 
alu_r3,alu_r2:in std_logic_vector(31 downto 0);
alu_i:in std_logic_vector(18 downto 0);
alu_r1:out std_logic_vector(31 downto 0);
op:in std_logic_vector(3 downto 0);
clk:in std_logic;
alu_c : in std_logic;
alu_result : out std_logic
);
end component;


component reg_component is 
	PORT (
		I: IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		CLK, load, INC, CLR: IN STD_LOGIC; 
		O: OUT  STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
end component; 

component Ar_component is
	Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           load : in  STD_LOGIC;
           ar_in : in  STD_LOGIC_VECTOR (6 downto 0);
           ar_out : out  STD_LOGIC_VECTOR (6 downto 0)
			  );
end component;

component Memory_fetch_component is
port(datain : in STD_LOGIC_VECTOR(31 downto 0);
    dataout : out STD_LOGIC_VECTOR(31 downto 0);
    --address : in STD_LOGIC_VECTOR(6 downto 0);
    wr_en : in std_logic;
    reset : in std_logic;
    clk : in std_logic; 
	  
	 ar : out STD_LOGIC_VECTOR(6 DOWNTO 0);
    pc : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    ir : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
	 end component;


component controlUnit_component is
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
end component;


component execute_component is
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
end component;


component final_bus is
Port (  e1, e2 : in  STD_LOGIC;
		  alu_in: in STD_LOGIC_VECTOR(31 downto 0);
        memory_out : out  STD_LOGIC_VECTOR(31 downto 0);
        ar_out : out STD_LOGIC_VECTOR(6 downto 0);
        s0_out : out STD_LOGIC_VECTOR(31 downto 0);
        s1_out : out STD_LOGIC_VECTOR(31 downto 0);
        s2_out : out STD_LOGIC_VECTOR(31 downto 0);
        s3_out : out  STD_LOGIC_VECTOR(31 downto 0);
        t0_out : out  STD_LOGIC_VECTOR(31 downto 0);
        t1_out : out  STD_LOGIC_VECTOR(31 downto 0);
        t2_out : out  STD_LOGIC_VECTOR(31 downto 0);
        t3_out : out  STD_LOGIC_VECTOR(31 downto 0);
        t4_out : out  STD_LOGIC_VECTOR(31 downto 0);
        pc_out : out  STD_LOGIC_VECTOR(6 downto 0);
        ir_out : out  STD_LOGIC_VECTOR(31 downto 0);
        a0_out : out  STD_LOGIC_VECTOR(31 downto 0);
        v0_out : out  STD_LOGIC_VECTOR(31 downto 0);
		  
        memory_in : in STD_LOGIC_VECTOR(31 downto 0);
        ar_in  : in  STD_LOGIC_VECTOR(6 downto 0);
        s0_in : in  STD_LOGIC_VECTOR(31 downto 0);
        s1_in : in STD_LOGIC_VECTOR(31 downto 0);
        s2_in : in STD_LOGIC_VECTOR(31 downto 0);
        s3_in : in  STD_LOGIC_VECTOR(31 downto 0);
        t0_in : in  STD_LOGIC_VECTOR(31 downto 0);
        t1_in : in  STD_LOGIC_VECTOR(31 downto 0);
        t2_in : in  STD_LOGIC_VECTOR(31 downto 0);
        t3_in : in  STD_LOGIC_VECTOR(31 downto 0);
        t4_in : in  STD_LOGIC_VECTOR(31 downto 0);
        pc_in : in  STD_LOGIC_VECTOR(6 downto 0);
        ir_in : in STD_LOGIC_VECTOR(31 downto 0);
        a0_in : in  STD_LOGIC_VECTOR(31 downto 0);
        v0_in : in STD_LOGIC_VECTOR(31 downto 0);
		  ar_load : in  STD_LOGIC;
        s0_load : in  STD_LOGIC;
        s1_load : in  STD_LOGIC;
        s2_load : in  STD_LOGIC;
        s3_load : in  STD_LOGIC;
        t0_load : in  STD_LOGIC;
        t1_load : in  STD_LOGIC;
        t2_load : in  STD_LOGIC;
        t3_load : in  STD_LOGIC;
        t4_load : in  STD_LOGIC;
        pc_load : in  STD_LOGIC;
        ir_load : in  STD_LOGIC;
        a0_load : in  STD_LOGIC;
        v0_load : in  STD_LOGIC;
        s : in  STD_LOGIC_VECTOR (3 downto 0);
        clk : in STD_LOGIC);
end component;


begin

sc_component : sc_counter port map (clk => clk, clr => sc_clr, inc => sc_inc, sc_out => counter_sc_out);
pc_component: pc_counter port map (clk => clk, clr => pc_clr, inc => pc_inc, load => pc_load, pc_out => counter_pc_out, pc_in => counter_pc_in);
Hazard : Hazard_component port map (opcode1 => opcode1, opcode2 => opcode2, flag => flag, clk => clk);
Dec_1: Dec_component port map(ir=>dec_Ir_In,Clk=>clk,dec_r1=>dec_R1,dec_r2=>dec_R2,dec_r3=>dec_R3,Opcode=>decode_opcode,dec_i=>dec_I,dec_c=>dec_C);


alu_comp :alu_component port map (
alu_r3 => alu_comp_r3,
alu_r2 => alu_comp_r2,
alu_i => alu_comp_i,
alu_r1 => alu_comp_r1,
op => op,
clk => CLK,
alu_c => alu_comp_c,
alu_result => ALU_RESULT
);


S0_compon: reg_component port map ( i => I_s0, clk => CLK, load => load_s0, inc => INC_s0, clr => CLR_s0 ,o => O_s0);
S1_compon: reg_component port map ( i => I_s1, clk => CLK, load => load_s1, inc => INC_s1, clr => CLR_s1 ,o => O_s1);
S2_compon: reg_component port map ( i => I_s2, clk => CLK, load => load_s2, inc => INC_s2, clr => CLR_s2 ,o => O_s2);
S3_compon: reg_component port map ( i => I_s3, clk => CLK, load => load_s3, inc => INC_s3, clr => CLR_s3 ,o => O_s3);
t0_compon: reg_component port map ( i => I_t0, clk => CLK, load => load_t0, inc => INC_t0, clr => CLR_t0 ,o => O_t0);
t1_compon: reg_component port map ( i => I_t1, clk => CLK, load => load_t1, inc => INC_t1, clr => CLR_t1 ,o => O_t1);
t2_compon: reg_component port map ( i => I_t2, clk => CLK, load => load_t2, inc => INC_t2, clr => CLR_t2 ,o => O_t2);
t3_compon: reg_component port map ( i => I_t3, clk => CLK, load => load_t3, inc => INC_t3, clr => CLR_t3 ,o => O_t3);
t4_compon: reg_component port map ( i => I_t4, clk => CLK, load => load_t4, inc => INC_t4, clr => CLR_t4 ,o => O_t4);
ir_compon: reg_component port map ( i => I_ir, clk => CLK, load => load_ir, inc => INC_ir, clr => CLR_ir ,o => O_ir);
a0_compon: reg_component port map ( i => I_a0, clk => CLK, load => load_a0, inc => INC_a0, clr => CLR_a0 ,o => O_a0);
v0_compon: reg_component port map ( i => I_v0, clk => CLK, load => load_v0, inc => INC_v0, clr => CLR_v0 ,o => O_v0);
AR_compon : Ar_component port map (clk => clk, clr => Ar_clr, load => Ar_load , ar_in => ar_in , ar_out => ar_out);
Memory: Memory_fetch_component port map(datain=>memory_Datain,dataout=>memory_Dataout,wr_en=>Wr_en,reset=>Reset,clk=>Clk,ar=>memory_AR,pc=>memory_PC,ir=>memory_IR);


execution : execute_component port map(
E1 => e1,
er1 => Er1,
Er2 => Er2,
Er3 => Er3,
clk => CLK,
c => C,
s => S,
r1 => R1,
r2 => R2,
r3 => R3,
i => I,
pc_in => EXE_PC_IN,
pc_out => EXE_PC_OUT,
ar_in => EXE_AR_IN,
ar_out => EXE_AR_OUT,
address => ADDRESS,
dataout => DATAOUT,
datain => DATAIN,
alu_c => ALU_C,
alu_r1 => ALU_R1,
alu_r2 => ALU_R2,
alu_r3 => ALU_R3,
alu_op => ALU_OP,
alu_i => ALU_I,
s0_in => EXE_S0_IN,
s1_in => EXE_S1_IN,
s2_in => EXE_S2_IN,
s3_in => EXE_S3_IN,
t0_in => EXE_T0_IN,
t1_in => EXE_T1_IN,
t2_in => EXE_T2_IN,
t3_in => EXE_T3_IN,
t4_in => EXE_T4_IN,
ir_in => EXE_IR_IN,
sc_in => EXE_SC_IN,
v0_in => EXE_V0_IN,
a0_in => EXE_A0_IN,
s0_out => EXE_S0_OUT,
s1_out => EXE_S1_OUT,
s2_out => EXE_S2_OUT,
s3_out => EXE_S3_OUT,
t0_out => EXE_T0_OUT,
t1_out => EXE_T1_OUT,
t2_out => EXE_T2_OUT,
t3_out => EXE_T3_OUT,
t4_out => EXE_T4_OUT,
ir_out => EXE_IR_OUT,
sc_out => EXE_SC_OUT,
v0_out => EXE_V0_OUT,
a0_out => EXE_A0_OUT,
clear_s0 => EXE_CLEAR_S0,
clear_s1 => EXE_CLEAR_S1,
clear_s2 => EXE_CLEAR_S2,
clear_s3 => EXE_CLEAR_S3,
clear_t0 => EXE_CLEAR_T0,
clear_t1 => EXE_CLEAR_T1,
clear_t2 => EXE_CLEAR_T2,
clear_t3 => EXE_CLEAR_T3,
clear_t4 => EXE_CLEAR_T4,
clear_pc => EXE_CLEAR_PC,
clear_ir => EXE_CLEAR_IR,
clear_sc => EXE_CLEAR_SC,
clear_v0 => EXE_CLEAR_V0,
clear_a0 => EXE_CLEAR_A0,
clear_ar => EXE_CLEAR_AR,
inc_s0 => EXE_INC_S0,
inc_s1 => EXE_INC_S1,
inc_s2 => EXE_INC_S2,
inc_s3 => EXE_INC_S3,
inc_t0 => EXE_INC_T0,
inc_t1 => EXE_INC_T1,
inc_t2 => EXE_INC_T2,
inc_t3 => EXE_INC_T3,
inc_t4 => EXE_INC_T4,
inc_pc => EXE_INC_PC,
inc_ir => EXE_INC_IR,
inc_sc => EXE_INC_SC,
inc_v0 => EXE_INC_V0,
inc_a0 => EXE_INC_A0,
ctrl_out => CTRL_OUT,
ss0_out => SS0_OUT,
ss1_out => SS1_OUT,
ss2_out  => SS2_OUT,
ss3_out => SS3_OUT ,
st0_out => ST0_OUT ,
st1_out => ST1_OUT ,
st2_out => ST2_OUT ,
st3_out => ST3_OUT ,
st4_out => ST4_OUT ,
sv0_out => SV0_OUT ,
sa0_out => SA0_OUT ,
sar_out => SAR_OUT ,
spc_out => SPC_OUT , 
sir_out => SIR_OUT,
ssc_out => SSC_OUT,
r1_result => R1_RESULT,
r2_result => R2_RESULT,
r3_result => R3_RESULT,
op_result => OP_RESULT,
move_result => MOVE_RESULT,
output_result => OUTPUT_RESULT
);


controlUnit : controlUnit_component port map(
clk => CLK,
ss0 => SS0, 
ss1=>SS1,
ss2 => SS2,
ss3 => SS3,
st0 => ST0,
st1=>ST1 ,
st2 => ST2,
st3 => ST3,
st4=>ST4 ,
sv0 => SV0,
sa0 => SA0,
sar => SAR,
spc => SPC,
sir => SIR,
ssc => SSC,
alu_out => ALU_OUT,
opcode => OPCODE,
add_out => ADD_OUT,
addi_out => ADDI_OUT,
s0_in => CU_S0_IN,
s1_in => CU_S1_IN,
s2_in => CU_S2_IN,
s3_in => CU_S3_IN,
t0_in => CU_T0_IN,
t1_in => CU_T1_IN,
t2_in => CU_T2_IN,
t3_in => CU_T3_IN,
t4_in => CU_T4_IN,
ir_in => CU_IR_IN,
v0_in => CU_V0_IN,
a0_in => CU_A0_IN,
pc_in => CU_PC_IN,
ar_in => CU_AR_IN,
s0_out => CU_S0_OUT,
s1_out => CU_S1_OUT,
s2_out => CU_S2_OUT,
s3_out => CU_S3_OUT,
t0_out => CU_T0_OUT,
t1_out => CU_T1_OUT,
t2_out => CU_T2_OUT,
t3_out => CU_T3_OUT,
t4_out => CU_T4_OUT,
ir_out => CU_IR_OUT,
v0_out => CU_V0_OUT,
a0_out => CU_A0_OUT,
pc_out => CU_PC_OUT,
ar_out => CU_AR_OUT,
clear_s0 => CU_CLEAR_S0,
clear_s1 => CU_CLEAR_S1,
clear_s2 => CU_CLEAR_S2,
clear_s3 => CU_CLEAR_S3,
clear_t0 => CU_CLEAR_T0,
clear_t1 => CU_CLEAR_T1,
clear_t2 => CU_CLEAR_T2,
clear_t3 => CU_CLEAR_T3,
clear_t4 => CU_CLEAR_T4,
clear_pc => CU_CLEAR_PC,
clear_ir => CU_CLEAR_IR,
clear_sc => CU_CLEAR_SC,
clear_v0 => CU_CLEAR_V0,
clear_a0 => CU_CLEAR_A0,
clear_ar => CU_CLEAR_AR,
inc_s0 => CU_INC_S0,
inc_s1 => CU_INC_S1,
inc_s2 => CU_INC_S2,
inc_s3 => CU_INC_S3,
inc_t0 => CU_INC_T0,
inc_t1 => CU_INC_T1,
inc_t2 => CU_INC_T2,
inc_t3 => CU_INC_T3,
inc_t4 => CU_INC_T4,
inc_pc => CU_INC_PC,
inc_ir => CU_INC_IR,
inc_sc => CU_INC_SC,
inc_v0 => CU_INC_V0,
inc_a0 => CU_INC_A0,
cu_opcode => CU_OPCODE,
result => RESULT
);




Bus_1: final_bus port map(e1 => bus_E1, e2 => bus_E2,alu_in => bus_alu_in ,memory_out=>Memory_out,ar_out=>bus_AR_out,s0_out=>bus_S0_out,s1_out=>bus_S1_out,s2_out=>bus_S2_out,s3_out=>bus_S3_out,
t0_out=>bus_t0_out,t1_out=>bus_t1_out,t2_out=>bus_t2_out,t3_out=>bus_t3_out,t4_out=>bus_t4_out,pc_out=>bus_PC_out,ir_out=>bus_IR_out,a0_out=>bus_a0_out,v0_out=>bus_v0_out,
memory_in=>Memory_in,ar_in=>bus_AR_in,s0_in=>bus_S0_in,s1_in=>bus_S1_in,s2_in=>bus_S2_in,s3_in=>bus_S3_in,t0_in=>bus_t0_in,t1_in=>bus_t1_in,t2_in=>bus_t2_in,
t3_in=>bus_t3_in,t4_in=>bus_t4_in,pc_in=>bus_PC_in,ir_in=>bus_IR_in,a0_in=>bus_a0_in,v0_in=>bus_v0_in,ar_load=>bus_ar_load,s0_load=>bus_s0_load,
s1_load=>bus_s1_load,s2_load=>bus_s2_load,s3_load=>bus_s3_load,t0_load=>bus_t0_load,t1_load=>bus_t1_load,t2_load=>bus_t2_load,
t3_load=>bus_t3_load,t4_load=>bus_t4_load,pc_load=>bus_pc_load,ir_load=>bus_ir_load,a0_load=>bus_a0_load,v0_load=>bus_v0_load,s=>bus_S,clk=>clk);


end Behavioral;

