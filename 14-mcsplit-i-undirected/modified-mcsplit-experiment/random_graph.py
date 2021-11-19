from collections import deque
import random
import sys
import time

class Graph(object):
    def __init__(self, adjmat):
        self.n = len(adjmat)
        self.adjmat = adjmat
        self.degree = [sum(row) for row in self.adjmat]

if __name__ == "__main__":
    if "-" in sys.argv[1]:   # a range of n values
        n1, n2 = sys.argv[1].split("-")
        n = random.randint(int(n1), int(n2))
    else:
        n = int(sys.argv[1])
    if "-" in sys.argv[2]:   # a range of p values
        p1, p2 = sys.argv[1].split("-")
        p = random.uniform(float(p1), float(p2))
    else:
        p = float(sys.argv[2])

    adjmat = [[False] * n for _ in range(n)]
    for i in range(n-1):
        for j in range(i+1, n):
            if random.random() < p:
                adjmat[i][j] = adjmat[j][i] = True

    g = Graph(adjmat)

    num_edges = sum(sum(row) for row in g.adjmat)/2
    print "p edge {} {}".format(g.n, num_edges)
    for i in range(g.n-1):
        for j in range(i+1, g.n):
            if g.adjmat[i][j]:
                print "e {} {}".format(i+1, j+1)
