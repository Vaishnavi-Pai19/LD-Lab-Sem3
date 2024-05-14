module alu_16bit_tb;

   reg [15:0]X;
	reg [15:0]Y;
	reg [3:0]S;
	wire [15:0]Out;
	
	alu_16bit lavender (.Out(Out), .X(X), .Y(Y), .S(S));
	integer count;
	
	initial begin
	repeat(5)
	begin
	  X = $urandom%1000;                  //Chooses a random unsigned integer to be the input
	  Y = $urandom%1000;
	  for (count = 0; count<16; count = count+1) begin
	     //x = 16'b0000000000000100;
	     //Y = 16'b0000000000000010;
	     { S } = count;                   //Select line can take values from 0 to 16
	     #100;
	  $display("S = %b, X = %b, Y = %b, Out = %b", S, X, Y, Out);
	  end
   end
end
endmodule
