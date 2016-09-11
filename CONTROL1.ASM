;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"

		.MODEL SMALL
		.STACK 100H
		.DATA
TABLA1		DB 87H,68H,65H,0A3H,28H,76H,09H,89H,0B7H,66H
TABLA2		DB 10 DUP(?)
		.CODE
		MOV AX,SEG TABLA1
		MOV DS,AX
		MOV DI,OFFSET TABLA1
		MOV SI,OFFSET TABLA2
		MOV CX,0010
L0:		MOV AL,DS:[DI]
		ROL AL,1
		JNC L1
		MOV AL,DS:[DI]
		MOV DS:[SI],AL
		INC SI
L1:		INC DI
		LOOP L0
		MOV AX,4C00H
		INT 21H
		END