public static int checksum() {
    // Defining variables
    int $t0;      // final int max_int;
    int $t1;      // int sum;
    int $t2;      // int header_checksum;
    int $t3;      // int quotient;
    int $t4;      // int remainder;
    int $t5;      // int calculatedChecksum;
    int $t6;      // int num;
    int $t7;      // max_int + 1 (divisor);
    int $t8;      // quotient + remainder;
    int $t9;      // loop variable;
    int $v0;      // return value;

    // Initializing variables
    $t0 = 255;    // max_int = 255;
    $t1 = 0;      // sum = 0;
    $t2 = 0;      // header_checksum = 0;
    $t7 = 256;    // num = 0;

    // Loop to read integers and calculate the sum
    for($t9 = 0; $t9 < 10; $t9++) {  // for(int i = 0; i < 10; i++) {
        mips.read_d();              // mips.read_d();
        $t6 = mips.retval();        // num = mips.retval();
        
        if($t9 == 5) {              // if(i == 5) {
            $t2 = $t6;              //     header_checksum = num;
        } else {                    // } else {
            $t1 = $t1 + $t6;        //     sum += num;
        }
    }

    // Compute quotient and remainder
    $t3 = $t1 / $t7;             // quotient = sum / (max_int + 1);
    $t4 = $t1 % $t7;             // remainder = sum % (max_int + 1); 

    // Compute the checksum
    $t8 = $t3 + $t4; 
    $t5 = $t0 - $t8;             // calculatedChecksum = max_int - (quotient + remainder);

    // Compare header_checksum with calculatedChecksum and return the result
    if($t2 == $t5) {             // if(header_checksum == calculatedChecksum) {
        return 0;                //     return 0;
    } else {
        return $t5;              //     return calculatedChecksum;
    }
}


// Task 1 complete: Thu Oct 12 00:01:13 PDT 2023

// Task 2 complete: Thu Oct 12 17:16:06 PDT 2023

// Task 1 complete: Thu Oct 12 22:32:14 PDT 2023

// Task 1 complete: Thu Oct 12 22:32:26 PDT 2023

// Task 2 complete: Thu Oct 12 22:32:37 PDT 2023
