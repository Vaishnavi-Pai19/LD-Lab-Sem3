module half_adder (output S, C, input A, B);        //Submodule for half adder   
   
	xor (S, A, B);
	and (C, A, B);
	
endmodule

module full_adder (output Sum, Cout, input X, Y, Cin);       //SUbmodule for full adder using half adders
 
   wire a, b, c;
	
	half_adder H1 (a, b, X, Y);
	half_adder H2 (Sum, c, a, Cin);
	or (Cout, c, b);
	
endmodule

module ripple_carry_4_bit (output [3:0]Sum, output Cout, input [3:0]A,B);         //Ripple carry adder using hierarchical modelling
  
   wire l, m, n, o;
	integer Cin=0;  
	
	full_adder F1 (Sum[0], l, A[0], B[0], Cin);
	full_adder F2 (Sum[1], m, A[1], B[1], l);
	full_adder F3 (Sum[2], n, A[2], B[2], m);
	full_adder F4 (Sum[3], Cout, A[3], B[3], n);
	
endmodule

	

	
	