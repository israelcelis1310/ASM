;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"
		
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
	
		
			
	  	.CODE
		MOV AX,SEG MAESTRA
		MOV DS,AX
		MOV SI,OFFSET MAESTRA
		MOV DI,OFFSET TUBERCULOSIS

		MOV DI,0082H
L1:		MOV BL,"/"
      		CMP BL,ES:[DI]
		JE  VT                    
       		JMP FIN                  
	
VT:		INC DI
		MOV BH,"T"
		CMP BH,ES:[DI]   
		JE  SEPT
		MOV BH,"t"
		CMP BH,ES:[DI]                
		JE SEPT

VS:		MOV BH,"S"
		CMP BH,ES:[DI]   
		JE  SEPS
		MOV BH,"s"
		CMP BH,ES:[DI]                
		JE SEPS
		            
VP:		MOV BH,"P"
		CMP BH,ES:[DI]   
		JE  SEPP
		MOV BH,"p"
		CMP BH,ES:[DI]                
		JE SEPP
		JMP FIN


SEPT:		PUSH DI
		MOV DI,OFFSET TUBERCULOSIS
		MOV SI,OFFSET MAESTRA
		MOV CX,20H
V1T:		MOV AL,DS:[SI+51]
		CMP AL,"1"
		JNE S1T
		CALL CLASIFICA
		JMP S2T
S1T:            ADD SI,54
S2T:		LOOP V1T
		POP DI
		INC DI
		JMP L1

SEPS:		PUSH DI
		MOV DI,OFFSET SARAMPION
		MOV SI,OFFSET MAESTRA
		MOV CX,20H
V1S:		MOV AL,DS:[SI+52]
		CMP AL,"1"
		JNE S1S
		CALL CLASIFICA
		JMP S2S
S1S:            ADD SI,54
S2S:		LOOP V1S
		POP DI
		INC DI
		JMP L1

SEPP:		PUSH DI
		MOV DI,OFFSET PALUDISMO
		MOV SI,OFFSET MAESTRA
		MOV CX,20H
V1P:		MOV AL,DS:[SI+53]
		CMP AL,"1"
		JNE S1P
		CALL CLASIFICA
		JMP S2P
S1P:            ADD SI,54
S2P:		LOOP V1P
		POP DI
		INC DI
		JMP L1


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

ERROR:	        MOV AX,4C01H
		INT 21H
		
FIN:		MOV AX,4C00H
		INT 21H
		END



