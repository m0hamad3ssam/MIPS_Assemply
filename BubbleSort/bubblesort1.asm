.data
x : .word 3,2,7,9,4,1
.text

main:
la $a0,x
addi $a1,$zero,5 #n-1
jal bubble


# bubble sort
bubble:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    
    addi $s0,$zero,0            # i
    loop1:
        beq $s0,$a1,end         # i equal n-1
        addi $s0,$s0,1          # i++
        addi $s1,$zero,-1        # j = -1
    loop2:
	addi $s1,$s1,1		#j++
        sub $t8,$a1,$s0         # (n-1)-i
        bgt $s1,$t8,loop1       # j equal n-1-i

        sll $t3, $s1, 2
        add $t3, $t3, $a0       # address[j]
        add $t4, $t3, 4         # address[j+1]
        lw $t5, 0($t3)          # arr[j]
        lw $t6, 0($t4)          # arr[j+1]



        blt $t5, $t6, loop2
	
	addi $sp, $sp, -4
 	sw $a1, 4($sp)
        jal swap
    	lw $a1, 4($sp)
    	addi $sp, $sp, 4
        
        j loop2

swap:
    # a0 --> address hasn't changed
    addi $a1, $s1, 0            # set i
    addi $a2, $s1, 1            # set j

    sll $t1, $a1,2
    add $t4, $t1, $a0           # address[i]
    lw $t6, 0($t4)              # arr[i]

    sll $t3, $a2, 2
    add $t3, $t3, $a0           # address[j]
    lw $t5, 0($t3)              # arr[j]

    sw $t5, 0($t4)
    sw $t6, 0($t3)

    jr $ra

end:
