import os
import random
import sys

print("n d")

targets = []

with open("instances.txt", "r") as f:
    for i_line in f:
        tokens = i_line.strip().split()
        target = os.path.expanduser(
            "~/OthersCode/solnon-benchmarks/cpaior2019-sbs-for-subgraphs-paper/instances/" +
            tokens[2]
        )
        targets.append(target)

random.shuffle(targets)

for target in targets[:1000]:
    with open(target, "r") as f2:
        lines = [[int(x) for x in line.strip().split()] for line in f2]
        adj_lines = lines[1:lines[0][0]+1]
        edges = set()
        for v, line in enumerate(adj_lines):
            for x in line[1:]: 
                if x < v:
                    edge = (x,v)
                elif v < x:
                    edge = (v,x)
                edges.add(edge)
        n = lines[0][0]
        print(n, len(edges) / (n*(n-1)/2))
