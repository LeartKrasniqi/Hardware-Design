// Implementation of 2-bit by 2-bit multiplier using a ROM

`timescale 1ns / 1ps

module ROM_mult
  ( data,
    addr );
    
output [3:0] data;
input [3:0] addr;

// Defining 16x4 ROM
reg [3:0] ROM [15:0];

// Reading contents at certain address
assign data = ROM[addr];

// Load ROM content from text file
initial $readmemb("ROM_data.txt", ROM, 0, 15);

endmodule
