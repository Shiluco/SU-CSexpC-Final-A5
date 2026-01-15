.PHONY: all gen build program clean assemble

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

clean:
	$(MAKE) -C tools clean
