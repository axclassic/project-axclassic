
HCC=$(shell ccache -V 2>/dev/null)
ifneq (,$(findstring version,$(HCC)))
	CC=ccache gcc
else
	CC=gcc
endif

OUT=-o 
LINKOUT=-o 
NOLINK=-c
LINKER=gcc
MYSQL_FLAGS=-I/usr/include/mysql
MYSQL_LIB=-L/usr/lib/mysql -lmysqlclient -lz -lcrypt -lnsl -lm -lc -lnss_files -lnss_dns -lresolv -lc -lnss_files -lnss_dns -lresolv
DFLAGS=-DEQDEBUG=5 -DEQBOTS 
WFLAGS=-Wall -Wuninitialized -Wwrite-strings -Wcast-qual -Wno-deprecated  -Wcomment -Wcast-align
COPTS=$(WFLAGS) -O -g -march=native -pthread -pipe -DEQLAUNCH $(DFLAGS) $(MYSQL_FLAGS)
LINKOPTS=$(COPTS) -rdynamic -L. -lstdc++ -ldl $(MYSQL_LIB)

all: eqlaunch

include .depend

include makefile.common

.depend depend:
	echo $(SF) "" | sed -e 's#.obj/#../common/#g' -e 's/\.o/.cpp/g' | \
	xargs gcc -MM $(COPTS) `$(PERL_FLAGS)` >.depend

