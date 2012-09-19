
CC=gcc
LINKER=gcc
OUT=-o 
NOLINK=-c

#For FreeBSD uncomment these, comment the matching ones further down.
#MYSQL_CFLAGS=-I'/usr/local/include/mysql'
#MYSQL_LIBS=-L'/usr/local/lib/mysql' -lmysqlclient -lz -lcrypt -lm
#DFLAGS=-DDEBUG=1 -DSHAREMEM -DCATCH_CRASH -DEMUSHAREMEM -DFREEBSD

#For Linux, and defaults that don't need to be overwritten.
MYSQL_CFLAGS= #`mysql_config --cflags`
MYSQL_LIBS= #`mysql_config --libs`
DFLAGS=-DDEBUG=1 -DCATCH_CRASH

WFLAGS=-Wall -Wuninitialized -Wwrite-strings -Wcast-qual -Wno-deprecated -Wcomment -Wcast-align
COPTS=$(WFLAGS) $(DFLAGS) -g -fPIC -O2 -D_GNU_SOURCE -DINVERSEXY -DFX $(MYSQL_CFLAGS)
LINKOPTS=-L. -lstdc++ $(MYSQL_LIBS)
LIB=libEMuShareMem.so
LINKRES=-g -shared -Wl,-soname,$(LIB) -o $(LIB)

all: $(LIB)

include makefile.common

