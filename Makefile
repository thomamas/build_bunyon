EXTRA_FILES = bunyon-0.3/Makefile bunyon-0.3/compat.c bunyon-0.3/compat.h

all: bunyon

glkterm:
	git clone https://github.com/erkyrath/glkterm.git

glkterm/libglkterm.a glkterm/Make.glkterm: glkterm
	cd glkterm && make

bunyon-0.3.tar.bz2:
	curl -LO http://www.ifarchive.org/if-archive/scott-adams/interpreters/bunyon/bunyon-0.3.tar.bz2

bunyon-0.3: bunyon-0.3.tar.bz2
	tar fxz bunyon-0.3.tar.bz2

bunyon-0.3/%: files/%
	cp $< $@

bunyon-0.3/bunyon: glkterm/libglkterm.a glkterm/Make.glkterm bunyon-0.3  $(EXTRA_FILES)
	cd bunyon-0.3 && grep compat.h main.c || patch -R main.c ../main.diff 
	cd bunyon-0.3 && make

bunyon: bunyon-0.3/bunyon
	ln -sf bunyon-0.3/bunyon .

clean:
	rm -rf glkterm/ bunyon-0.3.tar.bz2 bunyon-0.3/ bunyon
