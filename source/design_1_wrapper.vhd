-------------------------------------------------------------------------------
-- Copyright 1986-2016 Xilinx, Inc.  
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor:                Xilinx, Inc.
-- \   \   \/    Revision:               1.10
--  \   \        Filename:              design_1_wrapper.vhd
--  /   /        Date Last Modified:    May 5 2016
-- /___/   /\    Date Created:          May 5 2016  
-- \   \  /  \   Tool Version:          Vivado v.2016.1 (win64)  
--  \___\/\___\                         
--  
--
-- Device:       UltraScale FPGAs
-- Purpose:      Xapp1280 reference design wrapper.
-- Description:  Top level wrapper and the STARTUPE3 instantiation for 
--              post-configuration access.
--
-- Revision History: 
--    Rev 1.0, 2016/04/05 - [SSJ] Created
--    Rev 1.1, 2016/05/05 - [SSJ] Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    ddr4_sdram_act_n : out STD_LOGIC;
    ddr4_sdram_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    ddr4_sdram_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr4_sdram_bg : out STD_LOGIC;
    ddr4_sdram_ck_c : out STD_LOGIC;
    ddr4_sdram_ck_t : out STD_LOGIC;
    ddr4_sdram_cke : out STD_LOGIC;
    ddr4_sdram_cs_n : out STD_LOGIC;
    ddr4_sdram_dm_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr4_sdram_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
    ddr4_sdram_dqs_c : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr4_sdram_dqs_t : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr4_sdram_odt : out STD_LOGIC;
    ddr4_sdram_reset_n : out STD_LOGIC;
    sysclk_300_clk_n : in STD_LOGIC;
    sysclk_300_clk_p : in STD_LOGIC;
    reset : in STD_LOGIC;
    rs232_uart_rxd : in STD_LOGIC;
    rs232_uart_txd : out STD_LOGIC;
    GPIO_LED: out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    sysclk_300_clk_n : in STD_LOGIC;
    sysclk_300_clk_p : in STD_LOGIC;
    ddr4_sdram_act_n : out STD_LOGIC;
    ddr4_sdram_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    ddr4_sdram_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr4_sdram_bg : out STD_LOGIC;
    ddr4_sdram_ck_c : out STD_LOGIC;
    ddr4_sdram_ck_t : out STD_LOGIC;
    ddr4_sdram_cke : out STD_LOGIC;
    ddr4_sdram_cs_n : out STD_LOGIC;
    ddr4_sdram_dm_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr4_sdram_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
    ddr4_sdram_dqs_c : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr4_sdram_dqs_t : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr4_sdram_odt : out STD_LOGIC;
    ddr4_sdram_reset_n : out STD_LOGIC;
    reset : in STD_LOGIC;
    spi_rtl_io0_i : in STD_LOGIC;
    spi_rtl_io0_o : out STD_LOGIC;
    spi_rtl_io0_t : out STD_LOGIC;
    spi_rtl_io1_i : in STD_LOGIC;
    spi_rtl_io1_o : out STD_LOGIC;
    spi_rtl_io1_t : out STD_LOGIC;
    spi_rtl_io2_i : in STD_LOGIC;
    spi_rtl_io2_o : out STD_LOGIC;
    spi_rtl_io2_t : out STD_LOGIC;
    spi_rtl_io3_i : in STD_LOGIC;
    spi_rtl_io3_o : out STD_LOGIC;
    spi_rtl_io3_t : out STD_LOGIC;
    spi_rtl_sck_i : in STD_LOGIC;
    spi_rtl_sck_o : out STD_LOGIC;
    spi_rtl_sck_t : out STD_LOGIC;
    spi_rtl_ss_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    spi_rtl_ss_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    spi_rtl_ss_t : out STD_LOGIC;
    rs232_uart_rxd : in STD_LOGIC;
    rs232_uart_txd : out STD_LOGIC;
    addn_ui_clkout2 :out STD_LOGIC
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
  signal spi_0_io0_i : STD_LOGIC;
  signal spi_0_io0_o : STD_LOGIC;
  signal spi_0_io0_t : STD_LOGIC;
  signal spi_0_io1_i : STD_LOGIC;
  signal spi_0_io1_o : STD_LOGIC;
  signal spi_0_io1_t : STD_LOGIC;
  signal spi_0_io2_i : STD_LOGIC;
  signal spi_0_io2_o : STD_LOGIC;
  signal spi_0_io2_t : STD_LOGIC;
  signal spi_0_io3_i : STD_LOGIC;
  signal spi_0_io3_o : STD_LOGIC;
  signal spi_0_io3_t : STD_LOGIC;
  signal spi_0_sck_i : STD_LOGIC;
  signal spi_0_sck_o : STD_LOGIC;
  signal spi_0_sck_t : STD_LOGIC;
  signal spi_0_ss_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal spi_0_ss_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal spi_0_ss_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal spi_0_ss_t : STD_LOGIC;
 ---------------------------------------------
  constant ADD_PIPELINTE : integer := 8;
  signal pipe_signal     : std_logic_vector(ADD_PIPELINTE-1 downto 0);
  signal PREQ_int        : std_logic;
  signal PACK_int        : std_logic;
  signal Clk_out         : std_logic;
 ---------------------------------------------
  signal flash_dq_o : std_logic_vector (3 downto 0);
  signal flash_dq_t : std_logic_vector (3 downto 0);
  signal flash_dq_i : std_logic_vector (3 downto 0);
  signal startupe3_eos : STD_LOGIC;
 ---------------------------------------------
  signal cnt : integer := 0;
  signal div_temp : std_logic := '0';
 
 begin
 PREQ_REG_P:process(Clk_out)is  
 begin
      if(Clk_out'event and Clk_out = '1') then
          if(reset = '1')then
               pipe_signal(0) <= '0';
          elsif(PREQ_int = '1')then
               pipe_signal(0) <= '1';
          end if;
      end if;
 end process PREQ_REG_P;
 
 PIPE_PACK_P:process(Clk_out)is 
 begin
      if(Clk_out'event and Clk_out = '1') then
          if(reset = '1')then
               pipe_signal(ADD_PIPELINTE-1 downto 1) <= (others => '0');
          else
               pipe_signal(1) <= pipe_signal(0);
               pipe_signal(2) <= pipe_signal(1);
               pipe_signal(3) <= pipe_signal(2);
               pipe_signal(4) <= pipe_signal(3);
               pipe_signal(5) <= pipe_signal(4);
               pipe_signal(6) <= pipe_signal(5);
               pipe_signal(7) <= pipe_signal(6);
          end if;
                 if (cnt >= 50000000) then
                         div_temp <= not(div_temp);
                         cnt <= 0;
                  else    
                      cnt <= (cnt + 1);
                  end if;
                       GPIO_LED(0) <= div_temp;
                       GPIO_LED(1) <= '0';
                       GPIO_LED(2) <= '0';
                       GPIO_LED(3) <= '0';
                       GPIO_LED(4) <= '0';
                       GPIO_LED(5) <= '0';
                       GPIO_LED(6) <= '0';
                       GPIO_LED(7) <=  not (startupe3_eos);
         end if;
         
 end process PIPE_PACK_P;
 
 PACK_int  <= pipe_signal(7); 

design_1_i: component design_1
     port map (
      ddr4_sdram_act_n => ddr4_sdram_act_n,
      ddr4_sdram_adr(16 downto 0) => ddr4_sdram_adr(16 downto 0),
      ddr4_sdram_ba(1 downto 0) => ddr4_sdram_ba(1 downto 0),
      ddr4_sdram_bg => ddr4_sdram_bg,
      ddr4_sdram_ck_c => ddr4_sdram_ck_c,
      ddr4_sdram_ck_t => ddr4_sdram_ck_t,
      ddr4_sdram_cke => ddr4_sdram_cke,
      ddr4_sdram_cs_n => ddr4_sdram_cs_n,
      ddr4_sdram_dm_n(7 downto 0) => ddr4_sdram_dm_n(7 downto 0),
      ddr4_sdram_dq(63 downto 0) => ddr4_sdram_dq(63 downto 0),
      ddr4_sdram_dqs_c(7 downto 0) => ddr4_sdram_dqs_c(7 downto 0),
      ddr4_sdram_dqs_t(7 downto 0) => ddr4_sdram_dqs_t(7 downto 0),
      ddr4_sdram_odt => ddr4_sdram_odt,
      ddr4_sdram_reset_n => ddr4_sdram_reset_n,
      sysclk_300_clk_n => sysclk_300_clk_n,
      sysclk_300_clk_p => sysclk_300_clk_p,
      reset => reset,
      rs232_uart_rxd => rs232_uart_rxd,
      rs232_uart_txd => rs232_uart_txd,
      spi_rtl_io0_i => flash_dq_i(0),
      spi_rtl_io0_o => flash_dq_o(0),
      spi_rtl_io0_t => flash_dq_t(0),
      spi_rtl_io1_i => flash_dq_i(1),
      spi_rtl_io1_o => flash_dq_o(1),
      spi_rtl_io1_t => flash_dq_t(1),
      spi_rtl_io2_i => flash_dq_i(2),
      spi_rtl_io2_o => flash_dq_o(2),
      spi_rtl_io2_t => flash_dq_t(2),
      spi_rtl_io3_i => flash_dq_i(3),
      spi_rtl_io3_o => flash_dq_o(3),
      spi_rtl_io3_t => flash_dq_t(3),
      spi_rtl_sck_i => spi_0_sck_i,
      spi_rtl_sck_o => spi_0_sck_o,
      spi_rtl_sck_t => spi_0_sck_t,
      spi_rtl_ss_i(0) => spi_0_ss_i_0(0),
      spi_rtl_ss_o(0) => spi_0_ss_o_0(0),
      spi_rtl_ss_t => spi_0_ss_t,
      addn_ui_clkout2 => Clk_out
    );
    
-- STARTUPE3: STARTUP Block
-- Kintex UltraScale+
-- Xilinx HDL Language Template, version 2016.1
STARTUPE3_inst : STARTUPE3
    -----------------------
    generic map
    (
            PROG_USR      => "FALSE",        -- Activate program event security feature. Requires encrypted bitstreams.
            SIM_CCLK_FREQ => 0.0             -- Set the Configuration Clock Frequency (ns) for simulation
    )
    port map
    (
            USRCCLKO  => spi_0_sck_o,       -- 1-bit input: User CCLK input
            ----------
            CFGCLK    => open,              -- 1-bit output: Configuration internal oscillator clock output
            CFGMCLK   => open,              -- 1-bit output: Configuration internal oscillator clock output
            EOS       => startupe3_eos,     -- 1-bit output: Active-High output signal indicating the End Of Startup
            PREQ      => open,              -- 1-bit output: PROGRAM request to fabric output
            ----------
            DO        => flash_dq_o,        -- 4-bit input: Allows control of the D pin output
            DI        => flash_dq_i,        -- 4-bit output: Allow receiving on the D input pin
            DTS       => flash_dq_t,        -- 4-bit input: Allows tristate of the D pin
            FCSBO     => spi_0_ss_o_0(0),   -- 1-bit input: Controls the FCS_B pin for flash access
            FCSBTS    => spi_0_ss_t,        -- 1-bit input: Tristate the FCS_B pin
            GSR       => '0',               -- 1-bit input: Global Set/Reset input (GSR cannot be used for the port)
            GTS       => '0',               -- 1-bit input: Global 3-state input (GTS cannot be used for the port name)
            KEYCLEARB => '1',               -- 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
            PACK      => PACK_int,          -- 1-bit input: PROGRAM acknowledge input
            USRCCLKTS => spi_0_sck_t,       -- 1-bit input: User CCLK 3-state enable input
            USRDONEO  => '1',               -- 1-bit input: User DONE pin output control
            USRDONETS => '1'                -- 1-bit input: User DONE 3-state enable output
    );
 -- End of STARTUPE3_inst instantiation
end STRUCTURE;
			