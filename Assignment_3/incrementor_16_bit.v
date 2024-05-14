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

module incrementor_16_bit (output [15:0]O, output Cout, input [15:0]I);
 
   wire a, b, c, d, e, f, g, h, i, j, k, l, m, n, o;
	integer Cin = 1'b1;      //Incrementor increments the whole input by 1
	
	half_adder ha1 (O[0], a, I[0], Cin);
	half_adder ha2 (O[1], b, I[1], a);
	half_adder ha3 (O[2], c, I[2], b);
	half_adder ha4 (O[3], d, I[3], c);
	half_adder ha5 (O[4], e, I[4], d);
	half_adder ha6 (O[5], f, I[5], e);
	half_adder ha7 (O[6], g, I[6], f);
	half_adder ha8 (O[7], h, I[7], g);
	half_adder ha9 (O[8], i, I[8], h);
	half_adder ha10 (O[9], j, I[9], i);
	half_adder ha11 (O[10], k, I[10], j);
	half_adder ha12 (O[11], l, I[11], k);
	half_adder ha13 (O[12], m, I[12], l);
	half_adder ha14 (O[13], n, I[13], m);
	half_adder ha15 (O[14], o, I[14], n);
	half_adder ha16 (O[15], Cout, I[15], o);
endmodule

	
	
	
	
	
	
	
