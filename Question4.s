	area Question4,code,readonly
			entry
			MOV r0, #0x11 
			MOV r1, r0, LSL #1
			MOV r2, r1, LSL #1
stop b stop
end