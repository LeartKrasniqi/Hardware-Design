// Design an 8-bit Counter using D Flip-Flops

`timescale 1ns / 1ps

module D_counter(input CLK, input D, input Clear, output [7:0] Q);

D_flip_flop D0(.CLK(CLK), .D(~Q[0]), .Clear(Clear), .Q(Q[0]));
D_flip_flop D1(.CLK(~Q[0]), .D(~Q[1]), .Clear(Clear), .Q(Q[1]));
D_flip_flop D2(.CLK(~Q[1]), .D(~Q[2]), .Clear(Clear), .Q(Q[2]));
D_flip_flop D3(.CLK(~Q[2]), .D(~Q[3]), .Clear(Clear), .Q(Q[3]));
D_flip_flop D4(.CLK(~Q[3]), .D(~Q[4]), .Clear(Clear), .Q(Q[4]));
D_flip_flop D5(.CLK(~Q[4]), .D(~Q[5]), .Clear(Clear), .Q(Q[5]));
D_flip_flop D6(.CLK(~Q[5]), .D(~Q[6]), .Clear(Clear), .Q(Q[6]));
D_flip_flop D7(.CLK(~Q[6]), .D(~Q[7]), .Clear(Clear), .Q(Q[7]));

endmodule
