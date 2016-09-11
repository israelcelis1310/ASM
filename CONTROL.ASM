;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"	

		.MODEL SMALL
		.STACK 100H
		.DATA
VALORES		DB 14H,0A7H,46H,0C2H,1FH
			DB 38H,5DH,09H,0EEH,61H
DESTINO		DB 0AH DUP (?)
		.CODE
		MOV AX,SEG VALORES
		MOV DS,AX
		MOV CX,000AH
		MOV SI,0000H
		MOV DI,0000H
L1:		MOV AL,DS:VALORES[SI]
		XOR AL,0FFH
		AND AL,01H
		JZ L3
L2:		INC SI
		LOOP L1
		JMP FIN
L3:		MOV AL,DS:VALORES[SI]
		XOR AL,0FFH
		MOV DS:DESTINO[DI],AL
		INC DI
		JMP L2
FIN:	MOV AX,4C00H
		INT 21H
		END