//Gates built using the universal gate NOR

module not_g (output y, input x);        
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

module or_gate_16 (output X, input a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p);       //OR Gate with 16 inputs

   wire q, r, s, t, u, v, w, x, y, z, a1, b1, c1, d1;
	
	or_g o1 (q, a, b);
	or_g o2 (r, q, c);
	or_g o3 (s, r, d);
	or_g o4 (t, s, e);
	or_g o5 (u, t, f);
	or_g o6 (v, u, g);
	or_g o7 (w, v, h);
	or_g o8 (x, w, i);
	or_g o9 (y, x, j);
	or_g o10 (z, y, k);
	or_g o11 (a1, z, l);
	or_g o12 (b1, a1, m);
	or_g o13 (c1, b1, n);
	or_g o14 (d1, c1, o);
	or_g o15 (X, d1, p);
endmodule

module and_gate (output X, input a, b, c, d, e);             //AND Gate with 5 inputs
   
	wire w, x, y;
	
	and_g a1 (w, a, b);
	and_g a2 (x, w, c);
	and_g a3 (y, x, d);
	and_g a4 (X, y, e);
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


//Sub-modules for each of the 16 operations

//Function for a., b. and c.
module add_subtract_16_bit (output [15:0]Sum, input k, input [15:0]A,C);

     wire t, u, v, w, x, y, z, l, m, n, o, p, q, r, s;
	  wire Cout;
	  wire [15:0]B;
	  
	  xor_g x1 (B[0], C[0], k);
	  xor_g x2 (B[1], C[1], k);
	  xor_g x3 (B[2], C[2], k);
	  xor_g x4 (B[3], C[3], k);
	  xor_g x5 (B[4], C[4], k);
	  xor_g x6 (B[5], C[5], k);
	  xor_g x7 (B[6], C[6], k);
	  xor_g x8 (B[7], C[7], k);
	  xor_g x9 (B[8], C[8], k);
	  xor_g x10 (B[9], C[9], k);
	  xor_g x11 (B[10], C[10], k);
	  xor_g x12 (B[11], C[11], k);
	  xor_g x13 (B[12], C[12], k);
	  xor_g x14 (B[13], C[13], k);
	  xor_g x15 (B[14], C[14], k);
	  xor_g x16 (B[15], C[15], k);
	  
	  full_adder a1 (Sum[0], t, A[0], B[0], k);
	  full_adder a2 (Sum[1], u, A[1], B[1], t);
	  full_adder a3 (Sum[2], v, A[2], B[2], u);
	  full_adder a4 (Sum[3], w, A[3], B[3], v);
	  full_adder a5 (Sum[4], x, A[4], B[4], w);
	  full_adder a6 (Sum[5], y, A[5], B[5], x);
	  full_adder a7 (Sum[6], z, A[6], B[6], y);
	  full_adder a8 (Sum[7], l, A[7], B[7], z);
	  full_adder a9 (Sum[8], m, A[8], B[8], l);
	  full_adder a10 (Sum[9], n, A[9], B[9], m);
	  full_adder a11 (Sum[10], o, A[10], B[10], n);
	  full_adder a12 (Sum[11], p, A[11], B[11], o);
	  full_adder a13 (Sum[12], q, A[12], B[12], p);
	  full_adder a14 (Sum[13], r, A[13], B[13], q);
	  full_adder a15 (Sum[14], s, A[14], B[14], r);
	  full_adder a16 (Sum[15], Cout, A[15], B[15], s);
	  
endmodule


