.data
x: .word 3, 2, 4, 8, 1, 7, 9
i: .word 0
size: .word 7

la $t0, i
#array_base_address
la $s2, x

lw $s0, 0($t0)
la $t0 , size
lw $s1 , 0($t0)
loop:slt $t0, $s0, $s1
beq $t0, $0, endloop
# loopbody
mul $t1, $s0, 4
add $t1, $t1, $s2
lw $t2, 0($t1)
.
.
.
addi $s0, $s0,1
j loop

endloop