// Test for 4 Bit Ripple Carry Adder

`timescale 1ns / 1ps

module ripple_adder_test;

// Inputs
reg[3:0]A; 
reg[3:0]B;
reg[0:0]Cin;

// Outputs
wire[3:0]S;
wire[0:0]Cout;

// Instantiate Device Under Test
ripple_adder ttul( .A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));


// Testing
initial
begin
   begin
   A = 0; B = 0; Cin = 0;
   #10 A = 1;
   #10 B = 1;
   #10 Cin = 1;
   #10 A = 8; B = 0;
   #10 A = 5; B = 4;
   #10 Cin = 0;
   #10 A = 2;
   #10 B = 10;
   #10 A = 3; B = 0;
   #10 Cin = 1;
   #10 A = 10; B = 4;
   #20;
   end
end 
    
endmodule
