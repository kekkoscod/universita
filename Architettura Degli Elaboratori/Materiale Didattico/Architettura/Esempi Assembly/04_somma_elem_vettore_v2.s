@ somma elementi di un vettore di 5 elementi con indirizzamento indiretto 
@ con post-indicizzazione costante
@ salva la somma in una locazione di memoria
		.text
		.global _start
_start: LDR R0, =V
		MOV R1,#0   @INDICE I
		MOV R2,#0   @ACCUMULATORE DELLA SOMMA
ciclo:	CMP R1,#5   @IF I==5
		BEQ end_ciclo
		LDR R3,[R0],#4   @PRELEVA ELEMENTO PUNTATO DA R0, LO SALVA IN R3, E INCREMENTA R0 DI 4
		ADD R2,R2,R3
		ADD R1,R1,#1 @INCREMENTO +1 INDICE I
		B   ciclo
end_ciclo: LDR R0,=RES
		   STR R2,[R0]
		   SWI 0x11


		.data
V:      .word 1,2,3,4,5
RES:    .word 0