// Test Bench for Dataflow MUX Circuit

`timescale 1ns / 1ps


module data_mux_test;

// Inputs
reg [1:0] X;
reg [1:0] Y;
reg [0:0] S;

// Outputs
wire [1:0] O;

// Instantiate Device Under Test
data_mux ttul( .X(X), .Y(Y), .S(S), .O(O));

// Testing
initial
begin
   begin
   X = 0;
   Y = 0;
   S = 0;
   #10 X = 1;
   #10 Y = 1;
   #10 X = 3; Y = 0;
   #10 X = 2; Y = 3;
   #10 S = 1;
   #10 X = 1;
   #10 Y = 1;
   #10 X = 3; Y = 0;
   #10 X = 2; Y = 3;
   #20;
   end
end 
    
endmodule
