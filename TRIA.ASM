;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"
		.MODEL SMALL
		.STACK 100H         
		.DATA
		FILA DW 00H
		COL  DW 00H


		.CODE
		MOV AX,@data
		MOV DS,AX
		MOV ES,AX		
		
		CALL MODO
		MOV CX,100
		MOV FILA,150
		MOV COL,110
L1:		PUSH CX
		CALL PIXEL 
		INC COL 
		POP CX		 
		LOOP L1

		MOV CX,50             
L2:		DEC FILA
		DEC COL
		PUSH CX
		CALL PIXEL
		POP CX
		LOOP L2

		MOV CX,50             
L3:		INC FILA
		DEC COL
		PUSH CX
		CALL PIXEL
		POP CX
		LOOP L3

		DEC FILA
		INC COL
L4:		CALL TST
		CMP AL,00H
		JNE L5
		CALL PINTA
		DEC FILA
		JMP L4

L5:		MOV FILA,149
		INC COL
		CALL TST
		CMP AL,00H
		JE L4
		
		MOV AH,06H
		INT 16H
	    	
		.EXIT(0)

MODO:	MOV AH,00H
	MOV AL,0DH
	INT 10H
	RET

PIXEL:	MOV AH,0CH
	MOV AL,03H
	MOV BH,00H
	MOV CX,COL
	MOV DX,FILA
	INT 10H
	RET

PINTA:	MOV AH,0CH
	MOV AL,05H
	MOV BH,00H
	MOV CX,COL
	MOV DX,FILA
	INT 10H
	RET

TST:	MOV AH,0DH
	MOV BH,00H
	MOV CX,COL
	MOV DX,FILA
	INT 10H
	RET


	MOV AX,4C00H
	INT 21H
	END
