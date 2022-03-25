INCLUDES= -I ./rilib/ -I ./include/
CC=g++
CFLAGS=-O3 -march=native

all: ri36 ri36_with_timing ri36_decision_with_timing

ri36: ri3.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $^

ri36_with_timing: ri3_with_timing.cpp c_program_timing.c
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $^

ri36_decision_with_timing: ri3_with_timing.cpp c_program_timing.c
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $^ -DFIRST_MATCH_ONLY

#SOURCES= ri3.cpp c_program_timing.c
#OBJECTS=$(SOURCES:.cpp=.o)
#EXECUTABLE=ri36
#
#
#all:	$(SOURCES) $(EXECUTABLE)
#
#$(EXECUTABLE): $(OBJECTS)
#	$(CC) $(OBJECTS) -o $@
#
#.cpp.o:
#	$(CC) $(CFLAGS) $< $(INCLUDES) -o $@  
