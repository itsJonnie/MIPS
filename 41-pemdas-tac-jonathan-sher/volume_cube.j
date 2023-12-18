public static int volume_cube(int $a0) {
   // v0 :  V = s^3
   // a0 :  s = length / width / height of the cube

   int $v0;
   int $t0;
   int $t1;

   // compute s^2:
   $t0 = $a0 * $a0;

   // compute s^3:
   $t1 = $t0 * $a0;

   // assign the result to v0:
   $v0 = $t1;

 
   return $v0;
}
