// Implementation of IC 74138 functionality 
`timescale 1ns / 1ps

module IC_74138
  ( I,
    S,
    D );
    
input wire [2:0] I;     // Inputs
input wire [2:0] S;     // Select Lines
output wire [7:0] D;    // Data
wire [0:0] E;           // Enable
wire [7:0] temp;        

// Specialized Logic
assign E = I[2] & (~I[1]) & (~I[0]);
assign D = ~temp;

decoder demux(.E(E), .S(S), .D(temp));

endmodule
