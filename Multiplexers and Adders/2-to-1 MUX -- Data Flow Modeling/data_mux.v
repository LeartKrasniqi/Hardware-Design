// Creation of two-bit wide 2:1 multiplexer using dataflow modeling
`timescale 1ns / 1ps

module data_mux
    (X,
     Y,
     S,
     O);

// Each input is two bits, the output is two bits, and the selector is just one bit
input wire [1:0] X;
input wire [1:0] Y; 
input wire [0:0] S;
output wire [1:0] O;

// Using continuous assignments with a net delay of 3ns
assign #3 O[0] = (X[0] & ~S) | (Y[0] & S);
assign #3 O[1] = (X[1] & ~S) | (Y[1] & S);

endmodule
