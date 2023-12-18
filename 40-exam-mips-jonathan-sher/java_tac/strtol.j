// Jonathan Sher - strtol.j
public static int strtol(char[] buffer, int radix){ 

    int digit;
    int value;
    int index;
    int negativeOne = -1;

    value = 0;

init:       ;  
    index = 0;  
forLoops:   for(; buffer[index] != '\0';){
body:           ;    
        digit = glyph2int(buffer[index], radix);
    
        // exit the loop if digit is invalid
initIf:         ;
        if(digit == negativeOne) break;   
cons:           ;               
        value = value * radix; 
        value = value + digit;

next:           ; 
        index++;
        digit = glyph2int(buffer[index], radix);
        // continue;
    }   
done2:          ; 
        return value;

    }


    public static int glyph2int(char c, int radix){

    int value = -1;


    // between 0 to 9
init1:      ;                
    if('0' <= c ){
        if ( c <= '9'){
cons1:      ;        
            value = c - '0';
        }
    }
end1:       ;

    // between a to f 
init2:      ;
    if('a' <= c){  
        if( c <= 'f'){
cons2:      ;
           value = c - 'a';
           value = value + 10;
        } 
    }
end2:       ;

    // between A to F
init3:      ;
    if('A' <= c ){               
        if ( c <= 'F'){
cons3:      ;
            value = c - 'A';
            value = value + 10;
        }
    }
end3:       ;
    
    // Checks if radix < 10 
testing:    ;
    if(value >= radix){
cons4:      ;
    value = -1;
    }

done:       ;     
    return value;

}
