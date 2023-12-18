# FILE: encode_binary32.j
# Description:
#   This file provides the code to convert a binary number presented in 
#   Scientific Notation into binary32 format.  The binary32 format is as follows:
#
#     binary_32:   |  s  | eeee eeee | mmm mmmm mmmm mmmm mmmm mmmm |
#                  | <1> | <-  8  -> | <-          23            -> |
#
#     the sign bit is placed into position 32
#     the biassed exponent (8 bits) is placed into positions: 31 .. 24
#     the mantissa is left-justified (within it's 23-bit field),
#       and is placed in positions: 23 .. 1          
#
#  Given a the following binary number (as an example):
#      2# + 1.1 0100 1110 0001 x 2^ - 101
#
#  The input for the to sub routine is as follows:
#
#     sign    coefficient       expon_sign   exponent
#      '+'    2#11010011100001  '-'          2#101
#
#  Note: the coefficient is represented in fix-point notation in which the radix
#        point is always located immediately to the right of the msb.

                .text
                .globl encode_binary32
                .include "macros/syscalls.s"
                .include "macros/subroutine.s"
                .include "macros/stack.s"


                # The following is test input to help you in your initial debugging
                # When running this file via MARS.

                li $a0, '+'    # 0x2b (43)
                li $a1, 0x34E1 # (0011 0100 1110 0001) 
                li $a2, '-'    # 0x2d   (45)
                li $a3, 0x29   # (41)
                jal encode_binary32
                exit()

                # Use mips_subroutine to perform additional testing


                .macro call( %sub, %arg)
                  save_state()
                  push($a0)
                  move $a0, %arg
                  jal %sub
                  pop($a0)
                  restore_state()
                .end_macro

encode_binary32: nop
                # Prototype:  encode_binary32( sign, coefficient, expon_sign, expon )
                # Formal Parameters:
                # a0: sign -- an ASCII character
                # a1: coefficient (representing, in total,:  1.\<mantissa\>) 
                # a2: expon_sign -- an ASCII character
                # a3: exponent (unbiased)
                # v0: encoding -- the encoded binary32 value
        
                # Initial Register Allocation
                # t0: sign
                # t1: coefficient
                # t2: expon_sign
                # t3: exponent

                # Additional Register Allocation
                # t4: encoded_sign
                # t5: encoded_mantissa
                # t6: encoded_exponent;
                # t7: position -- the location of the msb of the coefficient
                # t8: coeeficient_shift
                # t9: negative_sign

                # The following do not get registers since they are all immediates
                #    used with the shift operations.  They are provide here for 
                #    as assemble literals:

                .eqv bias 127                   #  final int bias           = 127;  // As defined by the spec
                .eqv sign_shift 31              #  final int sign_shift     =  31;  //   << (8 + 23 )
                .eqv expon_shift 23             #  final int expon_shift    =  23;  //   << (23)
                .eqv mantissa_shift  9          #  final int mantissa_shift =   9;  //  >>> (1 + 8)  // the mantissa is left-justified
                                                #  final int $zero          =   0;  


                # Demarshal your input arguments
                move $t0, $a0
                move $t1, $a1
                move $t2, $a2
                move $t3, $a3

                #/////////////////////////////////////////////////////////
                #// BEGIN CODE of INTEREST
                #/////////////////////////////////////////////////////////


                                      #public static int encode_binary32(int sign, int coefficient, int expon_sign, int exponent){
                                      #          // $a0 : sign
                                      #          // $a1 : coefficient
                                      #          // $a2 : expon_sign
                                      #          // $a3 : exponent
                                      #          
     li $t4, 0                        #          
     li $t5, 0                        #          
     li $t6, 0                        #          
     li $t7, 0                        #          
     li $t9, 0                        #      
     li $t8, 0                        #           
                                      #
                                      #          final int bias              = 127;  // As defined by the spec
                                      #          final int sign_shift        = 31;   // << (8 + 23 )
                                      #          final int expon_shift       = 23;   // << (23)
                                      #          final int mantissa_shift    = 9;    // >>> (1 + 8) the mantissa is left-justified
                                      #
                                      #          /////////////////////////////////////////////////////////
                                      #          // BEGIN CODE of INTEREST
                                      #          /////////////////////////////////////////////////////////
                                      #
      li $t9, '-'                     #          negative_sign = '-';     // Define the value
                                      #
                                      #          /////////////////////////////////////////////////////////
                                      #          // 1. Encode each of the three fields of the floating point format:
                                      # 
                                      #          // 1.1 Sign Encoding (encoded_sign = )
                                      #          //     - Based upon the sign, encode the sign as a binary value
