.PHONY: all gen build program clean assemble mif assemble-mif

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

clean:
	$(MAKE) -C tools clean
