// Dr. Daniel Chang
// Implements Segment C using Verilog
// Note that this is NOT a program - it is a hardware description that gets turned into logic!

module segC
(
	input D3, D2, D1, D0,
	output segC
);

assign segC = (~D2 & D1 & ~D0) | (D3 & D2) | (D3 & D1);

endmodule	