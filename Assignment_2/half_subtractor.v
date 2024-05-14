module half_subtractor (output Diff, Borrow, input X, Y);

   wire a;
	
	xor x1 (Diff, X, Y);
	not n1 (a, X);
	and a1 (Borrow, a, Y);
	
endmodule
