#!/bin/sh

avr-as -g -mmcu=atmega328p -o blink_halfsec.o blink_halfsec.s 
avr-ld -o blink_halfsec.elf blink_halfsec.o
avr-objcopy -O ihex -R .eeprom blink_halfsec.elf blink_halfsec.hex

# Use avrdude to download to connected Arduino Nano
avrdude -C /etc/avrdude/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:blink_halfsec.hex:i
