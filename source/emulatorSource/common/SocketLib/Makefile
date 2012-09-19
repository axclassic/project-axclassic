
LIB=libSockets.a
LIBEX=libSocketsEx.a

CC=gcc
LINKER=ar cru
#the spaces on the end of these are important
OUT=-o 
NOLINK=-c

LINKOUT=
LINKOPTS=

INCLUDE =	-I.
PREFIX =	/usr/local
# .h files installed to $(PREFIX)/include/Sockets
# static lib .a files installed to $(PREFIX)/lib

CFLAGS =	-Wall -g -O2 $(INCLUDE) -MD -D_VERSION='"$(VERSION)"'

# uncomment depending on your operating system
#CFLAGS +=	-DLINUX
#CFLAGS +=	-DMACOSX 
# solaris > 8
#CFLAGS +=	-DSOLARIS
# solaris 8
#CFLAGS +=	-DSOLARIS8
# windows and/or cygwin
#CFLAGS +=	-D_WIN32
# cygwin
#CFLAGS +=	-D__CYGWIN__

CPPFLAGS =	$(CFLAGS) 

HTDOCS =	/usr/local/apache/www.alhem.net/htdocs

PROGS =		

all:		$(LIB) $(PROGS)
# $(LIBEX) Sockets-config 
	ranlib $(LIB)
#	ranlib $(LIBES)

include Makefile.common

Sockets-config:	Sockets-config.o
		g++ -o $@ $^

install:	all
		@mkdir -p $(PREFIX)/lib
		cp libSockets.a $(PREFIX)/lib
		cp libSocketsEx.a $(PREFIX)/lib
		@mkdir -p $(PREFIX)/include/Sockets
		cp -a *.h $(PREFIX)/include/Sockets
		@mkdir -p $(PREFIX)/bin
		install Sockets-config $(PREFIX)/bin

wine:
	$(MAKE) -f Makefile.wine

