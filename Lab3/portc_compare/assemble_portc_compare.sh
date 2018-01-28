#!/bin/sh

avr-as -g -mmcu=atmega328p -o portc_compare.o portc_compare.s 
avr-ld -o portc_compare.elf portc_compare.o
avr-objcopy -O ihex -R .eeprom portc_compare.elf portc_compare.hex

# Use avrdude to download to connected Arduino Nano
avrdude -C /etc/avrdude/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:portc_compare.hex:i
