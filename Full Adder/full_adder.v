// Full Adder Circuit Implementation

module full_adder

// I/O Ports
    ( A,
      B,
      Ci,
      S,
      Co );
      
// Functionality and External Wires
input wire [0:0]A;
input wire [0:0]B;
input wire [0:0]Ci;
output wire [0:0]S;
output wire [0:0]Co;

// Internal Wires
wire outXOR;
wire outAND1;
wire outAND2;

// Logic
xor(outXOR, A, B);
xor(S, outXOR, Ci);
and(outAND1, Ci, outXOR);
and(outAND2, A, B);
or(Co, outAND1, outAND2);

endmodule 
