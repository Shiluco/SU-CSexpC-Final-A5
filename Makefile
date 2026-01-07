.PHONY: all gen build program clean

all:
	$(MAKE) -C tools all

gen:
	$(MAKE) -C tools gen

build:
	$(MAKE) -C tools build

program:
	$(MAKE) -C tools program

clean:
	$(MAKE) -C tools clean
