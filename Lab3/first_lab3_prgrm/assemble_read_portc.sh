#!/bin/sh

avr-as -g -mmcu=atmega328p -o read_portc.o read_portc.s 
avr-ld -o read_portc.elf read_portc.o
avr-objcopy -O ihex -R .eeprom read_portc.elf read_portc.hex

# Use avrdude to download to connected Arduino Nano
avrdude -C /etc/avrdude/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:read_portc.hex:i
