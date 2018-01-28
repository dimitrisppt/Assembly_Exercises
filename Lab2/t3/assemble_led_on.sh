#!/bin/sh

avr-as -g -mmcu=atmega328p -o led_on.o led_on.s 
avr-ld -o led_on.elf led_on.o
avr-objcopy -O ihex -R .eeprom led_on.elf led_on.hex

# Use avrdude to download to connected Arduino Nano
avrdude -C /etc/avrdude/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:led_on.hex:i