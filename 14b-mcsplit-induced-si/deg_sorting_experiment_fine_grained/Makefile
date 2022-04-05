CXX := g++
#CXXFLAGS := -O0 -g -ggdb -fsanitize=address
CXXFLAGS := -O3 -march=native -g

all: mcsp_sparse_density_experiment

mcsp_sparse_density_experiment: mcsp_sparse_density_experiment.c sparse_graph.c sparse_graph.h
	$(CXX) $(CXXFLAGS) -Wall -std=c++11 -o mcsp_sparse_density_experiment sparse_graph.c mcsp_sparse_density_experiment.c -pthread

clean:
	rm mcsp_sparse_density_experiment
