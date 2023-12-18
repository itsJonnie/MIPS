		.text
		.globl surface_area_box

surface_area_box: 
		nop	
		# v0 : S = 2(l * w) + 2(l * h) + 2(w * h)
		# a0 : l = length of the box
		# a1 : w = width of the box
		# a2 : h = height of the box
		# a3 : (used as temporary storage in TAC style)

		# Compute l * w
		mult $a0, $a1      # Multiply l by w
		mflo $t0           # $t0 = l * w

		# Compute l * h
		mult $a0, $a2      # Multiply l by h
		mflo $t1           # $t1 = l * h

		# Compute w * h
		mult $a1, $a2      # Multiply w by h
		mflo $t2           # $t2 = w * h

		# Compute 2(l * w)
		add $t3, $t0, $t0  # $t3 = 2 * t0

		# Compute 2(l * h)
		add $t4, $t1, $t1  # $t4 = 2 * t1

		# Compute 2(w * h)
		add $t5, $t2, $t2  # $t5 = 2 * t2

		# Sum the first two areas and store in $a3
		add $a3, $t3, $t4  # $a3 = t3 + t4 (temporary storage)

		# Sum the total surface area
		add $v0, $a3, $t5  # $v0 = a3 + t5

		# Return the result
		jr $ra

