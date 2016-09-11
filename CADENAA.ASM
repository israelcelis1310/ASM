;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"
		.model small
		.stack 100H
		.data
	TAB DB 'H','A','L','A','B','A','A','C','D','A'

		.CODE
		MOV AX,@data
		MOV DS,AX
		MOV ES,AX 

		CLD 
		LEA DI,TAB
		MOV CX,0AH
		MOV AL,'A'
L1:		REPNE SCASB
		JE CUENTA
		JMP FIN

CUENTA:		INC BL
		JMP L1
FIN:		MOV AX,4C00H
		INT 21H
		END





