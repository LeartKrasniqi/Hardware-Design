// Implementation of ALU used in 32-bit MIPS.  Influenced by
// Computer Organization and Design, Fifth Edition by Patterson
// and Hennessy.

`timescale 1ns / 1ps

module ALU
(
    input CLK,                      // clock
    input [5:0] op,                 // opcode
    input [5:0] funct,              // function code
    input [31:0] A,                 // first input
    input [31:0] B,                 // second input
    output reg [31:0] ALU_out,      // output 
    output reg read_write           // 0 -> read op  ,   1 -> write op
);

// Wires to store answers to arithmetic operations
wire [31:0] sum, cout_a, diff, cout_d;

fa_32 adder(A, B, 0, sum, cout_a);
sub_32 subber(A, B, diff, cout_d);

always @ (*)
begin
    read_write = 0;
    // Arithmetic Instructions
    if (op == 6'b000000) 
    begin
        // Add
        if (funct == 6'b100000)
            ALU_out = sum;
                
        // Subtract
        else if (funct == 6'b100010)
            ALU_out = diff;
                
        // AND
        else if (funct == 6'b100100)
            ALU_out = A & B;
            
        // OR
        else if (funct == 6'b100101)
            ALU_out = A | B;
            
        // SLT (Set Less Than)    
        else if (funct == 6'b101010) 
            ALU_out = A < B ? 1 : 0;
                
        read_write = 1;     
    end
        
    // Load Word
    else if (op == 6'b100011)
    begin
        ALU_out = sum;
        read_write = 1;
    end
    
    // Store Word    
    else if (op == 6'b101011)        
        ALU_out = sum;
    
    // Branch on Equal            
    else if (op == 6'b000100)
        ALU_out = A == B ? 1 : 0;
end                    



endmodule
