onerror {quit -f}
vlib work
vlog -work work Lab6_test.vo
vlog -work work Lab6_test.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Lab6_test_vlg_vec_tst
vcd file -direction Lab6_test.msim.vcd
vcd add -internal Lab6_test_vlg_vec_tst/*
vcd add -internal Lab6_test_vlg_vec_tst/i1/*
add wave /*
run -all
