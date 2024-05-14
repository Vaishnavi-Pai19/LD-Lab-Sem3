module fsm_mealy_tb;

  reg Clk, Reset, In;
  wire Out;

  fsm_mealy tedex (.Out(Out), .In(In), .Reset(Reset), .Clk(Clk));

  initial 
  begin
	 Clk = 1;
	   forever #50 Clk = ~Clk;
	end

  initial begin
    In = 0;
	#100 Reset=0;
	#100 In=1;
	#100 Reset=1;
	#100 In=0;
	#100 In=1;
	#100 In=1;
	#100 In=1;
	#100 In=0;
	#100 In=0;
	#100 In=1;
	#100 In=0;
	#100 In=1;
	#100;
    $stop;
  end
endmodule
