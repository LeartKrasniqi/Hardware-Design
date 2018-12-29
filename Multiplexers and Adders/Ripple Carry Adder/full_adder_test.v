// Full Adder Test

`timescale 1ns / 1ps

module full_adder_data_test;

// Inputs
reg[0:0]A; 
reg[0:0]B;
reg[0:0]Cin;

// Outputs
wire[0:0]S;
wire[0:0]Cout;

full_adder_data ttul(.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

// Testing
initial
begin
  A = 0; B = 0; Cin = 0;
	#10 A = 1;
	#10 B = 1; A = 0;
	#10 A = 1;
	#10 Cin = 1; A = 0; B = 0;
	#10 A = 1;
	#10 B = 1; A = 0;
	#10 A = 1;
	#10;
end
   
endmodule
