//Eric Morse CM2084
//bcd_inc Module
// After creating your inc1b, fix_bcd, and ten_detect Verilog modules
// Use instantiations of them (copies) to make the bcd_inc module

module bcd_inc
(
	input A3, A2, A1, A0, Cin,
	output S3, S2, S1, S0, Cout
);

wire Cout_3, Cout_2, Cout_1, Cout_0; // the Cout of each inc1b
wire inc_S3, inc_S2, inc_S1, inc_S0; // the S output of each inc1b
wire T; // the T output of the ten_detect

//make 3 more copies of inc1b and use the correct input, outputs, and wires
//Connects the inputs to the 4 inc1bs.  
inc1b inc3(A0, Cin, Cout_0, inc_S0); 
inc1b inc4(A1, Cout_0, Cout_1, inc_S1);
inc1b inc5(A2, Cout_1, Cout_2, inc_S2);
inc1b inc6(A3, Cout_2, Cout_3, inc_S3);

// make 1 copy of ten_detect
//Takes the S outputs from the inc1bs to detect if a value of 10 occurs
ten_detect ten1(inc_S3,inc_S2,inc_S1,inc_S0, T);
// make 4 copies of fix_bcd
//forces output of 0 if ten is detected.
fix_bcd fix1(inc_S0, T, S0);
fix_bcd fix2(inc_S1, T, S1);
fix_bcd fix3(inc_S2, T, S2);
fix_bcd fix4(inc_S3, T, S3);
//If ten is detected, it sets Cout to 1 to increment next 7Segment Display
assign Cout = T;
endmodule