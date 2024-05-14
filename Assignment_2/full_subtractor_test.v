module full_subtractor_test;

   reg x, y, Bin;
	wire D, B;
	
	full_subtractor abcdefg (D, B, x, y, Bin);
	integer leap;
	
	initial begin
	   for (leap=0; leap<8; leap=leap+1) begin
		   {x, y, Bin} = leap;
			#200;
			$display("x = %b, y = %b, Bin = %b, D = %b, B = %b", x, y, Bin, D, B);
		end
	end
endmodule
	