// Implements operations that will be used in the ALU

`timescale 1ns / 1ps

// 1-Bit Full Adder
module fa
(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
);

assign S = (A ^ B) ^ Cin;
assign Cout = ((A ^ B) & Cin) | (A & B);

endmodule



// 32-Bit Adder
module fa_32
(
    input [31:0] A,
    input [31:0] B,
    input Cin,
    output [31:0] S,
    output Cout
);

// Wires for the carries
wire c0, c1, c2, c3, c4, c5, c6, c7, 
     c8, c9, c10, c11, c12, c13, c14, c15, 
     c16, c17, c18, c19, c20, c21, c22, c23, 
     c24, c25, c26, c27, c28, c29, c30, c31;

// Ripple Carry Addition 
fa a0(A[0], B[0], Cin, S[0], c0);
fa a1(A[1], B[1], c0, S[1], c1);
fa a2(A[2], B[2], c1, S[2], c2);
fa a3(A[3], B[3], c2, S[3], c3);
fa a4(A[4], B[4], c3, S[4], c4);
fa a5(A[5], B[5], c4, S[5], c5);
fa a6(A[6], B[6], c5, S[6], c6);
fa a7(A[7], B[7], c6, S[7], c7);
fa a8(A[8], B[8], c7, S[8], c8);
fa a9(A[9], B[9], c8, S[9], c9);
fa a10(A[10], B[10], c9, S[10], c10);
fa a11(A[11], B[11], c10, S[11], c11);
fa a12(A[12], B[12], c11, S[12], c12);
fa a13(A[13], B[13], c12, S[13], c13);
fa a14(A[14], B[14], c13, S[14], c14);
fa a15(A[15], B[15], c14, S[15], c15);
fa a16(A[16], B[16], c15, S[16], c16);
fa a17(A[17], B[17], c16, S[17], c17);
fa a18(A[18], B[18], c17, S[18], c18);
fa a19(A[19], B[19], c18, S[19], c19);
fa a20(A[20], B[20], c19, S[20], c20);
fa a21(A[21], B[21], c20, S[21], c21);
fa a22(A[22], B[22], c21, S[22], c22);
fa a23(A[23], B[23], c22, S[23], c23);
fa a24(A[24], B[24], c23, S[24], c24);
fa a25(A[25], B[25], c24, S[25], c25);
fa a26(A[26], B[26], c25, S[26], c26);
fa a27(A[27], B[27], c26, S[27], c27);
fa a28(A[28], B[28], c27, S[28], c28);
fa a29(A[29], B[29], c28, S[29], c29);
fa a30(A[30], B[30], c29, S[30], c30);
fa a31(A[31], B[31], c30, S[31], Cout);

endmodule


// 32-Bit Subtractor (A - B)
module sub_32
(
    input [31:0] A,
    input [31:0] B,
    output [31:0] diff,
    output Cout
);

reg [31:0] temp;
integer i;

// Use 32-Bit adder as a subtractor by inverting B and using Cin = 1
always @(*)
begin
    for (i = 0; i < 32; i = i + 1)
        temp[i] = !B[i];
end 

fa_32 sub(A, temp, 1, diff, Cout);

endmodule 
