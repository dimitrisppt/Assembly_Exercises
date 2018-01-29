#!/bin/sh

avr-as -g -mmcu=atmega328p -o blink_delay.o blink_delay.s 
avr-ld -o blink_delay.elf blink_delay.o
avr-objcopy -O ihex -R .eeprom blink_delay.elf blink_delay.hex

# Use avrdude to download to connected Arduino Nano
avrdude -C /etc/avrdude/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:blink_delay.hex:i
