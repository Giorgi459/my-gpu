module dispatcher( //
    input clk,     //t
    input start,
    input core1_done,
    input core2_done,
    output reg ready,
    output reg to_core1,
    output reg reset_cores,
    output reg to_core2

);

parameter idle = 2'b00;
parameter running = 2'b01;
parameter reset = 2'b10;
reg [1:0] state_reg;

always @(posedge clk ) begin    
    case (state_reg)
        idle: begin
            ready <= 1'b1;
            if (start)
                state_reg <= running;
        end
        running: begin
            ready <= 1'b0;
            to_core1 <= 1'b0;
            to_core2 <= 1'b1;
            if (core1_done & core2_done)  
                state_reg <= reset;
        end
        reset: begin
            reset_cores <= 1;
            state_reg <= idle; 
        end 
        
        default: 
            state_reg <= idle;
    endcase


    
end
endmodule