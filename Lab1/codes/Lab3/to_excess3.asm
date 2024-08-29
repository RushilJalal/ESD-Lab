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
	LDR R0, [R0];
	MOV R3, #0;
	
LOOP
	LSL R3, R3, #4;
	AND R1, R0, #0xF;
	ADD R1, R1, #3;
	ADD R3, R1;
	LSR R0, R0, #4;
	CMP R0, #0;
	BNE LOOP;
	
	LDR R4, =M;
	STR R3, [R4];
	
STOP B STOP

N   DCD     0x46
    AREA    mydata, DATA, READWRITE
M   DCD 0

    END