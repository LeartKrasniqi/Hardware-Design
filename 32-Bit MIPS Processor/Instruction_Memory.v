// Implementation of instruction memory.  The program counter provides an
// address and the instruction memory fetches the instruction that corresponds
// to that address.

`timescale 1ns / 1ps

module Instruction_Memory(input CLK, input [31:0] address, output reg [31:0] instruction);
 
reg [31:0] mem_array [1023:0];  // Holds 2^10 instructions, each 32 bits long

// Read contents of instructions from file into array
initial
begin
    $readmemb("instructions.txt", mem_array);      
end

// Fetch appropriate instruction 
always @ (posedge CLK)
begin
    instruction = mem_array[address]; 
end
endmodule
