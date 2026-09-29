@ dati due vettori a e b di 10 elementi
@ creare un vettore c che abbia un elemento di a e un elemento di b
@ es. c = a[0] b[0] a[1] b[1] etc..
@ obbligatorio passaggio di parametri su stack e uso del frame pointer

		.text
		.global _start
		
_start: LDR R0,=A
		LDR R1,=B
		LDR R2,=DIM
		LDR R3,=C
		PUSH {R0,R1,R2,R3}
		BL   crea_c   @salto al sottoprogramma crea_c
		ADD SP,SP,#16 @pulizia dello stack (non occorre recuperare 
		@alcun risultato dato che i valori di C sono stati scritti
		@direttamente in memoria
		SWI 0x11

		
crea_c: PUSH {FP,LR}
		MOV FP,SP
		PUSH {R0,R1,R2,R3,R4,R5,R6}				
@push dei registri che andiamo a sporcare
@che serve a salvare lo stato del programma chiamante. per esempio
@se nel registro R0, il chiamante ha inserito un valore che serve  
@alle attività successive alla chiamate a sottoprogramma, e responsabilita 
@del programmatore assicurarsi che il registro venga salvato (con push
@su stack) all'inizio del sottoprogramma, prima di utilizzare R0'. 
 
		LDR R0,[FP,#A_off]   @indirizzo di VETT.A 
		LDR R1,[FP,#B_off]   @indirizzo di VETT.B 
		LDR R2,[FP,#Dim_off] @indirizzo di DIM
		LDR R3,[FP,#C_off]   @indirizzo di C_off
		
		LDR R4,[R2]   
		MOV R5,#0           @indice i
		
ciclo:  CMP R5,R4
		BEQ fine
		LDR R6,[R0],#4      @prelievo elemento A[i]
		STR R6,[R3],#4      @salvataggio in C di A[i]
		LDR R6,[R1],#4      @prelievo elemento B[i]
		STR R6,[R3],#4      @salvataggio in C di B[i]
		ADD R5,R5,#1
		BAL ciclo
fine:	POP {R0,R1,R2,R3,R4,R5,R6} @ripristino del valore dei registri
		POP {FP,LR}  @ripristino di old_lr, e old_fp
        MOV PC,LR    @ritorno al programma chiamante
		


		.data
A: 		.word   0,1,2,3,4,5,6,7,8,9
B:      .word   10,11,12,13,14,15,16,17,18,19
DIM:    .word   10
C:		.word   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

.equ  C_off, 20
.equ  Dim_off,16
.equ  B_off,12
.equ  A_off,8

		.end 