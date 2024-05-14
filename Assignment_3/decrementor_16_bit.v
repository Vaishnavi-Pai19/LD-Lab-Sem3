module not_gate (output y, input x);        //Gates built using the universal gate NAND
   nand (y, x, x);
endmodule

module and_gate (output x, input A, B);
   wire a;
	nand (a, A, B);
	nand (x, a, a);
endmodule

module or_gate (output x, input C, D);
   wire a, b;
	nand (a, C, C);
	nand (b, D, D);
	nand (x, a, b);
endmodule

module xor_gate (output x, input L, M);
   wire a, b, c;
	nand (a, L, M);
	nand (b, L, a);
	nand (c, a, M);
	nand (x, b, c);
endmodule

module xnor_gate (output x, input R, S);   //XNOR gate can be obtained by just applying NOT gate to XOR
   wire a;
	xor_gate x1 (a, R, S);
	nand (x, a, a);
endmodule

module half_adder (output Sum, Carry, input A, B);
   xor_gate x2 (Sum, A, B);
	and_gate a2 (Carry, A, B);
endmodule

module full_adder (output Sum, Carry, input A, B, Cin);    //To be heirarchical modelling, we have to construct full adder using half adders  

   wire x, y, z;
	half_adder ha1 (x, y, A, B);
	half_adder ha2 (Sum, z, Cin, x);
	or_gate o1 (Carry, y, z);
endmodule

module decrementor_16_bit (output [15:0]Out, input [15:0]In);

   wire [15:0]X;
	wire a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
	wire Cout;
	
	and_gate a3 (X[0], 1'b1, 1'b1);
	and_gate a4 (X[1], 1'b1, 1'b1);
	and_gate a5 (X[2], 1'b1, 1'b1);
	and_gate a6 (X[3], 1'b1, 1'b1);
	and_gate a7 (X[4], 1'b1, 1'b1);
	and_gate a8 (X[5], 1'b1, 1'b1);
	and_gate a9 (X[6], 1'b1, 1'b1);
	and_gate a10 (X[7], 1'b1, 1'b1);
	or_gate o2 (X[8], 1'b1, 1'b0);
	or_gate o3 (X[9], 1'b1, 1'b0);
   or_gate o4 (X[10], 1'b1, 1'b0);
   or_gate o5 (X[11], 1'b1, 1'b0);
   or_gate o6 (X[12], 1'b1, 1'b0);
	or_gate o7 (X[13], 1'b1, 1'b0);
	or_gate o8 (X[14], 1'b1, 1'b0);
	or_gate o9 (X[15], 1'b1, 1'b0);
	
	integer Cin = 0;
	
	full_adder fa1 (Out[0], a, In[0], X[0], Cin);
	full_adder fa2 (Out[1], b, In[1], X[1], a);
	full_adder fa3 (Out[2], c, In[2], X[2], b);
	full_adder fa4 (Out[3], d, In[3], X[3], c);
	full_adder fa5 (Out[4], e, In[4], X[4], d);
	full_adder fa6 (Out[5], f, In[5], X[5], e);
	full_adder fa7 (Out[6], g, In[6], X[6], f);
	full_adder fa8 (Out[7], h, In[7], X[7], g);
	full_adder fa9 (Out[8], i, In[8], X[8], h);
	full_adder fa10 (Out[9], j, In[9], X[9], i);
	full_adder fa11 (Out[10], k, In[10], X[10], j);
	full_adder fa12 (Out[11], l, In[11], X[11], k);
	full_adder fa13 (Out[12], m, In[12], X[12], l);
	full_adder fa14 (Out[13], n, In[13], X[13], m);
	full_adder fa15 (Out[14], o, In[14], X[14], n);
	full_adder fa16 (Out[15], p, In[15], X[15], o);
	
	not_gate n2 (Cout, p);
endmodule

	
	