init1:  nop                           #init:     ;
if1:    bne $a0, $t9, else1           #          if(sign == negative_sign) {
cons1:  nop                           #cons:       ;
        li $t4, 1                     #            encoded_sign = 1;
        b done1                        #            // goto done;
                                      #          } else{   
else1:  nop                           #alt:        ;
        li $t4, 0                     #            encoded_sign = 0;
                                      #            // goto done;            
                                      #          }
done1:  nop                           #done:     ;     
                                      #
                                      #          // 1.2 Exponent Encoding: (encoded_expon = )
                                      #          //     - Make the exponent a signed quantity
                                      #          //     - Add the bias
init2:  nop                           #init:     ;
if2:    bne $t2, $t9, else2           #          if(expon_sign == negative_sign) {
cons2:  nop                           #cons:       ; 
        sub $t3, $zero, $t3           #            exponent = 0 - exponent; 
        b done2                       #            // goto done;    
                                      #          } else{
else2:  nop                           #alt:          ;
        add $t3, $zero, $t3           #              exponent = 0 + exponent;
                                      #            // goto done
done2:  nop                           #done:      ;      
        addi $t6, $t3, bias           #            encoded_exponent = exponent + bias;
                                      #            
                                      #    // 1.3  Mantissa Encoding (encoded_mantissa = )
                                      #    //      - Determine the number of bits in the coefficient
                                      #    //      - that is to say, find the position of the most-significant bit
                                      #    //      - Shift the coefficient to the left to obtain the mantissa
                                      #    //      - the whole number is now removed, and
        call pos_msb $t1              #    //      - the mantissa (which is a fractional value) is left-justified
        move $t7, $v0                 #    position = pos_msb(coefficient);
        li $t9, 32                    #    coefficient_shift = (32 - position);
        subu $t8, $t9, $t7            #
        addi $t8, $t8, 1              #    coefficient_shift = coefficient_shift + 1; 
        sllv $t5, $t1, $t8            #    encoded_mantissa = coefficient << coefficient_shift; 
                                      #
                                      #    /////////////////////////////////////////////////////////
                                      #    // 2. Shift the pieces into place: sign, exponent, mantissa
        sll $t4, $t4, sign_shift      #            encoded_sign     = encoded_sign << sign_shift;
        sll $t6, $t6, expon_shift     #            encoded_exponent = encoded_exponent << expon_shift;
        srl $t5, $t5, mantissa_shift  #            encoded_mantissa = encoded_mantissa >>> mantissa_shift;
                                      #            
                                      #            /////////////////////////////////////////////////////////
                                      #            // 3. Merge the pieces together
                                      #            //myfinalline
        or $v0, $t4, $t6              #            encoding = encoded_sign | encoded_exponent;
        or $v0, $v0, $t5              #            encoding = encoding | encoded_mantissa; 
                                      #
        move $v0, $v0                 #            return encoding;
        jr $ra                        #  }
        

#/////////////////////////////////////////////////////////
#// END CODE of INTEREST
#/////////////////////////////////////////////////////////



pos_msb:  nop                           # int pos_msb(int number)
        # a0:  number
        # v0:  counter -- return value
        # t0:  number

        # Demarshal your input arguments
        move $t0, $a0                   

        li $v0, 0                       # counter = 0;
init:   nop                             # init:  ;
loop:   beq $t0, $zero, done            # loop:  for(; number != zero ;) {
body:     nop                           # body:     ;
          addi $v0, $v0, 1              #           counter ++;
          srl $t0, $t0, 1               #           number = number >> 1;
        b loop                          #           contine loop;
                                        #        }
done:   nop                             # done:  nop
        move $v0, $v0                   #        return counter;
        jr $ra


# Task 3 complete: Tue Oct 24 16:16:58 PDT 2023
