`timescale 1ns/1ps
// This is a test bench to test the segG module

module segG_tb;
	reg D3_Test, D2_Test, D1_Test, D0_Test;	// inputs
	wire segG_Test;	// outputs
	
	// Instantiating a copy of the module we are testing
	segG uut(D3_Test, D2_Test, D1_Test, D0_Test, segG_Test);

initial begin
	// Fill in the 16 test inputs to test this
	D3_Test = 0; D2_Test = 0; D1_Test = 0; D0_Test = 0;   #10;
	D3_Test = 0; D2_Test = 0; D1_Test = 0; D0_Test = 1;   #10;
	D3_Test = 0; D2_Test = 0; D1_Test = 1; D0_Test = 0;   #10;
	D3_Test = 0; D2_Test = 0; D1_Test = 1; D0_Test = 1;   #10;
	D3_Test = 0; D2_Test = 1; D1_Test = 0; D0_Test = 0;   #10;
	D3_Test = 0; D2_Test = 1; D1_Test = 0; D0_Test = 1;   #10;
	D3_Test = 0; D2_Test = 1; D1_Test = 1; D0_Test = 0;   #10;
	D3_Test = 0; D2_Test = 1; D1_Test = 1; D0_Test = 1;   #10;
	D3_Test = 1; D2_Test = 0; D1_Test = 0; D0_Test = 0;   #10;
	D3_Test = 1; D2_Test = 0; D1_Test = 0; D0_Test = 1;   #10;
	D3_Test = 1; D2_Test = 0; D1_Test = 1; D0_Test = 0;   #10;
	D3_Test = 1; D2_Test = 0; D1_Test = 1; D0_Test = 1;   #10;
	D3_Test = 1; D2_Test = 1; D1_Test = 0; D0_Test = 0;   #10;
	D3_Test = 1; D2_Test = 1; D1_Test = 0; D0_Test = 1;   #10;
	D3_Test = 1; D2_Test = 1; D1_Test = 1; D0_Test = 0;   #10;
	D3_Test = 1; D2_Test = 1; D1_Test = 1; D0_Test = 1;   #10;
	$stop;
end
endmodule