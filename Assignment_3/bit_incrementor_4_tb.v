module bit_incrementor_4_tb;

    reg [3:0]Add;
	 wire [3:0]S;
	 wire C;
	
bit_incrementor_4 adizya (.S(S), .C(C), .Add(Add));
    integer leap;
	 
    initial begin
	 for (leap=0; leap<16; leap=leap+1) begin
	    {Add} = leap;
		 #100;
       $display("Add = %b, Sum = %b, C = %b", Add, S, C);
		 end
	 end
endmodule

		 
	 