// Dr. Daniel Chang
// Implements a random note generator using a LFSR and Modulo 3 operator

module NoteLoader(
input CLK, Reset,
output reg [11:0] Note);

reg [4:0] data;
reg [4:0] data_next;
reg [1:0] R;

	// LSFR to make a random 5-bit number
	always @ (*) begin
		data_next[4] = data[4]^data[1];
		data_next[3] = data[3]^data[0];
		data_next[2] = data[2]^data_next[4];
		data_next[0] = data[1]^data_next[3];	
		data_next[1] = data[0]^data_next[2];
	end
	
	always @ (posedge CLK or posedge Reset) begin
		if (Reset == 1) 
			data <= 5'h1f;
		else
			data <= data_next;
	end

	// Modulo 3 to reduce the range to the three notes
	// Assign the note based on the modulo 3 value
	always @(*)begin
		R = data % 3;
		case(R)
			0: Note = 12'b111011111111;
			1: Note = 12'b111111101111;
			2: Note = 12'b111111111110;
			default: Note = 12'b111111111111;
		endcase
	end
endmodule
