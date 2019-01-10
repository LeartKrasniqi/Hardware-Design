// Implementation of 32-Bit MIPS processor

`timescale 1ns / 1ps

module MIPS_32(input CLK, input reset, input [4:0] user_addr, input [1:0] reg_bits, output reg [7:0] register_out_user);

reg [31:0] pc_addr = 0;         // Program Counter
wire [31:0] pc;                 // Program Counter
wire [31:0] instruction;        // Instruction Memory
wire [5:0] opcode, funct;       // Tokenizer, ALU
wire [4:0] rs, rt, rd;          // Tokenizer               
wire [31:0] const_addr;         // Tokenizer, PC_mux
reg [31:0] reg_data;            // Registers
wire [31:0] out_rs, out_rt;     // Registers
reg [4:0] Rd;                   // Registers
wire [31:0] register_out;       // Registers 
wire read_write;                // Registers, ALU, Data Memory
reg [31:0] arg0, arg1;          // ALU
wire [31:0] ALU_out;            // ALU    
reg [31:0] mem_address;         // Data Memory
wire [31:0] data_out;           // Data Memory
reg branch;                     // PC_mux
wire [31:0] new_pc;             // PC_mux



// Initializing and updating the program counter 
PC prog_counter(CLK, pc_addr, pc);

// Fetching instruction
Instruction_Memory instr_mem(CLK, pc, instruction);

// Splitting up instruction into tokens
Tokenizer token(instruction, opcode, rs, rt, rd, funct, const_addr);

// Reading from and/or writing to registers
Registers r(CLK, rs, rt, Rd, reg_data, read_write, user_addr, out_rs, out_rt, register_out);

// Performing arithmetic operations
ALU alu(CLK, opcode, funct, arg0, arg1, ALU_out, read_write);

// Reading from and/or writing to data memory
Data_Memory d(CLK, out_rt, mem_address, read_write, data_out);

// Selection of new program counter address
PC_mux pc_select(pc, branch, const_addr, new_pc);


always @ (*)
begin
    // Arithmetic Instructions
    if (opcode == 6'b000000)
    begin
        arg0 = out_rs;
        arg1 = out_rt;
        Rd = rd;
        reg_data = ALU_out;
        branch = 0;
        pc_addr = new_pc;
    end
    
    // Load Word
    if (opcode == 6'b100011)
    begin
        arg0 = out_rs;
        arg1 = const_addr;
        Rd = rt;
        mem_address = ALU_out;
        branch = 0;
        pc_addr = new_pc;
    end
        
    // Store Word
    if (opcode == 6'b101011)
    begin
        arg0 = out_rs;
        arg1 = const_addr;
        mem_address = ALU_out;
        branch = 0;
        pc_addr = new_pc;
    end
    
    // Branch on Equal
    if (opcode == 6'b000100)
    begin
        arg0 = out_rs;
        arg1 = out_rt;
        branch = ALU_out;
        pc_addr = new_pc;
    end
    
    // Reset
    if (reset)
        pc_addr = 0;
    
    // Selecting which bits of register to display    
    case (reg_bits)
        // Bits 0-7
        0: register_out_user = register_out[7:0];
        // Bits 8-15
        1: register_out_user = register_out[15:8];
        // Bits 16-23
        2: register_out_user = register_out[23:16];
        // Bits 24-31
        3: register_out_user = register_out[31:24];
     endcase
     
                      
end    


endmodule
