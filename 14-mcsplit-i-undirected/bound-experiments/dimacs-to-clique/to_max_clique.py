from collections import deque
import random
import sys
import time

class Graph(object):
    def __init__(self, adjmat, vtx_labels):
        self.n = len(adjmat)
        self.adjmat = adjmat
        self.vtx_labels = vtx_labels

def read_instance(lines):
    lines = [line.strip().split() for line in lines]
    p_line = [line for line in lines if line[0]=="p"][0]
    n_lines = [line for line in lines if line[0]=="n"]
    e_lines = [line for line in lines if line[0]=="e"]
    E_lines = [line for line in lines if line[0]=="E"]
    n = int(p_line[2])
    adjmat = [[0] * n for _ in range(n)]
    vtx_labels = [0] * n
    for line in n_lines:
        v, label = int(line[1])-1, int(line[2])
        vtx_labels[v] = label
    for e in e_lines:
        v, w = int(e[1])-1, int(e[2])-1
        if v==w:
            vtx_labels[v] += 1000
        else:
            adjmat[v][w] = adjmat[w][v] = 1
    for e in E_lines:
        v, w, label = int(e[1])-1, int(e[2])-1, int(e[3])
        if v==w:
            vtx_labels[v] += 1000
        else:
            adjmat[v][w] = adjmat[w][v] = label
    return Graph(adjmat, vtx_labels)

def clique_encode(g0, g1):
    idx = []   # idx[j][k] will be index of the new vertex representing vertex
               # j in g0 being matched with vertex k in g1
    i = 0
    for j in range(g0.n):
        label_j = g0.vtx_labels[j]
        idx.append([])
        for k in range(g1.n):
            label_k = g1.vtx_labels[k]
            if label_j == label_k:
                idx[j].append(i)
                i += 1
            else:
                idx[j].append(None)

    adjmat = [[False]*i for row in range(i)]
    for j in range(g0.n):
        for k in range(g0.n):
            if j==k:
                continue
            for l in range(g1.n):
                if g0.vtx_labels[j] != g1.vtx_labels[l]:
                    continue
                for m in range(g1.n):
                    if l==m:
                        continue
                    if g0.vtx_labels[k] != g1.vtx_labels[m]:
                        continue
                    if g0.adjmat[j][k]==g1.adjmat[l][m]:
                        adjmat[idx[j][l]][idx[k][m]] = True
    for j in range(i):
        assert adjmat[j][j] == False
        for k in range(i):
            assert adjmat[j][k] == adjmat[k][j]
    return Graph(adjmat, None)

if __name__ == "__main__":
    with open(sys.argv[1], "r") as f:
        g0 = read_instance([line for line in f.readlines()])

    with open(sys.argv[2], "r") as f:
        g1 = read_instance([line for line in f.readlines()])

    g = clique_encode(g0, g1)

    num_edges = sum(sum(row) for row in g.adjmat)/2
    print "p edge {} {}".format(g.n, num_edges)
    for i in range(g.n-1):
        for j in range(i+1, g.n):
            if g.adjmat[i][j]:
                print "e {} {}".format(i+1, j+1)
