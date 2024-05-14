module full_adder (output S, Co, input A, B, Cin);   //Submodule for full adder

  wire a,b,c,d;
 
  xor g1 (a, A, B);
  xor g2 (S, a, Cin);
  and g3 (b, A, B);
  and g4 (c, B, Cin);
  and g5 (d, Cin, A);
  or g6 (Co, b, c, d);
  
endmodule

module ripple_carry_8_bit (output [7:0]Sum, output Cout, input [7:0]A,B);

     wire t, u, v, w, x, y, z;
	  integer Cin=0;
	  
	  full_adder a1 (Sum[0], t, A[0], B[0], Cin);
	  full_adder a2 (Sum[1], u, A[1], B[1], t);
	  full_adder a3 (Sum[2], v, A[2], B[2], u);
	  full_adder a4 (Sum[3], w, A[3], B[3], v);
	  full_adder a5 (Sum[4], x, A[4], B[4], w);
	  full_adder a6 (Sum[5], y, A[5], B[5], x);
	  full_adder a7 (Sum[6], z, A[6], B[6], y);
	  full_adder a8 (Sum[7], Cout, A[7], B[7], z);
	  
endmodule

	  
	  
	  