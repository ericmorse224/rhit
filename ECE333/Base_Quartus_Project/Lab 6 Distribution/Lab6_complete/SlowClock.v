module SlowClock(
input clkin, Reset,
output reg clkout);

reg [24:0] counter;

initial begin
    counter = 0;
    clkout = 0;
end

	always @(posedge clkin or posedge Reset) begin
		if (Reset == 1)
			counter <= 0;
		else if (counter == 0) begin
			counter <= 24999999;
			clkout <= ~clkout;
		end 
		else
			counter <= counter - 1;
	end
endmodule
