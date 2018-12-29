// Implementation of Full Adder using Dataflow Modeling

`timescale 1ns / 1ps

module full_adder_data
   ( A,
     B,
     Cin,
     S,
     Cout );

// Inputs and Outputs
input wire [0:0]A;
input wire [0:0]B;
input wire [0:0]Cin;
output wire [0:0]S;
output wire [0:0]Cout;

// Dataflow Modeling 
assign S = (A ^ B) ^ Cin;
assign Cout = ((A ^ B) & Cin) | (A & B);

endmodule
