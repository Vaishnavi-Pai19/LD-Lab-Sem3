module decrementor_16_bit_test;

    reg [15:0]In;
	 wire [15:0]Out;
	 
decrementor_16_bit Thanu (Out, In);
    integer hop;
	 
	 initial begin
	 for (hop=0; hop<65536; hop=hop+1) begin    //16 bit input has a maximum of 65536 values 
	 { In } = hop;
	 #100;
	 $display ("Input = %b, Output = %b", In, Out);
	 end
  end
endmodule
