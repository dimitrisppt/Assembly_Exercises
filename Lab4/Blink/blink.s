.equ SREG,0x3f     
.equ PORTB,0x05
.equ DDRB,0x04

.org 0

main:   ldi r16,0         
	out SREG,r16     

	ldi r16,0x0F
	out DDRB,r16
	
	; turn the LED on
	ldi r16,0x01
	out PORTB,r16

	ldi r16, 255
loop3:	nop

	ldi r17, 255
loop2:  nop

	ldi r18, 25
loop:   nop

	dec r18
	cpi r18, 0
	brne  loop

	dec r17
	cpi r17,0
	brne  loop2

	dec r16
	cpi r16,0
	brne loop3


	; turn the LED off
	ldi r16,0x00
	out PORTB, r16
	
	ldi r19, 255
loop4:	nop
	
	ldi r20, 255
loop5: 	nop

	ldi r21, 25
loop6: 	nop

	dec r21
	cpi r21, 0
	brne  loop4

	dec r20
	cpi r20,0
	brne  loop5

	dec r19
	cpi r19,0
	brne loop6
	

mainloop: rjmp main 
