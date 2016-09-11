;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"
	.MODEL SMALL
	.STACK 100H
	.DATA
PALABRA	DB 'ELEFANTE','$'
LETRA	DB 'E'
CANT	DB 00H
	.CODE
	MOV AX,SEG PALABRA
	MOV DS,AX
	MOV SI,OFFSET PALABRA
L1:	MOV AL,DS:[SI]
	CMP AL,'$'
	JE FIN
	CMP AL,'E'
	JE CONTAR
	INC SI
	JMP L1
CONTAR:	INC CANT
	INC SI
	JMP L1
FIN:	MOV AX,4C00H
	INT 21H
	END
