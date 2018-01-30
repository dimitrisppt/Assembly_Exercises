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

ldi r16,0x0B
out PORTB,r16

ldi r16,0xD0
out PORTD,r16



mainloop : rjmp mainloop ; jump back to mainloop address

