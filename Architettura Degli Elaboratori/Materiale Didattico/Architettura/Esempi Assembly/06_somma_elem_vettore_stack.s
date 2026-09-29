@ somma elementi di un vettore di 5 elementi 
@ con passaggio di parametri i/o su stack
@ salva risultato in memoria


		.text
		.global _start
_start: LDR R0,=V
		SUB SP,SP,#4 
		PUSH {R0}
		BL somma
		ADD SP,SP,#4 @RIMUOVO INDIRIZZO V SU STACK
		POP {R6} @SALVO IN R6 IL RISULTATO SOMMA 
		LDR R0,=RES
		STR R6,[R0]
		SWI 0x11
		
		
somma:  LDR R2,[SP] @RECUPERO DALLA TESTA DELLO STACK INDIRIZZO DI V
		MOV R3,#0   @INDICE I
		MOV R4,#0   @registro accumulatore della somma
ciclo_for: CMP R3,#5
		   BEQ end_for
		   LDR R5,[R2],#4 @ACCEDO A LOC. PUNTATA DA R2 (V[I]), SALVO IN R4 E INCREMENTO IL PT. DI 4 
		   ADD R4,R4,R5
		   ADD R3,R3,#1
		   B   ciclo_for
end_for:   STR R4,[SP,#4] @SALVO RIS IN SPAZIO riservato SU STACK
		   MOV PC,LR
		
		
		.data
		
V:      .word  1,2,3,4,5
RES:    .word  0