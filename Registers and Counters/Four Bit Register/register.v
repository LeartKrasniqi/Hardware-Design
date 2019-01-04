// Design a 4-bit Register with a synchronus Reset and Load

`timescale 1ns / 1ps

module register(input CLK, input [3:0] D, input R, input L, output reg [3:0] Q);

always @(posedge CLK)
    // If R(eset) is high, set output to 0
    if (R)
        begin
            Q <= 0;
        end
    // If L(oad) is high, set output to input
    else if (L)
        begin
            Q <= D;
        end
        
endmodule
