 ;JHEFERSON BASTIDAS EXP 200420703  SEC 02
 ;LUUIS CABRERA EXP 200620070       SEC 03
		
		.model small
		.stack 100h
		.data

MAESTRA DB "200420501","PEREZ PRADO MARIA LUISA                 ","22","0","1","0"               
	DB "000813501","LOPEZ YEPES JUAN JOSE                   ","52","1","0","0"
	DB "200610666","MARIN VALDIVIEZO LUIS DANIEL            ","20","0","1","1"
	DB "200220343","SALAZAR MAVARES SUSANA                  ","28","0","1","1"
	DB "200420754","PESTANO BASTIDAS JOSE RAMON             ","22","0","0","1"
	DB "008420501","RAUSSEO CARIAS LUIS GERARDO             ","64","1","0","0"
	DB "200910775","SALAS COLINA MICHELLE                   ","19","0","0","1"
	DB "200110221","RIVAS CRUZ FERNANDO DANIEL              ","18","0","1","0"
	DB "200820443","ARIAS ARRIETA MIGUEL ANGEL              ","21","0","1","1"
	DB "201220117","CABRERA AZUAJE ANTONIO LUIS             ","17","1","0","1"
	DB "200520995","SOLORZANO PEREZ MARIANA ANDREINA        ","25","0","1","0"
	DB "200410222","ROA SALAS MANUEL ALBERTO                ","22","0","1","0"
	DB "009910558","SANZ PETIT ADAN ROBERTO                 ","38","1","1","1"
	DB "200320452","ALVARADO VALERO ANA JULIA               ","23","1","1","0"
	DB "200210214","ADRIAN LUGO                             ","27","0","1","1"
	DB "200610118","RODRIGUEZ GOMEZ ALEXIS FERNANDO         ","25","0","1","0"
	DB "200110882","PERNIA COA JHOSY VANNESSA               ","29","1","1","1"
	DB "200320010","BATISTA BATISTA GERARDO LEONARDO        ","27","1","0","0"
	DB "200310223","GARCIA RANGEL ANDREA DAYANA             ","29","0","0","1"
	DB "200010511","BASTIDAS CALLES AURORA LUISA            ","30","1","1","1"
	DB "201310333","CAMACARO TORRES CARLOS LUIS             ","18","1","1","0"
	DB "201020434","HERNANDEZ SALAS IVAN RAFAEL             ","20","0","0","1"
	DB "200610884","MARTINEZ CABEZA RAUL JOSE               ","20","0","1","0"
	DB "201220041","RIVAS DURAN JUAN ANDRES                 ","19","1","0","0"
	DB "200510432","FERNANDEZ GARBOZA ANGEL GABRIEL         ","23","1","1","0"
	DB "201310778","DORTA SOSA BERTA KARINA                 ","18","1","0","1"
	DB "201120579","BLANCO RIVERO JESSICA                   ","18","0","1","0"
	DB "008920694","CORDERO SANCHES RITA ANA                ","32","1","1","0"
	DB "009920996","DIAZ RAMOS GONZALO DAVID                ","33","1","0","0"
	DB "200410897","BELLO MUNDARAIN SOFIA                   ","22","1","0","1"
	DB "200120667","ALTUVEZ RODRIGUEZ ROSA MARTHA           ","28","0","1","0"

TUBERCULOSIS 	DB 1728 DUP(?)
SARAMPION 	DB 1728 DUP(?)
PALUDISMO 	DB 1728 DUP(?)
PG0		DB "   SELECCIONE UNA OPCION PARA LOS PACIENTES CON LA INICIAL DE LA VACUNA QUE",0AH,0DH
		DB "                 DESEA VER SEGUIDA DE LA TECLA ENTER:",0AH,0AH,0DH
		DB "    PULSE LA TECLA (T) PARA VER LA TABLA DE TUBERCULOSIS",0AH,0AH,0DH
      		DB "    PULSE LA TECLA (S) PARA VER LA TABLA DE SARAMPION",0AH,0AH,0DH
	     	DB "    PULSE LA TECLA (P) PARA VER LA TABLA DE PALUDISMO",0AH,0AH,0AH,0AH,0AH,0DH
		DB "    EN CASO DE QUE LA TABLA SEA DE MAS DE UNA PAGINA PULSE LA TECLA() PARA",0AH,0DH
		DB "                            VER LA SIGUIENTE",0AH,0AH,0DH
		DB "    PARA SALIR PULSE LA TECLA (ESC).","$"

