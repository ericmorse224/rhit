onerror {quit -f}
vlib work
vlog -work work ECE233_Base.vo
vlog -work work ECE233_Base.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.fa4_vlg_vec_tst
vcd file -direction ECE233_Base.msim.vcd
vcd add -internal fa4_vlg_vec_tst/*
vcd add -internal fa4_vlg_vec_tst/i1/*
add wave /*
run -all
