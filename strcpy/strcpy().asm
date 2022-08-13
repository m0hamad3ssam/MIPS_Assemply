# base address of
# x[] --> $a0 
# y[] --> $a1
# and i is in $s0

strcpy:
addi $sp, $sp, -4   # adjust stack for 1 more item
sw $s0, 0($sp)      # save $s0

add $s0, $0, $0     # i = 0

L1:
add $t1, $s0, $a1   # address of y[i] in $t1
lbu $t2, 0($t1)     # $t2 = data in y[i]

add $t3, $s0, $a0   # address of x[i] in $t3
sb $t2, 0($t3)      # x[i] = y[i]

beq $t2, $0, L2     # if y[i] == '0' go_to L2
# else
addi $s0, $s0, 1    # i++
j L1

# if
L2:
lw $s0, 0($sp)      # restore old $s0
addi $sp, $sp, 4    # pop 1 word off stack
jr $ra              # return



