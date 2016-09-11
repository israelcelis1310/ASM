;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"
	MODEL SMALL                 
	STACK 100H
	.DATA

	TAB1 DB 02H,04H,05H,09H,00H,02H,04H,06H,00H,02H,04H,05H,04H,09H,09H,08H,08H,06H,05H,04H,01H,03H,05H,02H,0AH,06H,0BH,01H,09H,01H,00H,04H
	TAB2 DB 20H,02H,09H,0AH,00H,08H,03H,06H,09H,06H,02H,04H,02H,05H,01H,04H,00H,05H,09H,01H,04H,06H,00H,02H,04H,05H,04H,09H,09H,08H,08H,06H
	PROM DB 00H

	.CODE
	MOV AX,SEG TAB1
	MOV DS,AX
	MOV SI,OFFSET TAB1
	MOV DI,OFFSET TAB2

	MOV AX,0000H
	MOV CX,0020H

	MOV DI,0082H
	MOV BL,"/"
      	CMP BL,ES:[DI]
	JE  T1                    
	JNE FINAL                  
	
T1:	INC DI
	MOV BH,"P"
	CMP BH,ES:[DI]
	JE  P1
	MOV BH,"p"
	CMP BH,ES:[DI]                
	
	JNE FINAL
P1:	INC DI
	MOV BH,"1"
	CMP ES:[DI],BH
	JE  SUMA1
	MOV BH,"2"
	CMP ES:[DI],BH
	JE  SUMA2

	
SUMA1:  MOV SI,OFFSET TAB1
	MOV DI,OFFSET TAB2

	MOV AX,0000H
	MOV CX,0020H

S1:	MOV AL,DS:[SI]
	ADD DX,AX
	INC SI
	LOOP S1
	JMP FIN

SUMA2: 	MOV SI,OFFSET TAB2

	MOV AX,0000H
	MOV CX,0020H
	
S2:	MOV AL,DS:[SI]
	ADD DX,AX
	INC SI
	LOOP S2


  
FIN:	MOV AX,DX
	MOV BL,20H
	DIV BL
	MOV PROM,AL
	JMP FINAL

FINAL:	MOV AX,4C00H

	INT 21H
	END
	
						     
