
HCC=$(shell ccache -V 2>/dev/null)
ifneq (,$(findstring version,$(HCC)))
	CC=ccache gcc
else
	CC=gcc
endif

LINKER=gcc
#the spaces on the end of these are important
OUT=-o 
LINKOUT=-o 
NOLINK=-c
DFLAGS=-DDEBUG=5 -DEQDEBUG=5 -DSHAREMEM -DCATCH_CRASH -DNO_PIDLOG -DFIELD_ITEMS -DIRC -Di386 -DUCS
WFLAGS=-Wall -Wuninitialized -Wwrite-strings -Wcast-qual -Wcomment -Wcast-align -Wno-deprecated

PERL_FLAGS=$(shell perl -MExtUtils::Embed -e ccopts)
PERL_LIB=$(shell perl -MExtUtils::Embed -e ldopts)
DFLAGS+=-DEMBPERL -DEMBPERL_PLUGIN -DHAS_UNION_SEMUN

MYSQL_FLAGS=$(shell mysql_config --cflags)
MYSQL_LIB=$(shell mysql_config --libs)

COPTS=$(WFLAGS) -g -march=native -pthread -pipe -I../common/SocketLib \
  -DFX -D_GNU_SOURCE -DINVERSEXY $(DFLAGS) $(MYSQL_FLAGS) $(PERL_FLAGS)
LINKOPTS=$(COPTS) -rdynamic -L. -lstdc++ -lm -lz -ldl \
  $(MYSQL_LIB) $(PERL_LIB)

all: ucs


include .depend

include makefile.common

.depend depend:
	for f in $(SF); \
	do \
		i=`echo $$f | sed -e 's#.obj/#../common/#g' -e 's/\.o/.cpp/g' `; \
		gcc -MM $(COPTS) $(PERL_FLAGS) $$i | sed "s#^[^ ]*:#$$f:#g"; \
	done  >.depend


wine:
	$(MAKE) -f makefile.wine
