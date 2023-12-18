// FILE: encode_utf8.j
// Description:
  

public static int encode_utf8(){
        
        int value; // orignal unicode character

        int byte1;
        int byte2;
        int byte3;

        mips.read_x();
        value = mips.retval();

        p = pos_msb(value);

        if (p <= 21) {
                l = 21;
                b = 4;
        }
        if (p <= 16) {
                l = 16;
                b = 3;
        }

        byte1 = value & 0x3F; //continuation
        byte1 = 0x80 | byte1;

        byte2 =  (value >>> 6) & 0x3F; //continuation
        byte2 = 0x80 | byte1;

        byte3 = (value >>> 12) & 0x0F; // first byte
        byte3 = 0xE0 | byte3;

        mips.print_x(byte3);
        mips.print_x(byte2);
        mips.print_x(byte1);
        mips.print_ci('\n');
        return 3;
        }
        if (p <= 11) {
                l = 11;
                b = 2;
        }
        if (p <= 7) {
                l = 7;
                b = 1;
        }
        
        return b;
}
        
        
        

        mips.print_x(value);
        mips.print_ci('\n');
        mips.print_d(value);
        mips.print_ci('\n');

        return 0;
}  



  static int pos_msb(int number){
          // $a0 : number
          int counter;      // : counter: the return value

          counter = 0;
  init:   ;
  loop:   for(; number != 0 ;) {
  body:     ;
            counter ++;
            number = number >>> 1;
            continue loop;
          }
  done:   ;
          return counter;
  }
