# @Author: Brogan Miner <Brogan>
# @Date:   2019-04-28T16:56:50-07:00
# @Email:  brogan.miner@oregonstate.edu
# @Last modified by:   Brogan
# @Last modified time: 2019-04-28T20:31:18-07:00

ARDUINO_IN=arduino_interface.ino
ARDUINO_OUT=arduino_interface.bin

OSX_IN=main.mm
OSX_OUT=cli

FIRST_DEVICE := $(shell arduino-cli board list | cut -d$$'\t' -f1 | cut -d$$' ' -f2)
DEVICE_PORT := $(shell arduino-cli board list | cut -d$$'\t' -f2 | cut -d$$' ' -f2)

.PHONY: arduino

arduino:
ifneq ($(strip $(FIRST_DEVICE)),)
	arduino-cli compile -b $(FIRST_DEVICE) arduino/$(ARDUINO_IN) -o build/arduino/$(ARDUINO_OUT)
else
	@echo "FAILED: Arduino Device not connected"
endif

install: arduino
ifneq ($(strip $(DEVICE_PORT)),)
	arduino-cli upload -p $(DEVICE_PORT) -b $(FIRST_DEVICE) -i build/arduino/$(ARDUINO_OUT)
else
	@echo "FAILED: Arduino Device not connected"
endif

cli:
	g++ -Wall -Werror -g -v osx/$(OSX_IN) -lobjc -framework Foundation -framework CoreBluetooth -o build/osx/$(OSX_OUT)

all: arduino cli
	@echo "DONE"
