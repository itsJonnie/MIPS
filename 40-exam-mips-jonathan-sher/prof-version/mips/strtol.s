        .text
        .include "macros/syscalls.s"
        .include "macros/stack.s"

        .globl strtol
        .globl glyph2int


strtol: nop                                     # public static int strtol(char[] buffer, int radix){ 
            # $t2: digit                        # int digit;
            # $t3: value                        # int value;
            # $t4: index                        # int index;
            # $t5: -1                           # int negativeOne = -1;
            push_s_registers                    # Save S registers
            move $t0, $a0                       # Marshal input arguments
            move $t1, $a1
            li $t5, -1 
            li $t3, 0                           # value = 0;
        
init:       nop                                 # ;  
            lb $t4, 0($t0)                      # index = 0; 
forLoops:   beq $t4, $zero, done2               # for(; buffer[index] != '\0';){
body:           nop                             #     ; 
            push($gp, $sp, $fp, $ra)            # Save special registers
            push_t_registers()                  # Save T Registers
    
            move $a0, $t4
            move $a1, $t1
                jal glyph2int                   #     digit = glyph2int(buffer[index], radix);
            pop_t_registers()                   # Restore T Registers
            pop($gp, $sp, $fp, $ra)             # Restore special registers
            move $t2,$v0                        # Demarshal return value

                                                #      // If digit is invalid then exit the loop
initIf:         nop                             #      ;
                beq $t2, $t5, done2             #      if(digit == -1) break;           
cons:               nop                         #        ;               
                    mul $t3, $t3, $t1           #        value = value * radix; 
                    add $t3, $t3, $t2           #        value = value + digit;
                                                      
next:               nop                         #        ; 
                    addi $t0, $t0, 1            #        ++;
                         
                    lb $t4, 0($t0)              #        digit = glyph2int(buffer[index], radix);
                    b forLoops                  #        // continue forloops;
                                                # }  
done2:      nop                                 #      ; 
            # Marshal return value              
            pop_s_registers                     #       return value;
            move $v0, $t3                       # 
            jr $ra                              # }


glyph2int:      nop                             #   public static int glyph2int(char c, int radix) {
                push_s_registers   
                move $t0, $a0                   #   $t0 = c
                move $t1, $a1                   #   $t1 = radix          
                li $t2, -1                      #   value = -1;
                 
                                                #   // between 0 to 9
init1:          nop                             #   ;
                blt $t0, '0', init2             #   if ('0' <= c) {
                    bgt $t0, '9', init2         #       if (c <= '9') { 
                        subi $t2, $t0, '0'      #           value = c - '0'; 
                        b init3                 #       }
                                                #   }

                                                #   // between a to f 
init2:          nop                             #   ;        
                blt $t0, 'a', init3             #   if ('a' <= c) {
                    bgt $t0, 'z', init3         #       if (c <= 'z') { 
                        subi $t2, $t0, 'a'      #           value = c - 'a';                                        
                        addi $t2, $t2, 10       #           value = value + 10;
                        b init3                 #       }
                                                #   
                                                #   }

                                                #   // between A to F
init3:          nop                             #   ;
                blt $t0, 'A', testing           #   if ('A' <= c) { 
                    bgt $t0, 'Z', testing       #       if (c <= 'Z') { 
                        subi $t2, $t0, 'A'      #           value  = c - 'A';                                 
                        addi $t2, $t2, 10       #           value  = value + 10;
                                                #       }
                                                #   }

                                                #   // Checks if the radix is less then 10 to not convert letter glyphs
testing:        nop                             #   ;            
                blt $t2, $t1, done              #   if (value >= radix){ // Outside of base check
                    li $t2, -1                  #       value = -1;
                                                #   
                                                #   }
done:           nop                             #   ;            
                # Marshal return value                                
                move $v0, $t2                   #   return value;
                pop_s_registers                 #
                jr $ra                          #   }