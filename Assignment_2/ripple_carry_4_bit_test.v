module ripple_carry_4_bit_test;
  
   reg [3:0]A;
	reg [3:0]B;
	wire [3:0]Sum;
	wire Cout;
	
	ripple_carry_4_bit strsk (Sum, Cout, A, B);
	integer jump;
	
	initial begin
	  for (jump=0; jump<256; jump=jump+1) begin         //2^8 combinations since A and B have a total of 8 bits combined
	     {A, B} = jump;
		  #100;
		  $display("A = %b, B = %b, Sum = %b, Cout = %b", A, B, Sum, Cout);
		  end
	  end
endmodule
