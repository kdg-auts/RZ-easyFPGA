library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TopLevel_Module is
	port (
		   CLK     : in  std_logic;
		   RST     : in  std_logic;
		   KN      : in  std_logic_vector (3 downto 0) ;
		   LED_OUT : out std_logic_vector (3 downto 0)
		);
end TopLevel_Module;	 

architecture TLM_arch of TopLevel_Module is 
	signal FE_sig: std_logic_vector (3 downto 0);
	signal KN_sig: std_logic_vector (3 downto 0);
	signal ST_sig: std_logic_vector (3 downto 0);
	signal BL_sig: std_logic_vector (3 downto 0);
	signal LO_sig: std_logic_vector (3 downto 0);
	signal rst_sig : std_logic;
	
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
			rst	   => rst_sig,
			sw     => KN_sig(0), 
			Redge  => open, 
			Fedge  => FE_sig(0),	
			LVL	   =>  open,	
			Toggle => open,
			LPress => open	
		);	
		
	U2: control_FSM 
		port map (
			CLK       => CLK, 
			RST	      => RST_sig, 
			FE        => FE_sig(0), 
			state_led => ST_sig(0),
			blink_led => BL_sig(0)
		);	  
	
	U3: led_driver 
		port map (
			clk   => clk,
			rst	  => rst_sig,
			state => ST_sig(0),
			blink => BL_Sig(0),
			led	  => LO_Sig(0)
		);
	
	U4: switch_driver 
		port map ( 
			clk    => clk,
			rst	   => rst_sig,
			sw     => KN_sig(1), 
			Redge  => open, 
			Fedge  => FE_sig(1),	
			LVL	   =>  open,	
			Toggle => open,
			LPress => open	
		);	
		
	U5: control_FSM 
		port map (
			CLK       => CLK, 
			RST	      => RST_sig, 
			FE        => FE_sig(1), 
			state_led => ST_sig(1),
			blink_led => BL_sig(1)
		);	  
	
	U6: led_driver 
		port map (
			clk   => clk,
			rst	  => rst_sig,
			state => ST_sig(1),
			blink => BL_Sig(1),
			led	  => LO_Sig(1)
		);
	U7: switch_driver 
		port map ( 
			clk    => clk,
			rst	   => rst_sig,
			sw     => KN_sig(2), 
			Redge  => open, 
			Fedge  => FE_sig(2),	
			LVL	   =>  open,	
			Toggle => open,
			LPress => open	
		);	
		
	U8: control_FSM 
		port map (
			CLK       => CLK, 
			RST	      => RST_sig, 
			FE        => FE_sig(2), 
			state_led => ST_sig(2),
			blink_led => BL_sig(2)
		);	  
	
	U9: led_driver 
		port map (
			clk   => clk,
			rst	  => rst_sig,
			state => ST_sig(2),
			blink => BL_Sig(2),
			led	  => LO_Sig(2)
		);
	U10: switch_driver 
		port map ( 
			clk    => clk,
			rst	   => rst_sig,
			sw     => KN_sig(3), 
			Redge  => open, 
			Fedge  => FE_sig(3),	
			LVL	   =>  open,	
			Toggle => open,
			LPress => open	
		);	
		
	U11: control_FSM 
		port map (
			CLK       => CLK, 
			RST	      => RST_sig, 
			FE        => FE_sig(3), 
			state_led => ST_sig(3),
			blink_led => BL_sig(3)
		);	  
	
	U12: led_driver 
		port map (
			clk   => clk,
			rst	  => rst_sig,
			state => ST_sig(3),
			blink => BL_Sig(3),
			led	  => LO_Sig(3)
		);
	
	KN_sig <= not KN;
	LED_OUT <= not LO_sig; 
	rst_sig <= not rst ;
	
end architecture TLM_arch;
