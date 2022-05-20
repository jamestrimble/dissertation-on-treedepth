CXX := g++
#CXXFLAGS := -O0 -g -ggdb -fsanitize=address
CXXFLAGS := -O3 -march=native -g
PROGRAMS := mcsplit-mcis-sparse

all: $(PROGRAMS)

mcsplit-mcis-sparse: mcsplit-mcis-sparse.c sparse_graph.c sparse_graph.h
	$(CXX) $(CXXFLAGS) -Wall -std=c++11 -o $@ $< sparse_graph.c -pthread

clean:
	rm $(PROGRAMS)
