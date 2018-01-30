#!/bin/sh

avr-as -g -mmcu=atmega328p -o my_cache.o my_cache.s 
avr-ld -o my_cache.elf my_cache.o
avr-objcopy -O ihex -R .eeprom my_cache.elf my_cache.hex

# Use avrdude to download to connected Arduino Nano
avrdude -C /etc/avrdude/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:my_cache.hex:i
