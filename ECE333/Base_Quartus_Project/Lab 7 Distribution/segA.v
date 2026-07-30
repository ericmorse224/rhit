// note that this is NOT a program - it is a hardware description that gets turned into logic!

module segA
(
	input D3, D2, D1, D0,
	output reg segA
);

always @ (*) begin
	case ({D3,D2,D1,D0})
	4'd1, 4'd4, 4'd6, 4'd13, 4'd14 : segA = 1'b1; 
	4'd0, 4'd2, 4'd3, 4'd5, 4'd7, 4'd8, 4'd9, 4'd10, 4'd12 : segA = 1'b0; 
	default : segA = 1'bx; 
	endcase
end
endmodule
