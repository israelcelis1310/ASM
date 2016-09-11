;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"
		.MODEL SMALL
		.STACK 100H
		.DATA

ENC 		DB "ESCRIBA AQUI SU MENSAJE:","$"
MENSAJE         DB 0FFH
CANT		DB ?
MSJ		DB 0FFH DUP(?) 
MSJSV		DB 0FFH DUP(?),"$"
PAG 		DB 00

		.CODE
		MOV AX,SEG ENC
		MOV DS,AX
	    	CALL ACT
		MOV DX,0000H
		CALL CURSOR
		CALL BLK              
		MOV DX,0200H
		CALL CURSOR
		MOV DX,OFFSET ENC
		CALL IMPRIME
		MOV DX,0400H
		CALL CURSOR
		MOV DX,OFFSET MENSAJE
		MOV AH,0AH
		INT 21H
		MOV AH,00H
LZ:		INT 16H
		CMP AL,0DH
		JNE LZ		
		MOV SI,OFFSET MSJ
		MOV DI,OFFSET MSJSV
L1:		MOV BL,DS:[SI]

		CMP BL,0DH
		JE SIG
		CMP BL,"A"
		JE NC
		CMP BL,"a"
		JE NC
		CMP BL,"E"
		JE NC
		CMP BL,"e"
		JE NC
		CMP BL,"I"
		JE NC
		CMP BL,"i"
		JE NC
		CMP BL,"O"
		JE NC
		CMP BL,"o"
		JE NC
		CMP BL,"U"
		JE NC
		CMP BL,"u"
		JE NC

		MOV DS:[DI],BL
NC:		INC SI
		INC DI
		JMP L1

SIG:		MOV DX,0900H
		CALL CURSOR
		MOV DX,OFFSET MSJSV
		CALL IMPRIME

L2:		MOV AH,00
		INT 16H
		CMP AL,1BH
		JNE L1

FIN:		MOV AX,4C00H
		INT 21H





;*********** SUBRUTINAS ****************
BLK:	MOV AH,09H
	MOV AL,20H
	MOV BH,PAG
	MOV BL,07
	MOV CX,2000
	INT 10H
	RETN

CURSOR: MOV AH,02
	MOV BH,PAG
	INT 10H
	RETN

ACT:	MOV AH,05H
	MOV AL,PAG
	INT 10H
	RETN

EDIT:	MOV AH,0AH
	INT 21H
	RETN

IMPRIME: MOV AH,09H
	 INT 21H
	 RETN


	END






