	area program, code, readonly
		entry
		mov r1, #2
		mov r2, #3
		mov r3, #4
		mov r4, #5
		add r6,r1,r2
		add r7,r6,r3
		add r0,r7,r4
stop b stop

	end
		