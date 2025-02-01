	area program2, code, readonly
		entry
		mov r1,#1
		mov r2,r1
		mul r3, r1,r2
		mul r4, r3,#2
		mul r5,r1,#3
		add r7,r5,r6
		add,r0,r7,#3
	stop b stop
	end
		