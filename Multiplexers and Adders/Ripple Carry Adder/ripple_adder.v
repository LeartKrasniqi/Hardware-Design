// 4 Bit Ripple Carry Adder  

`timescale 1ns / 1ps

module ripple_adder
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

// Additional wires for carrying
wire carry0;
wire carry1;
wire carry2;

// Addition
full_adder_data fa0(.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .Cout(carry0));
full_adder_data fa1(.A(A[1]), .B(B[1]), .Cin(carry0), .S(S[1]), .Cout(carry1));
full_adder_data fa2(.A(A[2]), .B(B[2]), .Cin(carry1), .S(S[2]), .Cout(carry2));
full_adder_data fa3(.A(A[3]), .B(B[3]), .Cin(carry2), .S(S[3]), .Cout(Cout));
      
endmodule
