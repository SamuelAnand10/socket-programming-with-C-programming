AREA task1, CODE, READONLY
	ENTRY
	
BT ; making the Binary Tree
	ADR r0, list ; address of list
	
	; location of 1, 2, 5 in list
	MOV r1, #40
	MOV r2, #16
	MOV r3, #4
	BL BTLoop

	; location of 2, 9, 10 in list
	MOV r1, #16
	MOV r2, #48
	MOV r3, #0
	BL BTLoop
	
	; location of 5, 11, 14 in list
	MOV r1, #4
	MOV r2, #24
	MOV r3, #44
	BL BTLoop	

	; location of 9, 19, 23 in list
	MOV r1, #48
	MOV r2, #20
	MOV r3, #28
	BL BTLoop

	; location of 10, 30, 31 in list
	MOV r1, #0
	MOV r2, #8
	MOV r3, #56
	BL BTLoop
	
	; location of 11, 41, 48 in list
	MOV r1, #24
	MOV r2, # 52
	MOV r3, #32
	BL BTLoop

	; location of 14, 78, 79 in list
	MOV r1, #44
	MOV r2, # 12
	MOV r3, #36
	BL BTLoop
	B BFS

BTLoop
	;store address of left, right child next to parents node in list
	ADD r1, r1, r0
	STRB r2, [r1, #1]!
	STRB r3, [r1, #1]!
	BX lr

	
BFS ; breadth first search algorithm
	ADR r10, sort ; r10 = read pointer in sort
	MOV r1, #40 ; r1 = location of 1 in list
	STR r1, [r10] ; store r1 in [r10]
	ADD r11, r10, #4 ; r11 = write pointer in sort
	MOV r3, #1 ; counter r3 = 1
	
BFSLoop
	CMP r3, #15 ; if counter == 15 then goto update
	BEQ UPDATE
	
	; r1 = address of current node
	LDR r1, [r10]
	ADD r1, r1, r0
	
	; store the left child node in sort
	LDRB r2, [r1, #1]!
	STR r2, [r11], #4 
	
	; store the right child node in sort
	LDRB r2, [r1, #1]!	
	STR r2, [r11], #4
	
	ADD r10, r10, #4 ; read pointer to next
	ADD r3, r3, #2 ; counter += 2 (left and right) 
	B BFSLoop

UPDATE ; change all the address into value in sort
	ADR r1, sort ;  update pointer
	MOV r4, #0 ; counter r4 = 0

UPDATELoop
	; if counter ==15 exit
	CMP r4, #15
	BEQ exit
	
	; get the value of current node 
	LDR r2, [r1]
	ADD r2, r2, r0
	LDRB r3, [r2]

	STR r3, [r1], #4 ; update the value of node in sort
	ADD r4, r4, #1 ; counter += 1
	B UPDATELoop

exit B exit

	AREA task1, DATA, READWRITE
	
list DCD 10, 5, 30, 78, 2, 19, 11, 23, 48, 79, 1, 14, 9, 41, 31
sort DCD 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

	END