.data
arr: .word 3, 4, 1, 5, 1, 2, 3

.text
la $s2,arr		# arr-address
addi $s0, $0, 7		# size
addi $s3, $0, 3		# size / 2

addi $s1, $0, 1		# palindorome


# 0 is palindrome
# 1 is not a palindrome

addi $t0,$0,0           # i = 0

for:
beq $t0,$s3,endloop	# i = size / 2
sub $t3, $s0, $t0	# ind at the end
add $t3 , $t3, -1

# access arr[i]
sll $t1, $t0, 2
add $t1, $t1, $s2
lw $t1, 0($t1)

# access arr[ind]
sll $t2, $t3, 2
add $t2, $t2, $s2
lw $t2, 0($t2)

bne $t1, $t2, else	# arr[i] == arr[ind]
addi $s1, $0, 0 
addi $t0, $t0, 1
j for

else:
# not a palindrome
addi $s1, $0, 1

endloop:









