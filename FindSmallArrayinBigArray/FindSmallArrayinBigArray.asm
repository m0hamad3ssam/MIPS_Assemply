# Mohammad Essam Shehata 20190463
# Ammar Yasser 20190346

.data
arr1: .word 2, 6, 9, 4, 8
arr2: .word 6, 9

.text
# size arr1
addi $s5, $0, 5
# size arr2
addi $s6, $0, 2

# ind
addi $s7, $0,-1

# foundL
addi $t2,$0,0

# loading addresses
la $s2, arr1
la $s3, arr2

# index of arr1
addi $s4, $0, 0
# index of arr2 ,, count
addi $s1, $0, 0

# if index of arr1 overheaded size of arr1
loop: beq $s4, $s5, out

# access arr1
sll $t0,$s4,2 		# i++
add $t0, $t0, $s2 	# add arr[i]
lw $t1, 0($t0)		# data arr[i]


# access arr2
sll $t3,$s1,2 		# count++
add $t3, $t3, $s3 	# add arr2[count]
lw $t4, 0($t3)		# data arr2[count]

# ar1[i] == ar2[count]
bne $t1, $t4, else
addi $s1, $s1, 1 # count++
addi $t2, $t2, 1 # fl++

# fL == size of arr2
bne $t2, $s6, ignore 

addi $t6, $s6, -1	# size.arr2 - 1
sub $s7, $s4, $t6
j out

ignore:
addi $s4, $s4, 1    # i++
j loop

# found different_num in the middle of my target array
else:
addi $s1, $0, 0    # count = 0
add $t2, $0, $0     # fL = 0
addi $s4, $s4, 1    # i++
j loop

out:
