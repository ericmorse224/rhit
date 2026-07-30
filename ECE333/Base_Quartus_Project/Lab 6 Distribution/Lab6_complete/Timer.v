// Dr. Daniel Chang
// Implements a 0.5s timer that is used in multiple game states
// For example, used to shift the note after 0.5s. Without it, the game would go too fast

module Timer(
input CLK, RESET, input [6:0] STATE,
output TIME
);

reg [24:0] counter;
reg startcounter;

// If the counter is > 0 TIME = 0
// If the counter is 0 TIME = 1 for one cycle (used by state machine)
assign TIME = (counter > 0)?1'b0:1'b1;

	// Reset the counter to 12,500,500 (half a second) if we are in one of the five states that use TIME
	// Decrement the counter until we hit 0 (used in the assign above)
	always @(posedge CLK or posedge RESET) begin
		if (RESET) begin
			counter <= 12499999;
			startcounter <= 0;
		end
		else if ((STATE[1] == 1 || STATE[2] == 1 || STATE[3] == 1 || STATE[4] == 1 || STATE[5] == 1) && startcounter == 0) begin
			counter <= 12499999;
			startcounter <= 1;
		end
		else if (startcounter == 1)
			counter <= counter - 1;
	end
endmodule
