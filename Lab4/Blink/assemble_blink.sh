#!/bin/sh

avr-as -g -mmcu=atmega328p -o blink.o blink.s 
avr-ld -o blink.elf blink.o
avr-objcopy -O ihex -R .eeprom blink.elf blink.hex

# Use avrdude to download to connected Arduino Nano
avrdude -C /etc/avrdude/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:blink.hex:i
