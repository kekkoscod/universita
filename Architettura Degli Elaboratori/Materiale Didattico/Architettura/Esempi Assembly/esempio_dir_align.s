@ uso della direttiva .align

		.data 
	a:  .byte 0x11
		.align 2, 0xFF @incrementa PC di tre 
		@ per rendere multiplo di 2*2 = 4 byte, riempendo con FF
	b:  .byte 0x22
	c:  .byte 0x33
	d:  .byte 0x44
		.align @incrementa PC di 1 per rendere multiplo di 4 byte 
		@ il byte conterra 00
	e:  .byte 0x55
		.align 1
		@incrementa PC di 1 per rendere multiplo di 2 byte
	f:  .byte 0x66
		.align 2, 'a'
		@ incrementa PC di 1 per rendere multiplo di 4 byte 
	
		

