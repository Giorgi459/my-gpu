module DCR ( //whenever clk goes high, if reset is 1, thread zero, otherwise
//if enable is 1, thread out copies thread in
    input clk,
    input reset,
    input enable,
    input[7:0] thread_in,
    output reg [7:0] thread_out
);

always@(posedge clk) begin
    if (reset == 1'b1)
        thread_out <= 8'b0; //cannot you use output instead of thread_out
    else if (enable)
        thread_out <= thread_in;


end
endmodule