    AREA    RESET, CODE, READONLY
    EXPORT  __Vectors

__Vectors 
    DCD     0x10001000     ; Initial stack pointer value
    DCD     Reset_Handler  ; Reset vector (entry point)
    ALIGN

    AREA    mycode, CODE, READONLY
    ENTRY
    EXPORT  Reset_Handler

Reset_Handler
    LDR R0, =NUM1          ; Load address of first number
    LDR R1, [R0]           ; Load first number into R1
    LDR R0, =NUM2          ; Load address of second number
    LDR R2, [R0]           ; Load second number into R2
	MUL R11, R1, R2			; PRODUCT OF A,B
	LDR R6, =RESULT

GCD_LOOP
    CMP R1, R2             ; Compare R1 and R2
    SUBGT R1, R1, R2
	SUBLT R2, R2, R1
    BNE GCD_LOOP
	
	MOV R10, R2 ;STORES GCD
	
DIV_LOOP
    SUBS R11, R10
	ADD R5, #1
	CMP R11, #0
    BNE DIV_LOOP             ; Repeat until numerator < denominator

	STR R5, [R6]
	
STOP 
    B STOP                 ; Infinite loop to stop execution

NUM1    DCD     12          ; First number
NUM2    DCD     18          ; Second number

    AREA    result, DATA, READWRITE
RESULT  DCD     0           ; Variable to store the result

    END
