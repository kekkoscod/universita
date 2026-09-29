@ calcolo massimo e minimo tra due valori (in memoria), e salva prima max e poi min
@ nelle locazioni immediatamente succesive ai valori di partenza 
		
		
		.text
		.global _start
_start: LDR R0, =VAL1
		LDR R1,[R0]
		LDR R0, =VAL2
		LDR R2,[R0]
		CMP R1,R2
		BGE r1_max
		STR R2,[R0,#4]		@r2 piu' grande
		STR R1,[R0,#8]      @il registro r0 non è alterato dallo spiazzamento costante
		B  end_cal
r1_max: STR R1,[R0,#4]		@r1 piu' grande
		STR R2,[R0,#8]
end_cal: SWI 0x11



		.data
VAL1:    .word  5
VAL2:    .word  10