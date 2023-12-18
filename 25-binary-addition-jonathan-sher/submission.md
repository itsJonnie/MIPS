# Binary Addition & Subraction:
### Name:  Jonathan Sher    <!-- response -->
### GitHub Account:    jonathan-sher      <!-- response -->


## Questions

### Complements
Provide the 1's complement and 2 complement encodings for the following numbers.
(You can limit your answer to 8-bit encodings.)

1. -5
   - 1's:   1010                   <!-- response -->
   - 2's:  1011                   <!-- response -->

1. -22
   - 1's: 1110 1001           <!-- response -->
   - 2's: 1110 1010          <!-- response -->

1. 123
   - 1's: 0111 1011          <!-- response -->
   - 2's: 0111 1011          <!-- response -->

1. -2
   - 1's:  1101          <!-- response -->
   - 2's:  1110          <!-- response -->

1. -105
   - 1's: 1001 0110         <!-- response -->
   - 2's: 1001 0111          <!-- response -->


1. -122
   - 1's: 1000 0101          <!-- response -->
   - 2's: 1000 0110          <!-- response -->


### Binary Addition

Solve the following addition problems using binary arithmetic. Show your work by modifying the template provided.

1. 7 + 8:  
   ```
   0 0000 0000  <!-- response: carries -->
     0000 0111  <!-- response: op1 encoding -->
   + 0000 1000  <!-- response: op2 encoding -->
   ------ ----           
   0 0000 1111  <!-- response: sum encoding -->
   ```

1. 113 + 127: 
   ```
   0 1111 0000   <!-- response: carries -->
     0111 0001   <!-- response: op1 encoding -->
   + 0111 1111   <!-- response: op2 encoding -->
   ------  ----          
   1 1110 0100    Overflow  <!-- response: sum encoding -->
   ```

1. 112 - 12: 
   ```
   0 0000 0000   <!-- response: carries -->
     0111 0000   <!-- response: op1 encoding -->
   + 1111 0100   <!-- response: op2 encoding -->
   ------  ----          
   0 0110 0100   <!-- response: sum encoding -->
   ```

1. -22 + 22: 
   ```
   1 1111 0000     <!-- response: carries -->
     1110 1010     <!-- response: op1 encoding -->
   + 0001 0110     <!-- response: op2 encoding -->
   ------  ----          
   0 0000 0000     <!-- response: sum encoding -->
   ```


### Status Bits:
Provide the values of the CPU's status bits after the each of the following additions.  (Note you calculate these additions in the previous section:

1. 113 + 127 
  - C: 1         <!-- response -->
  - V:  1         <!-- response -->
  - S:  1         <!-- response -->
  - Z:  0        <!-- response -->

1. -22 + 22
  - C: 0          <!-- response -->
  - V:  0         <!-- response -->
  - S:  0         <!-- response -->
  - Z:  1        <!-- response -->


### Conversion from Base 16, 8, 2 -> Decimal
1. Convert the following numbers to their base10 equivalent, using the left-to-right method.
Make sure you format your answers well!<br>
(Don't worry about the missing &lt;!-- response: --&gt; tags)

   1. 2# 1010 1101 

   | v      | = | v    | * base + |  digit |  glyph  | 
   |--------|---|----- |----------|--------|---------| 
   |    1      | = |  1    | * 2  + |   0     |   0     |    
   |    0     | = |  0   | * 2  +  |   1     |    1     |    
   |    2     | = |  2    | * 2  + |   1     |    1     |    
   |    5     | = |  5   | *  2  + |   0    |    0     |    
   |    10   | = |  10   | * 2  + |   1    |    1      |    
   |    21   | = |  21   | * 2  + |   0    |    0     | 
   |    42   | = |  42   | * 2 + |   1    |    1      |
   |    85   | = |  85   | * 2 + |   0   |   0       |

   1. 8# 12131          
  
   | v      | = | v    | * base + |  digit |  glyph  | 
   |--------|---|----- |----------|--------|---------| 
   |  0     | = |   0   | * 8    + |   1    |    1    | 
   |  1     | = |    1   | * 8    + |   2    |    2   | 
   |  10   | = |   10  | * 8    + |   1    |    1    | 
   |  81   | = |   81  | * 8    + |   3    |   3    | 
   |  651 | = |  651 | * 8    + |   1    |    1    | 


   1. 16# 28B1    
   
   | v      | = | v    | * base + |  digit |  glyph  | 
   |--------|---|----- |----------|--------|---------| 
   | 0       | = |  0       | *   16      +  |   2       |    2     | 
   | 2       | = |  2       | *   16      +  |   8       |    8     | 
   | 40    | = |  40    | * 16      +    |   11      |    B     | 
   | 651  | = |  651  | * 16      +    |    1       |     1     | 


### Conversion from Decimal -> base N

 1. Convert 10# 43.5187 -> 2# 
    <br>Only provide a maximum of 16 digits in total
    ```
    number = 43                              
    43 / 2 = 21 r1<!--response -->
    21 / 2 = 10 r1<!--response -->
    10 / 2 = 5 r0<!--response --> 
    5 / 2 = 2 r1<!--response -->
    2 / 2 = 1 r0<!--response --> 
    1 / 2 = 0 r1<!--response -->                                         
    answer:101011  <!-- response -->                                  
    ```
    ```
    number =   5187 
    0.5187 * 2 = 1.0374 -> r1                 
    0.0374 * 2 = 0.0748 -> r0                 
    0.0748 * 2 = 0.1496 -> r0                 
    0.1496 * 2 = 0.2992 -> r0                 
    0.2992 * 2 = 0.5984 -> r0                 
    0.5984 * 2 = 1.1968 -> r1                 
    0.1968 * 2 = 0.3936 -> r0                 
    0.3936 * 2 = 0.7872 -> r0                 
    0.7872 * 2 = 1.5744 -> r1                 
    0.5744 * 2 = 1.1488 -> r1                                    
    max    = 6           <!-- response -->                  
    answer: 111101011110 <!-- response -->                            
    ```

 1. Convert 10# - 324.324 -> 2# 
    <br>Only provide a maximum of 16 digits in total
    ```
    number = -324 
    
	324 / 2 = 162 r0               
    162 / 2 = 81 r0                
    81 / 2 = 40 r1                 
    40 / 2 = 20 r0                 
    20 / 2 = 10 r0                 
    10 / 2 = 5 r0                  
    5 / 2 = 2 r1                   
    2 / 2 = 1 r0                   
    1 / 2 = 0 r1     						                                     
    answer: 101000100 <!-- response -->                             
    ```
    ```
    number = 324                              
    0.324 * 2 = 0.648 -> 0                   
    0.648 * 2 = 1.296 -> 1                   
    0.296 * 2 = 0.592 -> 0 
    
    max    =   9 <!-- response -->                         
                                
    answer: 010 <!-- response -->     
    ```



### Binary32

  1. Provide the Binary Scientific Notation for: 10# 43.5187
     -  2#  1.010111000110111  x2^5   <!-- response -->

  1. Provide the Binary Scientific Notation for: 10# - 324.324
     -  2#    -1.01000100            x2^8   <!-- response -->

  1. Provide the binary16 encoding pattern and then provide the encoding for: 10# 43.5187
     * | 0 | 10100 | 0101110001 |   <!-- response -->
     * 0101000101110001             <!-- response -->

  1. Provide the binary32 encoding pattern and then provide the encoding for: 10# - 324.324
     * | 0 | 10000111 | 0100010 |     <!-- response -->
     * 0100001110100010                <!-- response -->


 

