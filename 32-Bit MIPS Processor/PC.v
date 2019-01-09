// Implementation of Program Counter 

`timescale 1ns / 1ps

module PC
(
    input CLK,
    input [31:0] address,
    output reg [31:0] pc
);

// Set initial PC to 0
initial
begin
    pc = 32'b00000000000000000000000000000000;
end

// Update PC on negative edges
always @ (negedge CLK)
begin
    pc = address;
end
 
endmodule
