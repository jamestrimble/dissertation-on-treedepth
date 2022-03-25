all : lad2gfu

override CXXFLAGS += -O3 -march=native -std=c++14 -I./ -W -Wall -g -ggdb3 -pthread

lad2gfu : lad2gfu.cc
	$(CXX) $(CXXFLAGS) -o $@ $<
