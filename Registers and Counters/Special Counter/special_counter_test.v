// Test Bench for Special Counter

`timescale 1ns / 1ps

module special_counter_test;

reg CLK;
reg Reset;
reg Enable;
wire [2:0] Q;
integer k;

special_counter ttul(.CLK(CLK), .Reset(Reset), .Enable(Enable), .Q(Q));

always #1 CLK = !CLK;

initial
    begin
        // Reset and No Enable
        CLK = 0; Reset = 1; Enable = 0;
        for(k = 0; k < 8; k = k + 1)
            #2;
            
        // No Reset but Enabled
        CLK = 0; Reset = 0; Enable = 1;
        for(k = 0; k < 16; k = k + 1)
            #2;
            
        // Reset and Enabled
        CLK = 0; Reset = 1; Enable = 1;
        for(k = 0; k < 8; k = k + 1)
            #2;
        
        // No Reset and No Enable
        CLK = 0; Reset = 1; Enable = 1;
        for(k = 0; k < 8; k = k + 1)
            #2;
             
    end 
endmodule
