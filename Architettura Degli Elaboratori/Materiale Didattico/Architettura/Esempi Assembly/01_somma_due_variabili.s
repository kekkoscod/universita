@ es.: somma di due variabili a e b allocate in memoria
@ salvataggio del risultato in memoria
		.text 
		.global _start
_start: LDR R0,=A
		LDR R1,[R0]
		LDR R0,=B     @ pseudo istruzione (tradotta con mov da assemblatore)
		LDR R2,[R0]   @ ISTRUZIONE 
		ADD R3,R1,R2
		LDR R0,=RES
		STR R3,[R0]
		SWI 0x11

		.data
A:      .word  10
B:      .word  20
RES:    .word  0