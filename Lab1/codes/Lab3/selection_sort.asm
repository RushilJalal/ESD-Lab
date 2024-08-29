    AREA   RESET, CODE, READONLY
    EXPORT __Vectors

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
	
	MOV R0, #0;
	MOV R1, #0;
	MOV R2, #0;
	MOV R3, #0;

    LDR R0, =SRC;
    MOV R8, #9

UP1 
    MOV R7, R8
    MOV R1, R0

UP2
    LDR R2, [R0]
    LDR R3, [R1, #4]!
    CMP R3, R2
    BLS SKIP
    STR R2, [R1]
    STR R3, [R0]

SKIP
    SUB R7, #1
    TEQ R7, #0
    BNE UP2

    ADD R0, #4
    SUB R8, #1
    TEQ R8, #0
    BNE UP1

STOP
    B STOP

ARR   DCD   5, 6, 1, 2, 3, 8, 9, 4, 7, 10
    AREA    mydata, DATA, READWRITE
SRC   DCD   0

    END
