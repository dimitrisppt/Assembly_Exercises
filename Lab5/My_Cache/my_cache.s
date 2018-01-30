.equ SREG , 0x3f ; Status register.
.equ PORTB, 0x05
.equ DDRB, 0x04
.equ DDRD, 0x0A
.equ PORTD,0x0B

; specify the start address
.org 0

; reset system status
main : 	ldi r16,0 ; set register r16 to zero
	out SREG,r16 ; copy contents of r16 to SREG , clear SREG.

	ldi r16,0x0F
	out DDRB,r16

	ldi r16, 0xF0
	out DDRD, r16

	call decode

mainloop : rjmp main ; jump back to mainloop address

decode:

	ldi r20, 0x1D
	ldi r21, 0x33
	ldi r22, 0x2A



	ldi r23, 0xE0 	;bitmask 11100000
	mov r24, r21	;r24=r21
	and r24, r23
	lsr r24
	lsr r24
	lsr r24
	lsr r24
	lsr r24
	out PORTB, r24
	out PORTD, r24
	
	call delay

	
	ldi r23, 0x1F	; bitmask 00011111
	mov r24, r22
	and
	lsl r24
	lsl r24
	or r22, r24
	out PORTB, r22
	out PORTD, r22


	
	call delay
	

	ldi r25, 0x1C 	;bitmask 00011100
	mov r26, r21	;r26=r21
	and r26, r25
	lsr r26
	lsr r26
	out PORTB, r21
	out PORTD, r21

	
	
	ldi r27, 0x03	;bitmask 000000110
	mov r28, r21	;r27 = r21
	and r28, r27
	out PORTB, r20
	out PORTD, r20
	out PORTB, r25
	out PORTD, r25
	
	

	ret



delay: 

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

	
