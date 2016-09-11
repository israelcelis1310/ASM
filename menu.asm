;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"
	.Model 	Small
	.Stack 	100H
	.386
 	.Data

	SI1	DW 00H
	DAT1 	DW 	00H
	OPER	DB      00H
	DAT2 	DW 	00H	
	SIGU	DB   	'='
	RESUL	DD     	00H
	ESPACIO	DW	 00H
	HIST 	dB 100 DUP ('$')
	VMUL	DB  00H 
	VMUL1	DB  	00H

	FILA	DB 0
	COLUMNA DB 0
	TITULO1 DB "********CALCULADORA*********$"
	TITULO DB "*************MENU************$"
	CA DB "(1) CALCULADORA$"
	PA DB "(2) PAINT$"
	PGW DB"(3) PAGINA WEB$"
	CHAT DB"(4) CHAT$"
	EXIT DB"(5) SALIR$"
	
	EDATO1	DB 'DATO 1: ','$'
	EDATO2	DB 'DATO 2: ','$'		
	EOPER		DB 'OPERACION: ','$'
	
	.CODE
INICIO:	MOV AX,@data	
	MOV DS,AX             	
	MOV ES,AX
	CALL PANTALLA
	CALL PROGRAMENU


PROGRAMENU:
	CALL PANTALLA
	MOV FILA,0
	MOV COLUMNA,0
	CALL CURSOR
	LEA DX,TITULO
	CALL IMPRIMIR
	ADD FILA,2
	CALL CURSOR
	LEA DX,CA
	CALL IMPRIMIR
	INC FILA
	CALL CURSOR
	LEA DX,PA
	CALL IMPRIMIR
	INC FILA
	CALL CURSOR
	LEA DX,PGW
	CALL IMPRIMIR
	INC FILA
	CALL CURSOR
	LEA DX,CHAT
	CALL IMPRIMIR
	INC FILA
	CALL CURSOR
	LEA DX,EXIT
	CALL IMPRIMIR
S1:	CALL TECLA1
	CMP AL,31H
	JE CALCU
	CMP AL,35H
	JE FIN
	JMP S1
CALCU: CALL CALC
	JMP PROGRAMENU		



;::::::::::::::::::::::::::::::::::::INTERRUPCIONES:::::::::::::::::::::::::::::::::::::::::::::::
TECLA:	MOV  AH,01H
		INT  21H
		RET
		
CURSOR: MOV AH,02H
	MOV BH,00H
	MOV DH,FILA
	MOV DL,COLUMNA
	INT 10H
	RET
	

IMPRIMIR: MOV AH,09H
	INT 21H
	RET 

TECLA1: MOV AH,00H
	INT 16H
	RET

PANTALLA: MOV AH,00H
	MOV AL,00H
	INT 10H
	RET


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CALCULADORA;;;;;;;;;;;;;;;;;;;;;;;;;
CALC:		MOV CX,100
		LEA DI,HIST
	C3:	MOV AL,'$'
		STOSB
		LOOPZ C3
		MOV CX,0
		LEA DI,HIST
		MOV EAX,0
		MOV EBX,0
		MOV DAT1,0
		MOV DAT2,0
		MOV RESUL,0
		MOV EAX,0
		MOV EBX,0		
		
		CALL CAL1	

		MOV FILA,3
		MOV COLUMNA,0
		CALL CURSOR
		LEA DX,EDATO1
		CALL IMPRIMIR
		CALL TECLA		
		LEA SI,DAT1
		MOV [SI],AL
		CALL TECLA
		MOV [SI+1],AL
		
		CALL CAL1
		
		MOV FILA,3
		MOV COLUMNA,0
		CALL CURSOR
		LEA DX,EOPER
		CALL IMPRIMIR
		CALL TECLA
		MOV OPER,AL
		
		CALL CAL1
		
		MOV FILA,3
		MOV COLUMNA,0
		CALL CURSOR
		LEA DX,EDATO2
		CALL IMPRIMIR
		CALL TECLA
		LEA SI,DAT2
		MOV [SI],AL
		CALL TECLA
		MOV [SI+1],AL
		
		

		SUB DAT1,3030H
		SUB DAT2,3030H
		
				
		MOV AX,DAT1
		MOV BX,DAT2
		
		XCHG AH,AL
		XCHG BH,BL
		
		MOV DAT1,AX
		MOV DAT2,BX				

		MOV DL,OPER
		CMP DL,"+"
		JE S
		CMP DL,"-"
		JE R
		CMP DL,"/"
		JE D
		CMP DL,"*"
 		JE M
		JMP NEXT
 S:		CALL SUMA
		JMP NEXT
 R:		CALL RESTA
 		JMP NEXT
 M:		CALL MULTI
 		JMP NEXT
 D:		CALL DIVIS
 		
