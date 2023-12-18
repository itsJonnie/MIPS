		.text
		.globl volume_cube

volume_cube:	
		nop				# int volume_cube(int $a0) 
		# v0 :  V = s^3
		# a0 :  s = length / width / height of the cube

		# Compute s^2
		mult $a0, $a0     # Multiply s by itself
		mflo $t0          # $t0 = s^2

		# Compute s^3 using TAC style
		mult $t0, $a0     # Multiply s^2 by s
		mflo $t1          # $t1 = s^3
		move $v0, $t1     # $v0 = $t1

		# Return the result
		jr $ra




