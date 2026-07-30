// Dr. Daniel Chang
// Implements Segment F using Verilog
// Note that this is NOT a program - it is a hardware description that gets turned into logic!

module segF
(
	input D3, D2, D1, D0,
	output segF
);

assign segF = (~D3 & ~D2 & D0) | (~D2 & D1) | (D3 & D2) | (D1 & D0);

endmodule
