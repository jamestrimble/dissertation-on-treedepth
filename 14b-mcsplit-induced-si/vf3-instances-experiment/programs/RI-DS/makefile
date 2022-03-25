INCLUDES= -I ./rilib/ -I ./include/
CC=g++
CFLAGS=-O3 -march=native

all: ri351ds ri351ds_with_timing ri351ds_decision_with_timing

ri351ds: ri3.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $^

ri351ds_with_timing: ri3_with_timing.cpp c_program_timing.c
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $^

ri351ds_decision_with_timing: ri3_with_timing.cpp c_program_timing.c
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $^ -DFIRST_MATCH_ONLY

####CFLAGS=-c -O3 -g
###CFLAGS=-c -O3
###
###SOURCES= ri3.cpp
###OBJECTS=$(SOURCES:.cpp=.o)
###EXECUTABLE=ri351ds
####EXECUTABLE=ri351ds_matches
####EXECUTABLE=ri351ds_dbg
###
###
###all:	$(SOURCES) $(EXECUTABLE)
###
###$(EXECUTABLE): $(OBJECTS)
###	$(CC) $(OBJECTS) -o $@
###
###.cpp.o:
###	$(CC) $(CFLAGS) $< $(INCLUDES) -o $@  
