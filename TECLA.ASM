;	Israel Celis Campagnoli
;	twitter @israelcelis1310
;	https://ve.linkedin.com/in/israelceliscampagnoli
;	Practicas en Assembler Digitales III
;	Universidad Nacional Experimental "Antonio Jóse de Sucre"
;	Vicerectorado "Luis Caballero Mejías"
	.model small
	.stack 100h
	.data
TEC DB 00H

	.CODE 
	MOV AX,SEG TEC
	MOV DS,AX

	MOV AH,00H
	INT 16H
	MOV TEC,AH

	MOV AX,4C00H
	INT 21H
	END











