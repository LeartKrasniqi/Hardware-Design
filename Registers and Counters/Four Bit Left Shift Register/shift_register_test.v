// Test Bench for Shift Register

`timescale 1ns / 1ps


module shift_register_test;

    reg CLK;
    reg [3:0] Parallel_In;
    reg Load;
    reg Shift_Enable;
    reg Shift_In;
    wire [3:0] Reg_Content;
    wire Shift_Out;
    integer k;
    integer random;
    
   shift_register ttul(.CLK(CLK), .Parallel_In(Parallel_In), .Load(Load), .Shift_Enable(Shift_Enable), .Shift_In(Shift_In),
                        .Reg_Content(Reg_Content), .Shift_Out(Shift_Out));
    
    always #1 CLK = !CLK;
    
    initial
        begin
            // Test the Loading Feature 
            CLK = 0; Load = 1; Shift_Enable = 0; random = 0;
            for(k = 0; k < 16; k = k + 1)
            begin
                #2 Parallel_In = k;
                random = $random;
                Shift_In = random[0];       
            end
            #2;
            
            // Test the Shifting Feature
            CLK = 0; Load = 0; Shift_Enable = 1; random = 0;
            for(k = 0; k < 16; k = k + 1)
            begin
                #2 Parallel_In = k;
                random = $random;
                Shift_In = random[0];       
            end
            #2;
            
            
            // Test the ambiguous states
            CLK = 0; Load = 0; Shift_Enable = 0; random = 0;
            for(k = 0; k < 16; k = k + 1)
            begin
                #2 Parallel_In = k;
                random = $random;
                Shift_In = random[0];       
            end
            #2;
            
            CLK = 0; Load = 1; Shift_Enable = 1; random = 0;
            for(k = 0; k < 16; k = k + 1)
            begin
                #2 Parallel_In = k;
                random = $random;
                Shift_In = random[0];       
            end
            #2;            
        
        end
endmodule
