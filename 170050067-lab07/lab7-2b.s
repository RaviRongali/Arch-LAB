	.data
.align 2
a: .double 1.0 2.0 3.0 4.0 5.0 6.0
b: .double 2.0 3.0 4.0 5.0 6.0 7.0
c: .double 0.0 0.0 0.0 0.0 0.0 0.0
d: .double 0.0 0.0 0.0 0.0 0.0 0.0 
alpha: .double 10.0
	
.text
main:

	daddi r1,r0,0
	daddi r2,r0,6
	j LOOP
LOOP:
	slt r3, r1,r2
	beq r0, r3,EXIT
	dsll r4,r1,3
	l.d f1, a(r4) ##val a[i]
	l.d f2, b(r4) ##val b[i]
	 ##val d[i]
	mul.d f4,f2,f1  ##val s2 c[i]
	s.d f4, c(r4)
	l.d f5, d(r4)
	l.d f6, c(r4)
	l.d f3, alpha(r0)
	mul.d f7,f6,f3
	add.d f8,f5,f7 
	s.d f8, d(r4) ##val s3 d[i]

	daddi r1,r1,1
	j LOOP
EXIT:
	halt

