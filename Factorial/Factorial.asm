addi $a0, $0, 4

fact:
# push in stack
addi $sp, $sp, -8
sw $ra, 4($sp)      # save ra
sw $a0, 0($sp)      # argument n

# Test for n
slti $t0, $a0, 1    # n < 1 ??
beq $t0, $0, L1     # n >= 1 go_to L1

addi $v0, $0, 1     # return 1

# pop from stack
addi $sp, $sp, 8    # pop 2 items from stack
jr $ra              # return to caller

L1:                 # n >= 1
addi $a0, $a0, -1   # get n-1
jal fact            # go to fact with n-1

lw $a0, 0($sp)      # return from jal: restore argmument n
lw $ra, 4($sp)      # restore $ra
addi $sp, $sp, 8    # pop 2 items from stack

mul $v0, $a0, $v0   # return n*fact(n-1)
jr $ra
