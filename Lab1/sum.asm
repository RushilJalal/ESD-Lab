	AREA RESET, DATA, READONLY
	EXPORT __VECTORS
__VECTORS
	DCD 0X00010001
	DCD Reset_Handler
	ALIGN
	AREA mycoed, CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=NUM
	LDR R5,=M
UP LDR R6,[R5],#4
	LDR R1,[R0],#4
	LSR R2,R1,#1;R2=R1/2
UP2 MOV R3,R2;MOVES R2 INTO R3
UP3 CMP R1,R3
	SUBLT R3,R1
	SUBGT R1,R3
	BNE UP3
	CMP R1,R2
	BEQ UP
	SUBS R2,#1
	BNE UP2
	STREQ R1,[R6],#4
	BEQ UP
	
STOP B STOP
	
NUM DCD #1,#2,#3,#4,#5,#6,#7,#8,#9,#10
M DCD 0X10000000
	AREA mydata, DATA, READWRITE
	END