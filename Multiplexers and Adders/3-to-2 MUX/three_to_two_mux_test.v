// Test Bench for 3:2 MUX Circuit

`timescale 1ns / 1ps


module three_two_mux_test;

// Inputs
reg [1:0] X;
reg [1:0] Y;
reg [1:0] Z;
reg [0:0] S1;
reg [0:0] S2;

// Outputs
wire [1:0] O1;
wire [1:0] O2; 

// Instantiate Device Under Test
three_two_mux ttul( .X(X), .Y(Y), .Z(Z), .S1(S1), .S2(S2), .O1(O1), .O2(O2));

// Testing
initial
begin
   begin
   X = 0;
   Y = 0;
   Z = 0;
   S1 = 0;
   S2 = 0;
   #10 X = 1;
   #10 Y = 1;
   #10 Z = 1;
   #10 X = 3; Y = 0; Z = 2;
   #10 X = 2; Y = 3;
   #10 S1 = 1;
   #10 X = 1;
   #10 Y = 1;
   #10 S2 = 1;
   #10 X = 3; Y = 0; 
   #10 X = 2; Y = 3; Z = 1;
   #10 Z = 3;
   #10 S1 = 0;
   #10 X = 0; Y = 1;
   #10 X = 3; Y = 0; Z = 0;
   #20;
   end
end 
    
endmodule
