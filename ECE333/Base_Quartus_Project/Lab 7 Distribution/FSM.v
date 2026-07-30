//FSM
//Created by Eric Morse on 2/14/2018
//Finite State Machine that detects "00100" sequences for Lab 7

module FSM
(
	input X, clk, rst,
	output reg detect,
	output reg [3:0] CurrentState,
	output reg [3:0] NextState
);

	// State Encoding
	parameter State0 = 4'b0000, State1 = 4'b0001, State2 = 4'b0010, 
			  State3 = 4'b0011, State4 = 4'b0100, State5 = 4'b0101;

	// Write the Current State logic here. This includes the current 
	// state assignment and reset logic. Reset is active low.

	always @(posedge clk or negedge rst) begin
		if (rst == 0)						//Reset is active low, so when RST = 0, resets to State0 "seen nothing"
			CurrentState <= State0;
		else
			CurrentState <= NextState;  //When RST = 1, reset is not active, so transitions to next state at positive edge of clock
		end
	
	// Write the Output (detect) logic here.
	always @(CurrentState) begin
		if (CurrentState == State5)
			detect <= 1;					//Outputs a 1 if at State "seen 00100"
		else
			detect <= 0;					//Outputs a 0 if not at State5 "seen 00100"
	end
			
	// Write the Next State logic here. This includes your state
	// transitions within a case statement.

	always @(CurrentState or X) begin
	  case (CurrentState)
	    State0:	begin						//State "seen nothing"
		   if (X == 0)						//When X = 0, move to "seen 0"
			  NextState <= State1;
		   else								//When X = 1, stay in "seen nothing"
		     NextState <= State0;
		   end
		 State1:	begin						//State "seen 0"
		   if (X == 0)						//When X = 0, move to "seen 00"
		     NextState <= State2;
		   else								//When X = 1, move to "seen nothing"
		     NextState <= State0;
		   end
		 State2:	begin						//State "seen 00"
			if (X == 0)						//When X = 0, stay in "seen 00"
			  NextState <= State2;
			else								//When X = 1, move to "seen 001"
	    	  NextState <= State3;
			end
		 State3:  begin					//State "seen 001"
			if (X == 0)						//When X = 0, move to "seen 0010"
		     NextState <= State4;
			else								//When X = 1, move to "seen nothing"
			  NextState <= State0;
			end
		 State4:  begin					//State "seen 0010"
		   if (X == 0)						//When X = 0, move to "seen 00100"
		     NextState <= State5;	
			else								//When X = 1, move to "seen nothing"
		     NextState <= State0;
			end
	    State5:  begin					//State "seen 00100"
	   	if (X == 0)						//When X = 0, move to "seen 00"
		     NextState <= State2;
			else								//When X = 1, move to "seen 001"
			  NextState <= State3;
			end
		 default:
			NextState <= CurrentState;	//Leaves state transitions alone
	  endcase
	end

endmodule