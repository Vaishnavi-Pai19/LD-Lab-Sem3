module negator_4_bit_tb;

    reg [3:0]Yes;            //Reg is used for input while Wire is used for output
	 wire [3:0]No;
	
negator_4_bit hello (No, Yes);
    integer count;
	 
    initial begin
	 for (count=0; count<16; count=count+1) begin
	    {Yes} = count;
		 #100; 
       $display("Input = %b, Output = %b", Yes, No);
		 end
	 end
endmodule