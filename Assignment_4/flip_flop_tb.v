module flip_flop_tb;

    reg D, Clock, Preset, Clear;
	 wire Qn, Q_bar;
	 
	 flip_flop aaravam (.Qn(Qn), .Q_bar(Q_bar), .D(D), .Clk(Clock), .Clr(Clear), .Pre(Preset));
	 
	 initial begin
	 Clock = 0;
	 repeat (20) #100 Clock = ~Clock;
	 $stop;
	 end
	 
    initial begin
	   repeat (20) begin
	   D = $urandom%2;
		Clear = $urandom%2;
		Preset = $urandom%2;
		#100;
		$display("D = %b, Pre = %b, Clr = %b, Qn = %b, Q_bar = %b", D, Preset, Clear, Qn, Q_bar);
      end
		$finish;
	end
endmodule
