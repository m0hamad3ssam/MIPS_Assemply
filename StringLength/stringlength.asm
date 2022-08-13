# assume 
# $s0--> str(or char[])
# $s1 --> p

addi $s2, $0, 0     # ct = 0
addi $s1, $s0, 0

loop:
lb $t0, 0($s1)      # $t0 = {p --> str}
beq $t0, $0, exit   # if *p == '\0'
addi $s1, $s1, 1    # p++
addi $s2, $s2, 1    # ct++
j loop

exit:

# Notes
#   p is a number(32 bit address) so when i add 1 to it, we are increamenting the address by 1 byte
#   $t0 holds the ASCII code(a byte) in the lower 8 bytes
