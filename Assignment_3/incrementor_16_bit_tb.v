module incrementor_16_bit_tb;

    reg [15:0]I;
	 wire [15:0]O;
	 wire Cout;
	
incrementor_16_bit barnacle (.O(O), .Cout(Cout), .I(I));
    integer leap;
	 
    initial begin
	 for (leap=0; leap<65536; leap=leap+1) begin
	    { I } = leap;
		 #20;
       $display("Input = %b, Output = %b, C = %b", I, O, Cout);
		 end
	 end
endmodule
