//Eric Morse CM2084
//Fix_bcd Module
// Implement your fix_bcd module using Verilog

module fix_bcd
(
	input P, T,
	output S
);


//When an input of ten is detected, Fix_bcd forces output of 0.
   assign S = P&~T;
endmodule