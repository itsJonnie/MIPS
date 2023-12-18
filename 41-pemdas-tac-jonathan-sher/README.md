[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/aHiTCHuq)
# PEMDAS-TAC
Converting Mathematical Equations into Three Address Code

## Overview

In this programming assignment, you are to write three Java methods and three corresponding MIPS subroutines. Each of these set of methods/subroutines evaluate one of the following three mathematical expressions:

  1. Description: Compute the volume of a cube.
     - Filenames: volume_cube.j, volume_cube.s
     - Method: public static int volume_cube(int s);
     - Equation:
       ```
       V = s^3
       where
          s = length/width/height of the cube
       ```

  1. Description: Compute the surface area of a box.
     - Filenames: surface_area_box.j, surface_area_box.s
     - Method: public static int surface_area_box(int l, int w, int h);
     - Equation:
       ```
       S = 2(l * w) + 2(l * h) + 2(w * h)
       where
          l = length of the box
          w = width of the box
          h = height of the box
       ```

  1. Description:  Compute the future value of an investment.
     - Filenames: future_value.j, future_value.s
     - Method: public static int future_value(int I, int R, int T);
     - Equation:
       ```
       FV = I * ( 100 + (R * T)) / 100
       where
         I = Investment amount in pennies
         R = Interest rate in the whole amount, i.e., 3% == 3
         T = Number of years
       ```        


## General Process for Each Equation
   1. Create a java subroutine that computes the equation.
      - Validate your method using `java_subroutine`


   1. Rewrite your java program to follow the TAC convention
      - rename your input parameters to be `$a0`, `$a1`, `$a2`, `$a3` (as needed)
      - use PEMDAS to break down your equations into a series of equations
        - you are limited to the temporary variables:  `$t0`, `$t1`, ... `$t9`
        - you are limited to instructions of the following form:
          *  variable = literal;
          *  variable = variable;
          *  variable = variable op variable;
          *  variable = variable op variable;
      - Validate your method using `java_subroutine`
      - E.g., The final value of $v0 must be 64
        ```bash
        java_subroutine volume_cube 4
        ```

   1. Create a MIPS subroutine via transliteration that computes the equation
      - You _must_ follow the process provided in class
      - The list of TAC -> MIPS code transliteration that you are allow to use is provided below
      - Validate your subroutine via `mips_subroutine` 
      - E.g., The final value of $v0 must be 64
        ```bash
        mips_subroutine volume_cube 4
        ```

## List of Deliverables:

You repository must contain the following files:
   1. README.md:  provided by the Professor
   1. Makefile:   provided by the Professor
   1. volume_cube.j:  template provided by the Professor
   1. volume_cube.s:  template provided by the Professor
   1. surface_area_box.j: empty file, with updates from the student
   1. surface_area_box.s: empty file, with updates from the students
   1. future_value.j: student created
   1. future_value.s: student created
   1. validation.output: an auto-generated file from running `make validate`

## Requirements:
   1. You *MUST* follow the process provided by the professor pedantically 
   1. Your MIPS code (blah.s) must
      - contain your TAC Java code as comments 
      - the TAC Java code must be provided line-by-line to the right of your MIPS instructions
      - be formatted for readability
      - contain a bookkeeping map of all use variables
   1. You must run the command `make validate` just prior to your final submission


## Validation and Final Submission
Prior to your final submission to the repository, run the `make` command to test programs.
The output should be as follows:

   ```bash
   $ make
   java_subroutine volume_cube 3
   #########################################
   # Above is the output from your program
   #########################################
   
   v0:         27; 0x00 00 00 1B; 0b0000 0000 0000 0000 0000 0000 0001 1011;
   
   mips_subroutine volume_cube 3
   #########################################
   # Above is the output from your program
   #########################################
   
   v0:         27; 0x00 00 00 1B; 0b0000 0000 0000 0000 0000 0000 0001 1011;
   
   java_subroutine surface_area_box 3 3 3
   #########################################
   # Above is the output from your program
   #########################################
   
   v0:         54; 0x00 00 00 36; 0b0000 0000 0000 0000 0000 0000 0011 0110;
   
   mips_subroutine surface_area_box 3 3 3
   #########################################
   # Above is the output from your program
   #########################################
   
   v0:         54; 0x00 00 00 36; 0b0000 0000 0000 0000 0000 0000 0011 0110;
   
   java_subroutine future_value 100000 3 1
   #########################################
   # Above is the output from your program
   #########################################
   
   v0:     103000; 0x00 01 92 58; 0b0000 0000 0000 0001 1001 0010 0101 1000;
   
   mips_subroutine future_value 100000 3 1
   #########################################
   # Above is the output from your program
   #########################################

   v0:     103000; 0x00 01 92 58; 0b0000 0000 0000 0001 1001 0010 0101 1000;

   ```

If all is working correctly, you can now run the command `make validate`.  This command will create a file called `validation.output`.  Moreover, this file will automatically be added to your local repository.


Summary of steps for final submission:

  ```bash
  make
  make validate
  git commit -m 'Final Submission'      
  ```

You may RESUBMIT your work any number of times prior to the due date.



## Three Address Code to MIPS Transliteration
   - Java Instructions with two variables: `x = a <op> b;`
     - `MIPS <op>  <- Java operator`
       * add: +, sub: -, or: |, and: &, xor: ^,

      | TAC Equations                 | MIPS Instructions         |   
      |-------------------------------|---------------------------|
      | `return a`                    | `move $v0, a`             |
      |                               | `jr $ra`                  |
      |                               |                           |

      | TAC Equations                 | MIPS Instructions         |
      |-------------------------------|---------------------------|
      | `;`                           | `nop`                     |
      | `x = imm;`                    | `li x, imm`               |
      | `x = - a`                     | `sub  x, $zero, a`        |
      | `x = a;`                      | `move x, a`               |
      | `x = a <op> b;`               | `<op> x, a, b`            |
      | `x = ~ a`                     | `nor x, a, $zero`         |


      | TAC Mult / Div Equations      | MIPS Instruction          |
      |-------------------------------|---------------------------|
      | `x = a * b;`                  | `mult a, b`               |
      |                               | `mflo x`                  |
      |                               |                           |
      | `x = a / b;`                  | `div a, b`                |
      |                               | `mflo x`                  |
      |                               |                           |
      | `x = a % b;`                  | `div a, b`                |
      |                               | `mfhi x`                  |
      |                               |                           |

