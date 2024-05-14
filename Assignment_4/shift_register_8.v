module shift_register_8 (output reg [7:0]Out, input Clk, input In);

always @(posedge Clk)
begin
      Out[7] <= In;
		Out[6] <= Out[7];
		Out[5] <= Out[6];
		Out[4] <= Out[5];
		Out[3] <= Out[4];
		Out[2] <= Out[3];
		Out[1] <= Out[2];
		Out[0] <= Out[1];
end
endmodule