NEXT:       CALL COPIAR

		CALL CAL1
		MOV FILA,3
		MOV COLUMNA,0		
		CALL CURSOR
		LEA DX,HIST
		CALL IMPRIMIR
T1:		CALL TECLA
		CMP AL,0DH
		JE FIN111	
		JMP T1
		
				
		CALL FIN
		
SUMA:	    	MOV SI1,SI
		MOV SI1,SI
		ROL AH,4
		ROL BH,4
		ADD AL,AH
		ADD BL,BH
		MOV AH,0
		MOV BH,0
		ADD AL,BL
		DAA
		JNC S11
		ADD AH,1
S11:		ROL EAX,8
		ROR AX,4
		ROR AL,4
		MOV RESUL,EAX
		MOV SI,SI1
		RET

		
		
RESTA:		
		MOV SI1,SI
		ROL AH,4
				ROL BH,4
		ADD AL,AH
		ADD BL,BH
		MOV AH,0
		MOV BH,0
		SUB AL,BL
		DAS
		ROL EAX,8
		ROR AX,4
		ROR AL,4
		MOV RESUL,EAX
		MOV SI,SI1
		RET
		     

						
MULTI:	MOV SI1,SI
		ROL AH,4
		ADD AL,AH
		MOV AH,0
		MOV AH,0
		PUSH AX
		MOV AX,BX
		AAD
		MOV CX,AX
		POP AX
		MOV VMUL,AL
		MOV AL,0
M1:		ADD AL,VMUL
		DAA
		JNC M2
		PUSH AX
		MOV AH,0		
		MOV AL,VMUL1
		ADD AL,1
		DAA
		MOV VMUL1,AL
		POP AX
M2:		LOOPNZ M1
		ADD AH,VMUL1
		PUSH AX
		ROL EAX,12
		ROR EAX,16
		ROR AL,4
		ROL EAX,16
		POP AX
		MOV AH,0
		ROL AX,4		
		ROR AL,4
		MOV RESUL,EAX						
		MOV SI,SI1		 
		
		RET

DIVIS:	MOV SI1,SI
		ROL AH,4
		ROL BH,4
		ADD AL,AH
		ADD BL,BH
		MOV AH,0
		MOV BH,0
	
D1:		SUB AL,BL
		DAS
		PUSH AX
		MOV EAX,RESUL
		ADD AX,1
		AAA
		MOV RESUL,EAX
		POP	 AX
		CMP AL,BL
		JG D1
		JE D1	

		MOV SI,SI1		 
    		RET


COPIAR:	ADD DAT1,3030H
		ADD DAT2,3030H
		ADD RESUL,30303030H
		
		LEA SI,RESUL
		ADD SI,3				
C33:		MOV AL,[SI]
		CMP AL,30H
		JNE S116
		MOV BL,20H
		MOV [SI],BL
		DEC SI
		JMP C33 	
		
S116:						MOV AX,DAT1		
		XCHG AH,AL
		MOV DAT1,AX
		MOV [DI],AX
		ADD DI,2
		MOV AL,OPER
		MOV [DI],AL
		INC DI
		MOV AX,DAT2
		XCHG AH,AL
		MOV DAT2,AX
		MOV [DI],AX
		ADD DI,2
		MOV [DI],'='
		INC DI
		MOV EAX,RESUL
		XCHG AH,AL
		ROL EAX,16
		XCHG AH,AL		
		MOV RESUL,EAX
		MOV [DI],EAX
		ADD DI,5
		
		
FIN222:	RET			
		
		


CAL1:		CALL PANTALLA	
		MOV FILA,0
		MOV COLUMNA,0	
		CALL CURSOR
		LEA DX,TITULO1
		CALL IMPRIMIR
		RET
FIN111:		RET
		
;;;;;;;;;;;;;;;;;;;;;;;;,FIN;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FIN:		MOV AX,4C00H
		INT 21H
		END
				