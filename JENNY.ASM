;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"
	.MODEL SMALL
	.STACK 100H         
	.DATA
VALORES DB 10H,24H,00H,47H,98H  
	DB 57H,9DH,86H,43H,0D5H
DESTINO DB 10 DUP(?)
	.CODE
INICIO: MOV AX,SEG VALORES
	MOV DS,AX
	MOV CX,0005H
	MOV SI,OFFSET DESTINO
	MOV DI,SI
	DEC SI
L1:     MOV AL,DS:[SI]
	MOV DS:[DI],AL                                                                                                          
	DEC SI
	MOV AL,DS:[SI]
	MOV DS:[DI],AL
	DEC SI 
	INC DI
	LOOP L1
        MOV CX,0005H
	MOV SI,OFFSET VALORES       
L2:     MOV AL,DS:[SI]
        MOV DS:[DI],AL
	INC SI
	INC DI
	LOOP L2
	MOV AX,4C00H
	INT 21H
	END
