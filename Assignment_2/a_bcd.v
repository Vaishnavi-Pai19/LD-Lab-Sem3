module mux_2_1 (output Y, input I0, I1, S);  //Submodule for Multiplexer

   wire a, b, c;
	not (a,S);
	
	and (b, I0, a);
	and (c, I1, S);
	
	or (Y, b, c);
endmodule

module full_adder (output S, Co, input A, B, Cin);   //Submodule for Full Adder

  wire a,b,c,d;
 
  xor g1 (a, A, B);
  xor g2 (S, a, Cin);
  and g3 (b, A, B);
  and g4 (c, B, Cin);
  and g5 (d, Cin, A);
  or g6 (Co, b, c, d);
  
endmodule

module convert_4bit_8bit (output [7:0]Sum, input [3:0]A, input Cin);     //Converting final output into 2 digit form ie. 8 bit form
	
	 and (Sum[7], 1'b0, 1'b0);
	 or (Sum[6], 1'b0, 1'b0);
	 and (Sum[5], 1'b0, 1'b0);
	 or (Sum[4], Cin, 1'b0);
	 and (Sum[3], A[3], 1'b1);
	 and (Sum[2], A[2], 1'b1);
	 and (Sum[1], A[1], 1'b1);
	 and (Sum[0], A[0], 1'b1);
endmodule

module ripple_carry_4_bit (output [3:0]Sum, output Cout, input [3:0]A,B);    //Ripple carry adder for doing the addition
  
   wire l, m, n, o;
	integer Cin=0;
	
	full_adder F1 (Sum[0], l, A[0], B[0], Cin);
	full_adder F2 (Sum[1], m, A[1], B[1], l);
	full_adder F3 (Sum[2], n, A[2], B[2], m);
	full_adder F4 (Sum[3], Cout, A[3], B[3], n);
	
endmodule

module a_bcd (output [7:0]Sum, input [3:0]A, input [3:0]B);

   wire [3:0]tempsum;
	wire [3:0]valid;
	wire [3:0]add;
	wire [7:0]tsum;
	wire Ctemp, Cout, C, x, y, z;
	wire p, q, r, l, m, n, S;
	
	ripple_carry_4_bit abcd (tempsum, Ctemp, A, B);
	
	and (x, tempsum[3], tempsum[2]);      //Checking if the tempsum is a valid BCD number
	and (y, tempsum[3], tempsum[1]);
	or (Cout, Ctemp, x, y);
	
	buf (valid[3], 1'b0);            
	buf (valid[2], Cout);                 //If Cout is 0, it will be equivalent to adding 0000
	buf (valid[1], Cout);                 //If Cout is 1, valid[3:0] will become 0110
	buf (valid[0], 1'b0);
	
	ripple_carry_4_bit hello (add, C, valid, tempsum);      //Adding 0110=6 if the sum is invalid form, otherwise it will just add 0000 to the number
	convert_4bit_8bit hii (tsum, add, Cout);                //Converting to 8 bit form
	
	and (p, A[3], A[2]);
	and (q, A[3], A[1]);
	or (r, p, q);
	
	and (l, B[3], B[2]);
	and (m, B[3], B[1]);
	or (n, l, m);
	
	or (S, r, n);    //Condition to check if any of the inputs A or B are more than 1001
	
	mux_2_1 pqrst (.Y(Sum[7]), .I0(1'b0), .I1(1'bx), .S(S));
	mux_2_1 pqrs (.Y(Sum[6]), .I0(1'b0), .I1(1'bx), .S(S));
	mux_2_1 pqr (.Y(Sum[5]), .I0(1'b0), .I1(1'bx), .S(S));
	mux_2_1 pq (.Y(Sum[4]), .I0(Cout), .I1(1'bx), .S(S));
	mux_2_1 lmnopq (.Y(Sum[3]), .I0(tsum[3]), .I1(1'bx), .S(S));
	mux_2_1 lmnop (.Y(Sum[2]), .I0(tsum[2]), .I1(1'bx), .S(S));
	mux_2_1 lmno (.Y(Sum[1]), .I0(tsum[1]), .I1(1'bx), .S(S));
	mux_2_1 lmn (.Y(Sum[0]), .I0(tsum[0]), .I1(1'bx), .S(S));

	
endmodule

