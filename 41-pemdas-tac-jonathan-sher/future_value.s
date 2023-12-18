		.text
		.globl future_value

future_value: 
		nop	
		# v0 : FV = I * (100 + (R * T)) / 100
		# a0 : I = initial investment
		# a1 : R = rate of return (as an integer, e.g., 5 for 5%)
		# a2 : T = time in years

		# Compute R * T
		mult $a1, $a2      # Multiply R by T
		mflo $t0           # $t0 = R * T

		# Compute 100 + (R * T)
		addi $t1, $t0, 100  # $t1 = 100 + t0

		# Compute I * (100 + (R * T))
		mult $a0, $t1      # Multiply I by t1
		mflo $t2           # $t2 = I * t1

		# Load immediate value 100 into $t3
		li $t3, 100

		# Compute FV = I * (100 + (R * T)) / 100
		div $t2, $t3       # divide t2 by $t3 (which holds the value 100)
		mflo $v0           # $v0 = quotient of the division

		# Return the result
		jr $ra
