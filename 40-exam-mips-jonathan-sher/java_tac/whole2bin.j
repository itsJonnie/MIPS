// Jonathan Sher - whole2bin.j
public static int whole2bin(int whole){
    int number = whole;
    int bit;
    int _1 = 1;
    int _2 = 2;


loop:   while (number != 0) {
body:       mips.push( number % _2 );
        number = number / _2;
    }
end:    ;

loop2:  while(number != whole){
body2:      bit = mips.pop();
        mips.print_d(bit);
        number = number << _1;
        number = bit + number; 
    }
end2:   ;

    return number;
}   
