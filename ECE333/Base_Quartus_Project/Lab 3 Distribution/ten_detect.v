//Eric Morse CM2084
//Ten_detect Module
// Implement your ten_detect module using Verilog

module ten_detect
(
	input A3, A2, A1, A0,
	output T
);
//outputs a 1 only when 10 is inputted, which is A3 and A2not and A1 and A0not.
   assign T = A3&~A2&A1&~A0;
endmodule