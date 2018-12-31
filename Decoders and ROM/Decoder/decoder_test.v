// Test Bench for 3:8 Decoder

`timescale 1ns / 1ps

module decoder_test;

reg [2:0] S;
wire [7:0] D;
integer k;

decoder ttul(.E(1), .S(S), .D(D));

initial 
begin
    S = 0;
    for (k = 0; k < 8; k = k + 1)
        #5 S = k;
    #10;
end
endmodule
