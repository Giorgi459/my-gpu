`timescale 1ns/1ps


module alu_testbench;

reg [7:0] a;
reg [7:0] b;
reg [1:0] alu_op;
wire [7:0] result;
wire [2:0] nzp;

ALU alu_tester (
    .a(a),
    .b(b),
    .alu_op(alu_op),
    .result(result),
    .nzp(nzp)
);

initial begin
    $dumpfile("alu_dump.vcd");
    $dumpvars(0, alu_testbench);
    $monitor("t=%0t a=%8b b=%8b alu_op=%2b result=%8b nzp=%3b", $time, a, b, alu_op, result, nzp);
end


initial begin
    a = 8'd10;
    b = 8'd2;
    #20 alu_op = 2'b00;
    #20 alu_op = 2'b10;
    #10 $finish;
end
endmodule