// Simple Adder Implementation

`timescale 1ns / 1ps

module simple_add
  ( A,
    B,
    Cin,
    S );
    
input wire [0:0] A;
input wire [0:0] B;
input wire [0:0] Cin;
output wire [0:0] S;

assign S = (A ^ B) ^ Cin;
    
endmodule
