all : get_lad_density

override CXXFLAGS += -O3 -std=c++14 -W -Wall -g -ggdb3

get_lad_density : get_lad_density.cc
	$(CXX) $(CXXFLAGS) -o $@ $<
