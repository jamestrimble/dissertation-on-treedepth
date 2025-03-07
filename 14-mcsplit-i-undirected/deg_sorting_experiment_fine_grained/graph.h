#include <limits.h>
#include <stdbool.h>

#include <vector>

struct Graph {
    int n;
    std::vector<std::vector<unsigned int>> adjmat;
    std::vector<unsigned int> label;
    Graph(unsigned int n);
};

Graph induced_subgraph(struct Graph& g, std::vector<int> vv);

void add_edge(Graph& g, int v, int w, bool directed=false, unsigned int val=1);

Graph readGraph(char* filename, char format, bool directed, bool edge_labelled, bool vertex_labelled);

