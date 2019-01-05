// Design a counter that counts in a special sequence

`timescale 1ns / 1ps

module special_counter(input CLK, input Reset, input Enable, output [2:0] Q);

reg [2:0] current;
reg [2:0] next;

// The unique states
localparam s0 = 3'b000;     // 000
localparam s1 = 3'b001;     // 001
localparam s2 = 3'b011;     // 011
localparam s3 = 3'b101;     // 101
localparam s4 = 3'b111;     // 111
localparam s5 = 3'b010;     // 010

assign Q = current;

always @(posedge CLK)
    begin
        if(Reset)
            current = s0;
        else if (Enable && ~Reset)
            current = next;
    end

always @(CLK or Reset or Enable)
    begin
        next = current;
        case(current)
            s0: if(Enable)
                    next = s1;
            s1: if(Enable)
                    next = s2;
            s2: if(Enable)
                    next = s3;
            s3: if(Enable)
                    next = s4;
            s4: if(Enable)
                    next = s5;
            s5: if(Enable)
                    next = s0;
            default: 
                    next = s0;
       endcase
    end
endmodule
