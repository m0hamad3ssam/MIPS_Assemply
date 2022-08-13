# Write a procedure (function) that receives two integers in $a0 and $a1, and returns
# their product in $v0. Do not use the multiply instruction. Assume both numbers are
# positive and the product fits in 32 bits.

# store old arguments in stack
addi $sp, $sp, -8
sw $a0, 0($sp)
sw $a1, 4($sp)

addi $a0, $a0, 6        # constNUM1
addi $a1, $a1, 9        # constNUM2
addi $v0, $0,0

# make one of them the counter to sum the other on itself
loop:
beq $a1, $0, end
add $v0, $v0, $a0
addi $a1, $a1, -1
j loop

end:
lw $a0, 0($sp)
lw $a1, 4($sp)
addi $sp, $sp, 8
# jr $ra
