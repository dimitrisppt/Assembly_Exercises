#!/bin/sh

avr-as -g -mmcu=atmega328p -o write_DB.o write_DB.s 
avr-ld -o write_DB.elf write_DB.o
avr-objcopy -O ihex -R .eeprom write_DB.elf write_DB.hex

# Use avrdude to download to connected Arduino Nano
avrdude -C /etc/avrdude/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:write_DB.hex:i
