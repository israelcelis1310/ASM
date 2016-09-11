;   Israel Celis Campagnoli
;   twitter @israelcelis1310
;   https://ve.linkedin.com/in/israelceliscampagnoli
;   Practicas en Assembler Digitales III
;   Universidad Nacional Experimental "Antonio Jóse de Sucre"
;   Vicerectorado "Luis Caballero Mejías"
DATA SEGMENT
    LABEL1 DB "SELECCIONA UNA OPERACION $"
    LABEL2 DB "1.- SUMA $"
    LABEL3 DB "2.- RESTA $"
    LABEL4 DB "3.- MULTIPLICACION $"
    LABEL5 DB "4.- DIVISION $"
    LABEL6 DB "5.- SALIR $"
    LABEL7 DB "INGRESE UNA OPCION $"
    LABEL8 DB "INGRESE NUMERO     $"
    LABEL9 DB "EL RESULTADO ES $"
    LABEL10 DB "ERROR NO DIVISIBLE ENTRE 0 $"
    LABEL11 DB "`COCIENTE  $"
    LABEL12 DB "RESIDUO $"
    RESULTADO DB 0
    COCIENTE  DB    0
    RESIDUO   DB    0
    NUMERO    DB    0
    SIGNOX     DB    0
    R2      DB    ?
    AC      DB    0
   
DATA ENDS

PILA SEGMENT STACK
        
    DW 256 DUP (?)

PILA ENDS
    
CODE SEGMENT

MENU PROC FAR
    
    ASSUME CS:CODE,DS:DATA,SS:PILA
    PUSH DS
    XOR AX,AX
    PUSH AX
    MOV AX,DATA
    MOV DS,AX
    XOR DX,DX
    
    ;INTERLINEADO
    MOV AH,02H
    MOV DL,10
    INT 21H
    MOV AH,02H
    MOV DL,13
    INT 21H
    ;INTERLINEADO
    MOV AH,02H
    MOV DL,10
    INT 21H
    MOV AH,02H
    MOV DL,13
    INT 21H          
    ;IMPRIME SELECCION DE MENU 
    MOV AH,09H
    MOV DX,OFFSET LABEL1
    INT 21H
    
    ;INTERLINEADO
    MOV AH,02H
    MOV DL,10
    INT 21H
    MOV AH,02H
    MOV DL,13
    INT 21H
    
    MOV AH,09H
    MOV DX,OFFSET LABEL2
    INT 21H
    
    MOV AH,02H
    MOV DL,10
    INT 21H
    MOV AH,02H
    MOV DL,13
    INT 21H
    
    MOV AH,09H
    MOV DX,OFFSET LABEL3
    INT 21H
    
    MOV AH,02H
    MOV DL,10
    INT 21H
    MOV AH,02H
    MOV DL,13
    INT 21H
    
    MOV AH,09H
    MOV DX,OFFSET LABEL4
    INT 21H
    
    MOV AH,02H
    MOV DL,10
    INT 21H
    MOV AH,02H
    MOV DL,13
    INT 21H
        
    MOV AH,09H
    MOV DX,OFFSET LABEL5
    INT 21H
    
    MOV AH,02H
    MOV DL,10
    INT 21H
    MOV AH,02H
    MOV DL,13
    INT 21H
    
    MOV AH,09H
    MOV DX,OFFSET LABEL6
    INT 21H
    
    MOV AH,02H
    MOV DL,10
    INT 21H
    MOV AH,02H
    MOV DL,13
    INT 21H
    
    MOV AH,09H
    MOV DX,OFFSET LABEL7
    INT 21H
        
    ;LEE TECLADO
    MOV AH,01H
    INT 21H
     
    ;AJUNSTANDO EL TECLADO
    XOR AH,AH
    SUB AL,30H
    MOV CX,2
    ;VERIFICANDO OPCION
    
    CMP AL,1
    JZ SUMA ;SE DIRIGE AL METODO SUMA
    
    CMP AL,2
    JZ RESTA ;SE DIRIGE AL METODO RESTA
                                       
    CMP AL,3
    JZ MULT ;SE DIRIGE AL METODO MULTIPLIK
    
    CMP AL,4
    JZ DIVI ;SE DIRIGE AL METODO DIVIDIR
    
    CMP AL,5
    JZ FIN
    
SUMA: 
    MOV AH,02H
    MOV DL,10
    INT 21H
    MOV AH,02H
    MOV DL,13
    INT 21H            
    MOV AH,09H
    MOV DX,OFFSET LABEL8
    INT 21H
    
    ;LEE TECLADO
    MOV AH,01H
    INT 21H
    
    ;VERIFICANDO SI ES NEGATIVO
    CMP AL,2DH
    JE SIGNO
       
    ;AJUSTA TECLADO
    SUB AL,30H
    ADD RESULTADO,AL 
    JMP RETURN1
    

SIGNO:
    MOV AH,01H
    INT 21H
    SUB AL,30H
    NEG AL
    ADD RESULTADO,AL
    JE RETURN1
 
RETURN1: LOOP SUMA
         

IMP1:
    CMP RESULTADO,00
    JL IMP2
    ;INTERLINEADO
    MOV AH,02H
    MOV DL,10
    INT 21H
    MOV AH,02H
    MOV DL,13
    INT 21H
    MOV AH,09H
    MOV DX,OFFSET LABEL9
    INT 21H
    JMP IMPRIME
        
       
