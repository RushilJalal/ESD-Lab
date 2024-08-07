	AREA RESET, DATA, READONLY
    EXPORT __Vectors

__Vectors
    DCD 0x10001000
    DCD Reset_Handler
    ALIGN
    AREA mycoder, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler
	
Reset_Handler
    ; subtract 2 64-bit numbers and store in memory
    LDR R0, =N1
    LDR R1, =N2
    LDR R2, =M
    MOV R3, #0  ; diff of numbers (low 32 bits)
    MOV R4, #0  ; diff of numbers (high 32 bits)
    
	LDR R6, [R0], #4
    LDR R7, [R1], #4
    SUBS R3, R6, R7
	LDR R6, [R0], #4
    LDR R7, [R1], #4
    SBC R4, R6, R7
	STR R3, [R2], #4  ; Store low 32 bits
    STR R4, [R2]      ; Store high 32 bits
    
    
STOP B STOP

N1 DCD 0xFFFFFFFF, 0x00000002  ; 64-bit number: 0x00000002FFFFFFFF
N2 DCD 0x00000003, 0x00000004  ; 64-bit number: 0x0000000400000003
    AREA mydata, DATA, READWRITE
M DCD 0, 0  ; Space for 64-bit result
    END