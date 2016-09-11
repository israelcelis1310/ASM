;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"	

		.Model Small
		.Stack 100h
		.Data
TEXTO  		DB 'va Actualmente, el Big Data es una de las sombras m s'
		DB 'alargadas en la administraci¢n americana tras la'
		DB "revelaci¢n de las pol‚micas escuchas que realizaran la"
		DB "NSA (Agencia Nacional de Seguridad Americana) a"
		DB "ciudadanos americanos y l¡deres internacionales, Angela"
		DB "Merkel incluida, bajo el pretexto de la seguridad del pa¡s."
		DB "Para atenuar la pol‚mica, a principios de enero, Obama"
		DB "encomend a su equipo de gobierno un an lisis sobre la"
		DB "relaci¢n entre Big Data y privacidad. La reflexi¢n"
		DB "incluye tres charlas en prestigiosas universidades"
		DB "americanas que tendr n lugar en los pr¢ximos 90 d¡as."
		DB "El MIT abord¢ el primer round y el resultado no fue "
		DB "muy prometedor: mucho business y poca privacidad."
		DB "La presencia de la NSA en el evento qued¢ relegada "
		DB "al ultimo panel de la conferencia con la representaci¢n "
		DB "de John DeLong, directivo de la agencia. Seg£n relata el"
		DB "BetaBoston, la comparecencia del directivo deber¡a haber"
		DB "sido galardonado con un premio de honor a la mejor"
		DB "mordedura de lengua. El l¡der apenas habl¢, no fue "
		DB "preguntado directamente sobre la NSA y pas¢ mucho rato"
		DB "mirando al suelo, seg£n relatan otros medios."
		DB "En un momento dado, una representante de Libertades"
		DB "Civiles le apunt¢ al mencionar el caso Snowden, pero"
		DB "De Long no entr¢ al trapo y esper¢ que otro" 
		DB "conferenciante saliera a su rescate. Preguntado por un "
		DB "periodista al acabar el debate, De Long le hizo saber que"
		DB "viene a menudo a Cambridge con motivo de su participaci¢n"
		DB "en la Big Data Initiative del MIT. Varios medios han"
		DB "lamentado que la cita del MIT se haya enfocado m s al"
		DB "business que a la privacidad. De hecho, muchos de los"
		DB "profesores que tomaron la palabra en el evento est n"
		DB "directamente ligados a la industria.$"
VOCAL		DB 'AEIOUaeiou ‚¡¢£'
BUFFER		DB 40H DUP(?)
CONT    	DW 0000H    	
CANTV		DB 00H     ;CANTIDAD DE VOCALES
V01             DB 60H DUP(?)
V02             DB 60H DUP(?)
V03             DB 50H DUP(?)
V04             DB 50H DUP(?)
V05             DB 40H DUP(?)
V06             DB 40H DUP(?)
V07             DB 30H DUP(?)
		.code
		MOV AX,SEG TEXTO
		MOV DS,AX			 ;ICC
		MOV SI,OFFSET TEXTO
INICIO:		CALL PALABRA
		MOV CX,CONT
		SUB SI,CX
		MOV DI,OFFSET BUFFER
GUARDA:		MOV AL,DS:[SI]			;DI ESTA AL FINAL
		MOV DS:[DI],AL			;DE LA PALABRA
		INC SI                          
		INC DI
		LOOP GUARDA
		XOR CX,CX
		INC SI
                MOV DI,OFFSET BUFFER
		MOV BX,OFFSET VOCAL
		MOV CL,0FH
CVOCAL:		MOV AL,DS:[DI]
		CMP AL,BL
		JE CUENTA
		INC BL
		LOOP CVOCAL
		DEC CONT
		JZ SIG
CVOCAL1:	INC DI
		JMP CVOCAL
CUENTA:		INC CANTV
		JMP CVOCAL1
		 
SIG:		
		CMP CANTV,01H  ;SIG PALABRA
		JE CARGA1
		CMP CANTV,02H  ;SIG PALABRA
		JE CARGA2
                CMP CANTV,03H  ;SIG PALABRA
		JE CARGA3
		CMP CANTV,04H  ;SIG PALABRA
		JE CARGA4
		CMP CANTV,05H  ;SIG PALABRA
		JE CARGA5
		CMP CANTV,06H  ;SIG PALABRA
		JE CARGA6
		CMP CANTV,07H  ;SIG PALABRA
		JE CARGA7
		
CARGA1:         MOV BX,OFFSET V01
		MOV DI,OFFSET BUFFER
		MOV CX,CONT
C1:		MOV AL,DS:[DI]
		MOV DS:[BX],AL
		INC DI
		INC BX
		LOOP C1
		JMP INICIO
CARGA2:         MOV BX,OFFSET V02
		MOV DI,OFFSET BUFFER
		MOV CX,CONT
C2:		MOV AL,DS:[DI]
		MOV DS:[BX],AL
		INC DI
		INC BX
		LOOP C2
		JMP INICIO
CARGA3:         MOV BX,OFFSET V03
		MOV DI,OFFSET BUFFER
		MOV CX,CONT
C3:		MOV AL,DS:[DI]
		MOV DS:[BX],AL
		INC DI
		INC BX
		LOOP C3
		JMP INICIO
CARGA4:         MOV BX,OFFSET V04
		MOV DI,OFFSET BUFFER
		MOV CX,CONT
C4:		MOV AL,DS:[DI]
		MOV DS:[BX],AL
		INC DI
		INC BX
		LOOP C4
		JMP INICIO
CARGA5:         MOV BX,OFFSET V05
		MOV DI,OFFSET BUFFER
		MOV CX,CONT
C5:		MOV AL,DS:[DI]
		MOV DS:[BX],AL
		INC DI
		INC BX
		LOOP C5
		JMP INICIO
CARGA6:         MOV BX,OFFSET V06
		MOV DI,OFFSET BUFFER
		MOV CX,CONT
C6:		MOV AL,DS:[DI]
		MOV DS:[BX],AL
		INC DI
		INC BX
		LOOP C6
		JMP INICIO
CARGA7:         MOV BX,OFFSET V07
		MOV DI,OFFSET BUFFER
		MOV CX,CONT
C7:		MOV AL,DS:[DI]
		MOV DS:[BX],AL
		INC DI
		INC BX
		LOOP C7
		JMP INICIO
ORDEN:		JMP FIN
		
				
PALABRA:	MOV AL,DS:[SI]
PAL1:		CMP AL,20H  			;COMPARA ESPACIO
		JE PAL2
		CMP AL,','			;COMPARA COMAS
		JE PAL2	
		CMP AL,'.'			;COMPARA PUNTO
		JE PAL2		       		  		
		INC CONT
		INC SI
		JMP PALABRA
PAL2:		CMP AL,'$'
		JE ORDEN
		RETN

FIN:		MOV AX,4C00H    
		INT 21H
		END