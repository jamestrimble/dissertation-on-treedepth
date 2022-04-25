all : lad2arg lad2arg-plus-universal-vertex

override CXXFLAGS += -O3 -march=native -std=c++14 -I./ -W -Wall -g -ggdb3 -pthread

lad2arg : lad2arg.cc
	$(CXX) $(CXXFLAGS) -o $@ $<

lad2arg-plus-universal-vertex : lad2arg-plus-universal-vertex.cc
	$(CXX) $(CXXFLAGS) -o $@ $<
