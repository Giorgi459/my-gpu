`timescale 1ns/1ps

module dcr_tb;

reg clk = 0;  
reg reset; 
reg enable;
reg [7:0] thread_in;
wire [7:0] thread_out;
DCR tester (
        .clk(clk),   
        .reset(reset),
        .enable(enable),
        .thread_in(thread_in),
        .thread_out(thread_out)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, dcr_tb);
    $monitor("t=%0t reset = %b, enable = %b, thread_in = %b, thread_out=%b",
    $time, reset, enable, thread_in, thread_out);
end

initial begin
    reset = 1; thread_in = 8'd255; enable = 1; //start in reset
    #12 reset = 0;  //release reset
    #20 thread_in = 8'd25;
    #10 enable = 0;
    #20 $finish;
end

endmodule