module register_8bit (output reg [7:0]Out, input Clk, input [7:0]In);

   always@(posedge Clk) begin
	Out[0] = In[0];
	Out[1] = In[1];
	Out[2] = In[2];
	Out[3] = In[3];
	Out[4] = In[4];
	Out[5] = In[5];
	Out[6] = In[6];
	Out[7] = In[7];
	end
endmodule

	