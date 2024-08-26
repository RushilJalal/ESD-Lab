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
    ; subtract 2 64-bit numbers and store in memory
    LDR R0, =N1
    LDR R1, =N2
    LDR R2, =M
	LDR R5, =2
    
LOOP LDR R6, [R0], #4
    LDR R7, [R1], #4
    SUBS R3, R6, R7
	STR R3, [R2], #4
	SUBS R5, #1
	BNE LOOP
    
    
STOP B STOP

N1 DCD 0xFFFFFFFF, 0x00000002  ; 64-bit number: 0x00000002FFFFFFFF
N2 DCD 0x00000003, 0x00000004  ; 64-bit number: 0x0000000400000003
    AREA mydata, DATA, READWRITE
M DCD 0, 0  ; Space for 64-bit result
    END