
HCC=$(shell ccache -V 2>/dev/null)
ifneq (,$(findstring version,$(HCC)))
	CC=ccache gcc -D_FORTIFY_SOURCE=0
else
	CC=gcc -D_FORTIFY_SOURCE=0
endif

OUT=-o 
LINKOUT=-o 
NOLINK=-c 
LINKER=gcc 
MYSQL_FLAGS=-I/usr/include/mysql 
MYSQL_LIB=-L/usr/lib/mysql  -L/usr/lib64/mysql -L/usr/lib64 -lmysqlclient -lz -lcrypt -lnsl -lm -lc -lnss_files -lnss_dns -lresolv -lc -lnss_files -lnss_dns -lresolv 
DFLAGS=-DEQDEBUG=5 -DCATCH_CRASH -DNO_PIDLOG -DSHAREMEM -DFIELD_ITEMS -DCOMBINED -DAPP_OPCODE_SIZE=2 -DEQBOTS 
#try commenting out the following three lines to disable embedded perl
PERL_FLAGS=perl -MExtUtils::Embed -e ccopts 
PERL_LIB=perl -MExtUtils::Embed -e ldopts 
DFLAGS+=-DEMBPERL -DEMBPERL_PLUGIN -DHAS_UNION_SEMUN 
#WFLAGS=-Wuninitialized -Wwrite-strings -Wcast-qual -Wno-deprecated  -Wcomment -Wcast-align -Wno-endif-labels -Wno-attributes -Wno-multichar -Wno-deprecated-declarations 
WFLAGS=-Wall -Wno-sign-compare -Wuninitialized -Wwrite-strings -Wcast-qual -Wno-deprecated  -Wcomment -Wcast-align 
SOFCOPTS=$(WFLAGS) -g -pthread -pipe -D_GNU_SOURCE -DINVERSEXY -DFX -DWORLD $(DFLAGS) $(MYSQL_FLAGS) $(PERL_FLAGS) 
COPTS=$(WFLAGS) -O -march=native -pthread -pipe -D_GNU_SOURCE -DINVERSEXY -DFX -DZONE $(DFLAGS) $(MYSQL_FLAGS) `$(PERL_FLAGS)` 
LINKOPTS=$(COPTS) -rdynamic -L. -lstdc++ -ldl $(MYSQL_LIB) `$(PERL_LIB)` 

all: zone

include .depend 

include makefile.common 

./common/patches/SoF.o: ./common/patches/SoF.cpp
	$(CC) $(NOLINK) $(SOFCOPTS) $< $(OUT)$@
./common/patches/SoD.o: ./common/patches/SoD.cpp
	$(CC) $(NOLINK) $(SOFCOPTS) $< $(OUT)$@
./common/patches/Underfoot.o: ./common/patches/Underfoot.cpp
	$(CC) $(NOLINK) $(SOFCOPTS) $< $(OUT)$@
./common/patches/HoT.o: ./common/patches/HoT.cpp
	$(CC) $(NOLINK) $(SOFCOPTS) $< $(OUT)$@

.depend depend:
	for f in $(SF); \
	do \
		i=`echo $$f | sed -e 's#.obj/#../common/#g' -e 's/\.o/.cpp/g' `; \
		gcc -MM $(COPTS) `$(PERL_FLAGS)` $$i | sed "s#^[^ ]*:#$$f:#g"; \
	done  >.depend

wine:
	$(MAKE) -f makefile.wine

