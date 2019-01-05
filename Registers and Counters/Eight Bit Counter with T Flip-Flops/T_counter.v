// Design an 8-bit Counter using T Flip-Flops

`timescale 1ns / 1ps

module T_counter(input CLK, input Reset, input T, output [7:0] Q);

T_flip_flop T0(.CLK(CLK), .Reset(Reset), .T(T), .Q(Q[0]));
T_flip_flop T1(.CLK(CLK), .Reset(Reset), .T(T && Q[0]), .Q(Q[1]));     
T_flip_flop T2(.CLK(CLK), .Reset(Reset), .T(T && Q[0] && Q[1]), .Q(Q[2]));     
T_flip_flop T3(.CLK(CLK), .Reset(Reset), .T(T && Q[0] && Q[1] && Q[2]), .Q(Q[3]));     
T_flip_flop T4(.CLK(CLK), .Reset(Reset), .T(T && Q[0] && Q[1] && Q[2] && Q[3]), .Q(Q[4]));     
T_flip_flop T5(.CLK(CLK), .Reset(Reset), .T(T && Q[0] && Q[1] && Q[2] && Q[3] && Q[4]), .Q(Q[5]));     
T_flip_flop T6(.CLK(CLK), .Reset(Reset), .T(T && Q[0] && Q[1] && Q[2] && Q[3] && Q[4] && Q[5]), .Q(Q[6]));     
T_flip_flop T7(.CLK(CLK), .Reset(Reset), .T(T && Q[0] && Q[1] && Q[2] && Q[3] && Q[4] && Q[5] && Q[6]), .Q(Q[7]));

endmodule
