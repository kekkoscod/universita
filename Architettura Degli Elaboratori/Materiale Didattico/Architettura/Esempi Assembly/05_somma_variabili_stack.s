@somma di due variabili tramite passaggio di 
@parametri su stack

		.text
		.global _start
_start: LDR R0,=val1
		LDR R1,[R0]
		LDR R0,=val2
		LDR R2,[R0]
		SUB SP,SP,#4
		PUSH {R1,R2}
		BL somma
		ADD SP,SP,#8
		POP {R6}
		LDR R0,=res
		STR R6,[R0]
		SWI 0x11
		
somma:  LDR R3,[SP]   @RECUPERO IL VALORE DI R1
		LDR R4,[SP,#4] @RECUPERO IL VALORE DI R2
		ADD R5,R3,R4
		STR R5,[SP,#8]
		MOV PC,LR

		.data
val1:   .word  7
val2:   .word  10
res:    .word  0