module mux_2_1 (output Y, input I0, I1, S);    //Submodule for Multiplexer used to check if BCD number is valid

   wire a, b, c;
	not (a,S);
	
	and (b, I0, a);
	and (c, I1, S);
	
	or (Y, b, c);
endmodule

module bcd_excess_3 (output [3:0]ex, input [3:0]bcd);      //Let bcd number be ABCD and excess-3 code be wxyz
  
   wire a, b, c, d, e, f, g, h, i, j;
	wire x, y, z;
	wire tempex[3:0];
	
	and (x, bcd[3], bcd[2]);         //Used for checking if a number is greater than 9 or not         
	and (y,  bcd[3], bcd[1]);
	or (z, x, y);
	
	or (a, bcd[1], bcd[0]);
	and (b, bcd[2], a);
	or (tempex[3], bcd[3], b);        //w=A+B(C+D)
	
	not (c, bcd[2]);
	not (d, a);
	and (e, c, a);
	and (f, bcd[2], d);
	or (tempex[2], e, f);             //x=B(C+D)'+B'(C+D)
	
	not (g, bcd[1]);
	not (h, bcd[0]);
	and (i, g, h);
	and (j, bcd[1], bcd[0]);
	or (tempex[1], i, j);             //y=CD+C'D'
	
	not (tempex[0], bcd[0]);          //z=D'
	
	mux_2_1 abcdefg (.Y(ex[3]), .I0(tempex[3]), .I1(1'bx), .S(z));    //Excess-3 code displays don't care if BCD number exceeds 9
	mux_2_1 abcdef (.Y(ex[2]), .I0(tempex[2]), .I1(1'bx), .S(z));
	mux_2_1 abcde (.Y(ex[1]), .I0(tempex[1]), .I1(1'bx), .S(z));
	mux_2_1 abcd (.Y(ex[0]), .I0(tempex[0]), .I1(1'bx), .S(z));

endmodule
