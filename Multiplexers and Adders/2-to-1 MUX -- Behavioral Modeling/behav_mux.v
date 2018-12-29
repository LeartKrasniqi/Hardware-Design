// Creation of two-bit wide 2:1 multiplexer using behavioral modeling
`timescale 1ns / 1ps

module behav_mux
    (X,
     Y,
     S,
     O);

// Each input is two bits, the output is two bits, and the selector is just one bit
input wire [1:0] X;
input wire [1:0] Y; 
input wire [0:0] S;
output reg [1:0] O;

// Using procedural statements 
always @(X or Y or S)
begin
    case(S)
        0: O = X;
        1: O = Y;
        default: $display("Error");
    endcase
end

endmodule
