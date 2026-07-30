//Eric Morse CM2084
//Inc1b Module
// Implement your inc1b module using Verilog

module inc1b
(
	input A, Cin,
	output Cout, S
);

//increments input A by Cin.  Essentially a 2 bit adder that adds A and Cin together.
// S is 1 when A xor Cin, if A and Cin then S is 0 and Cout is 1.
   assign S = A^Cin;
	assign Cout = A&Cin;
endmodule