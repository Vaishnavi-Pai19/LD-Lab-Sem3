module full_subtractor (output D, B, input x, y, Bin);

   wire a, b, c, d, e;
	
	xor (a, x, y);
	xor (D, Bin, a);
	
	not (b, a);
	and (c, Bin, b);
	not (d, x);
	and (e, d, y);
	
	or (B, c, e);
	
endmodule
