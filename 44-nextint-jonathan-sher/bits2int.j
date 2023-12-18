public static int get_bit() {
    int zero;
    int one;
    int value;

    zero = '0';
    one = '1';
    value = -1;

    mips.read_c();
    char c = (char) mips.retval();

// init    ;
    if (c == zero){
// cons1:  ;
        return 0;
// cons2:  ;
    } else if(c == one){
        return 1;
// alt:    ;
    } else{
        return -1;
    }
}
public static int bits2int(){
    int $r0; // This will hold the final integer value
    int $t0; // This will store the current bit

    
    $r0 = 0; 
        
// wloop:  ;
    while (($t0 = get_bit()) != -1) { // Read bits until get_bit() returns -1
// body:   ;
            $r0 = ($r0 << 1) | $t0; // Shift $r0 left by 1 and add the bit
    }
    
// done:   ;
    return $r0; // Return the final integer value
}

    
