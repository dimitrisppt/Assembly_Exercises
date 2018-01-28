; read_portc.s - reads value from PORTC and writes to PORTB

; specify equivalent symbols
.equ SREG, 0x3f ; Status register. See data sheet , p.11
.equ DDRB, 0x04 ; Data Direction Register for PORTB
.equ PORTB, 0x05 ; Address of PORTB
.equ PINC, 0x06	; Address of input register for PORTC
.equ DDRC, 0x07	; Data Direction Register for PORTC

 
 ; specify the start address
.org 0
; reset system status
main:	ldi r16,0 ; set register r16 to zero
		out SREG, r16 ; copy contents of r16 to SREG , i.e. , clear SREG.

		; configure PORTB for output	
		ldi r16,0x0F ; copies hexidecimal 0x0F to r16
		out DDRB, r16 ; writes r16 to DDRB , setting up bits 0 to 3 in output mode

		; configure PORTC for input
		ldi r16, 0xF0
		out DDRC, r16

		; reads from external pins of PORTC to r16
		in r16, PINC
		ldi r17, 2
		add r16, r17

		


		out PORTB, r16 ; writes contents of r16 to PORTB

mainloop : rjmp mainloop ; jump back to mainloop address
