.equ SREG, 0x3f  ; Status register
.equ DDRB, 0x04  ; Data Direction Register for PORTB
.equ PORTB, 0x05 ; Address of PORTB
.equ PINC, 0x06	 ; Address of input register for PORTC
.equ DDRC, 0x07	 ; Data Direction Register for PORTC

 
; specify the start address
.org 0

; reset system status
main:	ldi r16,0 	; set register r16 to zero
	out SREG, r16   ; copy contents of r16 to SREG , i.e. , clear SREG.

		; configure PORTB for output	
		ldi r16,0x0F 	; copies hexidecimal 0x0F to r16
		out DDRB, r16 	; writes r16 to DDRB , setting up bits 0 to 3 in output mode

		; configure PORTC for input
		ldi r16, 0xF0
		out DDRC, r16

		; reads from external pins of PORTC to r16
		in r16, PINC
		
		; compares whether the contents of r16 are smaller than 9
		cpi r16, 9
		brlo lessthan
		ldi r17, 22
		sub r17, r16
		rjmp done
		
    lessthan:   ldi r17, 15

    done: 	out PORTB, r17
		nop

		out PORTB, r17 ; writes contents of r16 to PORTB

mainloop : rjmp mainloop ; jump back to mainloop address

; Dimitris Papatheodoulou
; K-1630513
; This program 
