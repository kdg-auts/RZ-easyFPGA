SetActiveLib -work
comp -include "$dsn\src\finaly_block.vhd" 
comp -include "$dsn\src\TestBench\finaly_model_TB.vhd" 
asim +access +r TESTBENCH_FOR_finaly_model 
wave 
wave -noreg clk
wave -noreg rst
wave -noreg KN
wave -noreg Led_Out
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\finaly_model_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_finaly_model 
run 2 ms;