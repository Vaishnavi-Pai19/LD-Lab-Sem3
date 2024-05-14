//Z = Xbar*Y1 + X*Y2
//T1 = Xbar*Y1 + X*Y1bar
//T2 = Xbar*Y2bar + X*Y2

module fsm_mealy (
    output reg Out, 
    input In, 
    input Reset, 
    input Clk
);

    reg [1:0] state, next_state;

    parameter S0 = 2'd0, S1 = 2'd1, S2 = 2'd2;

    always @(posedge Clk or posedge Reset) begin
	 
        if (Reset == 1) begin
            state <= S0;
            Out <= 0;
            end 
				 
		  else begin
            state <= next_state;
		  
        case (state)
            S0: begin
                if (In == 0) begin
                    next_state <= S1;
                    Out <= 0;
                    end 
					 else begin
                    next_state <= S2;
                    Out <= 0;
                    end
                end

            S1: begin
                if (In == 0) begin
                    next_state <= S1;
                    Out <= 0;
                    end 
					 else begin
                    next_state <= S2;
                    Out <= 1;
                    end
					 end
                

            S2: begin
                if (In == 0) begin
                    next_state <= S1;
                    Out <= 1;
                    end 
					 else begin
                    next_state <= S2;
                    Out <= 0;
                    end
                end

            default: begin
                next_state <= S0;
                Out <= 0;
                end
        endcase
		 end
	end
endmodule
