module dispatcher(
    input clk,
    input start,
    input core1_done,
    input core2_done,
    output wire ready,
    output wire reset_cores,
    output wire to_core1,
    output wire to_core2
);

parameter idle    = 2'b00;
parameter running = 2'b01;
parameter reset   = 2'b10;

reg [1:0] state_reg;

// Combinational outputs
assign ready = (state_reg == idle);
assign reset_cores = (state_reg == reset);

// Sequential state transitions
always @(posedge clk) begin
    case (state_reg)
        idle: begin
            if (start)
                state_reg <= running;
        end

        running: begin
            if (core1_done && core2_done)
                state_reg <= reset;
        end

        reset: begin
            state_reg <= idle;
        end

        default: state_reg <= idle;
    endcase
end

endmodule