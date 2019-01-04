// Test Bench for 4-bit Register

`timescale 1ns / 1ps

module register_test;

reg CLK; 
reg [3:0] D;  
reg R;
reg L;
wire [3:0] Q;
integer k;

   
register ttul(.CLK(CLK), .D(D), .R(R), .L(L), .Q(Q));

// Creating a digital clock   
always #5 CLK = !CLK;
    
initial
    begin
        // High R(eset)
        CLK = 0; D = 0; R = 1; L = 0; 
        for(k = 0; k < 16; k = k + 1)
            #5 D = k;
        #10;
        
        // High L(oad) 
        CLK = 0; D = 0; R = 0; L = 1;
        for(k = 0; k < 16; k = k + 1)
            #10 D = k;
        #10;
    end
endmodule
