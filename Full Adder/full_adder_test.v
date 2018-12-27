// Test Bench for Full Adder Circuit

`timescale 1ns / 1ps


module full_adder_test;

// Inputs
reg [2:0] swt;

// Outputs
wire S;
wire Co;

integer i;
reg e_outS;
reg e_outCo;

// Instantiate Device Under Test
full_adder ttul( .A(swt[2]), .B(swt[1]), .Ci(swt[0]), .S(S), .Co(Co));

// Expected values
function expected_sum;
    input [2:0] switch;
    begin 
        expected_sum = (switch[2] ^ switch[1]) ^ switch[0];
    end
endfunction

function expected_carry;
    input [2:0] switch;
    begin
        expected_carry = ((switch[2] ^ switch[1]) & switch[0]) + (switch[2] & switch[1]);
    end
endfunction 

// Testing
initial
begin
    for (i = 0; i < 8; i = i + 1)
    begin
        #50 swt = i;
        #10 e_outS = expected_sum(swt);
        #10 e_outCo = expected_carry(swt);
        // Comparing expected to actual
        if ((S == e_outS) && (Co == e_outCo))
            $display("LED output matched at %t\n", $time);
        else
            $display("At least one LED output mismatch at time %t:\n
            Sum Expected: %b\tSum Actual: %b\nCarry Expected: 5b\t
            Carry Actual: %b\n", $time, e_outS, S, e_outCo, Co);
    end
end 
    
endmodule
