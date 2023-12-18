           .data
buffer:    .space 256

           .text
           .include "macros/subroutine.s"
           .include "macros/syscalls.s"
           .include "macros/stack.s"
           .globl nextInt
           .globl glyph2int

            #   $a1 radix
            #   $a0 glyph
            #   $a2 digit_value

            #   $t0 counter
            #   $t1 buffer_length
            #   $t2 digit
            #   $t3 256
            #   $t4 buffer
 
            #   $v0 result

                                                                    # public static int glyph2int(char glyph, int radix){
glyph2int:                                                          #     ;    
                blt  $a1, 10, glyph2int_else                        #     if (radix >= 10) {
glyph2int_hex:                                                      #         ;
                sub $a1, $a1, 11                                    #         radix -= 11;
                add $a1, $a1, 'A'                                   #         radix += 'A';
                j glyph2int_if                                      #     }
                                                                    #     else {
glyph2int_else:                                                     #         ;                                                
                add $a1, $a1, '0'                                   #         radix += '0'; 
                                                                    #     }
                                                                    # 
glyph2int_if:                                                       #     ;
                blt $a0, '0', glyph2int_check2                         #     if (glyph >= '0') {
                    bgt $a0, '9', glyph2int_check2                     #         if (glyph <= '9') {
                        bgt $a0, $a1, glyph2int_check2              #             if (glyph <= radix) {

                            sub $a0, $a0, '0'                       #                 glyph -= '0';
                            move $v0, $a0
                            jr $ra                                  #                 return glyph;
                                                                    #             }
                                                                    #         }
glyph2int_check2:                                                                    #     }
                bgt $a0, 'F', glyph2int_not                         #     if (glyph <= 'F') {
                    blt $a0, 'A', glyph2int_not                     #         if (glyph >= 'A') {
                        bgt $a0, $a1, glyph2int_not              #             if (glyph <= radix) {

                                                   #                ;
                            add $a0, $a0, 10                        #                 glyph += 10;
                            sub $a0, $a0, 'A'                       #                 glyph -= 'A';
                            move $v0, $a0
                            jr $ra                                  #                 return glyph;
                                                                    #             }
                                                                    #         }
                                                                    #     }
                                                                
glyph2int_not:                                                      #     ;              
                li $a0, -1                                          #     return -1;
                move $v0, $a0
                jr $ra                                              # 
                                                                    # }
                                                        
                                                        
                                                                    # static char [] buffer = new char[256];
                                                                    # 
                                                                    # public static int nextInt(int radix){
nextInt:                                                            #     ;   
                move $a3, $a0 
                                                                    #     int buffer_length;
                li $t3, 256                                         #
                la $t4, buffer 
                read_s($t4, $t3)                                    #     mips.read_s(buffer, 256);
                move $t1, $v0                                       #     buffer_length = mips.retval();
                                                                    # 
                li $t5, 0                                           #     int result = 0;
                li $t0, 0                                           #     int counter = 0;
                                                                    #     char digit;
                                                                    #     int digit_value;
                                                                    #
nextInt_loop:                                                                     
                bge $t0, $t1, nextInt_done                          #     while (counter < buffer_length) {
                                                       #         ;                  
                    lb $t2, 0($t4)                                  #         digit = buffer[counter];
                    add $t0, $t0, 1                                #         counter += 1;
                                                                    #
                    call glyph2int $t2 $a3                          #         digit_value = glyph2int(digit, radix);
                    move $a2, $v0                                   # 
                    beq $a2, -1, nextInt_done                            #         if (digit_value != -1) {

nextInt_if:                                                         #             ;
                        mul $t5, $t5, $a3                           #             result = result * radix;
                        add $t5, $t5, $a2                           #             result = result + digit_value;
                        add $t4, $t4, 1
                        j nextInt_loop
                                                                    #         } 
                                                                    #     }
nextInt_done:                                                       #     ;
                    move $v0, $t5
                    jr $ra                                          #     return result;  
                                                                    # }// Task 4  complete: Fri Nov 10 22:12:45 PST 2023
