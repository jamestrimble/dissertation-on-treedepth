CXX := g++
CXXFLAGS := -O3 -march=native
all: mcsp_density_experiment

mcsp_density_experiment: mcsp_density_experiment.c graph.c graph.h
	$(CXX) $(CXXFLAGS) -Wall -std=c++11 -o mcsp_density_experiment graph.c mcsp_density_experiment.c -pthread
	#$(CXX) -g -ggdb -fsanitize=address -Wall -std=c++11 -o mcsp_density_experiment graph.c mcsp_density_experiment.c -pthread
