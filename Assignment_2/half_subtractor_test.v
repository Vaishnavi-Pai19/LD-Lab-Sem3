module half_subtractor_test;

    reg X, Y;
	 wire Diff, Borrow;
	 
	 half_subtractor abcd (Diff, Borrow, X, Y);
	 integer j;
	 
	 initial begin
	 for (j=0; j<4; j=j+1) begin
	    { X, Y } = j;
		 #200;
		 $display ("X = %b, Y = %b, Diff = %b, Borrow = %b", X, Y, Diff, Borrow);
		 end
	  end
endmodule
	   