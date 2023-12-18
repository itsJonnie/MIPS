# Base Conversion and Floating Point Representation

## Name: Jonathan Sher                                  <!-- response -->
## GitHub Account: jonathan-sher                        <!-- response -->

## Problems:


### Scientific Notation Representation
Represent each number in Scientific Notation:
  1. 2# - 10010.11001
     >  $1.878125 \times 10^{1}$        <!-- response -->

  1. 8#  0.00034237
     >  $1.0823822021484375 \times 10^{-4}$                                             <!-- response -->

  1. 16#  4E1.212
     >    $7.8070587158203125 \times 10^{1}$                                               <!-- response -->

### Converting from Scientific Notation
Represent each number in normal form:

1. -1.010010010  x 2^ 101
   >$-1010010010$                                                     <!-- response -->

1. 4.34 x 8^ -3
   >$0.005425$                                                     <!-- response -->

1. 1.ABC2 x 16^ 3
   >  $43906.125$                                                   <!-- response -->
 

### Base Conversion of Real Numbers
Represent each of the following numbers as a binary real.  <br>
(Yes, it is really that simple!)

  1. 8# 0.00434  
     >$0.0001001101101_2$                                                    <!-- response -->

  1. 16#  1ABC.2 
     >$110101011110.0010_2$                                                    <!-- response -->
  

### Floating Point Representation
For each of the problem, perform the following steps:
  * Convert the number (as necessary) to a binary real
  * Represent the number in Scientific Notation (using base 2)
  * Represent the number in IEEE binary16 format
  * Represent the number in IEEE binary32 format

Note: you may use the following conversion calculator
  * https://www.csun.edu/~steve/classes/integers-conversion-encoding/integer-conversion.html


#### 8# 345.23  
For Example:

  1. Base 2: 
     * 110 100 101 . 010 111                              <!-- response --> 

  1. Scientific Notation: 
     * 2# 1.10 100 101 010 111 x 2^ 1000  // 8            <!-- response --> 

  1. IEEE Binary16: 
     * | x | x xxxx | xxxx xxxx xx |                     
     * | 0 | 1 0111 | 1010 0101 01 |                      <!-- response --> 
     * 8 + 15 = 23 -> 1 0111                              <!-- response -->

  1. IEEE Binary32:
     * | x | xxxx xxxx | xxxx xxxx xxxx xxxx xxxx xxx |
     * | 0 | 1000 0111 | 1010 0101 0101 1100 0000 000 |   <!-- response -->
     * 8 + 127 = 135 -> 1000 0111                         <!-- response -->


### 2#  - 0.000000101010  
  1. Base 2: 
     *    $- 0.000000101010_2$                                                <!-- response -->
 
  1. Scientific Notation: 
     *   $-1.01010_2 \times 2^{-6}$                                                 <!-- response -->

  1. IEEE Binary16:
     * | x | x xxxx | xxxx xxxx xx |                     
     * | 1 | 0 1001 | 0101 0000 00 |                                                   <!-- response -->
     *  -6 + 15 = 9 -> 01001                                                  <!-- response -->

  1. IEEE Binary32:
     * | x | xxxx xxxx | xxxx xxxx xxxx xxxx xxxx xxx |
     * | 1 | 0111 1001 | 0101 0000 0000 0000 0000 000 |                                     <!-- response -->
     *  -6 + 127 = 121 -> 01111001                                                 <!-- response -->

### 16#  1AB.C2 
  1. Base 2: 
     * $1.1010101111000010_2$                                                   <!-- response -->
 
  1. Scientific Notation: 
     * $1.1010101111_2 \times 2^8$                                                   <!-- response -->

  1. IEEE Binary16:
     * | x | x xxxx | xxxx xxxx xx |                     
     * | 0 | 1 0111 | 1010 1011 11 |                                                 <!-- response -->
     *  8 + 15 = 23 -> 10111                                                  <!-- response -->

  1. IEEE Binary32:
     * | x | xxxx xxxx | xxxx xxxx xxxx xxxx xxxx xxx |
     * | 0 | 10000111 | 1010 1011 1100 0000 0000 000 |                                 <!-- response -->
     * 8 + 127 = 135 -> 10000111                                                   <!-- response -->


### 16#  - 242.324345
  1. Base 2: 
     *  $-10 0010 0010.0011 0011 0100 0011 0100 0101_2$    <!-- response -->
 
  1. Scientific Notation:             
     * $-1.0010000100011_2 \times 2^9$                                                   <!-- response -->

  1. IEEE Binary16:
     * | x | x xxxx | xxxx xxxx xx |                     
     * | 1 | 1 1000 | 0010 0011 00 |                                                   <!-- response -->
     *  9 + 15 = 24 -> 11000                                                 <!-- response -->

  1. IEEE Binary32:
     * | x | xxxx xxxx | xxxx xxxx xxxx xxxx xxxx xxx |
     * | 1 | 1000 1000 | 0010 0011 0011 0100 0011 010 |                                            <!-- response -->
     * 9 + 127 = 136 -> 10001000

### 8#  - 342.324345674 

  1. Base 2: 
     * $-1110001001101.00110010011011001100_2$                                 <!-- response -->
 
  1. Scientific Notation: 
	  * $-1.11000100110100110010011011001100_2 \times 2^{12}$        <!-- response -->

  3. IEEE Binary16:
     * | x | x xxxx | xxxx xxxx xx |                     
     *  1 | 1 1011 | 1100 0100 11 |                                                  <!-- response -->
     * 12 + 15 = 27 -> 11011                                                   <!-- response -->

  4. IEEE Binary32:
     * | x | xxxx xxxx | xxxx xxxx xxxx xxxx xxxx xxx |
     * | 1 | 1000 1011 | 1100 0100 1101 0011 0010 011 |                       <!-- response -->
     *  12 + 127 = 139 -> 10001011                                                 <!-- response -->

## Resources: 
  * [Encoding to Float](encode_float.md)

