f1=open('output1.txt','r')
ans_noopt=[l.split(' ')[2] for l in f1.readlines()]
#print(ans_noopt)
noopt_count_multi=0
noopt_count_single=len(ans_noopt)
print("number of cycles for single cycle for noopt",noopt_count_single)

for i in ans_noopt:
	if(i=='lw'):
		noopt_count_multi+=5
	elif i[0] in ['b','j']:
		noopt_count_multi+=3
	else:
		noopt_count_multi+=4
print("number of cycles for multi cycle for noopt",noopt_count_multi)
f2=open('output2.txt','r')
ans_opt=[l.split(' ')[2] for l in f2.readlines()]
#print(ans_opt)
opt_count_multi=0
opt_count_single=len(ans_opt)
print("number of cycles for single cycle for opt",opt_count_single)
for i in ans_opt:
	if(i=='lw'):
		opt_count_multi+=5
	elif i[0] in ['b','j']:
		opt_count_multi+=3
	else:
		opt_count_multi+=4
#print(opt_count_multi)
print("number of cycles for multi cycle for opt",opt_count_multi)


print("multi_cycle is fast than single cycle in noopt by",(noopt_count_single*5/noopt_count_multi))
print("multi_cycle is fast than single cycle in noopt by",(opt_count_single*5/opt_count_multi))