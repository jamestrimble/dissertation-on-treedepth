all : is_lad_connected is_vf_connected

override CXXFLAGS += -O3 -std=c++14 -W -Wall -g -ggdb3

is_vf_connected : is_vf_connected.cc
	$(CXX) $(CXXFLAGS) -o $@ $<

is_lad_connected : is_lad_connected.cc
	$(CXX) $(CXXFLAGS) -o $@ $<
