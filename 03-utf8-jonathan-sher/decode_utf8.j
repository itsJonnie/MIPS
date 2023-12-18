public static int decode_utf8(){

    int first;
    int value;
    int prefix;
    int next;

    value = -1;

    mips.read_x();
    first = mips.retval();

    prefix = first & 0x80;    //0b0xxx xxxx
    
    if (prefix == 0x00){
        // Assume one byte sequence 
    return first;
    } 

    // I have a multi-byte sequence
    prefix = first & 0xE0;  //0b110 x xxxx
    if (prefix == 0xC0){
        
        first = first & 0x3F //0b110x xxxx

        // two byte sequence;
        mips.read_x();
        next = mips.retval();

        // validate framing bits
        // insert code here

        first = first & 0x3F;      //0b11xx xxxx
        next = next & 0x3F;  //0b10 xx xxxx
        value = (first << 6) | next;
        return value;
    }

    // I have a multi-byte sequence
    prefix = first & 0xF0;  // 0b1110  xxxx
    if (prefix == 0xE0){
        // three byte sequence;
        return 3;
    }

    // I have a multi-byte sequence
    prefix = first & 0xF8;  //0b1111 0xxx
    if (prefix == 0xF0){
        // four byte sequence;
        return 4;
    }

    return value;
}