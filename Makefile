.PHONY: all gen build program clean assemble mif assemble-mif write-mem-config list-devices

all:
	$(MAKE) -C tools all

gen:
	$(MAKE) -C tools gen

build:
	$(MAKE) -C tools build

program:
	$(MAKE) -C tools program

assemble:
	$(MAKE) -C tools assemble

mif:
	$(MAKE) -C tools mif

assemble-mif:
	$(MAKE) -C tools assemble-mif

write-mem-config:
	$(MAKE) -C tools write-mem-config

list-devices:
	$(MAKE) -C tools list-devices

clean:
	$(MAKE) -C tools clean
