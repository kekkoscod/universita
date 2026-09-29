@ esempio: primo esempio di codice in assembly GAS
@ ------------------------------------------------


		.global _start
_start: MOV	R1, #3
		MOV R2, #4
		ADD R3, R1, R2
		SWI 0x11