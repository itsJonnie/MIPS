        .text
        .include "macros/syscalls.s"
        .include "macros/stack.s"


        .globl fractional2bin

       
        # $t0: fractional
        # $t1: max_bits
        # $t4: max
        # $t3: number
        # $t5: 


fractional2bin: nop                         #  public static int fractional2bin(int fractional, int max_bits){
            push_s_registers() 
            move $t0, $a0                   # Marshal input arguments
            move $t1, $a1 

            li $t5, 1                       # int _1 = 1;
            
            push($gp, $sp, $fp, $ra)        # Save special registers
            push_t_registers()              # Save T registers
            move $a0, $t0                   # Marshal arg
            jal value_of_max                # int max = value_of_max(fractional);
            pop_t_registers()               # Restore T registers
            pop($gp, $sp, $fp, $ra)         # Restore special registers

            move $t4, $v0                
            move $t3, $t0                   #  int number = fractional;

initLoop:   beq $t3, $zero, done            #     while ( number != 0 ) {
if1:            nop                         #       ;
                beq $t1, $zero, done        #       if(max_bits == 0) break;
cons1:          nop                         #       ;                
                    mul $t3, $t3, 2         #           number = number * 2; 
if2:            nop                         #       ;
                blt $t3, $t4, alt           #       if (number >= max ) {
cons2:          nop                         #       ;                  
                    print_d($t5)            #           mips.print_d(1);
                    sub $t3, $t3, $t4       #           number = number - max;
                    b next                  #           // go to next;
                                            #       } else {
alt:            nop                         #       ;                   
                    print_d($zero)          #           mips.print_d(0);
                    b next                  #           // go to next;
                                            #        }
next:                                       #       ;                                            
                  sub $t1, $t1, 1           #           max_bits = max_bits - 1; 
                                            #               
                  b initLoop                #    }
done:       nop                             #    ;            
            # Marshal return value          #            
            move $v0, $t3                   #     return number;
            pop_s_registers()               #
            jr $ra                          #
                                            #  }
                                            #
 
       .globl value_of_max
        
value_of_max: nop               # public static int value_of_max(int number) {
        # t0: number
        # t1: max               # int max;
        # t2: i                 # int i;
        # s0: 8                 # int _8;
        # s1: 10                # int _10;
      
        push_s_registers()      # Save S registers
        move $t0, $a0           # Demarshal input arguments
      
        li $t1, 10              # max = 10;
        li $t2, 0               # i=0;
        li $s0, 8               # _8 = 8;
        li $s1, 10              # _10 = 10;
      
loop2:  blt $t0, $t1, done2     # for (; number >= max ;) {
if3:       nop                  #   ;
           bgt $t2, $s0, loop2  #   if( i > _8) break loop2;
cons3:     nop                  #   ;
             mul $t1, $t1, $s1  #     max = max * _10;
             addi $t2, $t2, 1   #     i++;
             b loop2            #     continue loop2;
                                # }
done2:  nop                     # ;
        move $v0, $t1           # return max;
        pop_s_registers()       # Marshal output value
        jr $ra                  # Restore S registers                          
                                # }