IMP2: 
    NEG RESULTADO 
    ;INTERLINEADO
    MOV AH,02H
    MOV DL,10
    INT 21H
    MOV AH,02H
    MOV DL,13
    INT 21H
        
    MOV AH,09H
    MOV DX,OFFSET LABEL9
    INT 21H
    MOV AH,02H        
    MOV DL,'-'        
    INT 21H
    JMP IMPRIME
       
IMPRIME:

               
        MOV AH,0
        MOV AL,RESULTADO
        MOV CL,10
        DIV CL
        
        ADD AL,30H
        ADD AH,30H; CONVIRTIENDO A DECIMAL
        MOV BL,AH
        
        MOV DL,AL
        MOV AH,02H;IMPRIME LA DECENA
        INT 21H
        
        MOV DL,BL
        MOV AH,02H
        INT 21H;IMPRIME LA UNIDAD
        MOV CX,2
        JMP MENU
RESTA:
    MOV AH,02H
    MOV DL,10
    INT 21H
    MOV AH,02H
    MOV DL,13
    INT 21H            
    MOV AH,09H
    MOV DX,OFFSET LABEL8
    INT 21H
    
    ;LEE TECLADO
    MOV AH,01H
    INT 21H
    
    ;VERIFICANDO SI ES NEGATIVO
    CMP AL,2DH
    JE SIGNOR
      
    ;AJUSTA TECLADO
    SUB AL,30H
    CMP CX,2
    JE ETIQUETA1
    SUB RESULTADO,AL 
    JMP RETURN2
ETIQUETA1: MOV RESULTADO,AL
            JMP RETURN2    
SIGNOR:
    MOV AH,01H
    INT 21H
    SUB AL,30H
    NEG AL
    CMP CX,2
    JE ETIQUETA1
    SUB RESULTADO,AL
    JE RETURN2

RETURN2: LOOP RESTA
    JMP IMP1    
             
MULT:
    MOV AH,02H
    MOV DL,10
    INT 21H
    MOV AH,02H
    MOV DL,13
    INT 21H            
    MOV AH,09H
    MOV DX,OFFSET LABEL8
    INT 21H
    
    ;LEE TECLADO
    MOV AH,01H
    INT 21H
    
    ;VERIFICANDO SI ES NEGATIVO
    CMP AL,2DH
    JE SIGNOM
    SUB AL,30H
    CMP CX,2
    JE ETIQUETA2
    MOV AH,0
    MUL RESULTADO
    JMP RETURN3
ETIQUETA2:
    MOV RESULTADO,AL
    JMP RETURN3
SIGNOM:
    MOV AH,01H
    INT 21H
    SUB AL,30H
    NEG AL
    CMP CX,2
    JE ETIQUETA2
    MOV AH,0
    MUL RESULTADO
    JMP RETURN3
RETURN3:LOOP MULT
        MOV RESULTADO,AL
        JMP IMP1    

MOV SIGNOX,0    
DIVI:
    MOV AH,02H
    MOV DL,10
    INT 21H
    MOV AH,02H
    MOV DL,13
    INT 21H            
    MOV AH,09H
    MOV DX,OFFSET LABEL8
    INT 21H
    
    ;LEE TECLADO
    MOV AH,01H
    INT 21H
    
    ;VERIFICANDO SI ES NEGATIVO
    CMP AL,2DH
    JE SIGNOD
    
    SUB AL,30H
    CMP CX,2
    JE ETIQUETA3
    CMP AL,0
    JE FALLA
    MOV AH,0
    MOV NUMERO,AL
    MOV AL,RESULTADO
    DIV NUMERO 
    JMP RETURN4

ETIQUETA3:
    MOV RESULTADO,AL
    JMP RETURN4
SIGNOD:
    MOV AH,01
    INT 21H
    SUB AL,30H
    INC SIGNOX
    CMP CX,2
    JE ETIQUETA3
    MOV AH,0
    MOV NUMERO,AL
    MOV AL,RESULTADO
    DIV NUMERO
    JMP RETURN4

RETURN4:LOOP DIVI
    MOV COCIENTE,AL
    MOV RESIDUO,AH
    MOV RESULTADO,AL
    JMP IMP3
FALLA: 
    MOV AH,9
    MOV DX, OFFSET LABEL10
    INT 21H
    JMP DIVI
IMP3:
    
    
    MOV AH,02H
    MOV DL,10
    INT 21H
    MOV AH,02H
    MOV DL,13
    INT 21H
    MOV AH,09H
    MOV DX,OFFSET LABEL9
    INT 21H
    JMP IMPRIMEDIVI
        
       

    
IMPRIMEDIVI:
       MOV AL,RESULTADO
              
       MOV CH,30H
       ADD AL,CH
       ADD AH,CH
       MOV BL,AH  
       
      
       MOV AH,9
       MOV DX,OFFSET LABEL11
       INT 21H      
       
       CMP SIGNOX,1
       JZ CAMBIO
       JMP TERMINA
       
CAMBIO:
       MOV DL,"-"
       MOV AH,02H
       INT 21H        
       MOV SIGNOX,0

TERMINA:
       MOV DX,0
       ADD COCIENTE,30H
       MOV DL,COCIENTE
       MOV AH,02H ;IMPRIME EL COCIENTE
       INT 21H
               
               
       MOV AH,9
       MOV DX,OFFSET LABEL12
       INT 21H
       
       MOV DX,0
       ADD RESIDUO,30H
       MOV DL,RESIDUO 
       MOV AH,02H ;IMPRIME EL RESIDUO
       INT 21H
       
       JMP MENU  
FIN:     RET     
MENU ENDP
CODE ENDS
END MENU