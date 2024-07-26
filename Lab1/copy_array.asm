	AREA RESET, DATA, READONLY
	EXPORT __Vectors
 
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =N;/address of N
	LDR R2, =M;/address of M
	MOV R3, #5;/loop counter
 
BACK LDR R1, [R0], #4;/load value of R0 to R1(0x1), shift R0 by 4 bits
	STR R1, [R2], #4;/store value of R1 in R2(containing address of M) and shift this address by 4
	SUBS R3, #1;/SUBS changes the Z flag
	BNE BACK
 
STOP B STOP
N DCD 0x1, 0x2, 0x3, 0x4, 0x5;/Define Constant Data(32bit)
	AREA mydata, DATA, READWRITE;/anything defined in the READWRITE area is initialised to 0 at exec time
M DCD 0
	END