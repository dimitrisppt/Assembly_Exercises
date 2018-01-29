.equ SREG,0x3f     
.equ PORTB,0x05
.equ DDRB,0x04

.org 0

main:   ldi r16,0         
	out SREG,r16     

	ldi r16,0x0F
	out DDRB,r16
	
	; turn the LED on 600ms
	ldi r16,0x01
	out PORTB,r16


mycode:	ldi r19, 60
	call delay

	; turn the LED off 20ms
	ldi r16,0x00
	out PORTB, r16
	
	ldi r19, 20
	call delay

	; turn the LED on 200ms
	ldi r16,0x01
	out PORTB,r16

	ldi r19, 20
	call delay

	; turn the LED off 20ms
	ldi r16,0x00
	out PORTB, r16
	
	ldi r19, 20
	call delay

	; turn the LED on 200ms
	ldi r16,0x01
	out PORTB,r16

	ldi r19, 20
	call delay

	; turn the LED off 60ms
	ldi r16,0x00
	out PORTB, r16
	
	ldi r19, 60
	call delay

	; turn the LED on 200ms
	ldi r16,0x01
	out PORTB,r16

	ldi r19, 20
	call delay


	; turn the LED off 20ms
	ldi r16,0x00
	out PORTB, r16
	
	ldi r19, 20
	call delay

	; turn the LED on 200ms
	ldi r16,0x01
	out PORTB,r16

	ldi r19, 20
	call delay


	; turn the LED off 60ms
	ldi r16,0x00
	out PORTB, r16
	
	ldi r19, 60
	call delay

	; turn the LED on 600ms
	ldi r16,0x01
	out PORTB,r16

	ldi r19, 60
	call delay

	; turn the LED off 60ms
	ldi r16,0x00
	out PORTB, r16
	
	ldi r19, 20
	call delay

	; turn the LED on 600ms
	ldi r16,0x01
	out PORTB,r16

	ldi r19, 60
	call delay




mainloop: rjmp mycode 


delay: 
	
loop:  	

	ldi r16, 1
loop3:	nop

	ldi r17, 255
loop2:  nop

	ldi r18, 126

loop1:   nop

	dec r18
	cpi r18, 0
	brne  loop1

	dec r17
	cpi r17,0
	brne  loop2

	dec r16
	cpi r16,0
	brne loop3

	dec r19
	cpi r19,0
	brne loop

	ret
