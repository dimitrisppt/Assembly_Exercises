#!/bin/sh

avr-as -g -mmcu=atmega328p -o portc_sub1.o portc_sub1.s 
avr-ld -o portc_sub1.elf portc_sub1.o
avr-objcopy -O ihex -R .eeprom portc_sub1.elf portc_sub1.hex

# Use avrdude to download to connected Arduino Nano
avrdude -C /etc/avrdude/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:portc_sub1.hex:i
