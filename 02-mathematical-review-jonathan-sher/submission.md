# Mathematical Review: Base 10

### Name: Jonathan Sher                                         <!-- response -->
### GitHub Account: jonathan-sher                                <!-- response -->

---
## Overview
  * The human hand has ten digits, which are also known as fingers.
  * There are ten digits in the Base 10 numbering system.
  * We have all learned to count in Base 10.
  * As humans, we are comfortable in performing mathematical operations in base 10.

In COMP122, we will be learning about computer architecture and assembly languages. A key component in using these systems is knowing various numbering systems and data representations. For example, we will be learning about base 2, base 8, base 16, and base 64 within this class.

On a computer system, we need to perform basic mathematical operations. The operations are not performed in base 10, but in base 2. That is to say that a computer system uses binary numbers in all of its computations. Moreover, we are limited in the size of the numbers that can be used within our calculations.

In this assignment, you are to perform a number of simple mathematical operations in Base 10. The purpose of this assignment is to have you review the fundamentals of these operations and to prepare you to perform the same types of operations using binary numbers (that is to say, using Base 2 computations).

While completing this exercise, pay attention to the algorithm or process you use to solve each problem. Show all of your work in the space provided. Notice that you are limited to numbers in the range of 0 .. 9,999. Perhaps, there might be a problem or two in which you will not be able to solve given the provided <b>space</b>. When such an <b>exception</b> occurs, simply denote you were not able to solve that problem.


#### Section 1: Addition of Whole Numbers
   1. Perform the following additions.
   1. Show your work by replacing each 'x' with the appropriate character.
   1. Every 'x' needs to be replace with the appropriate character.

   * 13 + 5
   ```
         0000  
         0013  
       + 0005  
       ------
         0018  

   Final Answer: 0018 
   ```
 
   * 13 + 8
   ```
         0010  
         0013  
       + 0008  
       ------
         0021  
         
   Final Answer: 0021 
   ```
 
   * 1345 + 655
   ```
         1110  
         1345  
       + 0655  
       ------
         2000  
         
   Final Answer: 2000 
   ```
 
   * 5676 + 4334
   ```
         1110  
         5676   
       + 4334  
       ------
         0010  
         
   Final Answer: overflow 
   # Note the sum is 10,010, but this number overflowed the space provided.
   ```
 
#### Section 2: Addition of Fix Point Numbers
   1. Perform the following additions.
   1. Show your work by replacing each 'x' with the appropriate character.
   1. Every 'x' needs to be replaced with the appropriate character.

   * 13.5 + 5.0
   ```
        0000.00
        0013.50
      + 0005.00
      ---------
        0018.50
         
   Final Answer: 0018.50 
   ```
 
   * 45.67 + 0.8
   ```
        0001.00
        0045.67
      + 0000.80
      ---------
        0046.47
         
   Final Answer: 0046.47
   ```
 
   * 134.5 + 0.655
   I rounded 0.655 -> 0.66 otherwise there wouldn't be enough space
   ```
        0001.00
        0134.50
      + 0000.66
      ---------
        0135.16
         
   Final Answer: 0135.16
  
   ```
 
   * 566.76 + 4334.0
   ```
        0110.00
        0566.76
      + 4334.00
      ---------
        4900.76
         
   Final Answer: 4900.76
   ```

#### Section 3: Ten's Complement[^1]
[^1]: Also known as a radix complement for Base10.

> Complement: a thing that completes or brings to perfection

In mathematics, two numbers are said to be complements if by adding them together you obtain a number that is a power of ten: 0, 10, 100, 100, etc. For example, the ten's complement of 25 with respect to 100 is 75 (25 + 75 = 100).

  1. Calculate the complement of the following numbers _with respect to_ 10:
     * 3: 7 (3 + 7 = 10)                                           <!-- response -->
     * 5: 5 (5 + 5 = 10)                                           <!-- response -->
     * 6: 4 (6 + 4 = 10)                                           <!-- response -->
     * 9: 1 (9 + 1 = 10)                                          <!-- response -->
  
  1. Calculate the complement of the following numbers _with respect to_ 100:
     * 33: 67 (33 + 67 = 100)                                           <!-- response -->
     * 65: 35 (65 + 35 = 100)                                          <!-- response -->
     * 82: 18 (82 + 18 = 100)                                          <!-- response -->
     * 3:  97 (3 + 97 = 100)                                          <!-- response -->
  
  1. Calculate the complement of the following numbers:
     * 23: 77 (23 + 77 = 100)                                          <!-- response -->
     * 345: 655 (345 + 655 = 1000)                                     <!-- response -->
     * 3453: 6547 (3453 + 6547 = 10,000 )                               <!--response -->
     * 5638: 4362 (5638 + 4362 = 10,000)                                <!-- response -->
  
  When we are not given the sum of the two numbers, it is defined to be the   smallest power of 10 larger than both the complements.  For example, when   providing the complement of 654, we presume that this is _with respect to_ 1000.

#### Section 4: Nine's Complement[^2]
[^2]: Also know as the diminished radix complement for Base 10.

The nine's complement of a decimal digit is the number that must be added to produce 9.  Whereas the nine's complement of a three digit number is that number that must be added to it to produce 999.

  1. Provide the 9's complement of the following numbers:
     * 3: 6 (3 + 6 = 9)                                           <!-- response -->
     * 5: 4 (5 + 4 = 9)                                           <!-- response -->
     * 6: 3 (6 + 3 = 9)                                           <!-- response -->
     * 9: 0 (9 + 0 = 9)                                         <!-- response -->
  
  1. Provide the 9's complement of the following numbers:
     * 33: 66 (33 + 66 = 99)                                          <!-- response -->
     * 65: 34 (65 + 34 = 99)                                          <!-- response -->
     * 82: 17 (82 + 17 = 99)                                          <!-- response -->
     * 3:  6 (3 + 6 = 9)                                          <!-- response -->
  
  1. Provide the 9's complement of the following numbers:
     * 23: 76 (23 + 76 = 99)                                          <!-- response -->
     * 345: 654 (345 + 654 = 999)                                      <!-- response -->
     * 3453: 6546 (3453 + 6546 = 9999 )                                 <!-- response -->
     * 5638: 4361 (5638 + 4361 = 9999 )                                  <!-- response -->
  


