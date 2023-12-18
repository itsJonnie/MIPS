// Jonathan Sher - whole2bin.j
public static int whole2bin(int whole){
	int number = whole;
	int bit;

			while (number != 0) {
body:	  		mips.push( number % 2 );
		 	 	number = number / 2;
			}
end:

			while(number != whole){
body2:			bit = mips.pop();
				mips.print_d(bit);
				number = number << 1;
		        number = bit + number; 
			}
end2:

	return number;

}
