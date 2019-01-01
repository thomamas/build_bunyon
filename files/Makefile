GLK=glkterm
GLKINCLUDEDIR = ../$(GLK)
GLKLIBDIR = ../$(GLK)
GLKMAKEFILE = Make.$(GLK)
include $(GLKINCLUDEDIR)/$(GLKMAKEFILE)

CC = gcc
CFLAGS = -O2 -Wall -pedantic -ggdb -g3 -I$(GLKINCLUDEDIR)
LIBS = -L$(GLKLIBDIR) $(GLKLIB) $(LINKLIBS)

OBJS = main.o rnd.o msg.o interp.o unix_glkterm.o debug.o compat.o

bunyon: $(OBJS)
	$(CC) -o bunyon $(OBJS) $(LIBS)

clean:
	rm -f $(OBJS) bunyon
