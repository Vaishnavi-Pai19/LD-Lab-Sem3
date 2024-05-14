module sr_latch_tb;
   
	reg S, R;
	wire Q, Q_bar;
	
	sr_latch train (.Q(Q), .Q_bar(Q_bar), .S(S), .R(R));
   integer hop;
        	
        initial begin
        	  for (hop=0; hop<4; hop=hop+1) begin
        	  { S, R } = hop;
        	  #100;
        	  $display("S = %b, R = %b, Q = %b, Q-bar = %b", S, R, Q, Q_bar);
           end
        	end
endmodule
