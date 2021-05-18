	.file	1 "gcd.c"
	.data
	newline: .asciiz	"\n"
   .align 2
    result: .space 4
.text
	.align	2
	.globl	gcd
	.set	nomips16
	.set	nomicromips
	.ent	gcd

gcd:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	reorder
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp) # x is $a0
	sw	$5,12($fp) # y is $a1
$L6:
	lw	$3,8($fp) #load x,y
	lw	$2,12($fp)
	#nop
	bne	$3,$2,$L2 #x==y
	lw	$2,8($fp)
	b	$L7 #return x
$L2:
	lw	$3,8($fp)
	lw	$2,12($fp)
	#nop
	slt	$2,$2,$3 #checking whether x > y or not
	beq	$2,$0,$L4
	lw	$3,8($fp)
	lw	$2,12($fp)
	#nop
	subu	$2,$3,$2 #x = x-y
	sw	$2,8($fp)
	b	$L6
$L4:
	lw	$3,12($fp)
	lw	$2,8($fp)
	#nop
	subu	$2,$3,$2
	sw	$2,12($fp) #y = y-x
	b	$L6
$L7:
	move	$sp,$fp #ends the gcd function
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	.end	gcd

	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
main:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	reorder
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	sw	$5,44($fp)
	li	$2,48			# 0x30
	sw	$2,24($fp)
	li	$2,15			# 0xf
	sw	$2,28($fp)
	lw	$5,28($fp)
	lw	$4,24($fp)
	jal	gcd
	move	$3,$2
	la	$2,result
	sw	$3,0($2)
	la	$2,result
	lw	$2,0($2)
	#nop
	move	$4,$2
	jal	syscall_print_int
	jal	syscall_print_newline
	move	$2,$0
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	.end	main


syscall_print_int:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li	$v0, 1
	# Using $a0 as argument
	syscall
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr	$ra
	nop

syscall_print_newline:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li	$v0, 4
	la	$a0, newline
	syscall
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	nop

