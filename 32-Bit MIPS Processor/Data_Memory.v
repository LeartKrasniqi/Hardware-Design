// Implementation of Data Memory

`timescale 1ns / 1ps

module Data_Memory
(
    input CLK,
    input [5:0] op,
    input [31:0] rt,        // When using I-type instructions, rt is the destination register
    input [25:0] addr,
    output [31:0] data_out
);

reg [31:0] data_array [1023:0];  // Holds 2^10 data words 
integer k;

// Initialize data array to all zero
initial 
begin
    for (k = 0; k < 1024; k = k + 1)
        data_array[k] = 0;
end

// Writing to data array (if sw instruction)
always @ (negedge CLK)
begin
    if (op == 6'b101011)
        data_array[addr] = rt;
end

// Reading from data array
assign data_out = data_array[addr];

endmodule
