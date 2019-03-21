library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity TLM_tb is
end TLM_tb;

architecture TLM_TB_ARCH of TLM_tb is
	-- Component declaration of the tested unit
	component TopLevel_Module
	port(
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		KN : in STD_LOGIC;
		Led_Out : out STD_LOGIC );
	end component;

	-- stimulus signals
	signal clk : STD_LOGIC;
	signal rst : STD_LOGIC;
	signal KN : STD_LOGIC;
	-- observed signals
	signal Led_Out : STD_LOGIC;

	-- clock period
   constant clk_period : time := 20 ns; 
   
begin

	-- Unit Under Test port map
	UUT : TopLevel_Module
		port map (
			clk => clk,
			rst => rst,
			KN => KN,
			Led_Out => Led_Out
		);

	-- Add your stimulus here ...
	
	CLK_Gen: process 
	begin
		
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		
	end process;  
	
	
	rst_Gen: process 
	begin
		
		rst <= '1';
		wait for clk_period *2;
		rst <= '0';
		wait;
		
	end process;  
	
	KN_Gen: process 
	begin
		
		KN <= '1';
		wait for 100 ms;
		KN <= '0'; 
		wait for 20 ms;
		
	end process;  

end TLM_TB_ARCH;

configuration TESTBENCH_FOR_TLM of TLM_TB is
	for TLM_TB_ARCH
		for UUT : finaly_model
			use entity work.finaly_model(led_drv_arch);
		end for;
	end for;
end TESTBENCH_FOR_finaly_model;

