module register_file(  //decoder receives 16 bit instruction, it reads
//rs and rt from the register file by accessing whatever is stored at rs and rt addresses
//for this it needs two inputs into the register file that tell it the addresses
//of what has to be displayed, and register file needs two outputs that will contain the
//retrieved numbers. 2 inputs and 2 outputs so that this can be done simultaneously
//then ALU calculates rd and writes it into the register file , at the address 
//that is also contained in the 16-bit instruction. so it also needs to tell the register file
//the address of r_d - write address, and another input 8 bit number which is actually the
//result itself. write_address will also be used to load rt and rs into the addresses
//that the decoder expects to read from
    input reg [3:0] a_address,
    input reg [3:0] b_address,
    input reg [3:0] write_address,
    input clk,
    input write_enable,
    input reg [7:0] write_data,
    output reg [7:0] a_retrieved,
    output reg [7:0] b_retrieved
);

reg [7:0] registers [0:15]; //actual array of 16 registers containing 8 bit value each

always @(*) begin 
    a_retrieved = registers[a_address];
    b_retrieved = registers[b_address];
end //whenever one of input addresses is changed, output value also changes immediately

always @(posedge clk) begin
    if (write_enable)
    registers[write_address] <= write_data;
end
endmodule