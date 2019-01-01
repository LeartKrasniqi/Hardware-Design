// Implementation of 3:8 Decoder (Data Flow Modeling)

`timescale 1ns / 1ps

module decoder
  ( E,
    S,
    D );
    
input wire [0:0] E;     // Enable
input wire [2:0] S;     // Select Line
output wire [7:0] D;    // Data

assign D[0] = (~S[2] & ~S[1] & ~S[0]) & E;      // S = 000
assign D[1] = (~S[2] & ~S[1] & S[0]) & E;       // S = 001
assign D[2] = (~S[2] & S[1] & ~S[0]) & E;       // S = 010
assign D[3] = (~S[2] & S[1] & S[0]) & E;        // S = 011
assign D[4] = (S[2] & ~S[1] & ~S[0]) & E;       // S = 100
assign D[5] = (S[2] & ~S[1] & S[0]) & E;        // S = 101
assign D[6] = (S[2] & S[1] & ~S[0]) & E;        // S = 110
assign D[7] = (S[2] & S[1] & S[0]) & E;         // S = 111


endmodule
