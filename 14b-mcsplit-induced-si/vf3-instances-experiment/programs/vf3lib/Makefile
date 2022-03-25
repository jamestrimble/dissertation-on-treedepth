CC=g++
CFLAGS= -std=c++11 -march=native -O3 -Wno-deprecated
LDFLAGS= -lpthread -latomic
CPPFLAGS= -I./include

all: vf3 vf3_first_match_only vf3p vf3l

vf3_first_match_only:
	$(CC) $(CFLAGS) $(CPPFLAGS) -o bin/$@ main.cpp c_program_timing.c -DVF3 -DFIRST_MATCH_ONLY
vf3:
	$(CC) $(CFLAGS) $(CPPFLAGS) -o bin/$@ main.cpp c_program_timing.c -DVF3

vf3l:
	$(CC) $(CFLAGS) $(CPPFLAGS) -o bin/$@ main.cpp c_program_timing.c -DVF3L

vf3p:
	$(CC) $(CFLAGS) $(CPPFLAGS) -o bin/$@ main.cpp c_program_timing.c -DVF3P $(LDFLAGS)
	$(CC) $(CFLAGS) $(CPPFLAGS) -o bin/$@_bio main.cpp c_program_timing.c -DVF3BIO -DVF3P $(LDFLAGS)

clean:
	rm bin/*
