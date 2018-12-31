// Test Bench for IC 74138

`timescale 1ns / 1ps

module IC_74138_test;

reg [2:0] I;
reg [2:0] S;
wire [7:0] D;
integer k;

IC_74138 ttul(.I(I), .S(S), .D(D));

initial
begin
    S = 0; I = 3;
    for (k = 0; k < 8; k = k + 1)
        #5 S = k;
    #10;
    
    S = 0; I = 5;
    for (k = 0; k < 8; k = k + 1)
        #5 S = k;
    #10;
    
    S = 0; I = 2;
    for (k = 0; k < 8; k = k + 1)
        #5 S = k;
    #10;
    
    S = 0; I = 4;
    for (k = 0; k < 8; k = k + 1)
        #5 S = k;
    #10;    
end

endmodule 
