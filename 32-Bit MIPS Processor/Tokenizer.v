// This module splits up the instruction into tokens,
// depending on the instruction format.

`timescale 1ns / 1ps

module Tokenizer
(
    input [31:0] instruction,
    output [5:0] op,                // opcode
    output reg [4:0] rs,            // first register source operand
    output reg [4:0] rt,            // second register source operand
    output reg [4:0] rd,            // register destination operand
    output reg [5:0] funct,         // function code
    output reg [31:0] const_addr    // constant or address    
);

// Opcode is first 6 bits of instruction
assign op = instruction[31:26];

always @ (instruction)
begin
    // R Format
    if(op == 6'b000000) 
	begin
	   rs = instruction[25:21];
	   rt = instruction[20:16];
	   rd = instruction[15:11];
	   funct = instruction[5:0];
	end
	// I or J Format
	else 
	begin
	   rs = instruction[25:21]; 
	   rt = instruction[20:16];
	   const_addr[15:0] = instruction[15:0];
	   const_addr[31:16] = 0;                  // Sign Extension
	end
end

endmodule
