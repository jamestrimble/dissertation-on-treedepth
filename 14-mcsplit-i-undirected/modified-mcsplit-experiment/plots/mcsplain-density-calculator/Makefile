CXX := g++
CXXFLAGS := -O3 -march=native
all: density-calculator

density-calculator: mcsp.c graph.c graph.h
	$(CXX) $(CXXFLAGS) -Wall -std=c++11 -o density-calculator graph.c mcsp.c -pthread
