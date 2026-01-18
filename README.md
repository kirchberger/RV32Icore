# RV32Icore

Making a RISC-V core for the base instruction set in VHDL to learn VHDL and about processors.
I will implement this on my Mimas V2 Spartan 6 board with Xilinx ISE.

# ISA
32 x registers
4 core instruction formats (R,I,S,U)
Types of instructions:
Integer computation instructions
  Integer register immediate instructions
  Integer register register instructions
  NOP instruction
Control transfer instructions 
  Unconditional jumps
  Conditional branches
load and store instructions
Memory ordering instructions 
Environment call and breakpoints

Instruction list is [here](https://five-embeddev.com/riscv-user-isa-manual/Priv-v1.12/instr-table.html)

# Work 
I decided to make a single cycle CPU
Currently I am working on load and store instructions.




