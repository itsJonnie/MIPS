// Jonathan Sher - fractional2bin.j
public static int fractional2bin(int fractional, int max_bits){

    int _1 = 1;
    int max = value_of_max(fractional);
    int number = fractional;


initLoop:    while ( number != 0 ) {
if1:            ;
        if(max_bits == 0) break;
cons1:          ;                
        number = number * 2; 
if2:            ;
        if (number >= max ) {
cons2:          ;                  
          mips.print_d(_1);
          number = number - max;
          // go to next;
        } else {
alt:            ;                   
          mips.print_d(0);
          // go to next;
        }
next:           ;
        max_bits = max_bits - 1; 
    }
done:       ;            
    
      return number;

    }


    public static int value_of_max(int number) {

    int _8;
    int _10;

    int max;
    int i;

    _8  =  8;
    _10 = 10;

    max = 10;
    i   =  0;

loop2:      for (; number >= max ;) {
if3:          ;
      if( i > _8) break loop2;
cons3:        ;
        max = max * _10;
        i++;
        continue loop2;
    }
done2:        ;
      return max;
    }
