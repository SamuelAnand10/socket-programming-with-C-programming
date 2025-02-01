		AREA Question 2, CODE, READONLY
		entry
		mov r1,#1
		mov r8,#2
		mov r9,#3
		mov r2,#1
		mul r3,r1,r2
		mul r4,r3,r8
		mul r5,r1,r9
		add r7,r5,r6
		add,r0,r7,r9
stop 	b stop
		end