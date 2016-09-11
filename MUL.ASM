;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"	
		
		.MODEL SMALL
		.STACK 100H
		.DATA
TRES		DB 03H
CUATRO		DB 04H
DIEZ		DB 10H
CIEN		DB 100
VAR             DW ?
VAR1		DW ?
VAR2		DW ?
VAR3		DW ?
VAR4		DW ?
VAR5		DW ?

		.code
		MOV AX,SEG TRES
		MOV DS,AX
		XOR AX,AX
		XOR BX,BX
		XOR DX,DX
		MOV SI,OFFSET TRES
		MOV DI,OFFSET CUATRO
		MOV AL,DS:[SI]
		MOV BL,DS:[DI]
		MUL BL
		MOV VAR,AX
		MOV DL,0AH
		MUL DL
		MOV VAR1,AX
		MOV DL,0AH
		MUL DL
		MOV VAR2,AX
		XOR AX,AX
		MOV AX,VAR
		ADD VAR1,AX
		XOR AX,AX
		MOV AX,VAR1
		ADD VAR2,AX
		MOV AX,VAR2
		
		MOV DX,000AH
		MUL DX
		MOV VAR3,AX	;1332
		MUL DX          ;13320
		MOV VAR4,AX
		MUL DX		;133200
		MOV VAR5,AX
		XOR AX,AX
		MOV AX,VAR3
		ADD VAR4,AX
		XOR AX,AX
		MOV AX,VAR4
		ADD VAR5,AX
		MOV AX,4C00H
   		INT 21H
		END	