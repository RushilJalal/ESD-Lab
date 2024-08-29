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
	LDR R0, =N
	LDR R0, [R0]
	LDR R1, =M;
	MOV R2, #1;
	MOV R3, #0;
	MOV R5, #0xA;
	
BCD
	CMP R0, #0;
	BEQ STORE;
	AND R4, R0, #0xF
	MUL R4, R4, R2;
	MUL R2, R2, R5;
	ADD R3, R3, R4;
	LSR R0, R0, #4;
	B BCD
	
STORE
	STR R3, [R1]; 
	
STOP B STOP

N DCD 0x48
	AREA	mydata, DATA, READWRITE
M DCD 0

	END