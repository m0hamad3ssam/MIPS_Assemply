.data 
x: .word 1 , 8 , 7 , 5
size: .word 4

.text

# store old arguments in stack
addi $sp, $sp, -8
sw $a0, 0($sp)
sw $a1, 4($sp)

la $a0, x		# address
lw $a1, size 		# constNUM

jal mult

mult:

addi $t1, $0, 0 	# i
lw $v0, 0($a0) 		# maximum

for:
addi $t1, $t1, 1 	# i
bge $t1, $a1, end	# i<size

# acessing array[i]
sll $t2, $t1, 2
add $t2, $t2, $a0
lw $t3, 0($t2)
bgt $t3, $v0, l1
j for

l1:
addi $v0, $t3,0
j for

end:
lw $a0, 0($sp)
lw $a1, 4($sp)
addi $sp, $sp, 8

# jr $ra
