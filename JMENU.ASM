;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"
		
	MODEL SMALL                 
	STACK 100H
	.DATA

	FILA DB 00H
	COLUMNA DB 00H
	PR DB "1.- Promedio$" 
	MU DB "2.- Multiplica$"
	CU DB "3.- Cuadrado$"
	SA DB "4.- Salir$"
	ET1 DB "1.- Tabla 1$"
	ET2 DB "2.- Tabla 2$"
	RE DB "3.- Retornar$"
	PAG DB 00H

	.CODE
	MOV AX,SEG FILA
	MOV DS,AX
	MOV ES,AX

PG0:	CALL MODO
	CALL PANT
	MOV FILA,04H
	MOV COLUMNA,06H
	MOV BH,PAG
	CALL CURSOR
	LEA DX,PR
	CALL IMPRIME
	INC FILA
	INC FILA
	CALL CURSOR
	LEA DX,MU
	CALL IMPRIME
	INC FILA
	INC FILA
	CALL CURSOR
	LEA DX,CU
	CALL IMPRIME
	INC FILA
	INC FILA
	CALL CURSOR
	LEA DX,SA
	CALL IMPRIME
       	CALL TECLA
	;CMP AL,"1"
	;JE PG1 
       ;	CMP AL,"2"
	;JE MLT           
	;CMP AL,"3"
       ;	JE PG12
	;CMP AL,"4"
	JMP FINAL
	

		    ;********INTERRUPCIONES*********
CURSOR:	MOV AH,02H
	MOV BH,PAG
	MOV DH,FILA
	MOV DL,COLUMNA 
	INT 10H 
   	RET


IMPRIME: MOV AH,09H
	INT 21H
	RET

PANT:	MOV AH,05H
	MOV AL,PAG
	INT 10H
	RET
				       
TECLA:	MOV AH,00H
	INT 16H
	RET

MODO:	MOV AH,00
	MOV AL,03
	INT 10H
	RET 
       	
	  
ERROR:	MOV AX,4C01H
	JMP FINAL1

FINAL:	MOV AX,4C00H

FINAL1:	INT 21H
	END
	
						     
