// Implementation of a D Flip-Flop

`timescale 1ns / 1ps

module D_flip_flop(input CLK, input D, input Clear, output reg Q);

always @(posedge CLK or posedge Clear)
    if (Clear)
        Q <= 1'b0;
    else
        Q <= D;

endmodule
