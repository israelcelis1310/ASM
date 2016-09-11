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
	TABM DW 20H DUP(?)            
	TABC DW 20H DUP(?)
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
	JE  VP                    
	JMP ERROR                  
	
VP:	INC DI
	MOV BH,"P"
	CMP BH,ES:[DI]   
	JE  P1
	MOV BH,"p"
	CMP BH,ES:[DI]                
	JNE VM

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
	MOV DX,0000H

S1:	MOV AL,DS:[SI]
	ADD DX,AX
	INC SI
	LOOP S1
	JMP FIN

SUMA2: 	MOV DI,OFFSET TAB2

	MOV AX,0000H
	MOV CX,0020H
	MOV DX,0000H

S2:	MOV AL,DS:[DI]
	ADD DX,AX
	INC DI
	LOOP S2
         
FIN:	MOV AX,DX
	MOV BL,20H
	DIV BL
	MOV PROM,AL
	JMP FINAL


VM:	MOV BH,"M"
	CMP BH,ES:[DI]
	JE  MLT
	MOV BH,"m"
	CMP BH,ES:[DI]                
	JE  MLT
	
VC:    	MOV BH,"C"
	CMP BH,ES:[DI]   
	JE  C1
	MOV BH,"c"
	CMP BH,ES:[DI]                
	JNE ERROR

C1:	INC DI
	MOV BH,"1"
	CMP ES:[DI],BH
	JE  CUAD1
	MOV BH,"2"
	CMP ES:[DI],BH
	JE  CUAD2
	JMP ERROR                     

CUAD1:	MOV SI,OFFSET TAB1
	MOV DI,OFFSET TABC

	MOV AX,0000H
	MOV BX,0000H
	MOV CX,0020H

CD1:	MOV AL,DS:[SI] 	
	MOV BL,AL
	MUL BL
	MOV DS:[DI],AX
	INC SI
	INC DI
	INC DI
	LOOP CD1

	JMP FINAL

CUAD2:	MOV SI,OFFSET TAB2	
	MOV DI,OFFSET TABC
	
	MOV AX,0000H
	MOV BX,0000H
	MOV CX,0020H

CD2:	MOV AL,DS:[SI] 	
	MOV BL,AL                     
	MUL BL
	MOV DS:[DI],AX
	INC SI
	INC DI
	INC DI                      
	LOOP CD2

	JMP FINAL
	
MLT:	MOV SI,OFFSET TAB1
	MOV DI,OFFSET TABM
	MOV AX,0000H
	MOV BX,0000H
	MOV CX,0020H

M1:	MOV AL,DS:[SI]
	MOV BL,DS:[SI+20H]
	MUL BL
	MOV DS:[DI],AX
	INC SI
	INC DI
	INC DI
	LOOP M1
 
	JMP FINAL
	  
ERROR:	MOV AX,4C01H
	JMP FINAL1

FINAL:	MOV AX,4C00H

FINAL1:	INT 21H
	END
	
						     
