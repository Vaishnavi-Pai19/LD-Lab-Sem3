module negator_16_bit_test;

    reg [15:0]X;            //Reg is used for input while Wire is used for output
	 wire [15:0]Y;
	
negator_16_bit shimmer (.Y(Y), .X(X));
    integer jump;
	 
    initial begin
	 for (jump=0; jump<65536; jump=jump+1) begin  //The input has 16 bits and each bit can take 2 values, 0 or 1, therefore we need 2^16 values for jump
	    {X} = jump;
		 #20; 
       $display("Input = %b, Output = %b", X, Y);
		 end
	 end
endmodule
