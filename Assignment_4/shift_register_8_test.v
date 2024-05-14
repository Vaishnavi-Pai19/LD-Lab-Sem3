module shift_register_8_test;

  reg Clock;
  reg Input;
  wire [7:0]Output;
  
  shift_register_8 evian (.Out(Output), .Clk(Clock), .In(Input));
  
  initial begin
	 Clock = 0;
	 repeat (20) #100 Clock = ~Clock;
	 $stop;
	 end
	 
  initial begin
    Input = 0;
	 repeat (20) begin
	   Input = $urandom%2;
		#100;
		end
    $finish;
  end
endmodule
