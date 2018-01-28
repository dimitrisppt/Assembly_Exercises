
; specify equivalent symbols

.equ SREG , 0x3f ; Status register. See data sheet , p.11
.equ PORTB, 0x05
.equ DDRB, 0x04

; specify the start address
.org 0

; reset system status
main : ldi r16,0 ; set register r16 to zero
out SREG,r16 ; copy contents of r16 to SREG , i.e. , clear SREG.

ldi r16,0x0F
out DDRB,r16

ldi r16,0x0D
out PORTB,r16



mainloop : rjmp mainloop ; jump back to mainloop address
