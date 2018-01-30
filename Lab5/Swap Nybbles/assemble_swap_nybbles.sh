#!/bin/sh

avr-as -g -mmcu=atmega328p -o swap_nybbles.o swap_nybbles.s 
avr-ld -o swap_nybbles.elf swap_nybbles.o
avr-objcopy -O ihex -R .eeprom swap_nybbles.elf swap_nybbles.hex

# Use avrdude to download to connected Arduino Nano
avrdude -C /etc/avrdude/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:swap_nybbles.hex:i
