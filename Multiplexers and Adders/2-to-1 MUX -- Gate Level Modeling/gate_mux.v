// Creation of two-bit wide 2:1 multiplexer using gate level modeling

`timescale 1ns / 1ps

module gate_mux
    (X,
     Y,
     S,
     O);

// Each input is two bits, the output is two bits, and the selector is just one bit
input wire [1:0] X;
input wire [1:0] Y;
input wire [0:0] S;
output wire [1:0] O;

wire not_S;
wire X0_and_notS;
wire X1_and_notS;
wire Y0_and_S;
wire Y1_and_S;

// Logic
not(not_S, S);
and(X0_and_notS, X[0], not_S);
and(X1_and_notS, X[1], not_S);
and(Y0_and_S, Y[0], S);
and(Y1_and_S, Y[1], S);
or(O[0], X0_and_notS, Y0_and_S);
or(O[1], X1_and_notS, Y1_and_S);

endmodule
