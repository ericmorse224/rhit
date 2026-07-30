module error_detector(
	input LOAD_NOTE, SHIFT, INC_SCORE, INC_MISS, nCLRPT,  
	input [6:0] STATE,
	input G_LOAD_NOTE, G_SHIFT, G_INC_SCORE, G_INC_MISS, G_nCLRPT,  
	input [6:0] G_STATE,
	input CLK, RESET,
	output reg state_error, output_error);

	always @(posedge CLK or posedge RESET) begin
		if (RESET) begin
			state_error <= 1'b0;
			output_error <= 1'b0;
		end
		else begin
			state_error <= (STATE != G_STATE);
			output_error <= (LOAD_NOTE^G_LOAD_NOTE)|(SHIFT^G_SHIFT)|(INC_SCORE^G_INC_SCORE)|(G_INC_MISS^G_INC_MISS)|(G_nCLRPT^G_nCLRPT);
		end
	end
endmodule