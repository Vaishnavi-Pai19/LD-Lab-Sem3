module register_8bit_tb;

   reg Clk;
	reg [7:0]Input;
	wire [7:0]Output;
	
	register_8bit diya (.Out(Output), .Clk(Clk), .In(Input));
	
	initial begin
	 Clk = 0;
	 repeat (20) #100 Clk = ~Clk;
	 $stop;
	 end
	 
  initial begin
    Input = 8'bxxxxxxxx;
	 repeat (20) begin
	   Input = $urandom%256;
		#100;
		end
    $finish;
  end
endmodule