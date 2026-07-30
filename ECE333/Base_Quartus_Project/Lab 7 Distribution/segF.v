// note that this is NOT a program - it is a hardware description that gets turned into logic!

module segF
(
	input D3, D2, D1, D0,
	output segF
);

reg [0:15] truth_table = 16'b0111_0001_0000_0110;

assign segF = truth_table[{D3,D2,D1,D0}];

endmodule
