// Test Bench for 8-bit Counter using D Flip-Flops

`timescale 1ns / 1ps

module D_counter_test;

reg CLK;
reg D;
reg Clear;
wire [7:0] Q;
integer k;

D_counter ttul(.CLK(CLK), .D(D), .Clear(Clear), .Q(Q));

always #2 CLK = !CLK;

initial
    begin
        // Clearing with input = 0
        CLK = 0; Clear = 1; D = 0;
        for(k = 0; k < 8; k = k + 1)
            #2;
            
        // No clearing with input = 0
        CLK = 0; Clear = 0; D = 0;
        for(k = 0; k < 256; k = k + 1)
            #2;
            
        // Clearing with input = 1
        CLK = 0; Clear = 1; D = 1;
        for(k = 0; k < 8; k = k + 1)
            #2;
        
        // No clearing with input = 1
        CLK = 0; Clear = 0; D = 1;
        for(k = 0; k < 256; k = k + 1)
            #2;
             
    end 
endmodule
