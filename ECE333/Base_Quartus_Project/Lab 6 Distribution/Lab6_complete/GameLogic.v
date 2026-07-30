// Dr. Daniel Chang
// Implements basic game logic to see if the game is over
// Game is over if we hit a score of 20 or miss 10 notes

module GameLogic(
input [7:0] Score, input [7:0] Miss,
output nGameOver
);

	wire WL = ((Score >= 8'b00100000) || (Miss >= 8'b00001010));
	assign nGameOver = ~WL;

endmodule
