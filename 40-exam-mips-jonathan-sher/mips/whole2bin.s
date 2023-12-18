        .text
        .include "macros/syscalls.s"
        .include "macros/stack.s"

        .globl whole2bin

        # $a0: whole
        # $t0: number 
        # $t1: bit
        # $t2: _1
        # $t3: _2
        # $t4: reminder
        # $t5: temp

whole2bin: nop                      # public static int whole2bin(int whole){

        push_s_registers()          # Save S registers
        move $t0, $a0               # int number = whole;
        move $t5, $a0  #temp        # Demarshal input arguments
        li $t1, 0                   # int bit;
        li $t2, 1                   # int _1 = 1;
        li $t3, 2                   # int _2 = 2;
        li $t4, 0 
    
loop:   beq $t0, $zero, end         # while (number != 0) {
body:       div $t0, $t3    
            mfhi $t4   #reminder    #     mips.push( number % 2 );
            push $t4        
            div $t0, $t3            #     number = number / 2;
            mflo $t0                # }
        b loop

end:    nop                         # ;

loop2:  beq $t0, $t5, end2          # while(number != whole){
body2:      pop $t1                 #     bit = mips.pop();
            print_d($t1)            #     mips.print_d(bit);
            sllv $t0, $t0, $t2      #     number = number << 1;
            add $t0, $t1, $t0       #     number = bit + number; 
        b loop2                     # }

end2:   nop                         # ;
        move $v0, $t0               # return number;
        pop_s_registers()           # Restore S registers  
        jr $ra                      # }