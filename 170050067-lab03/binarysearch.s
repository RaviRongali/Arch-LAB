	.data
.align 2
A : .word 1 20 30 40 54 67 7 8
	.globl	main	
	.text



main:
	la $a0, A
	li $a1,0
	li $a2,7
	li $a3,67
	#addi $sp,$sp,-4
	jal BS
	addi $v1 $v0 0
	li $v0 10
	syscall
	

BS:
addi $sp,$sp,-4
sw $ra,0($sp)
slt $t1,$a1,$a2
bne $t1, $zero,ELSE1
addi $v0,$zero,-1
j EXIT

ELSE1:
sub $t2,$a2,$a1
li $t7,2
div $t2,$t7
mflo $t3
mfhi $t2
add $t4 $a1 $t3
mul $t5 $t4 4
add $t8 $a0 $t5
lw $t9 0($t8)
beq $t9,$a3,PASS
slt $t1,$t9,$a3

bne $t1,$zero,ELSE2
addi $a2 $t4 -1
jal BS
lw $ra 0($sp)
addi $sp,$sp,4

jr $ra


ELSE2:
addi $a1 $t4 1
jal BS
lw $ra 0($sp)
addi $sp,$sp,4

jr $ra


PASS:
add $v0,$zero,$t4
j EXIT


EXIT:
lw $ra 0($sp)
addi $sp,$sp,4

jr $ra



