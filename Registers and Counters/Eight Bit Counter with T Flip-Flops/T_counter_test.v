// Test Bench for 8-bit Counter using T Flip-Flops

`timescale 1ns / 1ps

module T_counter_test;

reg CLK;
reg Reset;
reg T;
wire [7:0] Q;
integer k;

T_counter ttul(.CLK(CLK), .Reset(Reset), .T(T), .Q(Q));

always #1 CLK = !CLK;

initial
    begin
        // Reset and no toggling
        CLK = 0; Reset = 0; T = 0;
        for(k = 0; k < 8; k = k + 1)
            #2;
 
        // Reset and toggling 
        CLK = 0; Reset = 0; T = 1;
        for(k = 0; k < 8; k = k + 1)
            #2;
        
        // No reset and no toggling
        CLK = 0; Reset = 1; T = 0;
        for(k = 0; k < 8; k = k + 1)
            #2;
        
        // No reset and toggling
        CLK = 0; Reset = 1; T = 1;
        for(k = 0; k < 256; k = k + 1)
            #2;
    end 
endmodule
