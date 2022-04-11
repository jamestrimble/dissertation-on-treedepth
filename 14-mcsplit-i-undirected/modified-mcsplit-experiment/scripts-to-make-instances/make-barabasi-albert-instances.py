import networkx as nx

import random
import sys

num_inst = int(sys.argv[1])

def write_random_graph(filename, n, m, graph_type):
    with open(filename, "w") as f:
        if graph_type == "BA":
            G = nx.barabasi_albert_graph(n, m)
        else:
            G = nx.gnm_random_graph(n, m)
        edge_count = len(G.edges())
        f.write("p edge {} {}\n".format(n, edge_count))
        for v, w in G.edges:
            f.write("e {} {}\n".format(v+1, w+1))


for i in range(1, num_inst + 1):
    n = random.randint(10, 50)
    m = random.randint(2, n-1)
    write_random_graph("barabasi-albert-instances/r{}A.grf".format(i), n, m, "BA")
    write_random_graph("barabasi-albert-instances/r{}B.grf".format(i), n, m, "BA")
