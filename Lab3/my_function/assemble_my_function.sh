#!/bin/sh

avr-as -g -mmcu=atmega328p -o my_function.o my_function.s 
avr-ld -o my_function.elf my_function.o
avr-objcopy -O ihex -R .eeprom my_function.elf my_function.hex

# Use avrdude to download to connected Arduino Nano
avrdude -C /etc/avrdude/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:my_function.hex:i
