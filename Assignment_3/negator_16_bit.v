module not_g (output B, input A);
    nor (B, A, A);
endmodule

module negator_16_bit (output [15:0]Y, input [15:0]X);
    
	 not_g N1 (Y[0], X[0]);
	 not_g N2 (Y[1], X[1]);
	 not_g N3 (Y[2], X[2]);
	 not_g N4 (Y[3], X[3]);
	 not_g N5 (Y[4], X[4]);
	 not_g N6 (Y[5], X[5]);
	 not_g N7 (Y[6], X[6]);
	 not_g N8 (Y[7], X[7]);
	 not_g N9 (Y[8], X[8]);
	 not_g N10 (Y[9], X[9]);
	 not_g N11 (Y[10], X[10]);
	 not_g N12 (Y[11], X[11]);
	 not_g N13 (Y[12], X[12]);
	 not_g N14 (Y[13], X[13]);
	 not_g N15 (Y[14], X[14]);
	 not_g N16 (Y[15], X[15]);
endmodule
