;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"
	.MODEL SMALL
	.STACK 100H
	.DATA

COL	DW ?
FIL	DW ?
COL1	DW ?
FIL1	DW ?
SW	DW ?
;AREA DE RUTINAS DE INTERRUPCION MODO TEXTO

MODO:	MOV AH,00H
	INT 10H
	RETN

CURSOR:	MOV AH,02H
	INT 10H
	RETN

BLAN:	MOV AH,09H
	MOV CX,2000
	MOV AL,20H
	MOV BL,07H
	INT 10H
	RETN

ESCRIB:	MOV AH,09H
	MOV BH,01H
	MOV BL,07H
	MOV CX,01H
	INT 10H
	RETN

PAG:	MOV AH,05H
	INT 10H
	RETN

EDIT:	MOV AH,0AH
	INT 21H
	RETN

IMPRIME: MOV AH,09H
	INT 21H
	RETN

TECLA:	MOV AH,00H
	INT 16H
	RETN

FIN:	MOV AX,4C00H
	INT 21H
	END
