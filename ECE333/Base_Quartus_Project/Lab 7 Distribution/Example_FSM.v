module Example_FSM (
	input X, clk, rst,
	output reg detect,
	output reg [3:0] CurrentState,
	output reg [3:0] NextState
);

	// State Encoding
	parameter State0 = 4'b0000, State1 = 4'b0001, State2 = 4'b0010;

	// Current State Assignment
	always @(posedge clk or negedge rst) begin
		if (rst == 0)
			CurrentState <= State0;
		else
			CurrentState <= NextState;
		end
		
	// Next State Logic
	always @(CurrentState or X) begin
		case (CurrentState)
			State0:	begin
				if (X == 0)
					NextState <= State1;
				else
					NextState <= State0;
				end
			State1:	begin
				if (X == 0)
					NextState <= State1;
				else
					NextState <= State2;
				end
			State2:	begin
				if (X == 0)
					NextState <= State1;
				else
					NextState <= State0;
				end
			default:
				NextState <= CurrentState;
		endcase
	end

	// Output Logic
	always @(CurrentState) begin
		if (CurrentState == State2)
			detect <= 1;
		else
			detect <= 0;
	end
endmodule
