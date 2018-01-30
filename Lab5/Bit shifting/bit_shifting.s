.equ SREG , 0x3f ; Status register.
.equ PORTB, 0x05
.equ DDRB, 0x04
.equ DDRD, 0x0A
.equ PORTD,0x0B

; specify the start address
.org 0

; reset system status
main : ldi r16,0 ; set register r16 to zero
out SREG,r16 ; copy contents of r16 to SREG , clear SREG.

	ldi r16,0x0F
	out DDRB,r16

	ldi r16, 0xF0
	out DDRD, r16

	ldi r16,0x55
	out PORTB,r16
	out PORTD,r16
	call halfsec

	lsl r16
	out PORTB,r16
	out PORTD,r16
	call halfsec

	lsr r16
	out PORTB,r16
	out PORTD,r16

mainloop : rjmp main ; jump back to mainloop address


halfsec: 

	ldi r17, 255
loop3:	nop

	ldi r18, 255
loop2:  nop

	ldi r19, 25
loop1:   nop

	dec r19
	cpi r19, 0
	brne  loop1

	dec r18
	cpi r18,0
	brne  loop2

	dec r17
	cpi r17,0
	brne loop3

	ret
