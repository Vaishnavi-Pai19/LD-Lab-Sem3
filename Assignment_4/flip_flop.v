module flip_flop (output reg Qn, output reg Q_bar, input D, Clk, Clr, Pre);

always @(posedge Clk or posedge Pre or posedge Clr) begin

if (Pre == 1'b1) begin
    if (Clr == 1'b1) begin
      Qn <= 1'bx;
      Q_bar <= 1'bx;
      end
    else begin
	   Qn <= 1;
	   Q_bar <= 0;
	   end
    end
	 
else if (Clr == 1'b1) begin
    Qn <= 0;
	 Q_bar <= 1;
	 end
	 
else begin
    Qn <= D;
    Q_bar <= ~D;	 
	 end
end
endmodule
