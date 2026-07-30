// Dr. Daniel Chang
// Implements Segment A using Verilog
// Note that this is NOT a program - it is a hardware description that gets turned into logic!

module segA
(
	input D3, D2, D1, D0,
	output segA
);

	assign segA = (~D3 & ~D2 & ~D1 & D0) | (~D3 & D2 & ~D0) | (D3 & D2 & D0) | (D3 & D1 & D0);
	
endmodule
