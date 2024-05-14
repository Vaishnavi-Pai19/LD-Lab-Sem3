module decrementor_4_bit_test;

    reg [3:0]X;
	 wire [3:0]Y;
	 
decrementor_4_bit dancing_queen (Y, X);
    integer hop;
	 
	 initial begin
	 for (hop=0; hop<16; hop=hop+1) begin    //4 bit input has a maximum of 16 values 
	 { X } = hop;
	 #100;
	 $display ("Input = %b, Output = %b", X, Y);
	 end
  end
endmodule
