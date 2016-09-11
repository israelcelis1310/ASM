;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"	

		.Model Small
		.Stack 100h
		.Data
TEXTO1 		DB 1AH DUP(00H)
		DB '$'
HN1		DW ?
TEXTO		DW 0900H DUP(00H)
		DB '$'
MENS1		DB 'Escriba el nombre del programa y la ruta ','$'
MENS2		DB 'Error en el archivo','$'
		.code
		MOV AX,SEG TEXTO1
		MOV DS,AX			 ;ICC

INI:		MOV DX,0000H
		MOV BH,00H
		MOV AL,00H
		CALL PANT
		CALL CURSOR
		CALL BLK
		CALL CURSOR
		MOV DX,OFFSET MENS1
		CALL IMPRIME
		CALL LEER
		CALL PRE
		CALL ABRIR
		JA FILEOK
		MOV DX,OFFSET MENS2
		CALL IMPRIME
		JMP INI
FILEOK:		MOV HN1,AX
		CALL LEER1

		JMP FINAL

CUR:		MOV AH,08H
		INT 10H
		RETN

IMPRIME:        MOV AH,09H
		INT 21H
		RETN

BLK:		MOV AH,09H
		MOV AL,20H
		MOV BL,07
		MOV CX,2000
		INT 10H
		RETN

CURSOR:		MOV AH,02H
		INT 10H
		RETN

PANT:		MOV AH,05H
		INT 10H
		RETN

ESCRIBIR:	MOV AH,40H
		MOV CX,000AH
		MOV BX,HN1
		MOV DX,OFFSET TEXTO1
		INT 21H
		RETN

ABRIR:		MOV AH,3DH
		MOV AL,02H
		MOV DX,OFFSET TEXTO1
		INT 21H
		RETN		
          	
LEER:		MOV AH,3FH
		MOV BX,HN1
		MOV DX,OFFSET TEXTO1
		INT 21H
		RETN

LEER1:		MOV AH,3FH
		MOV BX,HN1
		MOV DX,OFFSET TEXTO
		INT 21H
		RETN	

PRE:		MOV SI,OFFSET TEXTO1
PRE1:		MOV AL,DS:[SI]
		CMP AL,0DH
		JE PRE2
		INC SI
		JMP PRE1
PRE2:		MOV AL,00H
		MOV DS:[SI],AL
		INC SI
		MOV DS:[SI],AL
		RETN

FINAL:		MOV AX,4C00H    
		INT 21H
		END