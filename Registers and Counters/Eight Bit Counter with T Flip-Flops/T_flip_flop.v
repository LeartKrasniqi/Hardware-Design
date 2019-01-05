// Implementation of a T Flip-Flop using Behavioral Modeling

`timescale 1ns / 1ps


module T_flip_flop(input CLK, input Reset, input T, output reg Q);

always @(negedge CLK)
    if(!Reset)
        Q <= 1'b0;
    else 
        Q <= Q ^ T;
   
endmodule
