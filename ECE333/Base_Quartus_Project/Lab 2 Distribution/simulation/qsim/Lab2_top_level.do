onerror {quit -f}
vlib work
vlog -work work Lab2_top_level.vo
vlog -work work Lab2_top_level.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.bcd_inc_vlg_vec_tst
vcd file -direction Lab2_top_level.msim.vcd
vcd add -internal bcd_inc_vlg_vec_tst/*
vcd add -internal bcd_inc_vlg_vec_tst/i1/*
add wave /*
run -all
