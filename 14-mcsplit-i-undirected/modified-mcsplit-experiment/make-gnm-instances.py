import networkx as nx

import random
import sys

num_inst = int(sys.argv[1])

def write_random_graph(filename, n, m):
    with open(filename, "w") as f:
        G = nx.gnm_random_graph(n, m)
        edge_count = len(G.edges())
        f.write("p edge {} {}\n".format(n, edge_count))
        for v, w in G.edges:
            f.write("e {} {}\n".format(v+1, w+1))


for i in range(1, num_inst + 1):
    n = random.randint(10, 30)
    m = random.randint(0, n * (n - 1) // 2)
    write_random_graph("gnm-instances/r{}A.grf".format(i), n, m)
    write_random_graph("gnm-instances/r{}B.grf".format(i), n, m)
