all : lad2arg

override CXXFLAGS += -O3 -march=native -std=c++14 -I./ -W -Wall -g -ggdb3 -pthread

lad2arg : lad2arg.cc
	$(CXX) $(CXXFLAGS) -o $@ $<
