module bcd_excess_3_test;

   reg [3:0]bcd;
	wire [3:0]ex;
	
	bcd_excess_3 convert (ex, bcd);
	integer hop;
	
	initial begin
	  for (hop=0; hop<16; hop=hop+1) begin           //Since there are 4 bits, total possible numbers will be 2^4 combinations
	        {bcd} = hop;
	        #100;
           $display ("bcd = %b, excess_3 = %b", bcd, ex);
	     end
	  end
endmodule


