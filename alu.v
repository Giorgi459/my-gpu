module ALU ( //ALU receives a 2 bit encoded instruction, 
//ADD, SUBTRACT, MULTIPLY, DIVIDE
//DECODER receives 16bit instruction from program memory, xxxx dddd ffff ssss
//where xxxx is the instruction, dddd is the destination register address
// ffff and ssss are first and second source registers, d f and s 
// are addresses relating to a 4 bit register file, which stores at each address
//an 8 bit number, so 16 8-bit numbers
//decoder decodes this 16 bit number and sends the instruction with 2 bits
//and numbers rs and rt (the 8 bit numbers fetched from register file) to alu
    input wire [7:0] a,
    input wire [7:0] b,
    input wire [1:0] alu_op, //00 add, 01 subtract, 10 mult, 11 divide
    output reg [7:0] result
);

always @(*) begin
    
    case (alu_op)
        2'b00: result = a + b;
        2'b01: result = a - b;
        2'b10: result = a * b;
        2'b11: result = a / b;
        default: result = 8'b0;
    endcase

end
endmodule