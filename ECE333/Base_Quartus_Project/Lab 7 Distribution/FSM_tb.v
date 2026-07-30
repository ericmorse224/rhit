//FSM Testbench
//Created by Eric Morse on 2/14/2018
//Tests FSM for ECE233 Lab 7
`timescale 1ns/1ps

module FSM_tb;
	reg X, clk, rst;
	wire detect;
	wire [3:0] CurrentState;
	wire [3:0] NextState;
	
	// Instantiating a copy of the FSM we are testing
	FSM uut(X, clk, rst, detect, CurrentState, NextState);
	
	// Set the initial conditions (i.e. the start of the sim)
	initial begin
		clk = 0;
	end
	
	// Generate a 20 time unit clk (i.e. 10 low, 10 high)
	always begin
		#10 clk = ~clk;
	end
	
	
	// Your test points
	// Exhaustively test the FSM (i.e. all state transition)
	initial begin
		rst = 0; X = 1; #20 // tests the active-low reset and sets State0 as current State
		rst = 1; #20	//Reset = 1, reset is deactivated		
		X = 0; #20 		//State0 -> "seen 0"
		X = 1; #20		//"seen 0" -> State0
		X = 0; #20     //State0 -> "seen 0"
		X = 0; #20     //seen "0" -> "seen 00"
		X = 0; #20     //stays in "seen 00"
		X = 1; #20     //"seen 00" -> "seen 001"
		X = 0; #20     //"seen 001" -> "seen 0010"
		X = 0; #20     //"seen 0010" -> "seen 00100"
		X = 0; #20 		//"seen 00100" -> "seen 00"
		X = 1; #20		//"seen 00" -> "seen 001"
		X = 1; #20		//"seen 001" -> State0
		X = 0; #20		//State0 ->	"seen 0"
		X = 0; #20		//"seen 0" -> "seen 00"
		X = 1; #20     //"seen 00" -> "seen 001"
		X = 0; #20     //"seen 001" -> "seen 0010"
		X = 0; #20		//"seen 0010" -> "seen 00100"
		X = 1; #20		//"seen 00100" -> "seen 001"
		X = 0; #20		//"seen 001" -> "seen 0010"
		X = 1; #20     //"seen 001" -> State0
		$stop;
	end
endmodule
		
		
		