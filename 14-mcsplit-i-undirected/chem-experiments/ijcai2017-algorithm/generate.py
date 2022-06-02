import sys
import networkx as nx

n = int(sys.argv[1])

for i in range(100):
    while True:
        G = nx.gnp_random_graph(n, .5)
        if nx.is_connected(G):
            nx.write_edgelist(G, "g{}.grf".format(i+1), data=False)
            break
    with open("g{}.grf".format(i+1), "r") as f:
        lines = f.readlines()
        m = len(lines)
        with open("G{}.grf".format(i+1), "w") as f2:
            f2.write("p edge {} {}\n".format(n, m))
            for line in lines:
                line = line.strip().split()
                f2.write("e {} {}\n".format(int(line[0])+1, int(line[1])+1))
            

