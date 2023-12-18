public static int surface_area_box(int $a0, int $a1, int $a2) {
   // v0 : S = 2(l * w) + 2(l * h) + 2(w * h)
   // $a0 : l = length of the box
   // $a1 : w = width of the box
   // $a2 : h = height of the box

   int $t0, $t1, $t2, $t3, $t4, $t5, $t6;
   int $v0;

   // Compute l * w
   $t0 = $a0 * $a1;  // $t0 = l * w

   // Compute l * h
   $t1 = $a0 * $a2;  // $t1 = l * h

   // Compute w * h
   $t2 = $a1 * $a2;  // $t2 = w * h

   // Compute 2(l * w)
   $t3 = 2 * $t0;    // $t3 = 2 * t0

   // Compute 2(l * h)
   $t4 = 2 * $t1;    // $t4 = 2 * t1

   // Compute 2(w * h)
   $t5 = 2 * $t2;    // $t5 = 2 * t2

   // Sum the three areas
   $t6 = $t3 + $t4;  // $t6 = t3 + t4
   $v0 = $t6 + $t5;  // $v0 = t6 + t5

   return $v0;
}

