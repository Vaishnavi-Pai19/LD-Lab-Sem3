module not_g (output y, input x);        //Gates built using the universal gate NAND
   nand (y, x, x);
endmodule

module and_g (output x, input A, B);
   wire a;
	nand (a, A, B);
	nand (x, a, a);
endmodule

module or_g (output x, input C, D);
   wire a, b;
	nand (a, C, C);
	nand (b, D, D);
	nand (x, a, b);
endmodule

module xor_g (output x, input L, M);
   wire a, b, c;
	nand (a, L, M);
	nand (b, L, a);
	nand (c, a, M);
	nand (x, b, c);
endmodule

module xnor_g (output x, input R, S);   //XNOR gate can be obtained by just applying NOT gate to XOR
   wire a;
	xor_g x1 (a, R, S);
	nand (x, a, a);
endmodule

module half_adder (output Sum, Carry, input A, B);
   xor_g x2 (Sum, A, B);
	and_g a2 (Carry, A, B);
endmodule

module bit_incrementor_4 (output [3:0]S, output C, input [3:0]Add);   //Carry needed since adding 1 to 1111 gives a 5-bit output
   wire x, y, z;
	integer Cin = 1'b1;      //Incrementor increments the whole input by 1
	
	half_adder ha1 (S[0], x, Add[0], Cin);
	half_adder ha2 (S[1], y, Add[1], x);
	half_adder ha3 (S[2], z, Add[2], y);
	half_adder ha4 (S[3], C, Add[3], z);
endmodule


