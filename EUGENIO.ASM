;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"
		.MODEL SMALL
		.STACK 100H
		.DATA
TABLA	DB 07H,35H,33H,32H,31H,39H,30H,37H
EM1		DB ?
EM2		DB ?
EM3		DB ?
EM4		DB ?
TABLA1	DW 08H DUP(?)
TABLAF	DW 08H DUP(?)
CONT 	DB 04
		.CODE
		MOV AX,SEG TABLA
		MOV DS,AX
		MOV SI,OFFSET TABLA
		MOV AL,DS:[SI]
		AND AL,0F0H
		ROL AL,1
		MOV EM1,AL
		INC SI
		MOV AL,DS:[SI]
		AND AL,0F0H
		ADD AL,EM1
		INC SI
		MOV AL,DS:[SI]
		AND AL,0F0H
		ROL AL,1
		MOV EM2,AL
		INC SI
		MOV AL,DS:[SI]
		AND AL,0F0H
		ADD AL,EM2
		INC SI
		MOV AL,DS:[SI]
		AND AL,0F0H
		ROL AL,1
		MOV EM3,AL
		INC SI
		MOV AL,DS:[SI]
		AND AL,0F0H
		ADD AL,EM3
		INC SI
		MOV AL,DS:[SI]
		AND AL,0F0H
		ROL AL,1
		MOV EM4,AL
		INC SI
		MOV AL,DS:[SI]
		AND AL,0F0H
		ADD AL,EM4
		MOV CX,0004H
		MOV DI,OFFSET EM1
		MOV SI,OFFSET TABLA1
M1:		MOV AL,DS:[DI]
		MOV DS:[SI],AL
		INC SI
		INC DI
		LOOP M1
		MOV DI,OFFSET TABLAF
		MOV SI,OFFSET TABLA1
		ADD SI,0004H
M2:		MOV AX,DS:[SI]
		MOV DS:[DI],AX
		INC DI
		DEC SI
		DEC CONT
		JNZ M2
		MOV AX,4C00H
		INT 21H
		END






