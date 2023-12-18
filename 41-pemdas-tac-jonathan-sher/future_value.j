public static int future_value(int $a0, int $a1, int $a2) {
    // v0 : FV = I * (100 + (R * T)) / 100
    // $a0 : I = initial investment
    // $a1 : R = rate of return (as an integer, e.g., 5 for 5%)
    // $a2 : T = time in years
 
    int $t0, $t1, $t2, $t3;
    int $v0;
 
    // Compute R * T
    $t0 = $a1 * $a2;  // $t0 = R * T
 
    // Compute 100 + (R * T)
    $t1 = 100 + $t0;  // $t1 = 100 + t0
 
    // Compute I * (100 + (R * T))
    $t2 = $a0 * $t1;  // $t2 = I * t1
 
    // Compute FV = I * (100 + (R * T)) / 100
    $v0 = $t2 / 100;  // $v0 = t2 / 100
 
    return $v0;
 }
 