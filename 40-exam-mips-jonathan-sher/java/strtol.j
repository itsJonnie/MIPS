// Jonathan Sher - strtol.j
public static int strtol(char[] buffer, int radix){ // radix = base
    int digit;
    int value;
    int index;

    value = 0;

    for(index = 0; buffer[index] != '\0'; index++){
        digit = glyph2int(buffer[index], radix);

        // If digit is invalid then exit the loop
        if(digit == -1) break;   
         
        value = value * radix; 
        value = value + digit;
    }  
 
    return value;

}


public static int glyph2int(char c, int radix){
    int value;
    value = -1;

    if('0' <= c && c <= '9'){
        value = c - '0';
    }
    if('a' <= c && c <= 'f'){
        value = c - 'a' + 10;
    }
    if('A' <= c && c <= 'F'){
        value = c - 'A' + 10;
    }

    // Checks if the radix is less then 10 to not convert letter glyphs
    if(value >= radix){
        value = -1;
    }

    return value;

}
