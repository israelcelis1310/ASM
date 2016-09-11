;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"
	.model small
	.stack 100H
	.DATA
	.CODE

	MOV AX,50
	SUB AX,100
	
	MOV AX,4C00H
	INT 21H
	END

