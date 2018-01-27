.equ SREG, 0x3f		; define SREG label
.org 0
main:	ldi r16,0	; set register r16 to zero
	out SREG,r16	; copy contents of r16 to SREG
mainloop: rjmp mainloop	; jump to mainloop address

; Dimitris Papatheodoulou
; K1630513
;
; This program clears the status register with commands on line 3 & 4 
; and then loops endlessly with the last command line. Because it cannot 
; access dirrectly the status register, the ldi command loads immidiate the 
; register r16 with 0, then copies the contents of register r16 to status 
; register (SREG) and then jump to mainloop address again and again. 
; There is not much to see while this program running since it's only resets
; SREG and then does nothing.
