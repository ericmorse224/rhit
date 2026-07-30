// Dr. Daniel Chang
// Implements Segment D using Verilog
// Note that this is NOT a program - it is a hardware description that gets turned into logic!

module segD
(
	input D3, D2, D1, D0,
	output segD
);

assign segD = (~D2 & ~D1 & D0) | (D2 & ~D1 & ~D0) | (D2 & D1 & D0) | (D3 & D2);

endmodule
