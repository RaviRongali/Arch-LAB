.data
A:    .word 10
B:    .word 8
C:    .word 0

.text
main:
daddi r4, r0, 33
daddi r5, r0, 32
;;;raw
ld r1, A(r0)
dadd r6,r1,r5
beqz r6,jum
dmulu r7, r4, r5
daddi r7,r0,4
;;;;;;;;;;;;waw
halt
jum:

halt          


