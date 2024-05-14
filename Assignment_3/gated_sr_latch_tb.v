module gated_sr_latch_tb;
  
        	reg S, R, Clk;
        	wire Q, Q_bar;
        	
        	gated_sr_latch train (.Q(Q), .Q_bar(Q_bar), .S(S), .R(R), .Clk(Clk));
        	integer hop;
        	
        	initial begin
	repeat(30)
	begin
	  Clk = $urandom%2;                  //Chooses a random unsigned integer to be the input
	  S = $urandom%2;
	  R = $urandom%2; 
	  #100;
	  $display("Clk = %b, S = %b, R = %b, Q = %b, Q_bar = %b", Clk, S, R, Q, Q_bar);
	  end
   end
endmodule

