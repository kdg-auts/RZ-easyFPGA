library IEEE;
use IEEE.std_logic_1164.all;

entity kx_testbench is 
end entity;

architecture kx_t_arc of kx_testbench is 
	signal t_x, t_y: std_logic_vector(3 downto 0);
	component kx_module
	port(
		x: in std_logic_vector(3 downto 0);
		y: out std_logic_vector(3 downto 0)
	);
	end component;

begin 

	UUT: kx_module
	port map( x => t_x, y => t_y);

	tb_engine: process 
	begin
		t_x <= "0000";
		wait for 10 ns;
		t_x <= "0001";
		wait for 10 ns;
		t_x <= "0010";
		wait for 10 ns;
		t_x <= "0011";
		wait for 10 ns;
		t_x <= "0100";
		wait for 10 ns;
		t_x <= "0101";
		wait for 10 ns;
		t_x <= "0110";
		wait for 10 ns;
		t_x <= "0111";
		wait for 10 ns;
		t_x <= "1000";
		wait for 10 ns;
		t_x <= "1001";
		wait for 10 ns;
		t_x <= "1010";
		wait for 10 ns;
		t_x <= "1011";
		wait for 10 ns;
		t_x <= "1100";
		wait for 10 ns;
		t_x <= "1101";
		wait for 10 ns;
		t_x <= "1110";
		wait for 10 ns;
		t_x <= "1111";
		wait;
	end process;
end architecture;