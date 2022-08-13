.data 
x : .word 3,2,7,9,4,1
.text

main:
jal bubble

# bubble sort
bubble:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    la $a0,x
    addi $s0,$zero,0 #i
    addi $a1,$zero,5 #n-1
    
    loop1:
        beq $s0,$a1,end      #i equal n-1
        addi $s0,$s0,1       # i++
        addi $s1,$zero,0     # j = 0
    loop2:
        sub $t8,$a1,$s0       # (n-1)-i
        bgt $s1,$t8,loop1     # j equal n-1-i

        sll $t3, $s1, 2
        add $t3, $t3, $a0       # address[j]
        add $t4, $t3, 4         # address[j+1]
        lw $t5, 0($t3)          # arr[j]
        lw $t6, 0($t4)          # arr[j+1]
        
        addi $s1,$s1,1		#j++
        
        blt $t5, $t6, loop2     
        jal swap
        j loop2

swap:
    addi $sp, $sp, -8
    sw $a0, 0($sp)
    sw $a1, 4($sp)

    add $a0, $t5, $0            # arr[j]
    add $a1, $t6, $0            # arr[j+1]

    sw $a0, 0($t4)
    sw $a1, 0($t3)

    lw $a0, 0($sp)
    lw $a1, 4($sp)
    addi $sp, $sp, 8
    jr $ra

end:
