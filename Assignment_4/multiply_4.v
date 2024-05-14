module half_adder (output reg S, C, input a, b);

always @(a,b)
begin
      S = a ^ b;
	   C = a & b;
end
endmodule

module full_adder (output S, output reg Cout, input a, b, Cin);

wire x, y, z;

half_adder ha1 (x, y, a, b);
half_adder ha2 (S, z, x, Cin);
always@*
   Cout = z | y;
endmodule

module ripple_adder (output [6:0]Sum, output Cout, input [6:0]A, B);

    wire a, b, c, d, e, f;
	 
	 full_adder fa1 (Sum[0], a, A[0], B[0], 1'b0);
	 full_adder fa2 (Sum[1], b, A[1], B[1], a);
	 full_adder fa3 (Sum[2], c, A[2], B[2], b);
	 full_adder fa4 (Sum[3], d, A[3], B[3], c);
	 full_adder fa5 (Sum[4], e, A[4], B[4], d);
	 full_adder fa6 (Sum[5], f, A[5], B[5], e);
	 full_adder fa7 (Sum[6], Cout, A[6], B[6], f);
endmodule

module multiply_4 (output reg [7:0]Out, input [3:0]In1, input [3:0]In2);

    reg [6:0]W, X, Y, Z;
	 wire [6:0]temp1, temp2, temp3;
	 wire l, m, n;
	 
	 always @* begin
	 W[0] = In1[0] & In2[0];
	 W[1] = In1[1] & In2[0];
	 W[2] = In1[2] & In2[0];
	 W[3] = In1[3] & In2[0];
	 W[4] = 1'b0;
	 W[5] = 1'b0;
	 W[6] = 1'b0;
	 
	 X[0] = 1'b0;
	 X[1] = In1[0] & In2[1];
	 X[2] = In1[1] & In2[1];
	 X[3] = In1[2] & In2[1];
	 X[4] = In1[3] & In2[1];
	 X[5] = 1'b0;
	 X[6] = 1'b0;
	 
	 Y[0] = 1'b0;
	 Y[1] = 1'b0;
	 Y[2] = In1[0] & In2[2];
	 Y[3] = In1[1] & In2[2];
	 Y[4] = In1[2] & In2[2];
	 Y[5] = In1[3] & In2[2];
	 Y[6] = 1'b0;
	 
	 Z[0] = 1'b0;
	 Z[1] = 1'b0;
	 Z[2] = 1'b0;
	 Z[3] = In1[0] & In2[3];
	 Z[4] = In1[1] & In2[3];
	 Z[5] = In1[2] & In2[3];
	 Z[6] = In1[3] & In2[3];
	 end
	 
	 ripple_adder r1 (temp1, l, W, X);
	 ripple_adder r2 (temp2, m, temp1, Y);
	 ripple_adder r3 (temp3, n, temp2, Z);
	 
	 always@* begin
	 Out[0] = temp3[0];
	 Out[1] = temp3[1];
	 Out[2] = temp3[2];
	 Out[3] = temp3[3];
	 Out[4] = temp3[4];
	 Out[5] = temp3[5];
	 Out[6] = temp3[6];
	 Out[7] = n;
	 end
endmodule



	 
	 
	 
	 
