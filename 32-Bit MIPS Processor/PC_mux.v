// Implementation of MUX that updates the program counter

`timescale 1ns / 1ps

module PC_mux
(
    input [31:0] old_PC,
    input branch_output,
    input [31:0] branch_address,
    output [31:0] new_PC    
);


assign new_PC = branch_output ? (old_PC + branch_address) : (old_PC + 1);
 
endmodule
