// Test Bench for 2-bit by 2-bit Multiplier

`timescale 1ns / 1ps

module ROM_mult_test;

reg [3:0] addr;
wire [3:0] data;
integer k;

ROM_mult ttul(.data(data), .addr(addr));

initial 
begin
    addr = 0;
    for (k = 0; k < 16; k = k + 1)
        #5 addr = k;
    #10;
end
endmodule
