module not_g (output y, input x);        //Gates built using the universal gate NOR
   nor (y, x, x);
endmodule

module or_g (output x, input A, B);
   wire a;
	nor (a, A, B);
	nor (x, a, a);
endmodule

module and_g (output x, input C, D);
   wire a, b;
	nor (a, C, C);
	nor (b, D, D);
	nor (x, a, b);
endmodule

module xnor_g (output x, input L, M);
   wire a, b, c;
	nor (a, L, M);
	nor (b, L, a);
	nor (c, a, M);
	nor (x, b, c);
endmodule

module xor_g (output x, input R, S);   //XOR gate can be obtained by just applying NOT gate to XNOR
   wire a;
	xnor_g x1 (a, R, S);
	not_g n1 (x, a);
endmodule

module half_adder (output S, C, input A, B);
   xor_g x2 (S, A, B);
   and_g a1 (C, A, B);
endmodule 

module full_adder (output Sum, Carry, input A, B, Cin);    //To be heirarchical modelling, we have to construct full adder using half adders  

   wire x, y, z;
	half_adder ha1 (x, y, A, B);
	half_adder ha2 (Sum, z, Cin, x);
	or_g o1 (Carry, y, z);
endmodule

module decrementor_4_bit (output [3:0]Y, input [3:0]X);
 
   wire [3:0]A;
	wire l, m, n, o;
	
	or_g o2 (A[0], 1'b0, 1'b1);
	or_g o3 (A[1], 1'b1, 1'b1);
	and_g a1 (A[2], 1'b1, 1'b1);
	and_g a3 (A[3], 1'b1, 1'b1);
	
	integer C = 0;        //The first full adder does not have any Cin
	
	full_adder fa1 (Y[0], l, X[0], A[0], C);
	full_adder fa2 (Y[1], m, X[1], A[1], l);
	full_adder fa3 (Y[2], n, X[2], A[2], m);
	full_adder fa4 (Y[3], o, X[3], A[3], n);
	
endmodule


