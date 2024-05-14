module not_g (output y, input x);    	//Gates built using the universal gate NAND
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
 
module mux_2_1 (output Y, input I0, I1, S);    //Submodule for Multiplexer used to check if BCD number is valid

   wire a, b, c;
	not_g n1 (a,S);
	
	and_g a1 (b, I0, a);
	and_g a2 (c, I1, S);
	
	or_g o1 (Y, b, c);
endmodule

module sr_latch (output Q, Q_bar, input S, R);

     wire x;
	  wire temp, bar_temp;
	  
	  and_g a1 (x, S, R);         //Used to check if both S and R are 1, then it will display X since it is an invalid case
	  
	  nor (temp, R, bar_temp);
	  nor (bar_temp, S, temp);
	  
	  mux_2_1 m1 (.Y(Q), .I0(temp), .I1(1'bx), .S(x));
	  mux_2_1 m2 (.Y(Q_bar), .I0(bar_temp), .I1(1'bx), .S(x));
	  
endmodule
