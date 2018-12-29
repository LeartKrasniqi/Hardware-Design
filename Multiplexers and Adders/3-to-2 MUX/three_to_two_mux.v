// Creation of two-bit wide 3:2 multiplexer using two 2:1 multiplexers
`timescale 1ns / 1ps

module three_two_mux
    (X,
     Y,
     Z,
     S1,
     S2,
     O1,
     O2 );

// Each input is two bits, the output is two bits, and the selector is just one bit
input wire [1:0] X;
input wire [1:0] Y;
input wire [1:0] Z; 
input wire [0:0] S1;
input wire [0:0] S2;
output wire [1:0] O1;
output wire [1:0] O2;

// Using the behavioral model of the 2:1 muxes to create a 3:2 mux
behav_mux mux1(.X(X), .Y(Y), .S(S1), .O(O1));
behav_mux mux2(.X(O1), .Y(Z), .S(S2), .O(O2));

endmodule
