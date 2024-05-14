module not_gate (output Y, input X);    //NOT gate is applied to each bit of the input to negate it
   nand (Y, X, X);
endmodule

module negator_4_bit (output [3:0]No, input [3:0]Yes);
    not_gate n1 (No[0], Yes[0]);
	 not_gate n2 (No[1], Yes[1]);
	 not_gate n3 (No[2], Yes[2]);
	 not_gate n4 (No[3], Yes[3]);
endmodule
