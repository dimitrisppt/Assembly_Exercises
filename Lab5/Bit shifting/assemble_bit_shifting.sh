#!/bin/sh

avr-as -g -mmcu=atmega328p -o bit_shifting.o bit_shifting.s 
avr-ld -o bit_shifting.elf bit_shifting.o
avr-objcopy -O ihex -R .eeprom bit_shifting.elf bit_shifting.hex

# Use avrdude to download to connected Arduino Nano
avrdude -C /etc/avrdude/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:bit_shifting.hex:i
