//Eric Morse CM2084
//SegB Module
// Implement your segB module using Verilog

module segB
(
	input D3, D2, D1, D0,
	output segB
);

//SegB output is active low.  It turns off with (D3 and D1), (D2 and D1 and D0not), or (D2 and D1not and D0).
	assign segB = (D3&D1)|(D2&D1&~D0)|(D2&~D1&D0); // put the correct Verliog equation here
endmodule