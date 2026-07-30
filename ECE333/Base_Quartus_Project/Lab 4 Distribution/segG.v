//Eric Morse CM2084
//SegG Module
// Implement your segG module using Verilog

module segG
(
	input D3, D2, D1, D0,
	output segG
);

//SegG is active low.  It turns off with (D3not and D2not and D1not), (D2 and D1 and D0), or (D3 and D1).
	assign segG = (~D3&~D2&~D1)|(D2&D1&D0)|(D3&D1); // put the correct Verilog equation here
endmodule