#### Section 5: Scientific Notation
Large and small numbers can be more consciously written using Scientific Notation. For example, the value of ``pi`` can be represented as:

>  3.14159  x 10^ 0

This number represented in this form can be broken down into the following components
  1. the sign: + implicitly
  1. the whole part: 3
  1. the radix: .                  # also known as the decimal point
  1. the mantissa part: 14159
  1. the scientific-base: x 10^
  1. the sign of the exponent: + (implicitly)
  1. the exponent: 0

The general pattern for writing this number out in textual form is as follows:

> s w.mmmmm x 10^ s eee

Represent the following numbers using scientific notation using the pattern provided. That is to say, replace the pattern character (s, w, m, and e) with an appropriate character.  Every pattern character must be replaced, and you can't add additional pattern characters.

   * 45.67
     > + 4.56700 x 10^ + 001                         <!-- response -->

   * 92,955,807  # Average distance between the Sun and the Earth in miles.
     > + 9.2955807 x 10^ + 007                         <!-- response -->

   * 602,221,407,600,000,000,000,000    # Avogadro constant
     > + 6.022214076 x 10^ + 024                         <!-- response -->
   
   * 0.000,000,000,000,000,000,000,001,673,557,5 # Mass of an hydrogen atom 
     > + 1.6735575 x 10^ - 027                         <!-- response -->


### Section Three
1. Did you read the overview of this assignment? 
   * Yes I read the overview of the assignment.               <!-- response -->

1. Why was this exercise assigned to you by your Professor?
   * It is to give us a better understanding of how computers do math.                                                      <!-- response -->

1. What is a natural number?
   * A natural number is a positive integer that starts from 1 and continues indefinitely, excluding zero and negative numbers.                      <!-- response -->

1. What is a whole number?  
   * A whole number is a non-negative integer, including zero, and it does not have any fractional or decimal parts. Whole numbers are often used for counting objects or representing quantities.                           <!-- response -->

1. What is an integer?
   * An integer is a whole number that can be positive, negative, or zero, without any fractional or decimal parts.                       <!-- response -->

1. What is a real number? 
   * A real number is any number that can be represented on the number line, including both rational numbers (fractions) and irrational numbers (such as the square root of 2 or pi), and they can have decimal expansions that go on forever.                                             <!-- response -->

1. What is a complement?
   * The complement of a number is the amount that must be added to it to reach a specific value. For example, the nine's complement of a decimal digit is the number that, when added to that digit, produces 9.                  <!-- response -->

1. What is a carry?
   * A "carry" refers to the process of carrying over a value from one place value position to the next when the sum of two digits in that position exceeds the base of the number system. For example, in base-10 (our decimal system), when adding two numbers, if the sum of the digits in a particular column is 10 or greater, you carry the "1" to the next left column (position of higher significance) while retaining the remainder as part of the sum in the current column.                            <!-- response -->

1. What is overflow?
   * Overflow is a mathematical or computational error that occurs when a calculation or operation produces a result that exceeds the maximum representable value in a given number system, often leading to unintended or incorrect outcomes. It typically happens in computer programming when dealing with limited storage capacity for numbers.                                             <!-- response -->

1. When using scientific notation, with a particular pattern, is there the potential for a loss information or precision in the number?
   *  When using scientific notation with a particular pattern, such as representing a number as "s w.mmmmm x 10^ s eee," there can be a potential for a loss of precision, especially if the pattern imposes restrictions on the number of digits in the whole part, mantissa, or exponent. For example, if a pattern requires a fixed number of digits for the mantissa or exponent, it may not accurately represent very large or very small numbers, potentially leading to a loss of information. Additionally, rounding or truncating digits to fit the pattern can result in a loss of precision. To avoid such loss of precision, it's important to choose a scientific notation format that accommodates the specific range and precision requirements of the numbers you are working with.                                               <!-- response -->

1. What is an exception?
   * An exception in programming is an abnormal or unexpected event or condition that occurs during the execution of a program and disrupts its normal flow. It typically signals an error or exceptional circumstance that needs to be handled, allowing the program to gracefully recover or terminate with appropriate actions, such as displaying an error message or taking corrective measures. Exception handling is a fundamental concept in programming to ensure robust and reliable software behavior.                                               <!-- response -->



---
### Appendix:
* Example additions of 961 + 921 and 7236 + 4216 are provided as a template
* Note that it is not possible to add 7236 and 4216 together with the space provided.

#### Addition of 961 + 921 
* Template:
   ```
     xxx0  (Carry Row)
     xxxx  (Augend Row)
   + xxxx  (Addend Row)
   ------
     xxxx  (Sum Row)

   Final Answer: xxxx
   ```
* response:
   ```
     1000
     0961
   + 0921
   ------
     1882 

   Final Answer: 1882
   ```

#### Addition of 7236 + 4216 
* Template:
   ```
     xxx0 (Carry Row)
     xxxx (Augend Row)
   + xxxx (Addend Row)
   ------ 
     xxxx (Sum Row)

   Final Answer: 1882
   ```
* response:
   ```
     0010
     7236
   + 4216
   ------
     1452 

   Final Answer: overflow 
   # Note the sum is 11,452, but this number overflowed the space provided.
   ```


 
