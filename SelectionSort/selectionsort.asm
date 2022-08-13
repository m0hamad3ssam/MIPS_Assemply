.data
x: .word 2, 4, 10, 1, 5, 6
size: .word 6

.text

selectionsort:
la $a0, x		# loading address
lw $a1, size		# loading address size
addi $s0,$0,0		# i = 0

for:
beq $s0, $a1, end	# if(i=n) --> for(i<size)

# calling min()
# address => a0
# size => a1
add $a2, $0, $s0	# i for min => start
jal min


# calling swap()
addi $sp, $sp, -4
sw $a1, 0($sp)    # storing the size in stack
# address => a0
# ind
add $a1,$0, $v0		# ind is minimum in x[] from i:n
add $a2, $0, $s0	# i for swap => j
jal swap
lw $a1, 0($sp)
addi $sp, $sp, 4

addi $s0,$s0,1 # i++
j for


swap:			# addres a0, ind a1, i a2

# access x[i]
sll $t0, $a2, 2
add $t0, $t0, $a0
lw $t3, 0($t0)

# access x[ind]
sll $t2, $a1, 2
add $t2, $t2, $a0
lw $t4, 0($t2)

# x[i] = x[ind]
sw $t4, 0($t0)
# x[ind] = temp
sw $t3, 0($t2)
jr $ra

min:			# address a0, size a1, start a2
add $v0,$0,$s0		# ind = start => i from selection

# access x[start]..=> min
sll $t0, $a2, 2
add $t0, $t0, $a0
lw $t5, 0($t0)		# min = x[start]

forM:
# access x[i]
sll $t0, $a2, 2
add $t0, $t0, $a0
lw $t3, 0($t0)

beq $a2, $a1, out	# if(i = n) => for(i<n)

slt $t7, $t3, $t5	# x[i] < min
beq $t7, $0, no

add $t5, $t3, $0	# min = x[i]
add $v0, $a2, $0	# ind = i
addi $a2, $a2,1		# i++

j forM

no:
addi $a2, $a2,1
j forM

out:
jr $ra

end:
