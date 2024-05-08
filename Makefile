CC = gcc
CFLAGS = -Wall -g -O2 -lm
LTRACEF = -ltrace
INCLUDE = -I./mylib
PKT_SOURCE = ./mylib/myltrace.c ./mylib/myhash.c
PKT_HEADER = $(patsubst %.c,%.h, $(PKT_SOURCE))
FILENAME   ="./data/mawi/201902011400_20190201140000.pcap"
FILENAME   ="./data/mawi/201902011400.pcap"
REPORT_TIME= 1
VERBOSE = 0
ARGS = $(FILENAME) $(REPORT_TIME) $(VERBOSE)

all: pktrun #cmsrun

pktrun: pkt
	./pkt.o $(ARGS)
pkt: $(PKT_SOURCE) $(PKT_HEADER) main_pkt.c
	$(CC) $(INCLUDE) $(LTRACEF) $(PKT_SOURCE) $(CFLAGS) main_pkt.c -o pkt.o

clean:
	rm -f *.o