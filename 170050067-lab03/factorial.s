.globl main
.text


FACT:
addi $sp,$sp,-8
sw $a0,0($sp)
sw $ra,4($sp)
bne $a0,$zero,ELSE
addi $v0,$zero,1
j EXIT
ELSE:
add $a0,$a0,-1
jal FACT
lw $a0,0($sp)
mul $v0,$v0,$a0
EXIT:
lw $ra,4($sp)
addi $sp,$sp,8
jr $ra

main:
li $a0, 5
jal FACT
move $a0,$v0
li $v0,1
syscall
li $v0 10
