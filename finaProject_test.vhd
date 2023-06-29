--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:04:35 06/06/2023
-- Design Name:   
-- Module Name:   D:/AAST/ISE projects/abdullah/project/finaProject_test.vhd
-- Project Name:  final_project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mainModule
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY finaProject_test IS
END finaProject_test;
 
ARCHITECTURE behavior OF finaProject_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mainModule
    PORT(
         clk : IN  std_logic;
         pc_clr : IN  std_logic;
         pc_inc : IN  std_logic;
         pc_load : IN  std_logic;
         counter_pc_out : OUT  std_logic_vector(6 downto 0);
         counter_pc_in : IN  std_logic_vector(6 downto 0);
         counter_sc_out : OUT  std_logic_vector(6 downto 0);
         sc_clr : IN  std_logic;
         sc_inc : IN  std_logic;
         opcode1 : IN  std_logic_vector(3 downto 0);
         opcode2 : IN  std_logic_vector(3 downto 0);
         flag : OUT  std_logic_vector(1 downto 0);
         dec_Ir_In : IN  std_logic_vector(31 downto 0);
         dec_R1 : OUT  std_logic_vector(3 downto 0);
         dec_R2 : OUT  std_logic_vector(3 downto 0);
         dec_R3 : OUT  std_logic_vector(3 downto 0);
         decode_opcode : OUT  std_logic_vector(3 downto 0);
         dec_I : OUT  std_logic_vector(18 downto 0);
         dec_C : OUT  std_logic;
         alu_comp_r3 : IN  std_logic_vector(31 downto 0);
         alu_comp_r2 : IN  std_logic_vector(31 downto 0);
         alu_comp_i : IN  std_logic_vector(18 downto 0);
         alu_comp_r1 : OUT  std_logic_vector(31 downto 0);
         op : IN  std_logic_vector(3 downto 0);
         alu_comp_c : IN  std_logic;
         I_s0 : IN  std_logic_vector(31 downto 0);
         I_s1 : IN  std_logic_vector(31 downto 0);
         I_s2 : IN  std_logic_vector(31 downto 0);
         I_s3 : IN  std_logic_vector(31 downto 0);
         I_t0 : IN  std_logic_vector(31 downto 0);
         I_t1 : IN  std_logic_vector(31 downto 0);
         I_t2 : IN  std_logic_vector(31 downto 0);
         I_t3 : IN  std_logic_vector(31 downto 0);
         I_t4 : IN  std_logic_vector(31 downto 0);
         I_ir : IN  std_logic_vector(31 downto 0);
         I_a0 : IN  std_logic_vector(31 downto 0);
         I_v0 : IN  std_logic_vector(31 downto 0);
         INC_s0 : IN  std_logic;
         INC_s1 : IN  std_logic;
         INC_s2 : IN  std_logic;
         INC_s3 : IN  std_logic;
         INC_t0 : IN  std_logic;
         INC_t1 : IN  std_logic;
         INC_t2 : IN  std_logic;
         INC_t3 : IN  std_logic;
         INC_t4 : IN  std_logic;
         INC_ir : IN  std_logic;
         INC_a0 : IN  std_logic;
         INC_v0 : IN  std_logic;
         LOAD_s0 : IN  std_logic;
         LOAD_s1 : IN  std_logic;
         LOAD_s2 : IN  std_logic;
         LOAD_s3 : IN  std_logic;
         LOAD_t0 : IN  std_logic;
         LOAD_t1 : IN  std_logic;
         LOAD_t2 : IN  std_logic;
         LOAD_t3 : IN  std_logic;
         LOAD_t4 : IN  std_logic;
         LOAD_ir : IN  std_logic;
         LOAD_a0 : IN  std_logic;
         LOAD_v0 : IN  std_logic;
         CLR_s0 : IN  std_logic;
         CLR_s1 : IN  std_logic;
         CLR_s2 : IN  std_logic;
         CLR_s3 : IN  std_logic;
         CLR_t0 : IN  std_logic;
         CLR_t1 : IN  std_logic;
         CLR_t2 : IN  std_logic;
         CLR_t3 : IN  std_logic;
         CLR_t4 : IN  std_logic;
         CLR_ir : IN  std_logic;
         CLR_a0 : IN  std_logic;
         CLR_v0 : IN  std_logic;
         O_s0 : OUT  std_logic_vector(31 downto 0);
         O_s1 : OUT  std_logic_vector(31 downto 0);
         O_s2 : OUT  std_logic_vector(31 downto 0);
         O_s3 : OUT  std_logic_vector(31 downto 0);
         O_t0 : OUT  std_logic_vector(31 downto 0);
         O_t1 : OUT  std_logic_vector(31 downto 0);
         O_t2 : OUT  std_logic_vector(31 downto 0);
         O_t3 : OUT  std_logic_vector(31 downto 0);
         O_t4 : OUT  std_logic_vector(31 downto 0);
         O_ir : OUT  std_logic_vector(31 downto 0);
         O_a0 : OUT  std_logic_vector(31 downto 0);
         O_v0 : OUT  std_logic_vector(31 downto 0);
         Ar_clr : IN  std_logic;
         Ar_load : IN  std_logic;
         ar_in : IN  std_logic_vector(6 downto 0);
         ar_out : OUT  std_logic_vector(6 downto 0);
         memory_Datain : IN  std_logic_vector(31 downto 0);
         memory_Dataout : OUT  std_logic_vector(31 downto 0);
         Wr_en : IN  std_logic;
         Reset : IN  std_logic;
         memory_Ar : OUT  std_logic_vector(6 downto 0);
         memory_Pc : IN  std_logic_vector(6 downto 0);
         memory_Ir : OUT  std_logic_vector(31 downto 0);
         ss0 : IN  std_logic_vector(1 downto 0);
         ss1 : IN  std_logic_vector(1 downto 0);
         ss2 : IN  std_logic_vector(1 downto 0);
         ss3 : IN  std_logic_vector(1 downto 0);
         st0 : IN  std_logic_vector(1 downto 0);
         st1 : IN  std_logic_vector(1 downto 0);
         st2 : IN  std_logic_vector(1 downto 0);
         st3 : IN  std_logic_vector(1 downto 0);
         st4 : IN  std_logic_vector(1 downto 0);
         sv0 : IN  std_logic_vector(1 downto 0);
         sa0 : IN  std_logic_vector(1 downto 0);
         sar : IN  std_logic_vector(1 downto 0);
         spc : IN  std_logic_vector(1 downto 0);
         sir : IN  std_logic_vector(1 downto 0);
         ssc : IN  std_logic_vector(1 downto 0);
         ALU_out : IN  std_logic_vector(31 downto 0);
         Opcode : IN  std_logic_vector(3 downto 0);
         add_out : OUT  std_logic_vector(3 downto 0);
         addi_out : OUT  std_logic_vector(3 downto 0);
         cu_s0_in : IN  std_logic_vector(31 downto 0);
         cu_s1_in : IN  std_logic_vector(31 downto 0);
         cu_s2_in : IN  std_logic_vector(31 downto 0);
         cu_s3_in : IN  std_logic_vector(31 downto 0);
         cu_t0_in : IN  std_logic_vector(31 downto 0);
         cu_t1_in : IN  std_logic_vector(31 downto 0);
         cu_t2_in : IN  std_logic_vector(31 downto 0);
         cu_t3_in : IN  std_logic_vector(31 downto 0);
         cu_t4_in : IN  std_logic_vector(31 downto 0);
         cu_ir_in : IN  std_logic_vector(31 downto 0);
         cu_v0_in : IN  std_logic_vector(31 downto 0);
         cu_a0_in : IN  std_logic_vector(31 downto 0);
         cu_pc_in : IN  std_logic_vector(6 downto 0);
         cu_ar_in : IN  std_logic_vector(6 downto 0);
         cu_s0_out : OUT  std_logic_vector(31 downto 0);
         cu_s1_out : OUT  std_logic_vector(31 downto 0);
         cu_s2_out : OUT  std_logic_vector(31 downto 0);
         cu_s3_out : OUT  std_logic_vector(31 downto 0);
         cu_t0_out : OUT  std_logic_vector(31 downto 0);
         cu_t1_out : OUT  std_logic_vector(31 downto 0);
         cu_t2_out : OUT  std_logic_vector(31 downto 0);
         cu_t3_out : OUT  std_logic_vector(31 downto 0);
         cu_t4_out : OUT  std_logic_vector(31 downto 0);
         cu_ir_out : OUT  std_logic_vector(31 downto 0);
         cu_v0_out : OUT  std_logic_vector(31 downto 0);
         cu_a0_out : OUT  std_logic_vector(31 downto 0);
         cu_pc_out : OUT  std_logic_vector(6 downto 0);
         cu_ar_out : OUT  std_logic_vector(6 downto 0);
         cu_clear_s0 : OUT  std_logic;
         cu_clear_s1 : OUT  std_logic;
         cu_clear_s2 : OUT  std_logic;
         cu_clear_s3 : OUT  std_logic;
         cu_clear_t0 : OUT  std_logic;
         cu_clear_t1 : OUT  std_logic;
         cu_clear_t2 : OUT  std_logic;
         cu_clear_t3 : OUT  std_logic;
         cu_clear_t4 : OUT  std_logic;
         cu_clear_pc : OUT  std_logic;
         cu_clear_ir : OUT  std_logic;
         cu_clear_sc : OUT  std_logic;
         cu_clear_v0 : OUT  std_logic;
         cu_clear_a0 : OUT  std_logic;
         cu_clear_ar : OUT  std_logic;
         cu_inc_s0 : OUT  std_logic;
         cu_inc_s1 : OUT  std_logic;
         cu_inc_s2 : OUT  std_logic;
         cu_inc_s3 : OUT  std_logic;
         cu_inc_t0 : OUT  std_logic;
         cu_inc_t1 : OUT  std_logic;
         cu_inc_t2 : OUT  std_logic;
         cu_inc_t3 : OUT  std_logic;
         cu_inc_t4 : OUT  std_logic;
         cu_inc_pc : OUT  std_logic;
         cu_inc_ir : OUT  std_logic;
         cu_inc_sc : OUT  std_logic;
         cu_inc_v0 : OUT  std_logic;
         cu_inc_a0 : OUT  std_logic;
         E1 : IN  std_logic;
         Er1 : IN  std_logic;
         Er2 : IN  std_logic;
         Er3 : IN  std_logic;
         c : IN  std_logic;
         S : IN  std_logic_vector(3 downto 0);
         r1 : IN  std_logic_vector(3 downto 0);
         r2 : IN  std_logic_vector(3 downto 0);
         r3 : IN  std_logic_vector(3 downto 0);
         i : IN  std_logic_vector(18 downto 0);
         exe_pc_in : IN  std_logic_vector(6 downto 0);
         exe_ar_in : IN  std_logic_vector(6 downto 0);
         exe_pc_out : OUT  std_logic_vector(6 downto 0);
         exe_ar_out : OUT  std_logic_vector(6 downto 0);
         address : OUT  std_logic_vector(6 downto 0);
         dataout : IN  std_logic_vector(31 downto 0);
         datain : OUT  std_logic_vector(31 downto 0);
         alu_c : OUT  std_logic;
         alu_r2 : OUT  std_logic_vector(3 downto 0);
         alu_r3 : OUT  std_logic_vector(3 downto 0);
         alu_op : OUT  std_logic_vector(3 downto 0);
         alu_r1 : IN  std_logic_vector(3 downto 0);
         alu_i : OUT  std_logic_vector(18 downto 0);
         exe_s0_in : IN  std_logic_vector(31 downto 0);
         exe_s1_in : IN  std_logic_vector(31 downto 0);
         exe_s2_in : IN  std_logic_vector(31 downto 0);
         exe_s3_in : IN  std_logic_vector(31 downto 0);
         exe_t0_in : IN  std_logic_vector(31 downto 0);
         exe_t1_in : IN  std_logic_vector(31 downto 0);
         exe_t2_in : IN  std_logic_vector(31 downto 0);
         exe_t3_in : IN  std_logic_vector(31 downto 0);
         exe_t4_in : IN  std_logic_vector(31 downto 0);
         exe_ir_in : IN  std_logic_vector(31 downto 0);
         exe_sc_in : IN  std_logic_vector(31 downto 0);
         exe_v0_in : IN  std_logic_vector(31 downto 0);
         exe_a0_in : IN  std_logic_vector(31 downto 0);
         exe_s0_out : OUT  std_logic_vector(31 downto 0);
         exe_s1_out : OUT  std_logic_vector(31 downto 0);
         exe_s2_out : OUT  std_logic_vector(31 downto 0);
         exe_s3_out : OUT  std_logic_vector(31 downto 0);
         exe_t0_out : OUT  std_logic_vector(31 downto 0);
         exe_t1_out : OUT  std_logic_vector(31 downto 0);
         exe_t2_out : OUT  std_logic_vector(31 downto 0);
         exe_t3_out : OUT  std_logic_vector(31 downto 0);
         exe_t4_out : OUT  std_logic_vector(31 downto 0);
         exe_ir_out : OUT  std_logic_vector(31 downto 0);
         exe_sc_out : OUT  std_logic_vector(31 downto 0);
         exe_v0_out : OUT  std_logic_vector(31 downto 0);
         exe_a0_out : OUT  std_logic_vector(31 downto 0);
         exe_clear_s0 : IN  std_logic;
         exe_clear_s1 : IN  std_logic;
         exe_clear_s2 : IN  std_logic;
         exe_clear_s3 : IN  std_logic;
         exe_clear_t0 : IN  std_logic;
         exe_clear_t1 : IN  std_logic;
         exe_clear_t2 : IN  std_logic;
         exe_clear_t3 : IN  std_logic;
         exe_clear_t4 : IN  std_logic;
         exe_clear_pc : IN  std_logic;
         exe_clear_ir : IN  std_logic;
         exe_clear_sc : IN  std_logic;
         exe_clear_v0 : IN  std_logic;
         exe_clear_a0 : IN  std_logic;
         exe_clear_ar : IN  std_logic;
         exe_inc_s0 : IN  std_logic;
         exe_inc_s1 : IN  std_logic;
         exe_inc_s2 : IN  std_logic;
         exe_inc_s3 : IN  std_logic;
         exe_inc_t0 : IN  std_logic;
         exe_inc_t1 : IN  std_logic;
         exe_inc_t2 : IN  std_logic;
         exe_inc_t3 : IN  std_logic;
         exe_inc_t4 : IN  std_logic;
         exe_inc_pc : IN  std_logic;
         exe_inc_ir : IN  std_logic;
         exe_inc_sc : IN  std_logic;
         exe_inc_v0 : IN  std_logic;
         exe_inc_a0 : IN  std_logic;
         ctrl_out : OUT  std_logic_vector(3 downto 0);
         ss0_out : OUT  std_logic_vector(1 downto 0);
         ss1_out : OUT  std_logic_vector(1 downto 0);
         ss2_out : OUT  std_logic_vector(1 downto 0);
         ss3_out : OUT  std_logic_vector(1 downto 0);
         st0_out : OUT  std_logic_vector(1 downto 0);
         st1_out : OUT  std_logic_vector(1 downto 0);
         st2_out : OUT  std_logic_vector(1 downto 0);
         st3_out : OUT  std_logic_vector(1 downto 0);
         st4_out : OUT  std_logic_vector(1 downto 0);
         sv0_out : OUT  std_logic_vector(1 downto 0);
         sa0_out : OUT  std_logic_vector(1 downto 0);
         sar_out : OUT  std_logic_vector(1 downto 0);
         spc_out : OUT  std_logic_vector(1 downto 0);
         sir_out : OUT  std_logic_vector(1 downto 0);
         ssc_out : OUT  std_logic_vector(1 downto 0);
         alu_result : OUT  std_logic;
         r1_result : OUT  std_logic;
         r2_result : OUT  std_logic;
         r3_result : OUT  std_logic;
         op_result : OUT  std_logic;
         move_result : OUT  std_logic;
         output_result : OUT  std_logic;
         cu_opcode : OUT  std_logic;
         result : OUT  std_logic;
         bus_e1 : IN  std_logic;
         bus_E2 : IN  std_logic;
         Memory_out : OUT  std_logic_vector(31 downto 0);
         bus_AR_out : OUT  std_logic_vector(6 downto 0);
         bus_S0_out : OUT  std_logic_vector(31 downto 0);
         bus_S1_out : OUT  std_logic_vector(31 downto 0);
         bus_S2_out : OUT  std_logic_vector(31 downto 0);
         bus_S3_out : OUT  std_logic_vector(31 downto 0);
         bus_t0_out : OUT  std_logic_vector(31 downto 0);
         bus_t1_out : OUT  std_logic_vector(31 downto 0);
         bus_t2_out : OUT  std_logic_vector(31 downto 0);
         bus_t3_out : OUT  std_logic_vector(31 downto 0);
         bus_t4_out : OUT  std_logic_vector(31 downto 0);
         bus_PC_out : OUT  std_logic_vector(6 downto 0);
         bus_IR_out : OUT  std_logic_vector(31 downto 0);
         bus_a0_out : OUT  std_logic_vector(31 downto 0);
         bus_v0_out : OUT  std_logic_vector(31 downto 0);
         bus_alu_in : IN  std_logic_vector(31 downto 0);
         Memory_in : IN  std_logic_vector(31 downto 0);
         bus_AR_in : IN  std_logic_vector(6 downto 0);
         bus_S0_in : IN  std_logic_vector(31 downto 0);
         bus_S1_in : IN  std_logic_vector(31 downto 0);
         bus_S2_in : IN  std_logic_vector(31 downto 0);
         bus_S3_in : IN  std_logic_vector(31 downto 0);
         bus_t0_in : IN  std_logic_vector(31 downto 0);
         bus_t1_in : IN  std_logic_vector(31 downto 0);
         bus_t2_in : IN  std_logic_vector(31 downto 0);
         bus_t3_in : IN  std_logic_vector(31 downto 0);
         bus_t4_in : IN  std_logic_vector(31 downto 0);
         bus_PC_in : IN  std_logic_vector(6 downto 0);
         bus_IR_in : IN  std_logic_vector(31 downto 0);
         bus_a0_in : IN  std_logic_vector(31 downto 0);
         bus_v0_in : IN  std_logic_vector(31 downto 0);
         bus_ar_load : IN  std_logic;
         bus_s0_load : IN  std_logic;
         bus_s1_load : IN  std_logic;
         bus_s2_load : IN  std_logic;
         bus_s3_load : IN  std_logic;
         bus_t0_load : IN  std_logic;
         bus_t1_load : IN  std_logic;
         bus_t2_load : IN  std_logic;
         bus_t3_load : IN  std_logic;
         bus_t4_load : IN  std_logic;
         bus_pc_load : IN  std_logic;
         bus_ir_load : IN  std_logic;
         bus_a0_load : IN  std_logic;
         bus_v0_load : IN  std_logic;
         bus_S : IN  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal pc_clr : std_logic := '0';
   signal pc_inc : std_logic := '0';
   signal pc_load : std_logic := '0';
   signal counter_pc_in : std_logic_vector(6 downto 0) := (others => '0');
   signal sc_clr : std_logic := '0';
   signal sc_inc : std_logic := '0';
   signal opcode1 : std_logic_vector(3 downto 0) := (others => '0');
   signal opcode2 : std_logic_vector(3 downto 0) := (others => '0');
   signal dec_Ir_In : std_logic_vector(31 downto 0) := (others => '0');
   signal alu_comp_r3 : std_logic_vector(31 downto 0) := (others => '0');
   signal alu_comp_r2 : std_logic_vector(31 downto 0) := (others => '0');
   signal alu_comp_i : std_logic_vector(18 downto 0) := (others => '0');
   signal op : std_logic_vector(3 downto 0) := (others => '0');
   signal alu_comp_c : std_logic := '0';
   signal I_s0 : std_logic_vector(31 downto 0) := (others => '0');
   signal I_s1 : std_logic_vector(31 downto 0) := (others => '0');
   signal I_s2 : std_logic_vector(31 downto 0) := (others => '0');
   signal I_s3 : std_logic_vector(31 downto 0) := (others => '0');
   signal I_t0 : std_logic_vector(31 downto 0) := (others => '0');
   signal I_t1 : std_logic_vector(31 downto 0) := (others => '0');
   signal I_t2 : std_logic_vector(31 downto 0) := (others => '0');
   signal I_t3 : std_logic_vector(31 downto 0) := (others => '0');
   signal I_t4 : std_logic_vector(31 downto 0) := (others => '0');
   signal I_ir : std_logic_vector(31 downto 0) := (others => '0');
   signal I_a0 : std_logic_vector(31 downto 0) := (others => '0');
   signal I_v0 : std_logic_vector(31 downto 0) := (others => '0');
   signal INC_s0 : std_logic := '0';
   signal INC_s1 : std_logic := '0';
   signal INC_s2 : std_logic := '0';
   signal INC_s3 : std_logic := '0';
   signal INC_t0 : std_logic := '0';
   signal INC_t1 : std_logic := '0';
   signal INC_t2 : std_logic := '0';
   signal INC_t3 : std_logic := '0';
   signal INC_t4 : std_logic := '0';
   signal INC_ir : std_logic := '0';
   signal INC_a0 : std_logic := '0';
   signal INC_v0 : std_logic := '0';
   signal LOAD_s0 : std_logic := '0';
   signal LOAD_s1 : std_logic := '0';
   signal LOAD_s2 : std_logic := '0';
   signal LOAD_s3 : std_logic := '0';
   signal LOAD_t0 : std_logic := '0';
   signal LOAD_t1 : std_logic := '0';
   signal LOAD_t2 : std_logic := '0';
   signal LOAD_t3 : std_logic := '0';
   signal LOAD_t4 : std_logic := '0';
   signal LOAD_ir : std_logic := '0';
   signal LOAD_a0 : std_logic := '0';
   signal LOAD_v0 : std_logic := '0';
   signal CLR_s0 : std_logic := '0';
   signal CLR_s1 : std_logic := '0';
   signal CLR_s2 : std_logic := '0';
   signal CLR_s3 : std_logic := '0';
   signal CLR_t0 : std_logic := '0';
   signal CLR_t1 : std_logic := '0';
   signal CLR_t2 : std_logic := '0';
   signal CLR_t3 : std_logic := '0';
   signal CLR_t4 : std_logic := '0';
   signal CLR_ir : std_logic := '0';
   signal CLR_a0 : std_logic := '0';
   signal CLR_v0 : std_logic := '0';
   signal Ar_clr : std_logic := '0';
   signal Ar_load : std_logic := '0';
   signal ar_in : std_logic_vector(6 downto 0) := (others => '0');
   signal memory_Datain : std_logic_vector(31 downto 0) := (others => '0');
   signal Wr_en : std_logic := '0';
   signal Reset : std_logic := '0';
   signal memory_Pc : std_logic_vector(6 downto 0) := (others => '0');
   signal ss0 : std_logic_vector(1 downto 0) := (others => '0');
   signal ss1 : std_logic_vector(1 downto 0) := (others => '0');
   signal ss2 : std_logic_vector(1 downto 0) := (others => '0');
   signal ss3 : std_logic_vector(1 downto 0) := (others => '0');
   signal st0 : std_logic_vector(1 downto 0) := (others => '0');
   signal st1 : std_logic_vector(1 downto 0) := (others => '0');
   signal st2 : std_logic_vector(1 downto 0) := (others => '0');
   signal st3 : std_logic_vector(1 downto 0) := (others => '0');
   signal st4 : std_logic_vector(1 downto 0) := (others => '0');
   signal sv0 : std_logic_vector(1 downto 0) := (others => '0');
   signal sa0 : std_logic_vector(1 downto 0) := (others => '0');
   signal sar : std_logic_vector(1 downto 0) := (others => '0');
   signal spc : std_logic_vector(1 downto 0) := (others => '0');
   signal sir : std_logic_vector(1 downto 0) := (others => '0');
   signal ssc : std_logic_vector(1 downto 0) := (others => '0');
   signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
   signal Opcode : std_logic_vector(3 downto 0) := (others => '0');
   signal cu_s0_in : std_logic_vector(31 downto 0) := (others => '0');
   signal cu_s1_in : std_logic_vector(31 downto 0) := (others => '0');
   signal cu_s2_in : std_logic_vector(31 downto 0) := (others => '0');
   signal cu_s3_in : std_logic_vector(31 downto 0) := (others => '0');
   signal cu_t0_in : std_logic_vector(31 downto 0) := (others => '0');
   signal cu_t1_in : std_logic_vector(31 downto 0) := (others => '0');
   signal cu_t2_in : std_logic_vector(31 downto 0) := (others => '0');
   signal cu_t3_in : std_logic_vector(31 downto 0) := (others => '0');
   signal cu_t4_in : std_logic_vector(31 downto 0) := (others => '0');
   signal cu_ir_in : std_logic_vector(31 downto 0) := (others => '0');
   signal cu_v0_in : std_logic_vector(31 downto 0) := (others => '0');
   signal cu_a0_in : std_logic_vector(31 downto 0) := (others => '0');
   signal cu_pc_in : std_logic_vector(6 downto 0) := (others => '0');
   signal cu_ar_in : std_logic_vector(6 downto 0) := (others => '0');
   signal E1 : std_logic := '0';
   signal Er1 : std_logic := '0';
   signal Er2 : std_logic := '0';
   signal Er3 : std_logic := '0';
   signal c : std_logic := '0';
   signal S : std_logic_vector(3 downto 0) := (others => '0');
   signal r1 : std_logic_vector(3 downto 0) := (others => '0');
   signal r2 : std_logic_vector(3 downto 0) := (others => '0');
   signal r3 : std_logic_vector(3 downto 0) := (others => '0');
   signal i : std_logic_vector(18 downto 0) := (others => '0');
   signal exe_pc_in : std_logic_vector(6 downto 0) := (others => '0');
   signal exe_ar_in : std_logic_vector(6 downto 0) := (others => '0');
   signal dataout : std_logic_vector(31 downto 0) := (others => '0');
   signal alu_r1 : std_logic_vector(3 downto 0) := (others => '0');
   signal exe_s0_in : std_logic_vector(31 downto 0) := (others => '0');
   signal exe_s1_in : std_logic_vector(31 downto 0) := (others => '0');
   signal exe_s2_in : std_logic_vector(31 downto 0) := (others => '0');
   signal exe_s3_in : std_logic_vector(31 downto 0) := (others => '0');
   signal exe_t0_in : std_logic_vector(31 downto 0) := (others => '0');
   signal exe_t1_in : std_logic_vector(31 downto 0) := (others => '0');
   signal exe_t2_in : std_logic_vector(31 downto 0) := (others => '0');
   signal exe_t3_in : std_logic_vector(31 downto 0) := (others => '0');
   signal exe_t4_in : std_logic_vector(31 downto 0) := (others => '0');
   signal exe_ir_in : std_logic_vector(31 downto 0) := (others => '0');
   signal exe_sc_in : std_logic_vector(31 downto 0) := (others => '0');
   signal exe_v0_in : std_logic_vector(31 downto 0) := (others => '0');
   signal exe_a0_in : std_logic_vector(31 downto 0) := (others => '0');
   signal exe_clear_s0 : std_logic := '0';
   signal exe_clear_s1 : std_logic := '0';
   signal exe_clear_s2 : std_logic := '0';
   signal exe_clear_s3 : std_logic := '0';
   signal exe_clear_t0 : std_logic := '0';
   signal exe_clear_t1 : std_logic := '0';
   signal exe_clear_t2 : std_logic := '0';
   signal exe_clear_t3 : std_logic := '0';
   signal exe_clear_t4 : std_logic := '0';
   signal exe_clear_pc : std_logic := '0';
   signal exe_clear_ir : std_logic := '0';
   signal exe_clear_sc : std_logic := '0';
   signal exe_clear_v0 : std_logic := '0';
   signal exe_clear_a0 : std_logic := '0';
   signal exe_clear_ar : std_logic := '0';
   signal exe_inc_s0 : std_logic := '0';
   signal exe_inc_s1 : std_logic := '0';
   signal exe_inc_s2 : std_logic := '0';
   signal exe_inc_s3 : std_logic := '0';
   signal exe_inc_t0 : std_logic := '0';
   signal exe_inc_t1 : std_logic := '0';
   signal exe_inc_t2 : std_logic := '0';
   signal exe_inc_t3 : std_logic := '0';
   signal exe_inc_t4 : std_logic := '0';
   signal exe_inc_pc : std_logic := '0';
   signal exe_inc_ir : std_logic := '0';
   signal exe_inc_sc : std_logic := '0';
   signal exe_inc_v0 : std_logic := '0';
   signal exe_inc_a0 : std_logic := '0';
   signal bus_e1 : std_logic := '0';
   signal bus_E2 : std_logic := '0';
   signal bus_alu_in : std_logic_vector(31 downto 0) := (others => '0');
   signal Memory_in : std_logic_vector(31 downto 0) := (others => '0');
   signal bus_AR_in : std_logic_vector(6 downto 0) := (others => '0');
   signal bus_S0_in : std_logic_vector(31 downto 0) := (others => '0');
   signal bus_S1_in : std_logic_vector(31 downto 0) := (others => '0');
   signal bus_S2_in : std_logic_vector(31 downto 0) := (others => '0');
   signal bus_S3_in : std_logic_vector(31 downto 0) := (others => '0');
   signal bus_t0_in : std_logic_vector(31 downto 0) := (others => '0');
   signal bus_t1_in : std_logic_vector(31 downto 0) := (others => '0');
   signal bus_t2_in : std_logic_vector(31 downto 0) := (others => '0');
   signal bus_t3_in : std_logic_vector(31 downto 0) := (others => '0');
   signal bus_t4_in : std_logic_vector(31 downto 0) := (others => '0');
   signal bus_PC_in : std_logic_vector(6 downto 0) := (others => '0');
   signal bus_IR_in : std_logic_vector(31 downto 0) := (others => '0');
   signal bus_a0_in : std_logic_vector(31 downto 0) := (others => '0');
   signal bus_v0_in : std_logic_vector(31 downto 0) := (others => '0');
   signal bus_ar_load : std_logic := '0';
   signal bus_s0_load : std_logic := '0';
   signal bus_s1_load : std_logic := '0';
   signal bus_s2_load : std_logic := '0';
   signal bus_s3_load : std_logic := '0';
   signal bus_t0_load : std_logic := '0';
   signal bus_t1_load : std_logic := '0';
   signal bus_t2_load : std_logic := '0';
   signal bus_t3_load : std_logic := '0';
   signal bus_t4_load : std_logic := '0';
   signal bus_pc_load : std_logic := '0';
   signal bus_ir_load : std_logic := '0';
   signal bus_a0_load : std_logic := '0';
   signal bus_v0_load : std_logic := '0';
   signal bus_S : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal counter_pc_out : std_logic_vector(6 downto 0);
   signal counter_sc_out : std_logic_vector(6 downto 0);
   signal flag : std_logic_vector(1 downto 0);
   signal dec_R1 : std_logic_vector(3 downto 0);
   signal dec_R2 : std_logic_vector(3 downto 0);
   signal dec_R3 : std_logic_vector(3 downto 0);
   signal decode_opcode : std_logic_vector(3 downto 0);
   signal dec_I : std_logic_vector(18 downto 0);
   signal dec_C : std_logic;
   signal alu_comp_r1 : std_logic_vector(31 downto 0);
   signal O_s0 : std_logic_vector(31 downto 0);
   signal O_s1 : std_logic_vector(31 downto 0);
   signal O_s2 : std_logic_vector(31 downto 0);
   signal O_s3 : std_logic_vector(31 downto 0);
   signal O_t0 : std_logic_vector(31 downto 0);
   signal O_t1 : std_logic_vector(31 downto 0);
   signal O_t2 : std_logic_vector(31 downto 0);
   signal O_t3 : std_logic_vector(31 downto 0);
   signal O_t4 : std_logic_vector(31 downto 0);
   signal O_ir : std_logic_vector(31 downto 0);
   signal O_a0 : std_logic_vector(31 downto 0);
   signal O_v0 : std_logic_vector(31 downto 0);
   signal ar_out : std_logic_vector(6 downto 0);
   signal memory_Dataout : std_logic_vector(31 downto 0);
   signal memory_Ar : std_logic_vector(6 downto 0);
   signal memory_Ir : std_logic_vector(31 downto 0);
   signal add_out : std_logic_vector(3 downto 0);
   signal addi_out : std_logic_vector(3 downto 0);
   signal cu_s0_out : std_logic_vector(31 downto 0);
   signal cu_s1_out : std_logic_vector(31 downto 0);
   signal cu_s2_out : std_logic_vector(31 downto 0);
   signal cu_s3_out : std_logic_vector(31 downto 0);
   signal cu_t0_out : std_logic_vector(31 downto 0);
   signal cu_t1_out : std_logic_vector(31 downto 0);
   signal cu_t2_out : std_logic_vector(31 downto 0);
   signal cu_t3_out : std_logic_vector(31 downto 0);
   signal cu_t4_out : std_logic_vector(31 downto 0);
   signal cu_ir_out : std_logic_vector(31 downto 0);
   signal cu_v0_out : std_logic_vector(31 downto 0);
   signal cu_a0_out : std_logic_vector(31 downto 0);
   signal cu_pc_out : std_logic_vector(6 downto 0);
   signal cu_ar_out : std_logic_vector(6 downto 0);
   signal cu_clear_s0 : std_logic;
   signal cu_clear_s1 : std_logic;
   signal cu_clear_s2 : std_logic;
   signal cu_clear_s3 : std_logic;
   signal cu_clear_t0 : std_logic;
   signal cu_clear_t1 : std_logic;
   signal cu_clear_t2 : std_logic;
   signal cu_clear_t3 : std_logic;
   signal cu_clear_t4 : std_logic;
   signal cu_clear_pc : std_logic;
   signal cu_clear_ir : std_logic;
   signal cu_clear_sc : std_logic;
   signal cu_clear_v0 : std_logic;
   signal cu_clear_a0 : std_logic;
   signal cu_clear_ar : std_logic;
   signal cu_inc_s0 : std_logic;
   signal cu_inc_s1 : std_logic;
   signal cu_inc_s2 : std_logic;
   signal cu_inc_s3 : std_logic;
   signal cu_inc_t0 : std_logic;
   signal cu_inc_t1 : std_logic;
   signal cu_inc_t2 : std_logic;
   signal cu_inc_t3 : std_logic;
   signal cu_inc_t4 : std_logic;
   signal cu_inc_pc : std_logic;
   signal cu_inc_ir : std_logic;
   signal cu_inc_sc : std_logic;
   signal cu_inc_v0 : std_logic;
   signal cu_inc_a0 : std_logic;
   signal exe_pc_out : std_logic_vector(6 downto 0);
   signal exe_ar_out : std_logic_vector(6 downto 0);
   signal address : std_logic_vector(6 downto 0);
   signal datain : std_logic_vector(31 downto 0);
   signal alu_c : std_logic;
   signal alu_r2 : std_logic_vector(3 downto 0);
   signal alu_r3 : std_logic_vector(3 downto 0);
   signal alu_op : std_logic_vector(3 downto 0);
   signal alu_i : std_logic_vector(18 downto 0);
   signal exe_s0_out : std_logic_vector(31 downto 0);
   signal exe_s1_out : std_logic_vector(31 downto 0);
   signal exe_s2_out : std_logic_vector(31 downto 0);
   signal exe_s3_out : std_logic_vector(31 downto 0);
   signal exe_t0_out : std_logic_vector(31 downto 0);
   signal exe_t1_out : std_logic_vector(31 downto 0);
   signal exe_t2_out : std_logic_vector(31 downto 0);
   signal exe_t3_out : std_logic_vector(31 downto 0);
   signal exe_t4_out : std_logic_vector(31 downto 0);
   signal exe_ir_out : std_logic_vector(31 downto 0);
   signal exe_sc_out : std_logic_vector(31 downto 0);
   signal exe_v0_out : std_logic_vector(31 downto 0);
   signal exe_a0_out : std_logic_vector(31 downto 0);
   signal ctrl_out : std_logic_vector(3 downto 0);
   signal ss0_out : std_logic_vector(1 downto 0);
   signal ss1_out : std_logic_vector(1 downto 0);
   signal ss2_out : std_logic_vector(1 downto 0);
   signal ss3_out : std_logic_vector(1 downto 0);
   signal st0_out : std_logic_vector(1 downto 0);
   signal st1_out : std_logic_vector(1 downto 0);
   signal st2_out : std_logic_vector(1 downto 0);
   signal st3_out : std_logic_vector(1 downto 0);
   signal st4_out : std_logic_vector(1 downto 0);
   signal sv0_out : std_logic_vector(1 downto 0);
   signal sa0_out : std_logic_vector(1 downto 0);
   signal sar_out : std_logic_vector(1 downto 0);
   signal spc_out : std_logic_vector(1 downto 0);
   signal sir_out : std_logic_vector(1 downto 0);
   signal ssc_out : std_logic_vector(1 downto 0);
   signal alu_result : std_logic;
   signal r1_result : std_logic;
   signal r2_result : std_logic;
   signal r3_result : std_logic;
   signal op_result : std_logic;
   signal move_result : std_logic;
   signal output_result : std_logic;
   signal cu_opcode : std_logic;
   signal result : std_logic;
   signal Memory_out : std_logic_vector(31 downto 0);
   signal bus_AR_out : std_logic_vector(6 downto 0);
   signal bus_S0_out : std_logic_vector(31 downto 0);
   signal bus_S1_out : std_logic_vector(31 downto 0);
   signal bus_S2_out : std_logic_vector(31 downto 0);
   signal bus_S3_out : std_logic_vector(31 downto 0);
   signal bus_t0_out : std_logic_vector(31 downto 0);
   signal bus_t1_out : std_logic_vector(31 downto 0);
   signal bus_t2_out : std_logic_vector(31 downto 0);
   signal bus_t3_out : std_logic_vector(31 downto 0);
   signal bus_t4_out : std_logic_vector(31 downto 0);
   signal bus_PC_out : std_logic_vector(6 downto 0);
   signal bus_IR_out : std_logic_vector(31 downto 0);
   signal bus_a0_out : std_logic_vector(31 downto 0);
   signal bus_v0_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mainModule PORT MAP (
          clk => clk,
          pc_clr => pc_clr,
          pc_inc => pc_inc,
          pc_load => pc_load,
          counter_pc_out => counter_pc_out,
          counter_pc_in => counter_pc_in,
          counter_sc_out => counter_sc_out,
          sc_clr => sc_clr,
          sc_inc => sc_inc,
          opcode1 => opcode1,
          opcode2 => opcode2,
          flag => flag,
          dec_Ir_In => dec_Ir_In,
          dec_R1 => dec_R1,
          dec_R2 => dec_R2,
          dec_R3 => dec_R3,
          decode_opcode => decode_opcode,
          dec_I => dec_I,
          dec_C => dec_C,
          alu_comp_r3 => alu_comp_r3,
          alu_comp_r2 => alu_comp_r2,
          alu_comp_i => alu_comp_i,
          alu_comp_r1 => alu_comp_r1,
          op => op,
          alu_comp_c => alu_comp_c,
          I_s0 => I_s0,
          I_s1 => I_s1,
          I_s2 => I_s2,
          I_s3 => I_s3,
          I_t0 => I_t0,
          I_t1 => I_t1,
          I_t2 => I_t2,
          I_t3 => I_t3,
          I_t4 => I_t4,
          I_ir => I_ir,
          I_a0 => I_a0,
          I_v0 => I_v0,
          INC_s0 => INC_s0,
          INC_s1 => INC_s1,
          INC_s2 => INC_s2,
          INC_s3 => INC_s3,
          INC_t0 => INC_t0,
          INC_t1 => INC_t1,
          INC_t2 => INC_t2,
          INC_t3 => INC_t3,
          INC_t4 => INC_t4,
          INC_ir => INC_ir,
          INC_a0 => INC_a0,
          INC_v0 => INC_v0,
          LOAD_s0 => LOAD_s0,
          LOAD_s1 => LOAD_s1,
          LOAD_s2 => LOAD_s2,
          LOAD_s3 => LOAD_s3,
          LOAD_t0 => LOAD_t0,
          LOAD_t1 => LOAD_t1,
          LOAD_t2 => LOAD_t2,
          LOAD_t3 => LOAD_t3,
          LOAD_t4 => LOAD_t4,
          LOAD_ir => LOAD_ir,
          LOAD_a0 => LOAD_a0,
          LOAD_v0 => LOAD_v0,
          CLR_s0 => CLR_s0,
          CLR_s1 => CLR_s1,
          CLR_s2 => CLR_s2,
          CLR_s3 => CLR_s3,
          CLR_t0 => CLR_t0,
          CLR_t1 => CLR_t1,
          CLR_t2 => CLR_t2,
          CLR_t3 => CLR_t3,
          CLR_t4 => CLR_t4,
          CLR_ir => CLR_ir,
          CLR_a0 => CLR_a0,
          CLR_v0 => CLR_v0,
          O_s0 => O_s0,
          O_s1 => O_s1,
          O_s2 => O_s2,
          O_s3 => O_s3,
          O_t0 => O_t0,
          O_t1 => O_t1,
          O_t2 => O_t2,
          O_t3 => O_t3,
          O_t4 => O_t4,
          O_ir => O_ir,
          O_a0 => O_a0,
          O_v0 => O_v0,
          Ar_clr => Ar_clr,
          Ar_load => Ar_load,
          ar_in => ar_in,
          ar_out => ar_out,
          memory_Datain => memory_Datain,
          memory_Dataout => memory_Dataout,
          Wr_en => Wr_en,
          Reset => Reset,
          memory_Ar => memory_Ar,
          memory_Pc => memory_Pc,
          memory_Ir => memory_Ir,
          ss0 => ss0,
          ss1 => ss1,
          ss2 => ss2,
          ss3 => ss3,
          st0 => st0,
          st1 => st1,
          st2 => st2,
          st3 => st3,
          st4 => st4,
          sv0 => sv0,
          sa0 => sa0,
          sar => sar,
          spc => spc,
          sir => sir,
          ssc => ssc,
          ALU_out => ALU_out,
          Opcode => Opcode,
          add_out => add_out,
          addi_out => addi_out,
          cu_s0_in => cu_s0_in,
          cu_s1_in => cu_s1_in,
          cu_s2_in => cu_s2_in,
          cu_s3_in => cu_s3_in,
          cu_t0_in => cu_t0_in,
          cu_t1_in => cu_t1_in,
          cu_t2_in => cu_t2_in,
          cu_t3_in => cu_t3_in,
          cu_t4_in => cu_t4_in,
          cu_ir_in => cu_ir_in,
          cu_v0_in => cu_v0_in,
          cu_a0_in => cu_a0_in,
          cu_pc_in => cu_pc_in,
          cu_ar_in => cu_ar_in,
          cu_s0_out => cu_s0_out,
          cu_s1_out => cu_s1_out,
          cu_s2_out => cu_s2_out,
          cu_s3_out => cu_s3_out,
          cu_t0_out => cu_t0_out,
          cu_t1_out => cu_t1_out,
          cu_t2_out => cu_t2_out,
          cu_t3_out => cu_t3_out,
          cu_t4_out => cu_t4_out,
          cu_ir_out => cu_ir_out,
          cu_v0_out => cu_v0_out,
          cu_a0_out => cu_a0_out,
          cu_pc_out => cu_pc_out,
          cu_ar_out => cu_ar_out,
          cu_clear_s0 => cu_clear_s0,
          cu_clear_s1 => cu_clear_s1,
          cu_clear_s2 => cu_clear_s2,
          cu_clear_s3 => cu_clear_s3,
          cu_clear_t0 => cu_clear_t0,
          cu_clear_t1 => cu_clear_t1,
          cu_clear_t2 => cu_clear_t2,
          cu_clear_t3 => cu_clear_t3,
          cu_clear_t4 => cu_clear_t4,
          cu_clear_pc => cu_clear_pc,
          cu_clear_ir => cu_clear_ir,
          cu_clear_sc => cu_clear_sc,
          cu_clear_v0 => cu_clear_v0,
          cu_clear_a0 => cu_clear_a0,
          cu_clear_ar => cu_clear_ar,
          cu_inc_s0 => cu_inc_s0,
          cu_inc_s1 => cu_inc_s1,
          cu_inc_s2 => cu_inc_s2,
          cu_inc_s3 => cu_inc_s3,
          cu_inc_t0 => cu_inc_t0,
          cu_inc_t1 => cu_inc_t1,
          cu_inc_t2 => cu_inc_t2,
          cu_inc_t3 => cu_inc_t3,
          cu_inc_t4 => cu_inc_t4,
          cu_inc_pc => cu_inc_pc,
          cu_inc_ir => cu_inc_ir,
          cu_inc_sc => cu_inc_sc,
          cu_inc_v0 => cu_inc_v0,
          cu_inc_a0 => cu_inc_a0,
          E1 => E1,
          Er1 => Er1,
          Er2 => Er2,
          Er3 => Er3,
          c => c,
          S => S,
          r1 => r1,
          r2 => r2,
          r3 => r3,
          i => i,
          exe_pc_in => exe_pc_in,
          exe_ar_in => exe_ar_in,
          exe_pc_out => exe_pc_out,
          exe_ar_out => exe_ar_out,
          address => address,
          dataout => dataout,
          datain => datain,
          alu_c => alu_c,
          alu_r2 => alu_r2,
          alu_r3 => alu_r3,
          alu_op => alu_op,
          alu_r1 => alu_r1,
          alu_i => alu_i,
          exe_s0_in => exe_s0_in,
          exe_s1_in => exe_s1_in,
          exe_s2_in => exe_s2_in,
          exe_s3_in => exe_s3_in,
          exe_t0_in => exe_t0_in,
          exe_t1_in => exe_t1_in,
          exe_t2_in => exe_t2_in,
          exe_t3_in => exe_t3_in,
          exe_t4_in => exe_t4_in,
          exe_ir_in => exe_ir_in,
          exe_sc_in => exe_sc_in,
          exe_v0_in => exe_v0_in,
          exe_a0_in => exe_a0_in,
          exe_s0_out => exe_s0_out,
          exe_s1_out => exe_s1_out,
          exe_s2_out => exe_s2_out,
          exe_s3_out => exe_s3_out,
          exe_t0_out => exe_t0_out,
          exe_t1_out => exe_t1_out,
          exe_t2_out => exe_t2_out,
          exe_t3_out => exe_t3_out,
          exe_t4_out => exe_t4_out,
          exe_ir_out => exe_ir_out,
          exe_sc_out => exe_sc_out,
          exe_v0_out => exe_v0_out,
          exe_a0_out => exe_a0_out,
          exe_clear_s0 => exe_clear_s0,
          exe_clear_s1 => exe_clear_s1,
          exe_clear_s2 => exe_clear_s2,
          exe_clear_s3 => exe_clear_s3,
          exe_clear_t0 => exe_clear_t0,
          exe_clear_t1 => exe_clear_t1,
          exe_clear_t2 => exe_clear_t2,
          exe_clear_t3 => exe_clear_t3,
          exe_clear_t4 => exe_clear_t4,
          exe_clear_pc => exe_clear_pc,
          exe_clear_ir => exe_clear_ir,
          exe_clear_sc => exe_clear_sc,
          exe_clear_v0 => exe_clear_v0,
          exe_clear_a0 => exe_clear_a0,
          exe_clear_ar => exe_clear_ar,
          exe_inc_s0 => exe_inc_s0,
          exe_inc_s1 => exe_inc_s1,
          exe_inc_s2 => exe_inc_s2,
          exe_inc_s3 => exe_inc_s3,
          exe_inc_t0 => exe_inc_t0,
          exe_inc_t1 => exe_inc_t1,
          exe_inc_t2 => exe_inc_t2,
          exe_inc_t3 => exe_inc_t3,
          exe_inc_t4 => exe_inc_t4,
          exe_inc_pc => exe_inc_pc,
          exe_inc_ir => exe_inc_ir,
          exe_inc_sc => exe_inc_sc,
          exe_inc_v0 => exe_inc_v0,
          exe_inc_a0 => exe_inc_a0,
          ctrl_out => ctrl_out,
          ss0_out => ss0_out,
          ss1_out => ss1_out,
          ss2_out => ss2_out,
          ss3_out => ss3_out,
          st0_out => st0_out,
          st1_out => st1_out,
          st2_out => st2_out,
          st3_out => st3_out,
          st4_out => st4_out,
          sv0_out => sv0_out,
          sa0_out => sa0_out,
          sar_out => sar_out,
          spc_out => spc_out,
          sir_out => sir_out,
          ssc_out => ssc_out,
          alu_result => alu_result,
          r1_result => r1_result,
          r2_result => r2_result,
          r3_result => r3_result,
          op_result => op_result,
          move_result => move_result,
          output_result => output_result,
          cu_opcode => cu_opcode,
          result => result,
          bus_e1 => bus_e1,
          bus_E2 => bus_E2,
          Memory_out => Memory_out,
          bus_AR_out => bus_AR_out,
          bus_S0_out => bus_S0_out,
          bus_S1_out => bus_S1_out,
          bus_S2_out => bus_S2_out,
          bus_S3_out => bus_S3_out,
          bus_t0_out => bus_t0_out,
          bus_t1_out => bus_t1_out,
          bus_t2_out => bus_t2_out,
          bus_t3_out => bus_t3_out,
          bus_t4_out => bus_t4_out,
          bus_PC_out => bus_PC_out,
          bus_IR_out => bus_IR_out,
          bus_a0_out => bus_a0_out,
          bus_v0_out => bus_v0_out,
          bus_alu_in => bus_alu_in,
          Memory_in => Memory_in,
          bus_AR_in => bus_AR_in,
          bus_S0_in => bus_S0_in,
          bus_S1_in => bus_S1_in,
          bus_S2_in => bus_S2_in,
          bus_S3_in => bus_S3_in,
          bus_t0_in => bus_t0_in,
          bus_t1_in => bus_t1_in,
          bus_t2_in => bus_t2_in,
          bus_t3_in => bus_t3_in,
          bus_t4_in => bus_t4_in,
          bus_PC_in => bus_PC_in,
          bus_IR_in => bus_IR_in,
          bus_a0_in => bus_a0_in,
          bus_v0_in => bus_v0_in,
          bus_ar_load => bus_ar_load,
          bus_s0_load => bus_s0_load,
          bus_s1_load => bus_s1_load,
          bus_s2_load => bus_s2_load,
          bus_s3_load => bus_s3_load,
          bus_t0_load => bus_t0_load,
          bus_t1_load => bus_t1_load,
          bus_t2_load => bus_t2_load,
          bus_t3_load => bus_t3_load,
          bus_t4_load => bus_t4_load,
          bus_pc_load => bus_pc_load,
          bus_ir_load => bus_ir_load,
          bus_a0_load => bus_a0_load,
          bus_v0_load => bus_v0_load,
          bus_S => bus_S
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		
			pc_clr <= '1';
		pc_load <= '0';
		pc_inc <= '0';
		sc_clr <= '1';
		sc_inc <= '0';
		wait for clk_period*10;
	
      -- insert stimulus here 
		 bus_E1 <= '1';
        bus_S <= "1100";
        bus_AR_in <= "0000001"; -- bus = ar
      -- insert stimulus here 
		
		
		pc_clr <= '0';
		pc_load <= '0';
		pc_inc <= '1';
		sc_clr <= '0';
		sc_inc <= '1';
		
        wait for clk_period*5;
        bus_E2 <= '1';
        bus_S <= "0000";
        bus_s0_load <= '1'; -- s0 = bus
		  
		  pc_clr <= '0';
		pc_load <= '0';
		pc_inc <= '1';
		sc_clr <= '0';
		sc_inc <= '1';
        wait for clk_period*5;
        bus_E1 <= '1';
        bus_S <= "1101";
        memory_in <= "00000000000000000000000000000011"; --bus = memory 
		  
		  pc_clr <= '0';
		pc_load <= '1';
		counter_pc_in <= "0101101";
		pc_inc <= '0';
		sc_clr <= '0';
		sc_inc <= '1';
		
        wait for clk_period*5;
		  
        bus_E2 <= '1';
        bus_S <= "0101";
        bus_t1_load <= '1';
		
		pc_clr <= '0';
		pc_load <= '1';
		counter_pc_in <= "0101101";
		pc_inc <= '0';
		sc_clr <= '1';
		sc_inc <= '0';
		
		wait for clk_period*5;
		  alu_C<='0';
        OP<="0000";
        alu_comp_r2<="00000000000000000000000000001000";
        alu_comp_r3<="00000000000000000000000000000010";
        wait for clk_period*5;
        alu_C<='1';
        OP<="0001";
        alu_comp_r2<="00000000000000000000000000001000";
        alu_comp_i<="0000000000000000100";
        wait for clk_period*5;
        alu_C<='0';
        OP<="0000";
        alu_comp_r2<="00000000000000000000000000001100";
      alu_comp_R3<="00000000000000000000000000000110";
		  wait for clk_period*5;
			
			dec_Ir_In <= "10000010000010000111000000000111";
			wait for clk_period*5;
			dec_Ir_In <= "00000010000010000111000000000111";
      
		wait for clk_period*5;
		
		opcode1 <= "0011";
		opcode2 <= "0111";
      -- insert stimulus here 
		wait for clk_period*5;
		
		-- execute
		i <= "0000000000000000001";
		exe_pc_in <= "0000010";
		wait for clk_period*3;
		e1 <= '1';
		s <= "1000";
		c <= '1';
		--exe_s3_in <=  "00000000000000000000000000000011";
		--exe_t2_in <= "00000000000000000000000000000010";
		--cu_s3_in <=  "00000000000000000000000000000011";
		--cu_t2_in <= "00000000000000000000000000000010";
		wait for clk_period*3;
		er1 <= '1';
		r1 <= "0000"; --s0
		ss0 <= ss0_out;
		--opcode <= ctrl_out;
		--wait for clk_period*3;
		--er2 <= '1';
		--r2 <= "0011"; --s3
      --wait for clk_period*3;
		--er3 <= '1';
		--r3 <= "0110"; --t2
		--wait for clk_period*3;
		--op <= alu_op;
		--alu_comp_c <= alu_c;
		--alu_out <= alu_comp_r1;
		
		
		-- control unit
		wait for clk_period*3;
		opcode <= "0000";
		ss0 <= "01";
		wait for clk_period*3;
		--clear
		opcode <= "1010";
		ss3 <= "01";
		wait for clk_period*3;
		--increment
		opcode <= "1011";
		st3 <= "01";
		
      wait;
   end process;

END;
