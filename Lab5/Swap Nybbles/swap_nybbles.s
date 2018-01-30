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

	ldi r16,0x81
	out PORTB,r16
	out PORTD,r16
	call halfsec

	ldi r20, 0x0F
        mov r22, r16
	and r22, r20
	lsl r22
	lsl r22
	lsl r22
	lsl r22
	
	ldi r21, 0xF0
        mov r23, r16
	and r23, r21
	lsr r23
	lsr r23
	lsr r23
	lsr r23
	
	or r22, r23
	
	out PORTB,r22
	out PORTD,r22
	call halfsec

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

	
