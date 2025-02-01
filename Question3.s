	area Question3,code,readonly
		entry
		mov r0,#1
		mov r1,#2
		mov r2,#3
		mov r3,#4
		mla r5,r0,r1,r6
		mla r7,r2,r3,r6
stop b stop
	end