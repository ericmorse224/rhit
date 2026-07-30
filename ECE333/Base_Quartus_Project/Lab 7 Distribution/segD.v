// note that this is NOT a program - it is a hardware description that gets turned into logic!

module segD
(
	input D3, D2, D1, D0,
	output segD
);

reg [0:15] truth_table = 16'b0100_1001_0101_1010;

assign segD = truth_table[{D3,D2,D1,D0}];

endmodule
