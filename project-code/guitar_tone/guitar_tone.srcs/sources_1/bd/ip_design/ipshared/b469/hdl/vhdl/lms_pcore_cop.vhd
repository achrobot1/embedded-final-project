-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\lms\lms_pcore_cop.vhd
-- Created: 2015-06-26 15:25:11
-- 
-- Generated by MATLAB 8.5 and HDL Coder 3.6
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: lms_pcore_cop
-- Source Path: lms_pcore/lms_pcore_cop
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY lms_pcore_cop IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        in_strobe                         :   IN    std_logic;  -- ufix1
        cop_enable                        :   IN    std_logic;  -- ufix1
        out_ready                         :   OUT   std_logic;  -- ufix1
        dut_enable                        :   OUT   std_logic;  -- ufix1
        reg_strobe                        :   OUT   std_logic  -- ufix1
        );
END lms_pcore_cop;


ARCHITECTURE rtl OF lms_pcore_cop IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL cp_controller_cpstate            : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL cp_controller_clkcnt             : std_logic;  -- ufix1
  SIGNAL cp_controller_cpstate_next       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL cp_controller_clkcnt_next        : std_logic;  -- ufix1

BEGIN
  enb <= cop_enable;

  cp_controller_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      cp_controller_cpstate <= to_unsigned(16#00#, 8);
      cp_controller_clkcnt <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        cp_controller_cpstate <= cp_controller_cpstate_next;
        cp_controller_clkcnt <= cp_controller_clkcnt_next;
      END IF;
    END IF;
  END PROCESS cp_controller_process;

  cp_controller_output : PROCESS (cp_controller_cpstate, cp_controller_clkcnt, in_strobe)
    VARIABLE clkcnt_temp : std_logic;
    VARIABLE add_cast : unsigned(1 DOWNTO 0);
    VARIABLE add_temp : unsigned(1 DOWNTO 0);
  BEGIN
    cp_controller_cpstate_next <= cp_controller_cpstate;
    CASE cp_controller_cpstate IS
      WHEN "00000000" =>
        out_ready <= '1';
        dut_enable <= '0';
        reg_strobe <= '0';
        clkcnt_temp := '0';
        IF in_strobe /= '0' THEN 
          cp_controller_cpstate_next <= to_unsigned(16#01#, 8);
        ELSE 
          cp_controller_cpstate_next <= to_unsigned(16#00#, 8);
        END IF;
      WHEN "00000001" =>
        out_ready <= '0';
        dut_enable <= '1';
        reg_strobe <= '0';
        add_cast := '0' & cp_controller_clkcnt;
        add_temp := add_cast + to_unsigned(16#1#, 2);
        clkcnt_temp := add_temp(0);
        IF clkcnt_temp = '1' THEN 
          cp_controller_cpstate_next <= to_unsigned(16#02#, 8);
        ELSE 
          cp_controller_cpstate_next <= to_unsigned(16#01#, 8);
        END IF;
      WHEN "00000010" =>
        out_ready <= '0';
        dut_enable <= '0';
        reg_strobe <= '1';
        clkcnt_temp := '0';
        cp_controller_cpstate_next <= to_unsigned(16#00#, 8);
      WHEN OTHERS => 
        out_ready <= '0';
        dut_enable <= '0';
        reg_strobe <= '0';
        clkcnt_temp := '0';
        cp_controller_cpstate_next <= to_unsigned(16#00#, 8);
    END CASE;
    cp_controller_clkcnt_next <= clkcnt_temp;
  END PROCESS cp_controller_output;


END rtl;

