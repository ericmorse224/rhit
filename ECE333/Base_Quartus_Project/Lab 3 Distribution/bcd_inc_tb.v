`timescale 1ns/1ps
// This is a test bench to test the bcd_inc module

module bcd_inc_tb;
	reg A3_Test, A2_Test, A1_Test, A0_Test, Cin_Test;	// inputs
	wire S3_Test, S2_Test, S1_Test, S0_Test, Cout_Test;	// outputs
	
	// Instantiating a copy of the module we are testing
	bcd_inc uut(A3_Test, A2_Test, A1_Test, A0_Test, Cin_Test, S3_Test, S2_Test, S1_Test, S0_Test, Cout_Test);

// These test values test: 1) If Cin = 0, hold, 2) If Cin = 1, increment
// and 3) If the value is 9 (1001) and Cin = 1, go back to zero
initial begin
	A3_Test = 0; A2_Test = 0; A1_Test = 0; A0_Test = 0; Cin_Test = 0; #5;
	A3_Test = 0; A2_Test = 0; A1_Test = 0; A0_Test = 0; Cin_Test = 1; #5;
	A3_Test = 0; A2_Test = 0; A1_Test = 0; A0_Test = 1; Cin_Test = 0; #5;
	A3_Test = 0; A2_Test = 0; A1_Test = 0; A0_Test = 1; Cin_Test = 1; #5;
	A3_Test = 0; A2_Test = 0; A1_Test = 1; A0_Test = 0; Cin_Test = 0; #5;
	A3_Test = 0; A2_Test = 0; A1_Test = 1; A0_Test = 0; Cin_Test = 1; #5;
	A3_Test = 0; A2_Test = 0; A1_Test = 1; A0_Test = 1; Cin_Test = 0; #5;
	A3_Test = 0; A2_Test = 0; A1_Test = 1; A0_Test = 1; Cin_Test = 1; #5;
	A3_Test = 0; A2_Test = 1; A1_Test = 0; A0_Test = 0; Cin_Test = 0; #5;
	A3_Test = 0; A2_Test = 1; A1_Test = 0; A0_Test = 0; Cin_Test = 1; #5;
	A3_Test = 0; A2_Test = 1; A1_Test = 0; A0_Test = 1; Cin_Test = 0; #5;
	A3_Test = 0; A2_Test = 1; A1_Test = 0; A0_Test = 1; Cin_Test = 1; #5;
	A3_Test = 0; A2_Test = 1; A1_Test = 1; A0_Test = 0; Cin_Test = 0; #5;
	A3_Test = 0; A2_Test = 1; A1_Test = 1; A0_Test = 0; Cin_Test = 1; #5;
	A3_Test = 0; A2_Test = 1; A1_Test = 1; A0_Test = 1; Cin_Test = 0; #5;
	A3_Test = 0; A2_Test = 1; A1_Test = 1; A0_Test = 1; Cin_Test = 1; #5;
	A3_Test = 1; A2_Test = 0; A1_Test = 0; A0_Test = 0; Cin_Test = 0; #5;
	A3_Test = 1; A2_Test = 0; A1_Test = 0; A0_Test = 0; Cin_Test = 1; #5;
	A3_Test = 1; A2_Test = 0; A1_Test = 0; A0_Test = 1; Cin_Test = 0; #5;
	A3_Test = 1; A2_Test = 0; A1_Test = 0; A0_Test = 1; Cin_Test = 1; #5;
	$stop;
end
endmodule