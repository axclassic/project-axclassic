
MYSQL_FLAGS=`mysql_config --cflags`
MYSQL_LIB=`mysql_config --libs`
#freebsd:
#MYSQL_FLAGS=-I'/usr/local/include/mysql'
#MYSQL_LIB=-L'/usr/local/lib/mysql' -lmysqlclient -lz -lcrypt -lm

DFLAGS=-DINVERSEXY
CFLAGS=$(DFLAGS) -pipe -I.. -march=pentium4 -O2 -Wall -g $(MYSQL_FLAGS) -I/usr/local/include
LDFLAGS=-g -lz -L/usr/home/jonesa/eqemu/src/boost_1_32_0/stage/lib $(MYSQL_LIB) -L/usr/local/lib -lgd -lpng -ljpeg -lfreetype -lm

OBJS=apathing.o gpoint.o .obj/Map.zo .obj/unix.o actions.o quadtree.o .obj/rdtsc.o pathfinding.o boostcrap.o load_db.o

all: apath

apath: $(OBJS)
	g++ $(LDFLAGS) $(OBJS) -o apath

clean:
	rm -f $(OBJS) apath


%.o: %.cpp apathing.h
	$(CC) -c $(CFLAGS) $< -o $@

.obj/%.zo: ../../zone/%.cpp
	mkdir -p .obj
	$(CC) $(CFLAGS) -c $< -o $@

.obj/%.o: ../../common/%.cpp
	mkdir -p .obj
	$(CC) $(CFLAGS) -c $< -o $@