//Function for d.
module output_0 (output [15:0]X, input [15:0]Y);

     and_g a1 (X[0], 1'b0, Y[0]);
	  and_g a2 (X[1], Y[1], 1'b0);
	  and_g a3 (X[2], 1'b0, Y[2]);
	  and_g a4 (X[3], Y[3], 1'b0);
	  and_g a5 (X[4], 1'b0, Y[4]);
	  and_g a6 (X[5], Y[5], 1'b0);
	  and_g a7 (X[6], 1'b0, Y[6]);
	  and_g a8 (X[7], Y[7], 1'b0);
	  and_g a9 (X[8], 1'b0, Y[8]);
	  and_g a10 (X[9], Y[9], 1'b0);
	  and_g a11 (X[10], 1'b0, Y[10]);
	  and_g a12 (X[11], Y[11], 1'b0);
	  and_g a13 (X[12], 1'b0, Y[12]);
	  and_g a14 (X[13], Y[13], 1'b0);
	  and_g a15 (X[14], 1'b0, Y[14]);
	  and_g a16 (X[15], Y[15], 1'b0);
endmodule


//Function for e.
module output_1 (output [15:0]Y, input [15:0]X);
     
	  or_g o1 (Y[0], 1'b1, X[0]);
	  and_g o2 (Y[1], X[1], 1'b0);
	  and_g o3 (Y[2], 1'b0, X[2]);
	  and_g o4 (Y[3], X[3], 1'b0);
	  and_g o5 (Y[4], 1'b0, X[4]);
	  and_g o6 (Y[5], X[5], 1'b0);
	  and_g o7 (Y[6], 1'b0, X[6]);
	  and_g o8 (Y[7], X[7], 1'b0);
	  and_g o9 (Y[8], 1'b0, X[8]);
	  and_g o10 (Y[9], X[9], 1'b0);
	  and_g o11 (Y[10], 1'b0, X[10]);
	  and_g o12 (Y[11], X[11], 1'b0);
	  and_g o13 (Y[12], 1'b0, X[12]);
	  and_g o14 (Y[13], X[13], 1'b0);
	  and_g o15 (Y[14], 1'b0, X[14]);
	  and_g o16 (Y[15], X[15], 1'b0);
endmodule


//Function for f.
module output_neg1 (output [15:0]Y, input [15:0]X);
     
	  or_g o1 (Y[0], 1'b1, X[0]);
	  or_g o2 (Y[1], X[1], 1'b1);
	  or_g o3 (Y[2], 1'b1, X[2]);
	  or_g o4 (Y[3], X[3], 1'b1);
	  or_g o5 (Y[4], 1'b1, X[4]);
	  or_g o6 (Y[5], X[5], 1'b1);
	  or_g o7 (Y[6], 1'b1, X[6]);
	  or_g o8 (Y[7], X[7], 1'b1);
	  or_g o9 (Y[8], 1'b1, X[8]);
	  or_g o10 (Y[9], X[9], 1'b1);
	  or_g o11 (Y[10], 1'b1, X[10]);
	  or_g o12 (Y[11], X[11], 1'b1);
	  or_g o13 (Y[12], 1'b1, X[12]);
	  or_g o14 (Y[13], X[13], 1'b1);
	  or_g o15 (Y[14], 1'b1, X[14]);
	  or_g o16 (Y[15], X[15], 1'b1);
endmodule


//Function for i. and j.
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


//Function for g. and h.
module complement_2 (output [15:0]Y, input [15:0]X);

    wire Carry;
	 wire [15:0]temp;
	 
	 negator_16_bit negate (temp, X);
	 incrementor_16_bit incre (Y, temp);
endmodule


//Function for k. and l.
module incrementor_16_bit (output [15:0]O, input [15:0]I);
 
   wire a, b, c, d, e, f, g, h, i, j, k, l, m, n, o;
	wire Cout;
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


//Function for m. and n.
module decrementor_16_bit (output [15:0]Out, input [15:0]In);

   wire [15:0]X;
	wire a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
	wire Cout;
	
	and_g a3 (X[0], 1'b1, 1'b1);
	and_g a4 (X[1], 1'b1, 1'b1);
	and_g a5 (X[2], 1'b1, 1'b1);
	and_g a6 (X[3], 1'b1, 1'b1);
	and_g a7 (X[4], 1'b1, 1'b1);
	and_g a8 (X[5], 1'b1, 1'b1);
	and_g a9 (X[6], 1'b1, 1'b1);
	and_g a10 (X[7], 1'b1, 1'b1);
	or_g o2 (X[8], 1'b1, 1'b0);
	or_g o3 (X[9], 1'b1, 1'b0);
   or_g o4 (X[10], 1'b1, 1'b0);
   or_g o5 (X[11], 1'b1, 1'b0);
   or_g o6 (X[12], 1'b1, 1'b0);
	or_g o7 (X[13], 1'b1, 1'b0);
	or_g o8 (X[14], 1'b1, 1'b0);
	or_g o9 (X[15], 1'b1, 1'b0);
	
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
	
	not_g n2 (Cout, p);
endmodule


//Function for o.
module bitwise_and (output [15:0]out, input [15:0]in1, in2);
    
	 and_g h1 (out[0], in1[0], in2[0]);
	 and_g h2 (out[1], in1[1], in2[1]);
	 and_g h3 (out[2], in1[2], in2[2]);
	 and_g h4 (out[3], in1[3], in2[3]);
	 and_g h5 (out[4], in1[4], in2[4]);
	 and_g h6 (out[5], in1[5], in2[5]);
	 and_g h7 (out[6], in1[6], in2[6]);
	 and_g h8 (out[7], in1[7], in2[7]);
	 and_g h9 (out[8], in1[8], in2[8]);
	 and_g h10 (out[9], in1[9], in2[9]);
	 and_g h11 (out[10], in1[10], in2[10]);
	 and_g h12 (out[11], in1[11], in2[11]);
	 and_g h13 (out[12], in1[12], in2[12]);
	 and_g h14 (out[13], in1[13], in2[13]);
	 and_g h15 (out[14], in1[14], in2[14]);
	 and_g h16 (out[15], in1[15], in2[15]);
endmodule


//Function for p.
module bitwise_or (output [15:0]out, input [15:0]in1, in2);
    
	 or_g h1 (out[0], in1[0], in2[0]);
	 or_g h2 (out[1], in1[1], in2[1]);
	 or_g h3 (out[2], in1[2], in2[2]);
	 or_g h4 (out[3], in1[3], in2[3]);
	 or_g h5 (out[4], in1[4], in2[4]);
	 or_g h6 (out[5], in1[5], in2[5]);
	 or_g h7 (out[6], in1[6], in2[6]);
	 or_g h8 (out[7], in1[7], in2[7]);
	 or_g h9 (out[8], in1[8], in2[8]);
	 or_g h10 (out[9], in1[9], in2[9]);
	 or_g h11 (out[10], in1[10], in2[10]);
	 or_g h12 (out[11], in1[11], in2[11]);
	 or_g h13 (out[12], in1[12], in2[12]);
	 or_g h14 (out[13], in1[13], in2[13]);
	 or_g h15 (out[14], in1[14], in2[14]);
	 or_g h16 (out[15], in1[15], in2[15]);
endmodule


//16 to 1 MUX for finding the desired output

module mux_16_1 (output Y, input I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, S3, S2, S1, S0);
   
	wire w, x, y, z;
	wire a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
	
	not_g n1 (w, S0);
	not_g n2 (x, S1);
	not_g n3 (y, S2);
	not_g n4 (z, S3);
	
	and_gate a1 (a, I0, z, y, x, w);
	and_gate a2 (b, I1, z, y, x, S0);
	and_gate a3 (c, I2, z, y, S1, w);
	and_gate a4 (d, I3, z, y, S1, S0);
	and_gate a5 (e, I4, z, S2, x, w);
	and_gate a6 (f, I5, z, S2, x, S0);
	and_gate a7 (g, I6, z, S2, S1, w);
	and_gate a8 (h, I7, z, S2, S1, S0);
	and_gate a9 (i, I8, S3, y, x, w);
	and_gate a10 (j, I9, S3, y, x, S0);
	and_gate a11 (k, I10, S3, y, S1, w);
	and_gate a12 (l, I11, S3, y, S1, S0);
	and_gate a13 (m, I12, S3, S2, x, w);
	and_gate a14 (n, I13, S3, S2, x, S0);
	and_gate a15 (o, I14, S3, S2, S1, w);
	and_gate a16 (p, I15, S3, S2, S1, S0);
	
	or_gate_16 o1 (Y, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p);
	
endmodule


//Module for Arithmetic Logic Unit

module alu_16bit (output [15:0]Out, input [15:0]X, Y, input [3:0]S);

   wire [15:0]a_out, b_out, c_out, d_out, e_out, f_out, g_out, h_out, i_out, j_out, k_out, l_out, m_out, n_out, o_out, p_out;
	
	add_subtract_16_bit A (a_out, 1'b0, X, Y);    //S=0
	add_subtract_16_bit B (b_out, 1'b1, X, Y);    //S=1
	add_subtract_16_bit C (c_out, 1'b1, Y, X);    //S=2
	output_0 D (d_out, X);                        //S=3
	output_1 E (e_out, X);                        //S=4
	output_neg1 F (f_out, X);                     //S=5
	complement_2 G (g_out, X);                    //S=6
	complement_2 H (h_out, Y);                    //S=7
	negator_16_bit I (i_out, X);                  //S=8
	negator_16_bit J (j_out, Y);                  //S=9
	incrementor_16_bit K (k_out, X);              //S=10
	incrementor_16_bit L (l_out, Y);              //S=11
	decrementor_16_bit M (m_out, X);              //S=12
	decrementor_16_bit N (n_out, Y);              //S=13
	bitwise_and O (o_out, X, Y);                  //S=14
	bitwise_or P (p_out, X, Y);                   //S=15
	
	
	mux_16_1 m1 (Out[0], a_out[0], b_out[0], c_out[0], d_out[0], e_out[0], f_out[0], g_out[0], h_out[0], i_out[0], j_out[0], k_out[0], l_out[0], m_out[0], n_out[0], o_out[0], p_out[0], S[3], S[2], S[1], S[0]);
	mux_16_1 m2 (Out[1], a_out[1], b_out[1], c_out[1], d_out[1], e_out[1], f_out[1], g_out[1], h_out[1], i_out[1], j_out[1], k_out[1], l_out[1], m_out[1], n_out[1], o_out[1], p_out[1], S[3], S[2], S[1], S[0]);
	mux_16_1 m3 (Out[2], a_out[2], b_out[2], c_out[2], d_out[2], e_out[2], f_out[2], g_out[2], h_out[2], i_out[2], j_out[2], k_out[2], l_out[2], m_out[2], n_out[2], o_out[2], p_out[2], S[3], S[2], S[1], S[0]);
	mux_16_1 m4 (Out[3], a_out[3], b_out[3], c_out[3], d_out[3], e_out[3], f_out[3], g_out[3], h_out[3], i_out[3], j_out[3], k_out[3], l_out[3], m_out[3], n_out[3], o_out[3], p_out[3], S[3], S[2], S[1], S[0]);
	mux_16_1 m5 (Out[4], a_out[4], b_out[4], c_out[4], d_out[4], e_out[4], f_out[4], g_out[4], h_out[4], i_out[4], j_out[4], k_out[4], l_out[4], m_out[4], n_out[4], o_out[4], p_out[4], S[3], S[2], S[1], S[0]);
	mux_16_1 m6 (Out[5], a_out[5], b_out[5], c_out[5], d_out[5], e_out[5], f_out[5], g_out[5], h_out[5], i_out[5], j_out[5], k_out[5], l_out[5], m_out[5], n_out[5], o_out[5], p_out[5], S[3], S[2], S[1], S[0]);
	mux_16_1 m7 (Out[6], a_out[6], b_out[6], c_out[6], d_out[6], e_out[6], f_out[6], g_out[6], h_out[6], i_out[6], j_out[6], k_out[6], l_out[6], m_out[6], n_out[6], o_out[6], p_out[6], S[3], S[2], S[1], S[0]);
	mux_16_1 m8 (Out[7], a_out[7], b_out[7], c_out[7], d_out[7], e_out[7], f_out[7], g_out[7], h_out[7], i_out[7], j_out[7], k_out[7], l_out[7], m_out[7], n_out[7], o_out[7], p_out[7], S[3], S[2], S[1], S[0]);
	mux_16_1 m9 (Out[8], a_out[8], b_out[8], c_out[8], d_out[8], e_out[8], f_out[8], g_out[8], h_out[8], i_out[8], j_out[8], k_out[8], l_out[8], m_out[8], n_out[8], o_out[8], p_out[8], S[3], S[2], S[1], S[0]);
	mux_16_1 m10 (Out[9], a_out[9], b_out[9], c_out[9], d_out[9], e_out[9], f_out[9], g_out[9], h_out[9], i_out[9], j_out[9], k_out[9], l_out[9], m_out[9], n_out[9], o_out[9], p_out[9], S[3], S[2], S[1], S[0]);
	mux_16_1 m11 (Out[10], a_out[10], b_out[10], c_out[10], d_out[10], e_out[10], f_out[10], g_out[10], h_out[10], i_out[10], j_out[10], k_out[10], l_out[10], m_out[10], n_out[10], o_out[10], p_out[10], S[3], S[2], S[1], S[0]);
	mux_16_1 m12 (Out[11], a_out[11], b_out[11], c_out[11], d_out[11], e_out[11], f_out[11], g_out[11], h_out[11], i_out[11], j_out[11], k_out[11], l_out[11], m_out[11], n_out[11], o_out[11], p_out[11], S[3], S[2], S[1], S[0]);
	mux_16_1 m13 (Out[12], a_out[12], b_out[12], c_out[12], d_out[12], e_out[12], f_out[12], g_out[12], h_out[12], i_out[12], j_out[12], k_out[12], l_out[12], m_out[12], n_out[12], o_out[12], p_out[12], S[3], S[2], S[1], S[0]);
	mux_16_1 m14 (Out[13], a_out[13], b_out[13], c_out[13], d_out[13], e_out[13], f_out[13], g_out[13], h_out[13], i_out[13], j_out[13], k_out[13], l_out[13], m_out[13], n_out[13], o_out[13], p_out[13], S[3], S[2], S[1], S[0]);
	mux_16_1 m15 (Out[14], a_out[14], b_out[14], c_out[14], d_out[14], e_out[14], f_out[14], g_out[14], h_out[14], i_out[14], j_out[14], k_out[14], l_out[14], m_out[14], n_out[14], o_out[14], p_out[14], S[3], S[2], S[1], S[0]);
	mux_16_1 m16 (Out[15], a_out[15], b_out[15], c_out[15], d_out[15], e_out[15], f_out[15], g_out[15], h_out[15], i_out[15], j_out[15], k_out[15], l_out[15], m_out[15], n_out[15], o_out[15], p_out[15], S[3], S[2], S[1], S[0]); 
	 
endmodule
