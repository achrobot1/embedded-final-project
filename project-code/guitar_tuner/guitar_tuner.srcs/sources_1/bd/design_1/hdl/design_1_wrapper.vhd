--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
--Date        : Fri Dec 13 14:56:17 2019
--Host        : ece36 running 64-bit Ubuntu 16.04.5 LTS
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    BCLK_0 : out STD_LOGIC;
    FCLK_CLK1_0 : out STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    GPIO_0_tri_io : inout STD_LOGIC_VECTOR ( 0 to 0 );
    IIC_0_0_scl_io : inout STD_LOGIC;
    IIC_0_0_sda_io : inout STD_LOGIC;
    PBDATA_0 : out STD_LOGIC;
    PBLRCLK_0 : out STD_LOGIC;
    RECDAT_0 : in STD_LOGIC;
    RECLRCLK_0 : out STD_LOGIC;
    seven_segment : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    seven_segment : out STD_LOGIC_VECTOR ( 7 downto 0 );
    BCLK_0 : out STD_LOGIC;
    PBDATA_0 : out STD_LOGIC;
    PBLRCLK_0 : out STD_LOGIC;
    RECDAT_0 : in STD_LOGIC;
    RECLRCLK_0 : out STD_LOGIC;
    IIC_0_0_sda_i : in STD_LOGIC;
    IIC_0_0_sda_o : out STD_LOGIC;
    IIC_0_0_sda_t : out STD_LOGIC;
    IIC_0_0_scl_i : in STD_LOGIC;
    IIC_0_0_scl_o : out STD_LOGIC;
    IIC_0_0_scl_t : out STD_LOGIC;
    FCLK_CLK1_0 : out STD_LOGIC;
    GPIO_0_tri_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    GPIO_0_tri_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    GPIO_0_tri_t : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal GPIO_0_tri_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPIO_0_tri_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPIO_0_tri_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPIO_0_tri_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal IIC_0_0_scl_i : STD_LOGIC;
  signal IIC_0_0_scl_o : STD_LOGIC;
  signal IIC_0_0_scl_t : STD_LOGIC;
  signal IIC_0_0_sda_i : STD_LOGIC;
  signal IIC_0_0_sda_o : STD_LOGIC;
  signal IIC_0_0_sda_t : STD_LOGIC;
begin
GPIO_0_tri_iobuf_0: component IOBUF
     port map (
      I => GPIO_0_tri_o_0(0),
      IO => GPIO_0_tri_io(0),
      O => GPIO_0_tri_i_0(0),
      T => GPIO_0_tri_t_0(0)
    );
IIC_0_0_scl_iobuf: component IOBUF
     port map (
      I => IIC_0_0_scl_o,
      IO => IIC_0_0_scl_io,
      O => IIC_0_0_scl_i,
      T => IIC_0_0_scl_t
    );
IIC_0_0_sda_iobuf: component IOBUF
     port map (
      I => IIC_0_0_sda_o,
      IO => IIC_0_0_sda_io,
      O => IIC_0_0_sda_i,
      T => IIC_0_0_sda_t
    );
design_1_i: component design_1
     port map (
      BCLK_0 => BCLK_0,
      FCLK_CLK1_0 => FCLK_CLK1_0,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      GPIO_0_tri_i(0) => GPIO_0_tri_i_0(0),
      GPIO_0_tri_o(0) => GPIO_0_tri_o_0(0),
      GPIO_0_tri_t(0) => GPIO_0_tri_t_0(0),
      IIC_0_0_scl_i => IIC_0_0_scl_i,
      IIC_0_0_scl_o => IIC_0_0_scl_o,
      IIC_0_0_scl_t => IIC_0_0_scl_t,
      IIC_0_0_sda_i => IIC_0_0_sda_i,
      IIC_0_0_sda_o => IIC_0_0_sda_o,
      IIC_0_0_sda_t => IIC_0_0_sda_t,
      PBDATA_0 => PBDATA_0,
      PBLRCLK_0 => PBLRCLK_0,
      RECDAT_0 => RECDAT_0,
      RECLRCLK_0 => RECLRCLK_0,
      seven_segment(7 downto 0) => seven_segment(7 downto 0)
    );
end STRUCTURE;
