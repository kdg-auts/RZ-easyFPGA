library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TopLevel_Module is
	port (
		   CLK     : in  std_logic;
		   RST     : in  std_logic;
		   KN      : in  std_logic;
		   LED_OUT : out std_logic
		);
end TopLevel_Module;	 

architecture TLM_arch of TopLevel_Module is 
	signal FE_sig: std_logic;
	signal KN_sig: std_logic;
	signal ST_sig: std_logic;
	signal BL_sig: std_logic;
	signal LO_sig: std_logic;
	
	component control_FSM 
		port (
			CLK       : in  std_logic;
			RST	      : in  std_logic;
			FE        : in  std_logic;
			STATE_LED : out std_logic;
			BLINK_LED : out std_logic  
		);
	end component; 
	
	component switch_driver
		generic (
			LP_COUNT_PERIOD: integer := 50000000;
			SWS_COUNT_PERIOD: integer := 100000
		);
		port (
			clk    : in  std_logic;
			rst	   : in  std_logic;
			sw     : in  std_logic;
			Redge  : out std_logic;
			Fedge  : out std_logic;
			LVL	   : out std_logic;
			Toggle : out std_logic;
			LPress : out std_logic
		);
	end component; 	
	
	component led_driver
		generic (
			INTERVAL1s: integer := 50000000;
			INTERVAL100ms: integer := 5000000
		);
		port (
			clk   : in  std_logic;
			rst	  : in  std_logic;
			state : in  std_logic;
			blink : in  std_logic;
			led	  : out std_logic
		);
	end component; 						 

begin
	
	U1: switch_driver 
		port map ( 
			clk    => clk,
			rst	   => rst,
			sw     => KN_sig, 
			Redge  => open, 
			Fedge  => FE_sig,	
			LVL	   =>  open,	
			Toggle => open,
			LPress => open	
		);	
		
	U2: control_FSM 
		port map (
			CLK       => CLK, 
			RST	      => RST, 
			FE        => FE_sig, 
			state_led => ST_sig,
			blink_led => BL_sig
		);	  
	
	U3: led_driver 
		port map (
			clk   => clk,
			rst	  => rst,
			state => ST_sig,
			blink => BL_Sig,
			led	  => LO_Sig
		);

	KN_sig <= not KN;
	LED_OUT <= not LO_sig; 
	
end architecture TLM_arch;
