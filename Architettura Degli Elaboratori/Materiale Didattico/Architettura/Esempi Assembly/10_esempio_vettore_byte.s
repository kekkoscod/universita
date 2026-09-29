@ dati due vettori A e B di 5 byte ciascuno 
@ costruire un vettore C di 5 byte che contenga la differenza tra 
@ elemento i-esimo di A e elemento d i-esimo di B
@ uso di sottoprogramma crea_c, passaggio di parametri su stack
@ e uso del frame pointer
@ il sottoprogramma restituisce al chiamante la somma dei valori di A e B


		.text
		.global _start
_start: LDR R0,=A
		LDR R1,=B
		LDR R2,=C
		LDR R3,=DIM
		LDRB R4,[R3]
		SUB SP,SP,#4
		PUSH {R0,R1,R2,R4}   @ push su stack di ind. di A, B, C e VALORE di DIM.
		BL  crea_c
		LDR R5,[SP,#16]
		LDR R0,=RIS
		STRB R5,[R0]
		ADD SP,SP,#20
		SWI 0x11
		
crea_c: PUSH {FP,LR}
		MOV FP,SP 
		PUSH {R0,R1,R2,R3,R4,R5,R6,R7,R8,R9}
		LDR R0,[FP,#AOFF]
		LDR R1,[FP,#BOFF]
		LDR R2,[FP,#COFF]
		LDR R3,[FP,#DIMOFF]
		
		MOV R4,#0 @indice i
		MOV R8,#0 @accumulatore somma
ciclo:	CMP R3,R4
		BEQ fine
		LDRB R5,[R0],#1
		LDRB R6,[R1],#1
		SUB R7,R5,R6
		STRB R7,[R2],#1
		ADD R9,R5,R6
		ADD R8,R8,R9
		ADD R4,R4,#1
		BAL ciclo		
fine:	STR R8,[FP,#RISOFF]
		POP {R0,R1,R2,R3,R4,R5,R6,R7,R8,R9}
		POP {FP,LR}
		MOV PC,LR

	
		.data
A:      .byte   0,1,2,3,4
B:      .byte   5,6,7,8,9
C:      .byte   0,0,0,0,0
DIM:	.byte	5
RIS: 	.byte   0

.equ AOFF,8
.equ BOFF,12
.equ COFF,16
.equ DIMOFF,20
.equ RISOFF,24
		.end

