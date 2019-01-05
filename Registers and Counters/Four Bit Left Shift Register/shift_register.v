// Design a 4-bit Left Shift Register

`timescale 1ns / 1ps

module shift_register(input CLK, input [3:0] Parallel_In, input Load, input Shift_Enable, input Shift_In, output [3:0] Reg_Content, output Shift_Out);

reg [3:0] temp;

always @(posedge CLK)
    if (Load)
        begin
            temp <= Parallel_In;
        end
    else if (Shift_Enable)
        begin
            temp <= {Reg_Content[2:0], Shift_In};
        end
    assign Shift_Out = temp[3];
    assign Reg_Content = temp;
        
            
endmodule
