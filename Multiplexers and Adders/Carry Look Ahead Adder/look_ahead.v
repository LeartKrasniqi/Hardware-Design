// Implementing a 4 Bit Carry Lookahead Adder using Dataflow Modeling

`timescale 1ns / 1ps

module look_ahead
   ( A,
     B,
     Cin,
     S,
     Cout );
     
input wire [3:0] A;
input wire [3:0] B;  
input wire [0:0] Cin;     
output wire [3:0] S;     
output wire [0:0] Cout;     

// Additional Wire for Carry Lookahead
wire [2:0] C;

// Carry Lookahead
assign C[0] = (A[0] & B[0]) | ((A[0] | B[0]) & Cin);
assign C[1] = (A[1] & B[1]) | ((A[1] | B[1]) & C[0]);
assign C[2] = (A[2] & B[2]) | ((A[2] | B[2]) & C[1]);
assign Cout = (A[3] & B[3]) | ((A[3] | B[3]) & C[2]);

// Adding
simple_add a0(.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]));
simple_add a1(.A(A[1]), .B(B[1]), .Cin(C[0]), .S(S[1]));
simple_add a2(.A(A[2]), .B(B[2]), .Cin(C[1]), .S(S[2]));
simple_add a3(.A(A[3]), .B(B[3]), .Cin(C[2]), .S(S[3]));

endmodule
