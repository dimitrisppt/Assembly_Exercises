#!/bin/sh

avr-as -g -mmcu=atmega328p -o my_code.o my_code.s 
avr-ld -o my_code.elf my_code.o
avr-objcopy -O ihex -R .eeprom my_code.elf my_code.hex

# Use avrdude to download to connected Arduino Nano
avrdude -C /etc/avrdude/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:my_code.hex:i
