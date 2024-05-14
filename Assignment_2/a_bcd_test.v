module a_bcd_test;
   
	reg [3:0]A;
	reg [3:0]B;
	wire [7:0]Sum;
	
	a_bcd hunter (Sum, A, B);
	integer i, j;
	
	initial begin
	for (i=0; i<16; i=i+1) begin
	   for (j=0; j<16; j=j+1) begin
		   A = i;
			B = j;
			#100;
			$display ("A = %b, B = %b, Sum = %b", A, B, Sum);
		end
	end
end
endmodule
