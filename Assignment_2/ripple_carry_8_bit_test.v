module ripple_carry_8_bit_test;
   
	reg [7:0]A;
	reg [7:0]B;
	wire [7:0]Sum;
	wire Cout;
	
	ripple_carry_8_bit ripple (Sum, Cout, A, B);
	integer step;
	
	initial begin 
	   for (step=0; step<65536; step=step+1) begin   //2^16 gives 65536 possible combinations for the inputs
		{A, B} = step;
		#20;
		end
	end
endmodule

