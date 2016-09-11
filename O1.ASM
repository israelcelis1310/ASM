;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"
		.MODEL SMALL
		.STACK 100H
		.DATA

PG1 DB "    1.-MENSAJE.",0AH,0AH,0AH,0DH
    DB 20H,20H,20H,20H,"2.-MENSAJE.","$"

PAG DB 01

MENSAJE1 DB "este es el mensaje uno para probar","$"
MENSAJE2 DB "este es el mensaje dos para probar","$"
				      
		.CODE	
		 MOV AX,SEG PG1
		 MOV DS,AX
		 CALL ACT
		 MOV DX,0000H
		 CALL CURSOR
		 CALL BLK
		 MOV DX,0900H
		 CALL CURSOR
		 MOV DX,OFFSET PG1
		 CALL IMPRIME
L1:		 CALL TECLA
		 CMP AL,1BH
		 JE FIN
		 CMP AL,"1"
		 JE P2
		 CMP AL,"2"
		 JE P3
		 JMP L1
P2:		 MOV PAG,02
		 CALL ACT
		 MOV DX,0000H
		 CALL CURSOR
		 CALL BLK
		 MOV DX,0200H
		 CALL CURSOR
		 MOV DX,OFFSET MENSAJE1
		 CALL IMPRIME
		 JMP L2

P3:		 MOV PAG,03
		 CALL ACT
		 MOV DX,0000H
		 CALL CURSOR
		 CALL BLK
		 MOV DX,0200H
		 CALL CURSOR
		 MOV DX,OFFSET MENSAJE2
		 CALL IMPRIME
		 JMP L2

L2:		 CALL TECLA
		 CMP AL,1BH
		 JNE L2
		 MOV PAG,01
		 CALL ACT
		 JMP L1
FIN:		 MOV PAG,00H
		 CALL ACT
		 MOV AX,4C00H
		 INT 21H



;************** SUBRUTINAS ****************
IMPRIME:	MOV AH,09H
		INT 21H
		RETN

CURSOR:		MOV AH,02H
		MOV BH,PAG
		INT 10H
		RETN

BLK:		MOV AH,09H
		MOV AL," "
		MOV BH,PAG
		MOV BL,07H
		MOV CX,2000
		INT 10H
		RETN

ACT:		MOV AH,05
		MOV AL,PAG
		INT 10H
		RETN

TECLA:		MOV AH,00
		INT 16H
		RETN

		END


