#!/bin/sh

avr-as -g -mmcu=atmega328p -o portc_add2.o portc_add2.s 
avr-ld -o portc_add2.elf portc_add2.o
avr-objcopy -O ihex -R .eeprom portc_add2.elf portc_add2.hex

# Use avrdude to download to connected Arduino Nano
avrdude -C /etc/avrdude/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:portc_add2.hex:i
