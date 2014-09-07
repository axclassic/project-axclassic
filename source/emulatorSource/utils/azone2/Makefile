
CFLAGS=-Wall -g -I.
LDFLAGS=-g -lz

OBJS_COMMON=wld.o zon.o pfs.o ter.o file.o global.o
OBJS_AZONE=azone.o $(OBJS_COMMON)
OBJS_AWATER=awater.o $(OBJS_COMMON)
OBJS_LISTOBJ=listobj.o $(OBJS_COMMON)

all: azone2 awater listobj

azone2: $(OBJS_AZONE)
	g++ $(LDFLAGS) $(OBJS_AZONE) -o azone2

listobj: $(OBJS_LISTOBJ)
	g++ $(LDFLAGS) $(OBJS_LISTOBJ) -o listobj

awater: $(OBJS_AWATER)
	g++ $(LDFLAGS) $(OBJS_AWATER) -o awater

clean:
	rm -f $(OBJS_COMMON) azone.o awater.o listobj.o azone2 awater listobj




%.o: %.cpp
	g++ -c $(CFLAGS) $< -o $@
