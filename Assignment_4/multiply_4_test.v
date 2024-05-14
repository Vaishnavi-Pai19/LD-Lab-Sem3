module multiply_4_test;

   reg [3:0]A, B;
	wire [7:0]Out;
	
	multiply_4 diwali (.Out(Out), .In1(A), .In2(B));
	
	initial begin
	repeat(15)
	begin
	  A = $urandom%16;                  //Chooses a random unsigned integer to be the input
	  B = $urandom%16;
	  #100;
	  $display("A = %d, B = %d, Output = %d", A, B, Out);
	  end
   end
endmodule
