module dcr ( 
    input wire clk,
    input wire reset,
    input wire write_enable,
    input wire [7:0] thread_count_in,
    output reg [7:0] thread_count_out
);

always @(posedge clk) begin
    if (reset)
        thread_count_out <= 0;
    else if (write_enable)
        thread_count_out <= thread_count_in;
end

endmodule
