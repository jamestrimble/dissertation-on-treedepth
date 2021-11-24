import networkx as nx

import random
import sys

m = int(sys.argv[1])
num_inst = int(sys.argv[2])

def write_random_graph(filename, n):
    with open(filename, "w") as f:
        G = nx.barabasi_albert_graph(n, m)
        edge_count = len(G.edges())
        f.write("p edge {} {}\n".format(n, edge_count))
        for v, w in G.edges:
            f.write("e {} {}\n".format(v+1, w+1))


for i in range(1, num_inst + 1):
    n = random.randint(30, 50)
    write_random_graph("barabasi-albert-instances/r{}A.grf".format(i), n)
    write_random_graph("barabasi-albert-instances/r{}B.grf".format(i), n)
