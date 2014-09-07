
CFLAGS=-Wall -g -I.
LDFLAGS=-g -lz

OBJS_COMMON=s3d.o wld.o zon.o pfs.o ter.o file.o
OBJS_AZONE=azone.o $(OBJS_COMMON)
OBJS_AWATER=awater.o $(OBJS_COMMON)

#EQWldData.o EQWldDataFragment.o

#TODO: get un-lazy and compile to .o files.

all: azone awater

azone: $(OBJS_AZONE)
	g++ $(LDFLAGS) $(OBJS_AZONE) -o azone

awater: $(OBJS_AWATER)
	g++ $(LDFLAGS) $(OBJS_AWATER) -o awater

clean:
	rm -f $(OBJS_COMMON) azone.o awater.o azone awater


s3d.o: s3d.c s3d.h
	$(CC) -c $(CFLAGS) -O3 s3d.c -o s3d.o

wld.o: wld.c wld.h
	$(CC) -c $(CFLAGS) -O3 wld.c -o wld.o

%.o: %.cpp
	$(CC) -c $(CFLAGS) $< -o $@
