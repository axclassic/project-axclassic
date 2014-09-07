
CXXFLAGS=-ggdb -O -pipe -Wall -I../common -I/usr/include/mysql -I. -I..
LDFLAGS=-lpcap -lz -rdynamic -O2 -ggdb -pipe -ldl -lpthread -L/usr/lib/mysql -lmysqlclient

everything: all

include .depend

include Makefile.common

.depend depend:
	echo $(PPOBJS) "" | sed -e 's#.obj/#../../common/#g' -e 's/\.o/.cpp/g' | \
	xargs gcc -MM -I.. $(CXXFLAGS) `$(PERL_FLAGS)` | \
	sed 's#^patch_#patches/patch_#g' >.depend
	#patch sed to kinda work around a bug with gcc stripping leading dirs

