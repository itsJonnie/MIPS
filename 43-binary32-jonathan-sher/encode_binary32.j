// FILE: encode_binary32.j
// Description:
//   This file provides the code to convert a binary number presented in 
//   Scientific Notation into binary32 format.  The binary32 format is as follows:
//
//     binary_32:   |  s  | eeee eeee | mmm mmmm mmmm mmmm mmmm mmmm |
//                  | <1> | <-  8  -> | <-          23            -> |
//
//     the sign bit is placed into position 32
//     the biassed exponent (8 bits) is placed into positions: 31 .. 24
//     the mantissa is left-justified (within it's 23-bit field),
//       and is placed in positions: 23 .. 1          
//
//  Given a the following binary number (as an example):
//      2# + 1.1 0100 1110 0001 x 2^ - 101
//
//  The input for the to sub routine is as follows:
//
//     sign    coefficient       expon_sign   exponent
//      '+'    2#11010011100001  '-'          2#101
//
//  Note: the coefficient is represented in fix-point notation in which the radix
//        point is always located immediately to the right of the msb.


public static int encode_binary32(int sign, int coefficient, int expon_sign, int exponent){
  // $a0 : sign
  // $a1 : coefficient
  // $a2 : expon_sign
  // $a3 : exponent
  int encoding; // : return value

  int encoded_sign;
  int encoded_mantissa;
  int encoded_expon;
  int position;          // the location of the msb of the coefficient
  int coefficient_shift;
  int negative_sign;

  final int bias           = 127;  // As defined by the spec
  final int sign_shift     =  31;  //   << (8 + 23 )
  final int expon_shift    =  23;  //   << (23)
  final int mantissa_shift =   9;  //  >>> (1 + 8)  // the mantissa is left-justified
  final int $zero          =   0;  

  /////////////////////////////////////////////////////////
  // BEGIN CODE of INTEREST
  /////////////////////////////////////////////////////////

  //Initialization:
  // int encoding = 0; // : return value
  // int encoded_sign = 0;
  // int encoded_mantissa = 0;
  // int encoded_expon = 0;
  // int position = 0;          // the location of the msb of the coefficient
  // int coefficient_shift = 0;
  // int negative_sign = 0;

  negative_sign = '-';     // Define the value

  /////////////////////////////////////////////////////////
  // 1. Encode each of the three fields of the floating point format:

  // 1.1 Sign Encoding (encoded_sign = )
  //     - Based upon the sign, encode the sign as a binary value
  init:   ;
  if (sign == negative_sign) {
    cons:   ;
    encoded_sign = 1;
  }
  else{
    alt:   ;
    encoded_sign = 0;
  }
  // 1.2 Exponent Encoding: (encoded_expon = )
  //     - Make the exponent a signed quantity
  //     - Add the bias
  init:   ;
  if (expon_sign == negative_sign) {
    cons:   ;
    encoded_expon =  -exponent;
  }
  else{
    alt:   ;
    encoded_expon = exponent;
  }
    done:   ;
    encoded_expon += bias;
  
  // 1.3  Mantissa Encoding (encoded_mantissa = )
  //      - Determine the number of bits in the coefficient
  //        - that is to say, find the position of the most-significant bit
  //      - Shift the coefficient to the left to obtain the mantissa
  //        - the whole number is now removed, and
  //        - the mantissa (which is a fractional value) is left-justified
  position = pos_msb(coefficient);
  coefficient_shift = ((32 - position) + 1);
  encoded_mantissa = coefficient << coefficient_shift;

  /////////////////////////////////////////////////////////
  // 2. Shift the pieces into place: sign, exponent, mantissa
  encoded_sign  <<= sign_shift;
  encoded_expon <<= expon_shift;
  encoded_mantissa >>>= mantissa_shift;
  
  /////////////////////////////////////////////////////////
  // 3. Merge the pieces together
  encoding = encoded_sign | encoded_expon;
  encoding = encoding | encoded_mantissa;

  return encoding;
}

/////////////////////////////////////////////////////////
// END CODE of INTEREST
/////////////////////////////////////////////////////////

static int pos_msb(int number){
// $a0 : number
int counter;      // : counter: the return value

counter = 0;
init:   ;
loop:   for(; number != 0 ;) {
body:     ;
  counter ++;
  number = number >> 1;
  continue loop;
}
done:   ;
return counter;
}

// Task 1 complete: Tue Oct 24 10:54:26 PDT 2023

// Task 2 complete: Tue Oct 24 16:04:38 PDT 2023
