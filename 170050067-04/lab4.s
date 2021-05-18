	.data
.align 2
A:
   .word 0 0 -1 2 0 2 -1 -1
   .text
main:
    la $s0 A
    sw $t1 15($s0)
