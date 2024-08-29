	AREA    RESET, CODE, READONLY
    EXPORT  __Vectors

__Vectors
    DCD     0x10001000     ; stack pointer value when stack is empty
    DCD     Reset_Handler  ; reset vector

    ALIGN

    AREA    mycode, CODE, READONLY
    ENTRY
    EXPORT  Reset_Handler
            
Reset_Handler
	LDR R1, =N
	LDR R1, [R1]
CHECK 
	CMP R1, #0
	BEQ STORE
	MOV R3, #0
	
UP 
	CMP R1, #0xA
	BLO EXIT
	SUB R1, #0xA
	ADD R3, #1
	B UP
	
EXIT 
	LSL R1, R2
	ADD R0, R1
	ADD R2, #4
	MOV R1, R3
	B CHECK
	
STORE LDR R4, =BCD
	STR R0, [R4]
	
STOP 
	B STOP

N DCD 0x1234
	AREA mydata, DATA, READWRITE
BCD DCD 0x00000000

	END