`timescale 1ns/1ps

module Example_FSM_tb;
	reg X, clk, rst;
	wire detect;
	wire [3:0] CurrentState;
	wire [3:0] NextState;
	
	// Instantiating a copy of the FSM we are testing
	Example_FSM uut(X, clk, rst, detect, CurrentState, NextState);
	
	// Set the initial conditions (i.e. the start of the sim)
	initial begin
		clk = 0;
	end
	
	// Generate a 20 time unit clk (i.e. 10 low, 10 high)
	always begin
		#10 clk = ~clk;
	end
	
	// Test points
	initial begin
		rst = 0; X = 1; #20 // tests asynchronous reset
		rst = 1; #20
		X = 0; #20			// RST --> Seen "0"
		X = 0; #20			// Should stay in Seen "0"
		X = 1; #20			// Seen "0" --> Seen "01"
		X = 0; #20			// Seen "01" --> Seen "0"
		X = 1; #20			// Seen "0" --> Seen "01"
		X = 1; #20			// Seen "01" --> RST
		$stop;
	end
endmodule
		