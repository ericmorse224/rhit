// Dr. Daniel Chang
// Implements Segment E using Verilog
// Note that this is NOT a program - it is a hardware description that gets turned into logic!
	
module segE
(
	input D3, D2, D1, D0,
	output segE
);

	assign segE = D0 | (D2 & ~D1) | (D3 & D1);
	
endmodule