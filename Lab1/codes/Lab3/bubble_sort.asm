	AREA    RESET, CODE, READONLY
    EXPORT  __Vectors

__Vectors
    DCD     0x10001000     ; stack pointer value when stack is empty
    DCD     Reset_Handler  ; reset vector

    ALIGN

    AREA    mycode, CODE, READONLY
    ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	MOV R0, #10;
	LDR R1, =ARR;
	LDR R2, =SRC;
	
COPY
	LDR R3, [R1], #4;
	STR R3, [R2], #4;
	SUBS R0, 1;
	BNE COPY
	
	MOV R0, #9;
	MOV R1, #9;
	
OUTER
    LDR R2, =SRC;
    MOV R3, R1;
    
COMPARE
    LDR R4, [R2], #4;
    LDR R5, [R2];
    CMP R5, R4;
    STRCS R5, [R2, #-4]
    STRCS R4, [R2];
    SUBS R3, #1;
    BNE COMPARE;
    SUB R1, #1;
    SUBS R0, #1;
    BNE OUTER;
	
STOP
	B STOP

ARR   DCD   5, 6, 1, 2, 3, 8, 9, 4, 7, 10
    AREA    mydata, DATA, READWRITE
SRC   DCD   0

    END