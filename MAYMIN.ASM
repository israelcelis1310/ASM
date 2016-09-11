;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"	

		.Model 	Small
		.Stack 	100H
		.data
BUFFER	DB "A todo esto habrá que añadir navegación por el sistema"
		DB "de ficheros, buscar y reemplazar a través de todo el"
		DB "proyecto activo, múltiples ventanas, cursores y"
		DB "selectores, SNIPPETS y muchas más… Aunque tendremos"
		DB "que esperar todavía para ver todas estas características"
		DB "porque ATOM se encuentra en fase de beta privada."
TECLADO DB 201
CANT	DB ?
TEXTO   DB 201H DUP (?)
CONV	DB ?
		.code
		MOV AX,SEG BUFFER
		MOV DS,AX
;si el switch es /M lleva las letras halladas en miniscula a
;mayuscula y si es /D las mayuscula las lleva a miniscula .ICC
		MOV SI,OFFSET TEXTO
		MOV DI,0081H
		MOV SW,00H
L0:		MOV AL,ES:[SI]
		CMP AL,"/"
		JE L1
		INC DI
		JMP L0
L1:		INC DI
		MOV AL,ES:[DI]
		CMP AL,"D"
		JE DATOS
		CMP AL,"d"
		JE DATOS
		CMP AL,"T"
		JE DATOS
		CMP AL,"t"
		JE TECLA
		CMP AL,0DH
		JE FIN1
		JMP L0
DATOS:	INC DI
		MOV AL,ES:[DI]
		CMP AL,0DH
		JE FIN1
		CMP AL,"/"
		JE L1
		JMP DATOS
L2:		INC DI
		MOV AL,ES:[DI]
		CMP AL,0DH
		JE FIN1
		CMP AL,"M"
		JE MAYUS
		CMP AL,"m"
		JE MINUSC
		JMP DATOS
TECLA:	MOV AH,0AH
		MOV DX,OFFSET TECLADO
		INT 201H
		INC SW
		JMP DATOS
MAYUS:  CMP SW,01H
		JE M1
		MOV SI,OFFSET BUFFER
M1:		MOV CONV,0E0H
		MOV DX,"az"
		CALL CONVERT
		JMP FIN
MINUSC:	CMP SW,01H
		JE R1
		MOV SI,OFFSET BUFFER
R1:		MOV CONV,020H
		CALL CONVERT
FIN:	MOV AX,4C00H
		INT 21H
CONVERT:MOV AL,DS:[SI]
		CMP AL,0DH
		JE SALIR
		CMP AL,DH
		JB C1
		CMP AL,DL
		JA C1
		ADD AL,CONV
C1:		MOV DS:[SI],AL
		INC SI
		JMP CONVERT
SALIR:	RETN
		END