.text   
.include "macros/syscalls.s"                
.globl checksum                                 

checksum:
    # Initialize variables
    li $t0, 255                                 # int max_int = 255;          
    li $t1, 0                                   # int sum = 0;
    li $t2, 0                                   # int header_checksum = 0;
    li $t3, 0                                   # int checksum = 0;
    li $t4, 0                                   # int temp = 0; 
    li $t5, 256                                 # int t5 = 256;
    li $t6, 0                                   # int quotient = 0;
    li $t7, 0                                   # int remainder = 0;
    li $t8, 0                                   # int value = 0;
    li $t9, 0                                   # int i = 0;
    li $v0, 0                                   # int $v0 = 0;
    li $a0, 10                                  # int $a0 = 10;
    li $a1, 5                                   # int $a1 = 5;

init:   nop                                     # ;
        li $t9, 0                               # $t9 = 0;
loop:   bge $t9, $a0, done                      # for(;$t9 < $a0;){ 
body:   nop                                     # ;                                   
        read_d()                                # mips.read_d();
        move $t8, $v0                           # $t8 = mips.retval();
if:     bne $t9, $a1, else                      # if($t9 == $a1){ 
cons:   nop                                     # ;    
        move $t2, $t8                           # $t2 = $t8; 
        b exit                                  #go to done
                                                # }else{ 
else:   nop                                     # ;    
        add $t1, $t1, $t8                       # $t1 = $t1 + $t8; 
                                                # }
exit:   nop                                     # ;
        addi $t9, $t9, 1                        # $t9++ 
        b loop                                  #continue loop;
                                                # } 
done:   nop                                     # ;
        div $t1, $t5                            # $t1 / $t5;             
        mflo $t6                                # $t6 =  $t1 / $t5;
        mfhi $t7                                # $t7 = $t1 % $t5;
        add $t4, $t6, $t7                       # $t4 = $t6 + $t7;
        sub $t3, $t0, $t4                       # $t3 = $t0 - $t4; 

        bne $t2, $t3, else2                     # if ($t2 == $t3){
if2:    nop                                     # ;
        li $v0, 0                               # return $v0;
        jr $ra                                  # } else{                                         
else2:  nop                                     # ;        
        move $v0, $t3                           # return $t3;
        jr $ra                                  # } 


# Task 3 complete: Thu Oct 12 22:02:21 PDT 2023

# Task 3 complete: Thu Oct 12 22:13:22 PDT 2023

# Task 3 complete: Thu Oct 12 22:33:20 PDT 2023
