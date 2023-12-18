# Quiz #3: Digital Logic 
> Released: Dec 5 23:59:59
> Quiz Date: Dec 6/7 
> Time limit: 2 hours
> Due: Dec 7 23:59:59
> This an open notes quiz

---

### Name: Jonathan Sher
### GitHub Account: jonathan-sher

### Five Elements of an ISA
* What are the five (5) elements that are defined by an ISA?<br>
   1.    Supported instruction and their semantics                                         <!-- response -->
   2.    Supported data types                                                                            <!-- response -->
   3.    Registers: size, number, and purpose                                                 <!-- response -->
   4.    Memory: layout, addressing, alignment, endiance                            <!-- response -->
   5.    OS interface                                                                                            <!-- response -->



### Pipeline Architecture Stages
* The MIPS MicroArchitecture is an example of a pipeline architecture that executes each instruction via a series of stages.  Enumerate and describe briefly what each of these stages do:
   1. Instruction Fetch **(IF)**: Processor fetches the instruction to be executed from memory. The Program Counter (PC) points to the address of the instruction, which is then loaded into the Instruction Register (IR).                                                                   <!-- response -->
   1. Instruction Decode Register Fetch **(ID)**: Fetched instruction is decoded to understand what operation is to be performed & the necessary operands are fetched from the register file if needed for the execution.                                                                    <!-- response -->
   1. Execute Address Calculation **(EX)**: Where the actual operation specified by the instruction is carried out. This often involves arithmetic and logic unit (ALU) operations, such as addition or logical comparison, and calculating memory addresses for load/store instructions.                                            <!-- response -->
   1. Memory Access **(MEM)**: If the instruction requires reading from or writing to memory (like load and store instructions), this action is performed in this stage. The data is either read from memory and sent to the next stage or written to the memory system <!-- response -->
   1. Write Back **(WB)**: The final stage is where the results of an executed instruction are written back to the register file if necessary, completing the instruction cycle. This could be data loaded from memory or the result of an ALU operation.  <!-- response -->
 


### Signed Extension
* The MIPS I-format includes a 16-bit field, which is used to encode an immediate value.  During the "Instruction Decode" cycle this 16-bit value is transformed into a 32-bit value.  For each of the following values, provide 16-bit value that is stored in the instruction and the 32-bit value that is passed to the ALU.
   1. 0x4E0F:  
      * 16-bit value: 2#                     0100 1110 0000 1111      <!-- response -->
      * 32-bit value: 2# 0000 0000 0000 0000 0100 1110 0000 1111      <!-- response -->
   1. 0xA0AA:  
      * 16-bit value: 2#                     1010 0000 1010 1010      <!-- response -->
      * 32-bit value: 2# 1111 1111 1111 1111 1010 0000 1010 1010      <!-- response -->
   1. -8:                
      * 16-bit value: 2#                     1111 1111 1111 1000      <!-- response -->
      * 32-bit value: 2# 1111 1111 1111 1111 1111 1111 1111 1000      <!-- response -->
   1. 5:                   
      * 16-bit value: 2#                     0000 0000 0000 0101      <!-- response -->
      * 32-bit value: 2# 0000 0000 0000 0000 0000 0000 0000 0101      <!-- response -->


### Combinational versus Sequential Circuit
* Explain the primary difference between a combinational and a sequential circuit.
   ```response  (Place your response with this code block.)
   A sequential circuit has a clock and 1 or more pieces of memory, which a combinational circuit lacks.
   ```


### Boolean Expressions
* Given the following truth table, provide the equivalent Boolean expression:
   *  A ' B ' C ' + A B ' C + A B C '                                                                  <!-- response -->

   | A  | B  | C  | Output|
   |----|----|----|-------|
   | 0  | 0  | 0  |   1   |
   | 0  | 0  | 1  |   0   |
   | 0  | 1  | 0  |   0   |
   | 0  | 1  | 1  |   0   |
   | 1  | 0  | 0  |   0   |
   | 1  | 0  | 1  |   1   |
   | 1  | 1  | 0  |   1   |
   | 1  | 1  | 1  |   0   |

### Karnaugh map
* Convert the following truth table into a Karnaugh map.<br>
   (Make sure you update all of the x-s in the answer template.)
   
   | A  | B  | C  | Output |
   |----|----|----|--------|
   | 0  | 0  | 0  |   0    |
   | 0  | 0  | 1  |   0    |
   | 0  | 1  | 0  |   1    |
   | 0  | 1  | 1  |   0    |
   | 1  | 0  | 0  |   1    |
   | 1  | 0  | 1  |   1    |
   | 1  | 1  | 0  |   1    |
   | 1  | 1  | 1  |   1    |

   <!-- Updated the table below to provide your answer -->
   |   |   | BC <br> 00 | BC <br> 01 | BC <br> 11 | BC <br> 10 | 
   |---|---| -----------| ---------- | ---------- | ---------- | 
   | A | 0 |     0      |     1      |     0      |     1      | 
   | A | 1 |     1      |     1      |     1      |     1      | 


### Algebraic Simplification
* Proved the steps to show that `C'(B'C + 1) + A(BC' + ABC')` is equivalent to `C'`.
   ```response  C'(B'C + 1) + A(BC' + ABC') == C
   C'(B'C + 1) + A(BC' + ABC')     : Given        
   C'(1) + A(BC' + ABC')           : Annulment Law, since B'C + 1 is always 1
   C' + A(BC' + ABC')              : Identity Law, C' times 1 is just C'
   C' + A(BC' + A(BC'))            : Redundancy Law, since ABC' is just A AND BC'
   C' + A(BC')                     : Absorption Law, A(BC') absorbs A(BC')
   C' + ABC'                       : Distribution Law, distributing A over BC'
   C'                              : Absorption Law, since C' absorbs ABC'  
   ```


### Models of Computation
There are a number of different types of machines, each with a different level of computational power. The Turning machine is equivalent to a Recursively Enumerable Language.  Complete the following statements:

* The most power machine is the *Turing Machine*.                                  <!-- response -->
* Any function can be evaluated using *Combinational Logic*.                           <!-- response -->
* We can model a process via the PSD, which is an example of a *Finite State Machine*.   <!-- response -->



---
Remember to run `make` to review your submission.


