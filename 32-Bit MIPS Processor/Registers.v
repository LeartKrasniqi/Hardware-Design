// Implementation of Registers
// Layout of registers is as follows:
//          Name        Number (Decimal)
//          $zero       0
//          $at         1 
//          $v0-$v1     2-3
//          $a0-$a3     4-7
//          $t0-$t7     8-15
//          $s0-$s7     16-23
//          $t8-$t9     24-25
//          $k0-$k1     26-27
//          $gp         28
//          $sp         29
//          $fp         30
//          $ra         31


`timescale 1ns / 1ps

module Registers
(
    input CLK,
    input [4:0] rs_addr,        // Address of rs (source 1) register
    input [4:0] rt_addr,        // Address of rt (source 2) register
    input [4:0] rd_addr,        // Address of rd (destination) register
    input [31:0] data,          // Data to be written to rd
    input read_write,           // read -> 0, write -> 1
    input [4:0] user_addr,      // Address of register user wants to view 
    output [31:0] out_rs,       // Output from reading the register
    output [31:0] out_rt,
    output [31:0] out_user      
);

// 32 registers, each 32 bits long    
reg [31:0] reg_array [31:0];

// Initialize the registers to user provided values
initial
begin
    $readmemb("C:/Users/Milot/Desktop/Leart/Cooper Union/final_project/registers2.txt", reg_array);
end

// Write contents into register 
always @ (negedge CLK)
begin
    if (read_write)
        reg_array[rd_addr] = data;
end

// Reading contents of register    
assign out_rs = reg_array[rs_addr];
assign out_rt = reg_array[rt_addr];
assign out_user = reg_array[user_addr];
    
endmodule