PAG		DB 00H
CONT		DB 54
			
	  	.CODE
		MOV AX,SEG MAESTRA
		MOV DS,AX
		MOV SI,OFFSET MAESTRA
		MOV DI,OFFSET TUBERCULOSIS


SEPT:		MOV CX,20H
V1T:		MOV AL,DS:[SI+51]
		CMP AL,"1"
		JNE S1T
		CALL CLASIFICA
		JMP S2T
S1T:            ADD SI,54
S2T:		LOOP V1T
      
SEPS: 		MOV DI,OFFSET SARAMPION
		MOV SI,OFFSET MAESTRA
		MOV CX,20H
V1S:		MOV AL,DS:[SI+52]
		CMP AL,"1"
		JNE S1S
		CALL CLASIFICA
		JMP S2S
S1S:            ADD SI,54
S2S:		LOOP V1S

SEPP: 		MOV DI,OFFSET PALUDISMO
		MOV SI,OFFSET MAESTRA
		MOV CX,20H
V1P:		MOV AL,DS:[SI+53]
		CMP AL,"1"
		JNE S1P
		CALL CLASIFICA
		JMP S2P
S1P:            ADD SI,54
S2P:		LOOP V1P
    		
; la pagina cero (0) tendra en menu principal donde se podra seleccionar cual
; la tabla que se desea ver con la tecla adecuada al pulsar esta tecla se 
; imprimira la pag uno (1) donde se mostrara la tabla seleccionada

PAG0:           CALL ACT
		MOV DX,0000H
		CALL CURSOR
		CALL BLK
		MOV DX,0000H
		CALL CURSOR
		MOV DX,OFFSET PG0
		CALL IMPRIME
		MOV DX,3000H
		CALL CURSOR
VT:		CALL TECLA
		CMP AL,"T"
		JE AP1
		CMP AL,"t"
		JE AP1
		CMP AL,"S"
		JE AP2
		CMP AL,"s"
		JE AP2
		CMP AL,"P"
		JE AP3
		CMP AL,"p"
		JE AP3
		CMP AL,1BH
		JE FIN1
		JMP VT
FIN1:		JMP FIN

AP1:		MOV PAG,01H
		MOV SI,OFFSET TUBERCULOSIS
		CALL ACT
		JMP IM2

AP2:	        MOV PAG,01H
		MOV SI,OFFSET SARAMPION
		CALL ACT
		JMP IM2

AP3:		MOV PAG,01H
		MOV SI,OFFSET PALUDISMO
		CALL ACT

; en esta parte del programa se imprime la pag uno(1),y si es pulsada la 
; tecla de () se vera la parte final de la tabla si esta esta vacia se
; vera la pantalla sin datos pudiendo retornar al menu principal con (esc)
		
IM2:	        MOV DX,0000H
		CALL CURSOR
		CALL BLK
		MOV DH,00H
LP3:		MOV DL,05H
		CALL CURSOR
		CALL PRINT
		INC DH
		CMP DH,25
		JNE LP3
		MOV DX,3000H
		CALL CURSOR
LPT1:		CALL TECLA
		CMP AH,4DH
		JNE LPT1
		MOV DX,0000H
		CALL CURSOR
		CALL BLK
		MOV DH,00H
LP4:		MOV DL,05H
		CALL CURSOR
		CALL PRINT
		INC DH
		CMP DH,07
		JNE LP4
		MOV DX,3000H
		CALL CURSOR
VESC:		CALL TECLA
		CMP AL,1BH
		JNE VESC
		MOV PAG,00H
		CALL ACT
		JMP VT


     ;**************** SUBRUTINAS *******************
CLASIFICA:	PUSH CX
		MOV CX,54
C1:		MOV DL,DS:[SI]
		MOV DS:[DI],DL
		INC DI
		INC SI
		LOOP C1
		POP CX
		RETN
	     
IMPRIME:	MOV AH,09H
		INT 21H
		RETN

PRINT:		MOV CONT,54
LP:		MOV AL,DS:[SI]
		MOV AH,09H
		MOV BH,PAG
		MOV BL,07H
		MOV CX,0001H
		INT 10H
		INC SI
		INC DX
		CALL CURSOR
		DEC CONT
		JNZ LP 
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




ERROR:	        MOV AX,4C01H
		INT 21H
		
FIN:		MOV AX,4C00H
		INT 21H
		END



