;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"	

		.Model 	Small
		.Stack 	100H
		.data
MENU	DB "Expediente.$"
		DB "Especialidad.$"
		DB "Cedula.$"
		DB "Notas.$"
		DB "Salir.$"
PAG 	DB ?
ATRI	DB ?
ATRI1	DB ?
LIN		DB ?
CONT	DB ?
MENS	DB "la opcion.$"
NUM		DB ?
		DB "no ha sido desarrollada.$"
		.code
		MOV AX,SEG MENU
		MOV DS,AX
;Menu con cinco paginas y en cada una el mismo menu pero
;con diferentes opciones resaltadas .ICC
		MOV PAG,00H
		MOV ATRI,07H
		MOV ATRI1,70H
L1:		MOV DX,0000H
		CALL CURSOR
		MOV SI,OFFSET MENU
		CALL IMPRIME
		INC PAG
		CMP PAG,05H
		JNE L1
		MOV PAG,00H
L3:		CALL ACTIVAR
L2:		MOV AH,00H
		INT 16H
		JE EJEC
		CMP AH,"ABAJO"
		JE SUMA
		CMP AH,"ARRIBA"
		JE RESTA
		JMP L2
SUMA:	INC PAG
		CMP PAG,05H
		JNE L3
		MOV PAG,00H
		JMP L3
RESTA:	DEC PAG
		CMP PAG,0FFH
		JNE L3
		MOV PAG,04H
		JMP L3
EJEC:	CMP PAG,00H
		JNE E1
		CALL EXP
		JMP L3
E1:		CMP PAG,01H
		JNE E2
		CALL ESPE
		JMP L3
E2:		CMP PAG,02H
		JNE E3
		CALL CED
		JMP L3
E3:		CMP PAG,03H
		JNE E4
		CALL NOTAS
		JMP L3
E4:		MOV AX,4C00H
		INT 21H
EXP:
ESPE:
CED:
NOTAS:	MOV AL,PAG
		MOV SW,AL
		MOV PAG,05H
		MOV DX,0D05H
		CALL CURSOR
		MOV AL,SW
		ADD AL,31H
		MOV NUM,AL
		CALL ACTIVAR
		MOV AH,09H
		MOV DX,OFFSET MENS
		INT 21H
		MOV AH,00H
		INT 16H
		MOV AL,SW
		MOV PAG,AL
		RETN
CURSOR: MOV AH,02H
		MOV BH,PAG
		INT 10H
		RETN
BLK: 	MOV AH,09H
		MOV AL,20H
		MOV BH,PAG
		MOV BL,ATRI
		MOV CX,2000
		INT 10H
		RETN
IMPRIME:MOV LIN,00H
		MOV CONT,05H
I1:		MOV AL,PAG
		CMP AL,LIN
		JNE I2
		MOV BL,ATRI1
		JMP I3
I2:		MOV BL,ATRI
I3:		MOV AL,DS:[SI]
		CMP AL,$
		JE I4
		MOV AH,09H
		MOV CX,0001H
		MOV BH,PAG
		INT 10H
		INC DX
		CALL CURSOR
		INC SI
		JMP I3
I4:		MOV DL,0AH
		ADD DH,02H
		CALL CURSOR
		INC SI
		INC LIN
		DEC CONT
		JNZ I1
		MOV DX,2020H
		CALL CURSOR
		RETN
		END