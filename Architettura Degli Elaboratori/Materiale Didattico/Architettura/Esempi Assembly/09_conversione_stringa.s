@ uso delle stringhe in assembly ARM
@ conversione in maiuscole di una stringa
@ ogni carattere occupa un byte in memoria
@ conviene definire le stringhe NUL-terminated, ovvero con il carattere
@ codice ASCII zero posto nella locazione successiva a quella
@ occupata da ultimo carattere della stringa (per indicarne la fine).

			.text
			.global _start
			
_start: 	LDR R0,=stringa
			LDR R2,=stringa2
			
ciclo:		LDRB R1,[R0],#1  @prelievo carattere i-esimo
			TST R1,#0xFF     @controllo carattere di terminazione
			BEQ exit
			CMP R1, #'a'	@se R1>='a'
			BLT prossimo    @se no passa al prox
			CMP R1, #'z'	@se R1<='z'
			BGT prossimo    @se no, passa al prox char.
			SUB R1,R1,#32	@vuol dire che R1>='a' e R1<='z' --> minuscolo
prossimo:	STRB R1,[R2],#1				
			BAL ciclo	
exit:		SWI 0x11
			

			.data
stringa:	.asciz "ciao"   @la direttiva asciz 
	@aggiunge un byte zero in coda ad ultimo carattere
stringa2:	.asciz "xxxx"
			.end