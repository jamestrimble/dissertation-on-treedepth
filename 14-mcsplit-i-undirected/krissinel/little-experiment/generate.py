import sys
import networkx as nx

n = int(sys.argv[1])

for i in range(1, 10):
    G = nx.gnp_random_graph(n, i / 10.)
    nx.write_edgelist(G, "graphs/g{}.grf".format(i), data=False)
    with open("graphs/g{}.grf".format(i), "r") as f:
        lines = f.readlines()
        m = len(lines)
        with open("graphs/G{}.grf".format(i), "w") as f2:
            f2.write("p edge {} {}\n".format(n, m))
            for line in lines:
                line = line.strip().split()
                f2.write("e {} {}\n".format(int(line[0])+1, int(line[1])+1))
